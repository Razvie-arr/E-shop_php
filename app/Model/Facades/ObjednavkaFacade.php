<?php

namespace App\Model\Facades;


use App\Model\Entities\Objednavka;
use App\Model\Entities\ObjednavkaItem;
use App\Model\Entities\User;
use App\Model\Repositories\ObjednavkaItemRepository;
use App\Model\Repositories\ObjednavkaRepository;


class ObjednavkaFacade{
    private ObjednavkaRepository $objednavkaRepository;
    private ObjednavkaItemRepository $objednavkaItemRepository;

    /**
     * Metoda vracející objednávku podle objednavkaId
     * @param int $id
     * @return Objednavka
     * @throws \Exception
     */
    public function getObjednavkaById(int $id):Objednavka {
        return $this->objednavkaRepository->find($id);
    }

    /**
     * Metoda vracející objednávku konkrétního uživatele
     * @param User|int $user
     * @return Objednavka
     * @throws \Exception
     */
    public function getObjednavkaByUser($user):Objednavka {
        if ($user instanceof User){
            $user=$user->userId;
        }
        return $this->objednavkaRepository->findBy(['user_id'=>$user]);
    }

    /**
     * Metoda pro smazání objednávky konkrétního uživatele
     * @param User|int $user
     */
    public function deleteObjednavkaByUser($user):void {
        try{
            $this->objednavkaRepository->delete($this->getObjednavkaByUser($user));
        }catch (\Exception $e){}
    }

    /**
     * Metoda pro smazání starých objednávek
     */
    public function deleteOldObjednavky():void {
        try{
            $this->objednavkaRepository->deleteOldObjednavky();
        }catch (\Exception $e){}
    }

    /**
     * Metoda vracející konkrétní ObjednavkaItem
     * @param int $objednavkaItemId
     * @return ObjednavkaItem
     * @throws \Exception
     */
    public function getObjednavkaItem(int $objednavkaItemId):ObjednavkaItem {
        return $this->objednavkaItemRepository->find($objednavkaItemId);
    }

    /**
     * Metoda pro uložení položky v objednávce
     * @param ObjednavkaItem $objednavkaItem
     */
    public function saveObjednavkaItem(ObjednavkaItem $objednavkaItem):void {
        $this->objednavkaItemRepository->persist($objednavkaItem);
    }

    /**
     * Metoda pro smazání položky objednávky
     * @param ObjednavkaItem $objednavkaItem
     * @throws \LeanMapper\Exception\InvalidStateException
     */
    public function deleteObjednavkaItem(ObjednavkaItem $objednavkaItem):void {
        $this->objednavkaItemRepository->delete($objednavkaItem);
    }

    /**
     * Metoda pro uložení objednávky
     * @param Objednavka $objednavka
     */
    public function saveObjednavka(Objednavka $objednavka):void {
        $this->objednavkaRepository->persist($objednavka);
    }


    public function __construct(ObjednavkaRepository $objednavkaRepository, ObjednavkaItemRepository $objednavkaItemRepository){
        $this->objednavkaRepository=$objednavkaRepository;
        $this->objednavkaItemRepository=$objednavkaItemRepository;
    }
}