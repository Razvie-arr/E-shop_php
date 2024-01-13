<?php

namespace App\Model\Facades;

use App\Model\Entities\Cart;
use App\Model\Entities\CartItem;
use App\Model\Entities\Product;
use App\Model\Entities\ReservedProduct;
use App\Model\Repositories\ReservedProductRepository;
use Dibi\DateTime;

/**
 * Class ReservedProductsFacade
 * @package App\Model\Facades
 */
class ReservedProductsFacade {
    private ReservedProductRepository $reservedProductRepository;
    const FIFTEEN_MINUTES = 'PT15M';

    /**
     * Metoda pro získání jednoho produktu
     * @param int $id
     * @return ReservedProduct
     * @throws \Exception
     */
    public function getReservedProduct(int $id): ReservedProduct {
        return $this->reservedProductRepository->find($id);
    }

    public function getReservedProductsByProduct(Product $product): ?array {
        try {
            return $this->reservedProductRepository->findBy(['product_id' => $product->productId]);
        } catch (\Exception $e) {
            return null;
        }
    }

    public function deleteOldReservedItems() {
        $this->reservedProductRepository->deleteOldReservedProducts();
    }

    public function reserveCartItems(Cart $cart) {
        foreach ($cart->getCartItems() as $cartItem) {
            $this->reserveCartItem($cartItem);
        }
    }

    private function reserveCartItem(CartItem $cartItem): void {
        $reservedProduct = new ReservedProduct();
        $reservedProduct->product = $cartItem->product;
        $reservedProduct->cart = $cartItem->cart;
        $reserveTime = new DateTime();
        $reserveTime->add(new \DateInterval(self::FIFTEEN_MINUTES));

        $reservedProduct->reservedUntil = $reserveTime;
        $reservedProduct->count = $cartItem->count;
        $this->saveReservedProduct($reservedProduct);
    }

    public function saveReservedProduct(ReservedProduct $reservedProduct) {
        $this->reservedProductRepository->persist($reservedProduct);
    }

    public function getProductAvailableCount($product): int {
        $reservedProducts = $this->getReservedProductsByProduct($product);
        $totalReservedCount = 0;
        if ($reservedProducts) {
            foreach ($reservedProducts as $reservedProduct) {
                $totalReservedCount += $reservedProduct->count;
            }
            return $product->count - $totalReservedCount;
        } else {
            return $product->count;
        }
    }

    /**
     * @throws \Dibi\Exception
     */
    public function deleteReservedProductsByCartId($cartId) {
        $this->reservedProductRepository->deleteAllByCartId($cartId);
    }

    public function __construct(ReservedProductRepository $reservedProductRepository) {
        $this->reservedProductRepository = $reservedProductRepository;
    }

}