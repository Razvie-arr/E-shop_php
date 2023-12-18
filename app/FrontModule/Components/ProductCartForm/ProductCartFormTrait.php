<?php

namespace App\FrontModule\Components\ProductCartForm;

use Nette\Application\UI\Multiplier;

trait ProductCartFormTrait {
    protected function createComponentProductCartForm(): Multiplier {
        return new Multiplier(function ($productId) {
            $form = $this->productCartFormFactory->create();
            $form->setDefaults(['productId' => $productId]);
            $form->onSubmit[] = function (ProductCartForm $form) {
                try {
                    $product = $this->productsFacade->getProduct($form->values->productId);
                    //kontrola zakoupitelnosti
                } catch (\Exception $e) {
                    $this->flashMessage('Produkt nejde přidat do košíku', 'error');
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
}
