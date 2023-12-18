<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\ProductCartForm\ProductCartFormFactory;
use App\Model\Facades\ProductsFacade;
class HomepagePresenter extends BasePresenter{

    private ProductsFacade $productsFacade;
    private ProductCartFormFactory $productCartFormFactory;


    /**
     * Akce pro vykreslení doporučených produktů
     */
    public function renderDefault():void {
        $this->template->products = $this->productsFacade->findProducts(['recommend'=>'1']);

        //bez toho na localhostu nefungují obrázky
        if ($_SERVER['SERVER_NAME'] == 'localhost') {
            $this->template->basePath = "https://eso.vse.cz/~bret04/eshop";
        }
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
