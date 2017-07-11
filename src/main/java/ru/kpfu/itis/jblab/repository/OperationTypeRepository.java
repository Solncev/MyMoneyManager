package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.OperationType;

/**
 * Created by Марат on 10.07.2017.
 */
public interface OperationTypeRepository extends JpaRepository<OperationType, Long> {
    OperationType findOneByName(String name);
}
