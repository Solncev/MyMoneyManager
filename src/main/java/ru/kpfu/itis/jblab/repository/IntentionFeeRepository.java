package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.IntentionFee;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
public interface IntentionFeeRepository extends JpaRepository<IntentionFee, Long> {
    List<IntentionFee> findAllByIntentionId(Long intentionId);

    IntentionFee findByOperationId(Long operationId);
}
