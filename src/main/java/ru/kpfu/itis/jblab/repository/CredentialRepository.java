package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Credential;

/**
 * Created by Марат on 16.07.2017.
 */
public interface CredentialRepository extends JpaRepository<Credential, Long> {
    Credential findOneByLogin(String login);
}
