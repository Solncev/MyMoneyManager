package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.IntentionFee;
import ru.kpfu.itis.jblab.repository.IntentionFeeRepository;
import ru.kpfu.itis.jblab.service.IntentionFeeService;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
@Service
public class IntentionFeeServiceImpl implements IntentionFeeService {
    private final IntentionFeeRepository intentionFeeRepository;

    @Autowired
    public IntentionFeeServiceImpl(IntentionFeeRepository intentionFeeRepository) {
        this.intentionFeeRepository = intentionFeeRepository;
    }

    @Override
    public void add(IntentionFee intentionFee) {
        intentionFeeRepository.save(intentionFee);
    }

    @Override
    public List<IntentionFee> getAllByIntentionId(Long intentionId) {
        return intentionFeeRepository.findAllByIntentionId(intentionId);
    }

    @Override
    public IntentionFee update(IntentionFee intentionFee) {
        return intentionFeeRepository.save(intentionFee);
    }

    @Override
    public IntentionFee getByOperationId(Long operationId) {
        return intentionFeeRepository.findByOperationId(operationId);
    }

    @Override
    public void delete(IntentionFee intentionFee) {
        intentionFeeRepository.delete(intentionFee);
    }
}
