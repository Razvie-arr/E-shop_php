<?php

namespace App\AdminModule\Presenters;

use App\AdminModule\Components\ObjednavkaEditForm\ObjednavkaEditForm;
use App\AdminModule\Components\ObjednavkaEditForm\ObjednavkaEditFormFactory;
use App\AdminModule\Components\ObjednavkaStatusEditForm\ObjednavkaStatusEditForm;
use App\AdminModule\Components\ObjednavkaStatusEditForm\ObjednavkaStatusEditFormFactory;
use App\Model\Facades\ObjednavkaFacade;
use Nette\Application\BadRequestException;

/**
 * Class OrderPresenter
 * @package App\AdminModule\Presenters
 */
class OrderPresenter extends BasePresenter {
    private ObjednavkaFacade $objednavkaFacade;
    private ObjednavkaEditFormFactory $objednavkaEditFormFactory;

    private ObjednavkaStatusEditFormFactory $objednavkaStatusEditFormFactory;

    /**
     * Akce pro vykreslení seznamu objednavek
     */
    public function renderDefault(): void {
        $statusName = "Všechny objednávky";
        $findArray = ['order' => 'objednavka_id DESC'];
        if (isset($_GET["status"])) {
            $statusName = $_GET["status"];
            $findArray['status'] = $statusName;
        }
        $this->template->objednavky = $this->objednavkaFacade->findObjednavky($findArray);
        $this->template->statusName = $statusName;
    }

    /**
     * Akce pro zobrazení jedné objednávky
     * @param int $id
     * @throws BadRequestException
     */
    public function renderShow(int $id): void {
        try {
            $objednavka = $this->objednavkaFacade->getObjednavkaById($id);
        } catch (\Exception $e) {
            throw new BadRequestException('Objednávka nebyla nalezena.');
        }

        $form = $this->getComponent('objednavkaStatusEditForm');
        $form->setDefaults($objednavka);
        $this->template->objednavka = $objednavka;
    }

    /**
     * Akce pro úpravu jedné objednávky
     * @param int $id
     * @throws \Nette\Application\AbortException
     */
    public function renderEdit(int $id): void {
        try {
            $objednavka = $this->objednavkaFacade->getObjednavkaById($id);
        } catch (\Exception $e) {
            $this->flashMessage('Požadovaná objednávka nebyla nalezena.', 'error');
            $this->redirect('default');
        }
        if (!$this->user->isAllowed('Order', 'edit')) {
            $this->flashMessage('Požadovanou objednávku nemůžete upravovat.', 'error');
            $this->redirect('default');
        }

        $form = $this->getComponent('objednavkaEditForm');
        $form->setDefaults($objednavka);
        $this->template->objednavka = $objednavka;
    }

    /**
     * Akce pro smazání objednávky
     * @param int $id
     * @throws \Nette\Application\AbortException
     */
    public function actionDelete(int $id): void {
        try {
            $objednavka = $this->objednavkaFacade->getObjednavkaById($id);
        } catch (\Exception $e) {
            $this->flashMessage('Požadovaná objednávka nebyla nalezena.', 'error');
            $this->redirect('default');
        }

        if (!$this->user->isAllowed('Order', 'delete')) {
            $this->flashMessage('Tuto objednavku není možné smazat.', 'error');
            $this->redirect('default');
        }

        if ($this->objednavkaFacade->deleteObjednavka($objednavka)) {
            $this->flashMessage('Objednávka byl smazána.', 'info');
        } else {
            $this->flashMessage('Tuto objednávku není možné smazat.', 'error');
        }

        $this->redirect('default');
    }

    /**
     * Formulář na editaci objednávek
     * @return ObjednavkaEditForm
     */
    public function createComponentObjednavkaEditForm(): ObjednavkaEditForm {
        $form = $this->objednavkaEditFormFactory->create();
        $form->onCancel[] = function () {
            $this->redirect('default');
        };
        $form->onFinished[] = function ($message = null) {
            if (!empty($message)) {
                $this->flashMessage($message);
            }
            $this->redirect('default');
        };
        $form->onFailed[] = function ($message = null) {
            if (!empty($message)) {
                $this->flashMessage($message, 'error');
            }
            $this->redirect('default');
        };
        return $form;
    }


    /**
     * Formulář na změnu stavu objednávky
     * @return ObjednavkaStatusEditForm
     */
    public function createComponentObjednavkaStatusEditForm(): ObjednavkaStatusEditForm {
        $form = $this->objednavkaStatusEditFormFactory->create();
        $form->onCancel[] = function () {
            $this->redirect('default');
        };
        $form->onFinished[] = function ($message = null) {
            if (!empty($message)) {
                $this->flashMessage($message);
            }
        };
        $form->onFailed[] = function ($message = null) {
            if (!empty($message)) {
                $this->flashMessage($message, 'error');
            }
            $this->redirect('default');
        };
        return $form;
    }

    #region injections
    public function injectObjednavkaFacade(ObjednavkaFacade $objednavkaFacade): void {
        $this->objednavkaFacade = $objednavkaFacade;
    }

    public function injectObjednavkaEditFormFactory(ObjednavkaEditFormFactory $objednavkaEditFormFactory): void {
        $this->objednavkaEditFormFactory = $objednavkaEditFormFactory;
    }

    public function injectObjednavkaStatusEditFormFactory(ObjednavkaStatusEditFormFactory $objednavkaStatusEditFormFactory): void {
        $this->objednavkaStatusEditFormFactory = $objednavkaStatusEditFormFactory;
    }
    #endregion injections

}
