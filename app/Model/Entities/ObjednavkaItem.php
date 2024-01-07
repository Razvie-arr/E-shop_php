<?php


namespace App\Model\Entities;


use LeanMapper\Entity;

/**
 * Class ObjednavkaItem
 * @package App\Model\Entities
 * @property int $objednavkaItemId
 * @property Product $product m:hasOne
 * @property Objednavka $objednavka m:hasOne
 * @property int $count = 0
 * @property float $ObjednavkaItemPrice
 */
class ObjednavkaItem extends Entity{

}