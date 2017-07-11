package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.ExpenseType;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
public interface ExpenseTypeRepository extends JpaRepository<ExpenseType, Long> {
    List<ExpenseType> findAllByOwnerId(Long ownerId);
}
