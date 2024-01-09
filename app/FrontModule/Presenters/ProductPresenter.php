<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\ProductCartForm\ProductCartFormFactory;
use App\FrontModule\Components\ProductCartForm\ProductCartFormTrait;
use App\Model\Facades\ProductsFacade;
use Nette\Application\BadRequestException;

/**
 * Class ProductPresenter
 * @package App\FrontModule\Presenters
 * @property string $category
 */
class ProductPresenter extends BasePresenter {

    use ProductCartFormTrait;

    private ProductsFacade $productsFacade;
    private ProductCartFormFactory $productCartFormFactory;

    /**
     * Akce pro zobrazení jednoho produktu
     * @param string $url
     * @throws BadRequestException
     */
    public function renderShow(string $url): void {
        try {
            $product = $this->productsFacade->getProductByUrl($url);
        } catch (\Exception $e) {
            throw new BadRequestException('Produkt nebyl nalezen.');
        }

        $this->template->product = $product;
    }

    /**
     * Akce pro vykreslení přehledu produktů
     */
    public function renderList(): void {
        //TODO tady by mělo přibýt filtrování podle kategorie, stránkování atp.
        $categoryName = "Všechny E-čtečky a doplňky";
        $findArray = ['order' => 'title'];
        if (isset($_GET["kategorie"])) {
            $categoryId = $_GET["kategorie"];
            $findArray['category_id'] = $categoryId;
            $categoryName = $this->categoriesFacade->getCategory($categoryId)->title;
        }
        $this->template->products = $this->productsFacade->findProducts($findArray);
        $this->template->categoryName = $categoryName;
    }

    #region injections
    public function injectProductsFacade(ProductsFacade $productsFacade): void {
        $this->productsFacade = $productsFacade;
    }

    public function injectProductCartFormFactory(ProductCartFormFactory $productCartFormFactory): void {
        $this->productCartFormFactory = $productCartFormFactory;
    }
    #endregion injections
}