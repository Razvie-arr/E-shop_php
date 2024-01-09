<?php

namespace App\Model\Entities;

use Dibi\DateTime;
use LeanMapper\Entity;

/**
 * Class Objednavka
 * @package App\Model\Entities
 * @property int $objednavkaId
 * @property int|null $userId = null
 * @property ObjednavkaItem[] $objednavkaItems m:belongsToMany
 * @property DateTime|null $objednavkaDate
 * @property string $objednavkaName
 * @property string $objednavkaEmail
 * @property string $objednavkaAddress
 * @property int $objednavkaPhone
 * @property bool $paid = false
 * @property float $objednavkaPrice
 * @property string $status;
 */
class Objednavka extends Entity {

    public function updateObjednavkaItems() {
        $this->row->cleanReferencingRowsCache('objednavka_item'); //smažeme cache, aby se položky v košíku znovu načetly z DB bez nutnosti načtení celého košíku
    }

}