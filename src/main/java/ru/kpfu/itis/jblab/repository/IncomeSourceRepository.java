package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.IncomeSource;

import java.util.List;

/**
 * Created by Марат on 11.07.2017.
 */
public interface IncomeSourceRepository extends JpaRepository<IncomeSource, Long> {
    List<IncomeSource> findAllByOwnerId(Long ownerId);
}
