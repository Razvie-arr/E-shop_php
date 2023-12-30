<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\ProductCartForm\ProductCartFormFactory;
use App\FrontModule\Components\ProductCartForm\ProductCartFormTrait;
use App\Model\Facades\ProductsFacade;

class HomepagePresenter extends BasePresenter {

    use ProductCartFormTrait;

    private ProductsFacade $productsFacade;
    private ProductCartFormFactory $productCartFormFactory;


    /**
     * Akce pro vykreslení doporučených produktů
     */
    public function renderDefault(): void {
        $this->template->products = $this->productsFacade->findProducts(['recommend' => '1']);
    }

    #region injections
    public function injectProductsFacade(ProductsFacade $productsFacade): void {
        $this->productsFacade = $productsFacade;
    }

    public function injectProductCartFormFactory(ProductCartFormFactory $productCartFormFactory): void {
        $this->productCartFormFactory = $productCartFormFactory;
    }
    #endregion injections

}
