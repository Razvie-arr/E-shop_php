<?php

namespace App\AdminModule\Components\ObjednavkaStatusEditForm;

use App\Model\Entities\Objednavka;
use App\Model\Facades\ObjednavkaFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class ObjednavkaStatusEditForm
 * @package App\AdminModule\Components\ObjednavkaStatusEditForm
 *
 * @method onFinished(string $message = '')
 * @method onFailed(string $message = '')
 * @method onCancel()
 */
class ObjednavkaStatusEditForm extends Form {

    use SmartObject;

    /** @var callable[] $onFinished */
    public array $onFinished = [];
    /** @var callable[] $onFailed */
    public array $onFailed = [];
    /** @var callable[] $onCancel */
    public array $onCancel = [];
    public array $statuses = ['received' => 'received',
        'sent' => 'sent',
        'delivered' => 'delivered',
        'canceled' => 'canceled',
        'returned' => 'returned'];

    private ObjednavkaFacade $objednavkaFacade;

    /**
     * ObjednavkaStatusEditForm constructor.
     * @param ObjednavkaFacade $objednavkaFacade
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(ObjednavkaFacade $objednavkaFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->objednavkaFacade = $objednavkaFacade;
        $this->createSubcomponents();
    }

    private function createSubcomponents(): void {
        $objednavkaId = $this->addHidden('objednavkaId');

        $this->addSelect('status', 'Status:', $this->statuses)
            ->setRequired(true);

        $this->addSubmit('ok', 'Změnit stav objednávky')
            ->onClick[] = function (SubmitButton $button) {
            $values = $this->getValues('array');
            if (!empty($values['objednavkaId'])) {
                try {
                    $objednavka = $this->objednavkaFacade->getObjednavkaById($values['objednavkaId']);
                } catch (\Exception $e) {
                    $this->onFailed('Požadovaná objednávka nebyla nalezena . ');
                    return;
                }
            } else {
                $objednavka = new Objednavka();
            }
            $objednavka->assign($values, ['status']);

            $this->objednavkaFacade->saveObjednavka($objednavka);
            $this->setValues(['objednavkaId' => $objednavka->objednavkaId]);


            $this->onFinished('Stav objednávky byl uložen.');
        };
    }

    /**
     * Metoda pro nastavení výchozích hodnot formuláře
     * @param Objednavka|array|object $values
     * @param bool $erase = false
     * @return $this
     */
    public function setDefaults($values, bool $erase = false): self {
        if ($values instanceof Objednavka) {
            $values = [
                'objednavkaId' => $values->objednavkaId,
                'objednavkaName' => $values->objednavkaName,
                'objednavkaEmail' => $values->objednavkaEmail,
                'objednavkaAddress' => $values->objednavkaAddress,
                'objednavkaPhone' => $values->objednavkaPhone,
                'paid' => $values->paid,
                'objednavkaPrice' => $values->objednavkaPrice,
                'status' => $values->status
            ];
        }
        parent::setDefaults($values, $erase);
        return $this;
    }

}