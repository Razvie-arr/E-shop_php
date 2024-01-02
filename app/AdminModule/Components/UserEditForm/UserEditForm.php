<?php

namespace App\AdminModule\Components\UserEditForm;

use App\Model\Entities\User;
use App\Model\Facades\UsersFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class UserEditForm
 * @package App\AdminModule\Components\UserEditForm
 *
 * @method onFinished(string $message = '')
 * @method onFailed(string $message = '')
 * @method onCancel()
 */
class UserEditForm extends Form {

    use SmartObject;

    /** @var callable[] $onFinished */
    public array $onFinished = [];
    /** @var callable[] $onFailed */
    public array $onFailed = [];
    /** @var callable[] $onCancel */
    public array $onCancel = [];

    private UsersFacade $usersFacade;
    private Nette\Security\Passwords $passwords;

    /**
     * UserEditForm constructor.
     * @param UsersFacade $usersFacade
     * @param Nette\Security\Passwords $passwords
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(UsersFacade $usersFacade, Nette\Security\Passwords $passwords, ?Nette\ComponentModel\IContainer $parent = null, ?string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->usersFacade = $usersFacade;
        $this->passwords = $passwords;
        $this->createSubcomponents();
    }

    private function createSubcomponents() {
        $userId = $this->addHidden('userId');
        $this->addText('name', 'Jméno')
            ->setRequired('Musíte zadat jméno');
        $this->addText('email', 'Email')
            ->setRequired('Musíte zadat email');
        $this->addText('password', 'Heslo')
            ->setRequired('Musíte zadat heslo');

        #region role
        $roles = $this->usersFacade->findRoles();
        $rolesArr = array_map(function ($role) {
            return $role->roleId;
        }, $roles);
        $this->addSelect('roleId', 'Role', $rolesArr)
            ->setPrompt('--vyberte role--')
            ->setRequired('Musít zadat role');
        #endregion role

        $this->addSubmit('ok', 'uložit')
            ->onClick[] = function (SubmitButton $button) {
            $values = $this->getValues('array');
            if (!empty($values['userId'])) {
                try {
                    $user = $this->usersFacade->getUser($values['userId']);
                } catch (\Exception $e) {
                    $this->onFailed('Požadovaný uživatel nebyl nalezen.');
                    return;
                }
            } else {
                $user = new User();
            }
            $user->assign($values, ['name', 'email']);

            $rawPassword = $values['password'];
            $user->password = $this->passwords->hash($rawPassword);

            $user->role = $this->usersFacade->getRole($values['roleId']);

            $this->usersFacade->saveUser($user);
            $this->setValues(['userId' => $user->userId]);
            $this->onFinished('Uživatel byl uložen.');
        };
        $this->addSubmit('storno', 'zrušit')
            ->setValidationScope([$userId])
            ->onClick[] = function (SubmitButton $button) {
            $this->onCancel();
        };
    }

    public function setDefaults($values, bool $erase = false): self {
        if ($values instanceof User) {
            $values = [
                'userId' => $values->userId,
                'name' => $values->name,
                'email' => $values->email,
                'roleId' => $values->role->roleId,
                'password' => $values->password
            ];
        }
        parent::setDefaults($values, $erase);
        return $this;
    }
}