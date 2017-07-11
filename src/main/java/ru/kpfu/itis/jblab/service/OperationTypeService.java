package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.OperationType;

/**
 * Created by Марат on 10.07.2017.
 */
public interface OperationTypeService {
    OperationType getByName(String name);
}
