<?php

namespace App\FrontModule\Components\OrderForm;

use App\FrontModule\Components\CartControl\CartControl;
use App\Model\Entities\Cart;
use App\Model\Entities\Objednavka;
use App\Model\Facades\CartFacade;
use App\Model\Facades\ObjednavkaFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\Security\User;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;
use Nette\Http\Session;
use Nette\Http\SessionSection;

/**
 * Class OrderForm
 * @package App\FrontModule\Components\OrderForm
 *
 * @method onFinished(string $message = '')
 * @method onFailed(string $message = '')
 * @method onCancel()
 */
class OrderForm extends Form {

    use SmartObject;

    private User $user;
    public array $onFinished = [];
    public array $onFailed = [];
    public array $onCancel = [];

    private ObjednavkaFacade $objednavkaFacade;

    private SessionSection $cartSession;
    private CartFacade $cartFacade;
    public Cart $cart;
    /**
     * OrderForm constructor.
     * @param Session $session
     * @param CartFacade $cartFacade
     * @param ObjednavkaFacade $objednavkaFacade
     * @param User $user
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(Session $session, CartFacade $cartFacade,User $user,ObjednavkaFacade $objednavkaFacade,Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->cartFacade=$cartFacade;
        $this->cartSession=$session->getSection('cart');
        $this->cart = $cart;
        $this->user = $user;
        $this->objednavkaFacade = $objednavkaFacade;
    }


    private function createSubcomponents(): void {
        $this->addText('jmeno', 'Jméno')
            ->setRequired('Zadejte vaše jméno')
            ->setDefaultValue($this->user->identity->name);
        $this->addText('adresa', 'Adresa')
            ->setRequired('Vyplňte vaši adresu');
        $this->addEmail('email', 'E-mail')
            ->setRequired('Zadejte váš E-mail')
            ->setDefaultValue($this->user->identity->email);
        $this->addInteger('telefon', 'Telefonní číslo')
            ->setRequired('Zadejte váše číslo');
        $this->addCheckbox('potvrzeni', 'Souhlasím s obchodními podmínkami a chci závazně objednat.')
            ->setRequired('Pro pokračování musíte souhlasit');

        $this->addSubmit('ok', 'Potvrdit objednávku')
            ->onClick[] = function (SubmitButton $button) {
            $values = $this->getValues('array');
            $objednavka = new Objednavka();
            $objednavka->objednavkaName=$values['jmeno'];
            $objednavka->objednavkaAddress=$values['adresa'];
            $objednavka->objednavkaPhone=$values['telefon'];
            $objednavka->objednavkaEmail=$values['email'];
            $objednavka->objednavkaPrice=$this->cart->getTotalPrice();


            $this->objednavkaFacade->saveObjednavka($objednavka);
            $this->setValues(['objednavkaId' => $objednavka->objednavkaId]);

            $this->onFinished('Děkujeme za vaši objednávku. Vaši objednávku vyřídíme co nedjříve.');
        };
        $this->addSubmit('storno', 'Zrušit')
            ->setValidationScope([])
            ->onClick[] = function (SubmitButton $button) {
            $this->onCancel();
        };
    }

}