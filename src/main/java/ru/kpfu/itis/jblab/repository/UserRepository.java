package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.User;

/**
 * Created by Марат on 10.07.2017.
 */
public interface UserRepository extends JpaRepository<User, Long> {
}
