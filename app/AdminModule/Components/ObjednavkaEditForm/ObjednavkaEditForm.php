<?php

namespace App\AdminModule\Components\ObjednavkaEditForm;

use App\Model\Entities\Objednavka;
use App\Model\Facades\ObjednavkaFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class ObjednavkaEditForm
 * @package App\AdminModule\Components\ObjednavkaEditForm
 *
 * @method onFinished(string $message = '')
 * @method onFailed(string $message = '')
 * @method onCancel()
 */
class ObjednavkaEditForm extends Form {

    use SmartObject;

    /** @var callable[] $onFinished */
    public array $onFinished = [];
    /** @var callable[] $onFailed */
    public array $onFailed = [];
    /** @var callable[] $onCancel */
    public array $onCancel = [];

    private ObjednavkaFacade $objednavkaFacade;

    /**
     * ObjednavkaEditForm constructor.
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
        $productId = $this->addHidden('objednavkaId');
        $this->addText('userId', 'Uživatel')
            ->setMaxLength(100);

        $this->addDateTime('objednavkaDate', 'Datum objednávky')
            ->setRequired('Zadejte datum objednávky');

        $this->addText('objednavkaName', 'Jméno')
            ->setMaxLength(40);

        $this->addText('objednavkaEmail', 'Email')
            ->setMaxLength(255);

        $this->addText('objednavkaAddress', 'Adresa')
            ->setMaxLength(512);

        $this->addText('objednavkaPhone', 'Telefon')
            ->setHtmlType('number')
            ->addRule(Form::NUMERIC, 'Musíte zadat číslo.')
            ->setRequired('Musíte zadat telefon objednávky');

        $this->addText('objednavkaPrice', 'Cena')
            ->setHtmlType('number')
            ->addRule(Form::NUMERIC, 'Musíte zadat číslo.')
            ->setRequired('Musíte zadat cenu objednávky');//tady by mohly být další kontroly pro min, max atp.

        $this->addCheckbox('paid', 'Zaplaceno')
            ->setDefaultValue(false);

        $this->addSubmit('ok', 'Uložit')
            ->onClick[] = function (SubmitButton $button) {
            $values = $this->getValues('array');
            if (!empty($values['objednavkaId'])) {
                try {
                    $objednavka = $this->objednavkaFacade->getObjednavkaById($values['objednavkaId']);
                } catch (\Exception $e) {
                    $this->onFailed('Požadovaná objednávka nebyla nalezena.');
                    return;
                }
            } else {
                $objednavka = new Objednavka();
            }
            $objednavka->assign($values, ['userId', 'objednavkaDate', 'objednavkaName', 'objednavkaEmail','objednavkaAddress','paid']);
            $objednavka->objednavkaPrice = floatval($values['objednavkaPrice']);
            $objednavka->objednavkaPhone = intval($values['objednavkaPhone']);

            $this->objednavkaFacade->saveObjednavka($objednavka);
            $this->setValues(['objednavkaId' => $objednavka->objednavkaId]);


            $this->onFinished('Objednávka byla uložena.');
        };
        $this->addSubmit('storno', 'zrušit')
            ->setValidationScope([$productId])
            ->onClick[] = function (SubmitButton $button) {
            $this->onCancel();
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
                'userId' => $values->userId,
                'objednavkaDate' => $values->objednavkaDate,
                'objednavkaName' => $values->objednavkaName,
                'objednavkaEmail' => $values->objednavkaEmail,
                'objednavkaAddress' => $values->objednavkaAddress,
                'objednavkaPhone' => $values->objednavkaPhone,
                'paid' => $values->paid,
                'objednavkaPrice' => $values->objednavkaPrice
            ];
        }
        parent::setDefaults($values, $erase);
        return $this;
    }

}