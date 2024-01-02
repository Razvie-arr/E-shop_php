<?php

namespace App\AdminModule\Presenters;

use App\AdminModule\Components\UserEditForm\UserEditForm;
use App\AdminModule\Components\UserEditForm\UserEditFormFactory;
use App\Model\Facades\UsersFacade;

/**
 * Class UserPresenter
 * @package App\AdminModule\Presenters
 */
class UserPresenter extends BasePresenter {
    private UsersFacade $usersFacade;
    private UserEditFormFactory $userEditFormFactory;

    /**
     * Akce pro vykreslení seznamu uživatelů
     */
    public function renderDefault(): void {
        $this->template->listUsers = $this->usersFacade->findUsers(['order' => 'name']);
    }

    /**
     * Akce pro úpravu jednoho uživatele
     * @param int $id
     * @throws \Nette\Application\AbortException
     */
    public function renderEdit(int $id) {
        try {
            $user = $this->usersFacade->getUser($id);
        } catch (\Exception $e) {
            $this->flashMessage('Požadovaný uživatel nebyl nalezen.', 'error');
            $this->redirect('default');
        }
        $form = $this->getComponent('userEditForm');
        $form->setDefaults($user);
        $this->template->editUser = $user;
    }

    /**
     * Akce pro smazání uživatele
     * @param int $id
     * @throws \Nette\Application\AbortException
     */
    public function actionDelete(int $id): void {
        try {
            $user = $this->usersFacade->getUser($id);
        } catch (\Exception $e) {
            $this->flashMessage('Požadovaný uživatel nebyl nalezen.', 'error');
            $this->redirect('default');
        }

        if (!$this->user->isAllowed('User', 'delete')) {
            $this->flashMessage('Tohoto uživatele není možné smazat.', 'error');
            $this->redirect('default');
        }

        if ($this->usersFacade->deleteUser($user)) {
            $this->flashMessage('Uživatel byl smazán.', 'info');
        } else {
            $this->flashMessage('Tohoto uživatele není možné smazat.', 'error');
        }

        $this->redirect('default');
    }

    public function createComponentUserEditForm(): UserEditForm {
        $form = $this->userEditFormFactory->create();
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

    #region injections
    public function injectUsersFacade(UsersFacade $usersFacade): void {
        $this->usersFacade = $usersFacade;
    }

    public function injectUserEditFormFactory(UserEditFormFactory $userEditFormFactory) {
        $this->userEditFormFactory = $userEditFormFactory;
    }
    #endregion injections
}