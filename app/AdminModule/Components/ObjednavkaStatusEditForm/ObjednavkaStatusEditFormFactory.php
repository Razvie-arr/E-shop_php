<?php

namespace App\AdminModule\Components\ObjednavkaStatusEditForm;

/**
 * Interface ObjednavkaStatusEditFormFactory
 * @package App\AdminModule\Components\ObjednavkaStatusEditForm
 */
interface ObjednavkaStatusEditFormFactory{

    public function create():ObjednavkaStatusEditForm;

}