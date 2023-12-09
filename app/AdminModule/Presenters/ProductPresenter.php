<?php

namespace App\AdminModule\Presenters;

use App\AdminModule\Components\ProductEditForm\ProductEditForm;
use App\AdminModule\Components\ProductEditForm\ProductEditFormFactory;
use App\Model\Facades\ProductsFacade;

/**
 * Class ProductPresenter
 * @package App\AdminModule\Presenters
 */
class ProductPresenter extends BasePresenter{
  private ProductsFacade $productsFacade;
  private ProductEditFormFactory $productEditFormFactory;

  /**
   * Akce pro vykreslení seznamu produktů
   */
  public function renderDefault():void {
    $this->template->products=$this->productsFacade->findProducts(['order'=>'title']);
  }

  /**
   * Akce pro úpravu jednoho produktu
   * @param int $id
   * @throws \Nette\Application\AbortException
   */
  public function renderEdit(int $id):void {
    try{
      $product=$this->productsFacade->getProduct($id);
    }catch (\Exception $e){
      $this->flashMessage('Požadovaný produkt nebyl nalezen.', 'error');
      $this->redirect('default');
    }
    if (!$this->user->isAllowed($product,'edit')){
      $this->flashMessage('Požadovaný produkt nemůžete upravovat.', 'error');
      $this->redirect('default');
    }

    $form=$this->getComponent('productEditForm');
    $form->setDefaults($product);
    $this->template->product=$product;
  }

    /**
     * Akce pro smazání produktu
     * @param int $id
     * @throws \Nette\Application\AbortException
     */
    public function actionDelete(int $id):void {
        try{
            $product = $this->productsFacade->getProduct($id);
        }catch (\Exception $e){
            $this->flashMessage('Požadovaný produkt nebyl nalezen.', 'error');
            $this->redirect('default');
        }

        if (!$this->user->isAllowed($product,'delete')){
            $this->flashMessage('Tento produkt není možné smazat.', 'error');
            $this->redirect('default');
        }

        if ($this->productsFacade->deleteProduct($product)){
            $this->flashMessage('Produkt byl smazán.', 'info');
        }else{
            $this->flashMessage('Tento produkt není možné smazat.', 'error');
        }

        $this->redirect('default');
    }

  /**
   * Formulář na editaci produktů
   * @return ProductEditForm
   */
  public function createComponentProductEditForm():ProductEditForm {
    $form = $this->productEditFormFactory->create();
    $form->onCancel[]=function(){
      $this->redirect('default');
    };
    $form->onFinished[]=function($message=null){
      if (!empty($message)){
        $this->flashMessage($message);
      }
      $this->redirect('default');
    };
    $form->onFailed[]=function($message=null){
      if (!empty($message)){
        $this->flashMessage($message,'error');
      }
      $this->redirect('default');
    };
    return $form;
  }

  #region injections
  public function injectProductsFacade(ProductsFacade $productsFacade):void {
    $this->productsFacade=$productsFacade;
  }
  public function injectProductEditFormFactory(ProductEditFormFactory $productEditFormFactory):void {
    $this->productEditFormFactory=$productEditFormFactory;
  }
  #endregion injections

}
