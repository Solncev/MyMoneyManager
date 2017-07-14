package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Intention;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
public interface IntentionService {
    void add(Intention intention);

    List<Intention> getAllByOwnerId(Long ownerId);

    Intention getOne(Long id);

    void delete(Intention intention);

    Intention update(Intention intention);
}
