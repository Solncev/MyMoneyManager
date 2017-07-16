package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Credential;

/**
 * Created by Марат on 16.07.2017.
 */
public interface CredentialService {
    Credential getOneByLogin(String login);

    void add(Credential credential);
}
