package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Credential;
import ru.kpfu.itis.jblab.repository.CredentialRepository;
import ru.kpfu.itis.jblab.service.CredentialService;

/**
 * Created by Марат on 16.07.2017.
 */
@Service
public class CredentialServiceImpl implements CredentialService {
    private final CredentialRepository credentialRepository;

    @Autowired
    public CredentialServiceImpl(CredentialRepository credentialRepository) {
        this.credentialRepository = credentialRepository;
    }

    @Override
    public Credential getOneByLogin(String login) {
        return credentialRepository.findOneByLogin(login);
    }

    @Override
    public void add(Credential credential) {
        credentialRepository.save(credential);
    }
}
