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
    private Cart $cart;

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
        $this->cart=$this->prepareOrder();
        $this->user = $user;
        $this->objednavkaFacade = $objednavkaFacade;
        $this->createSubcomponents();
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

    private function prepareOrder():Cart {
        #region zkusíme najít košík podle ID ze session
        try {
            if ($cartId = $this->cartSession->get('cartId')){
                $cart = $this->cartFacade->getCartById((int)$cartId);
                //zkontrolujeme, jestli tu není košík od předchozího uživatele, nebo se nepřihlásil uživatel s prázdným košíkem (případně ho zahodíme)
                if (($cart->userId || empty($cart->items)) && ($cart->userId!=$this->user->id || !$this->user->isLoggedIn())){
                    $cart=null;
                }
            }
        }catch (\Exception $e){
            /*košík se nepovedlo najít*/
        }
        #endregion zkusíme najít košík podle ID ze session
        #region vyřešíme vazbu košíku na uživatele, případně vytvoříme košík nový
        if (isset($this->user)){
            if ($cart){
                //přiřadíme do košíku načteného podle session vazbu na aktuálního uživatele
                if ($cart->userId != $this->user->id){
                    $this->cartFacade->deleteCartByUser($this->user->id);
                }
                $cart->userId=$this->user->id;
                $this->cartFacade->saveCart($cart);
            }else{
                //zkusíme najít košík podle ID uživatele - pokud ho nenajdeme, vytvoříme nový
                try{
                    $cart=$this->cartFacade->getCartByUser($this->user->id);
                }catch (\Exception $e){
                    /*košík nebyl pro daného uživatele nalezen*/
                    $cart=new Cart();
                    $cart->userId=$this->user->id;
                    $this->cartFacade->saveCart($cart);
                    $this->deleteOldCarts();
                }
            }
        }elseif(!$cart){
            //košík jsme zatím nijak nezvládli najít, vytvoříme nový prázdný
            $cart=new Cart();
            $this->cartFacade->saveCart($cart);
            $this->deleteOldCarts();
        }
        #endregion vyřešíme vazbu košíku na uživatele, případně vytvoříme košík nový

        //aktualizujeme ID košíku v session
        $this->cartSession->set('cartId',$cart->cartId);

        return $cart;
    }

}