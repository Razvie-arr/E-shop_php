<?php

namespace App\FrontModule\Components\ProductCartForm;

use Nette\Application\UI\Multiplier;

trait ProductCartFormTrait {
    protected function createComponentProductCartForm(): Multiplier {
        return new Multiplier(function ($productId) {
            $form = $this->productCartFormFactory->create();
            $form->setDefaults(['productId' => $productId]);
            $form->onSubmit[] = function (ProductCartForm $form) {
                $selectedProductCount = (int)$form->values->count;
                try {
                    $product = $this->productsFacade->getProduct($form->values->productId);
                    //kontrola zakoupitelnosti

                    if ($selectedProductCount > $product->stock) {
                        throw new \InvalidArgumentException();
                    }
                } catch (\InvalidArgumentException $e) {
                    $this->flashMessage('Vybral jste větší množství produktů, než je skladem', 'error');
                    $this->redirect('this');
                } catch (\Exception $e) {
                    $this->flashMessage('Produkt nejde přidat do košíku', 'error');
                    $this->redirect('this');
                }

                //přidání do košíku
                /** @var CartControl $cart */
                $cart = $this->getComponent('cart');
                $cart->addToCart($product, $selectedProductCount);
                $this->redirect('this');
            };

            return $form;
        });
    }
}
