package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Account;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
public interface AccountRepository extends JpaRepository<Account, Long> {
    List<Account> findAllByOwnerId(Long ownerId);
}
