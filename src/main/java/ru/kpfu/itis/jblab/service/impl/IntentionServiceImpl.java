package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Intention;
import ru.kpfu.itis.jblab.repository.IntentionRepository;
import ru.kpfu.itis.jblab.service.IntentionService;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
@Service
public class IntentionServiceImpl implements IntentionService {
    private final IntentionRepository intentionRepository;

    @Autowired
    public IntentionServiceImpl(IntentionRepository intentionRepository) {
        this.intentionRepository = intentionRepository;
    }

    @Override
    public void add(Intention intention) {
        intentionRepository.save(intention);
    }

    @Override
    public List<Intention> getAllByOwnerId(Long ownerId) {
        return intentionRepository.findAllByOwnerId(ownerId);
    }

    @Override
    public Intention getOne(Long id) {
        return intentionRepository.findOne(id);
    }

    @Override
    public void delete(Intention intention) {
        intentionRepository.delete(intention);
    }

    @Override
    public Intention update(Intention intention) {
        return intentionRepository.save(intention);
    }
}
