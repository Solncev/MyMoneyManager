package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Debt;

import java.util.List;

/**
 * Created by Марат on 14.07.2017.
 */
public interface DebtRepository extends JpaRepository<Debt, Long> {
    List<Debt> findAllByOwnerId(Long ownerId);

    List<Debt> findAllByAccountId(Long accountId);
}
