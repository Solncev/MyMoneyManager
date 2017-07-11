package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Expense;

/**
 * Created by Марат on 10.07.2017.
 */
public interface ExpenseRepository extends JpaRepository<Expense, Long> {
    Expense findByOperationId(Long operationId);
}
