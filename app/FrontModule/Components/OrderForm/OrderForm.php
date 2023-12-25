<?php

namespace App\FrontModule\Components\OrderForm;

use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class OrderForm
 * @package App\FrontModule\Components\OrderForm
 *
 * @method onFinished($message='')
 * @method onCancel()
 */
class OrderForm extends Form{

    use SmartObject;

    public array $onFinished = [];
    public array $onCancel = [];


    /**
     * OrderForm constructor.
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(Nette\ComponentModel\IContainer $parent = null, string $name = null){
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->createSubcomponents();
    }


    private function createSubcomponents():void {
        $this->addText('jmeno','Jméno')
            ->setRequired('Zadejte vaše jméno');
        $this->addText('adresa','Adresa')
            ->setRequired('Vyplňte vaši adresu');
        $this->addEmail('email','E-mail')
            ->setRequired('Zadejte váš E-mail');
        $this->addInteger('telefon','Telefonní číslo')
            ->setRequired('Zadejte váše číslo');
        $this->addCheckbox('potvrzeni','Souhlasím s obchodními podmínkami a chci závazně objednat.')
            ->setRequired('Pro pokračování musíte souhlasit');

        $this->addSubmit('ok','Potvrdit objednávku')
            ->onClick[]=function(SubmitButton $button){
            $this->onFinished('Děkujeme za vaši objednávku. Vaši objednávku vyřídíme co nedjříve.');
        };
        $this->addSubmit('storno','Zrušit')
            ->setValidationScope([])
            ->onClick[]=function(SubmitButton $button){
            $this->onCancel();
        };
    }

}