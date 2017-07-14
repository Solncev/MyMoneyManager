package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Transfer;
import ru.kpfu.itis.jblab.repository.TransferRepository;
import ru.kpfu.itis.jblab.service.TransferService;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
@Service
public class TransferServiceImpl implements TransferService {
    private final TransferRepository transferRepository;

    @Autowired
    public TransferServiceImpl(TransferRepository transferRepository) {
        this.transferRepository = transferRepository;
    }

    @Override
    public void add(Transfer transfer) {
        transferRepository.save(transfer);
    }

    @Override
    public Transfer getByOperationId(Long operationId) {
        return transferRepository.findByOperationId(operationId);
    }

    @Override
    public void delete(Transfer transfer) {
        transferRepository.delete(transfer);
    }

    @Override
    public List<Transfer> getAllBySecondAccountId(long id) {
        return transferRepository.findAllBySecondAccountId(id);
    }

    @Override
    public Transfer update(Transfer transfer) {
        return transferRepository.save(transfer);
    }
}
