package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Operation;
import ru.kpfu.itis.jblab.model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
public interface OperationRepository extends JpaRepository<Operation, Long> {
    List<Operation> findAllByOwnerIdOrderByDateDesc(Long ownerId);

    List<Operation> findAllByAccountIdOrderByDateDesc(Long accountId);

    List<Operation> findFirst10ByOwnerIdOrderByDateDesc(Long ownerId);

    List<Operation> findAllByDateAfterAndDateBeforeAndOwner(Date date, Date date2, User owner);
}

