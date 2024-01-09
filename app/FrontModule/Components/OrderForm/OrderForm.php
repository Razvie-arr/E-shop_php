<?php

namespace App\FrontModule\Components\OrderForm;

use App\Model\Entities\Cart;
use App\Model\Entities\Objednavka;
use App\Model\Entities\ObjednavkaItem;
use App\Model\Entities\Product;
use App\Model\Facades\CartFacade;
use App\Model\Facades\ObjednavkaFacade;
use App\Model\Facades\ProductsFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\Http\Session;
use Nette\Security\User;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

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

    private ProductsFacade $productsFacade;
    private ObjednavkaFacade $objednavkaFacade;
    private CartFacade $cartFacade;
    public Cart $cart;

    /**
     * OrderForm constructor.
     * @param Session $session
     * @param CartFacade $cartFacade
     * @param ObjednavkaFacade $objednavkaFacade
     * @param ProductsFacade $productsFacade
     * @param User $user
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(CartFacade $cartFacade, User $user, ObjednavkaFacade $objednavkaFacade, ProductsFacade $productsFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->cartFacade = $cartFacade;
        $this->user = $user;
        $this->objednavkaFacade = $objednavkaFacade;
        $this->productsFacade = $productsFacade;
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
            $objednavka = $this->createAndPersistObjednavka($values);

            foreach ($this->cart->getCartItems() as $cartItem) {
                $product = $cartItem->product;
                $itemCount = $cartItem->count;
                $this->updateProductStockCount($product, $itemCount);
                $this->createAndPersistObjednavkaItem($objednavka, $cartItem);
            }

            $objednavka->updateObjednavkaItems();
            $this->cartFacade->deleteCart($this->cart);

            $this->setValues(['objednavkaId' => $objednavka->objednavkaId]);

            $this->onFinished('Děkujeme za vaši objednávku. Vaši objednávku vyřídíme co nedjříve.');
        };
        $this->addSubmit('storno', 'Zrušit')
            ->setValidationScope([])
            ->onClick[] = function (SubmitButton $button) {
            $this->onCancel();
        };
    }

    private function createAndPersistObjednavka($values): Objednavka {
        $objednavka = new Objednavka();
        $objednavka->userId = $this->cart->userId;
        $objednavka->objednavkaName = $values['jmeno'];
        $objednavka->objednavkaAddress = $values['adresa'];
        $objednavka->objednavkaPhone = $values['telefon'];
        $objednavka->objednavkaEmail = $values['email'];
        $objednavka->objednavkaPrice = $this->cart->getTotalPrice();
        $this->objednavkaFacade->saveObjednavka($objednavka);
        return $objednavka;
    }

    private function createAndPersistObjednavkaItem($objednavka, $cartItem) {
        $objednavkaItem = new ObjednavkaItem();
        $objednavkaItem->product = $cartItem->product;
        $objednavkaItem->objednavka = $objednavka;
        $objednavkaItem->count = $cartItem->count;
        $objednavkaItem->objednavkaItemPrice = $objednavkaItem->product->price;
        $this->objednavkaFacade->saveObjednavkaItem($objednavkaItem);
    }

    private function updateProductStockCount(Product $product, $itemCount) {
        $product->stock = $product->stock - $itemCount;
        $this->productsFacade->saveProduct($product);
    }

}