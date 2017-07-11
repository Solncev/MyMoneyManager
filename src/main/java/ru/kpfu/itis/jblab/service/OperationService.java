package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Operation;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
public interface OperationService {
    void add(Operation operation);

    List<Operation> getAll();

    Operation getOne(Long id);

    void delete(Operation operation);

    List<Operation> getAllByOwnerId(Long ownerId);
}
