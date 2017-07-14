package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.IntentionFee;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
public interface IntentionFeeService {
    void add(IntentionFee intentionFee);

    List<IntentionFee> getAllByIntentionId(Long intentionId);

    IntentionFee update(IntentionFee intentionFee);

    IntentionFee getByOperationId(Long operationId);

    void delete(IntentionFee intentionFee);
}
