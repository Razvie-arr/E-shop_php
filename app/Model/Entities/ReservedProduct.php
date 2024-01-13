<?php

namespace App\Model\Entities;

use Dibi\DateTime;
use LeanMapper\Entity;

/**
 * class ReservedProduct
 * @package App\Model\Entities
 * @property int $reservedProductId
 * @property DateTime $reservedUntil
 * @property Product $product m:hasOne
 * @property Cart $cart m:hasOne
 * @property int $count
 */
class ReservedProduct extends Entity {

}