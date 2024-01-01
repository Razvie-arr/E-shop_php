<?php

namespace App\AdminModule\Presenters;

use App\Model\Facades\UsersFacade;

/**
 * Class UserPresenter
 * @package App\AdminModule\Presenters
 */
class UserPresenter extends BasePresenter {
    private UsersFacade $usersFacade;

    public function renderDefault(): void {
        $this->template->listUsers = $this->usersFacade->findUsers(['order' => 'name']);
    }

    #region injections
    public function injectUsersFacade(UsersFacade $usersFacade): void {
        $this->usersFacade = $usersFacade;
    }
}