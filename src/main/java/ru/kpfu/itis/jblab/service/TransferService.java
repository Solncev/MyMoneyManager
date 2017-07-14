package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Transfer;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
public interface TransferService {
    void add(Transfer transfer);

    Transfer getByOperationId(Long operationId);

    void delete(Transfer transfer);

    List<Transfer> getAllBySecondAccountId(long id);

    Transfer update(Transfer transfer);
}
