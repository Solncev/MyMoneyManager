package ru.kpfu.itis.jblab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.jblab.model.Intention;

import java.util.List;

/**
 * Created by Марат on 13.07.2017.
 */
public interface IntentionRepository extends JpaRepository<Intention, Long> {
    List<Intention> findAllByOwnerId(Long ownerId);
}
