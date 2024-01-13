<?php

namespace App\Model\Repositories;

/**
 * Class ReservedProductRepository
 * @package App\Model\Repositories
 */
class ReservedProductRepository extends BaseRepository {
    /**
     * @throws \Dibi\Exception
     */
    public function deleteAllByCartId($cartId): void {
        $this->connection->query('DELETE FROM `reserved_product` WHERE cart_id = ?', $cartId);
    }

    public function deleteOldReservedProducts(): void {
        $this->connection->nativeQuery('DELETE FROM `reserved_product` WHERE (reserved_until < (NOW()))');
    }
}