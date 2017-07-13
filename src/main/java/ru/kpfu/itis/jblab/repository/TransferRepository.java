package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Transfer;

/**
 * Created by Марат on 13.07.2017.
 */
public interface TransferRepository extends JpaRepository<Transfer, Long> {
    Transfer findByOperationId(Long operationId);
}
