<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\CartControl\CartControl;
use App\FrontModule\Components\ProductCartForm\ProductCartForm;
use App\FrontModule\Components\ProductCartForm\ProductCartFormFactory;
use App\Model\Facades\ProductsFacade;
use Nette\Application\BadRequestException;
use Nette\Application\UI\Multiplier;

/**
 * Class ProductPresenter
 * @package App\FrontModule\Presenters
 * @property string $category
 */
class ProductPresenter extends BasePresenter{
    private ProductsFacade $productsFacade;
    private ProductCartFormFactory $productCartFormFactory;

    /**
     * Akce pro zobrazení jednoho produktu
     * @param string $url
     * @throws BadRequestException
     */
    public function renderShow(string $url):void {
        try{
            $product = $this->productsFacade->getProductByUrl($url);
        }catch (\Exception $e){
            throw new BadRequestException('Produkt nebyl nalezen.');
        }

        $this->template->product = $product;
    }

    /**
     * Akce pro vykreslení přehledu produktů
     */
    public function renderList():void {
        //TODO tady by mělo přibýt filtrování podle kategorie, stránkování atp.
        $categoryName = "Všechny E-čtečky";
        $findArray = ['order' => 'title'];
        if (isset($_GET["kategorie"])) {
            $categoryId = $_GET["kategorie"];
            $findArray['category_id'] = $categoryId;
            $categoryName = $this->categoriesFacade->getCategory($categoryId)->title;
        }
        $this->template->products = $this->productsFacade->findProducts($findArray);
        $this->template->categoryName = $categoryName;
    }

    protected function createComponentProductCartForm():Multiplier {
        return new Multiplier(function($productId){
            $form = $this->productCartFormFactory->create();
            $form->setDefaults(['productId'=>$productId]);
            $form->onSubmit[]=function(ProductCartForm $form){
                try{
                    $product = $this->productsFacade->getProduct($form->values->productId);
                    //kontrola zakoupitelnosti
                }catch (\Exception $e){
                    $this->flashMessage('Produkt nejde přidat do košíku','error');
                    $this->redirect('this');
                }
                //přidání do košíku
                /** @var CartControl $cart */
                $cart = $this->getComponent('cart');
                $cart->addToCart($product, (int)$form->values->count);
                $this->redirect('this');
            };

            return $form;
        });
    }

    #region injections
    public function injectProductsFacade(ProductsFacade $productsFacade):void {
        $this->productsFacade=$productsFacade;
    }

    public function injectProductCartFormFactory(ProductCartFormFactory $productCartFormFactory):void {
        $this->productCartFormFactory=$productCartFormFactory;
    }
    #endregion injections
}