package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Income;

import java.util.List;

/**
 * Created by Марат on 11.07.2017.
 */
public interface IncomeRepository extends JpaRepository<Income, Long> {
    Income findByOperationId(Long operationId);

    List<Income> findAllByIncomeSourceId(Long incomeSourceId);
}
