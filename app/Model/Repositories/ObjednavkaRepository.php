<?php

namespace App\Model\Repositories;

/**
 * Class ObjednavkaRepository
 * @package App\Model\Repositories
 */
class ObjednavkaRepository extends BaseRepository{

    /**
     * Metoda pro smazání již neplatných záznamů
     */
    public function deleteOldObjednavky():void {
        $this->connection->nativeQuery('DELETE FROM `objednavka` WHERE (user_id IS NULL AND last_modified < (NOW() - INTERVAL 2 YEAR)) OR (last_modified < (NOW() - INTERVAL 5 YEAR))');
    }

}