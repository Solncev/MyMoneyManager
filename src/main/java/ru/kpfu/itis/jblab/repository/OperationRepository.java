package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Operation;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
public interface OperationRepository extends JpaRepository<Operation, Long> {
    List<Operation> findAllByOwnerId(Long ownerId);

    List<Operation> findAllByAccountId(Long accountId);
}
