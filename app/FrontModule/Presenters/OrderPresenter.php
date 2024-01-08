<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\OrderForm\OrderForm;
use App\FrontModule\Components\OrderForm\OrderFormFactory;
use App\Model\Facades\ObjednavkaFacade;
use Nette;

class OrderPresenter extends BasePresenter{

    private OrderFormFactory $orderFormFactory;

    private ObjednavkaFacade $objednavkaFacade;

    /**
     * Formulář pro odeslání objednávky
     * @return OrderForm
     */
    protected function createComponentOrderForm():OrderForm {
        $form=$this->orderFormFactory->create();
        $form->onFinished[]=function($message='')use($form){
            $values=$form->getValues('array');

            #region příprava textu mailu
            $mail = new Nette\Mail\Message();
            $mail->setFrom('bret04@vse.cz');
            $mail->addTo($values['email'],$values['jmeno']);
            $mail->subject = 'Objednávka z Eleknihy';
            $mail->htmlBody = 'Děkujeme za vaši objednávku v našem eshopu.';
            #endregion endregion příprava textu mailu

            //odeslání mailu pomocí PHP funkce mail
            $mailer = new Nette\Mail\SendmailMailer;
            $mailer->send($mail);


            if (!empty($message)){
                $this->flashMessage($message);
            }
            $this->redirect('Homepage:default');
        };
        $form->onCancel[]=function()use($form){
            $this->redirect('Cart:default');
        };

        $form->onFailed[]=function($message=null){
            if (!empty($message)){
                $this->flashMessage($message,'error');
            }
            $this->redirect('Cart:default');
        };
        return $form;
    }

    public function injectObjednavkaFacade(ObjednavkaFacade $objednavkaFacade):void {
        $this->objednavkaFacade=$objednavkaFacade;
    }

    public function injectOrderFormFactory(OrderFormFactory $orderFormFactory):void {
        $this->orderFormFactory=$orderFormFactory;
    }

}
