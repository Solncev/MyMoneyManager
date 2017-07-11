package ru.kpfu.itis.jblab.model;

import javax.persistence.*;

/**
 * Created by Марат on 07.07.2017.
 */
@Entity
@Table(name = "intention_fees")
public class IntentionFee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OneToOne
    @JoinColumn(name = "intention_id")
    private Intention intention;
    @OneToOne
    @JoinColumn(name = "operation_id")
    private Operation operation;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Intention getIntention() {
        return intention;
    }

    public void setIntention(Intention intention) {
        this.intention = intention;
    }

    public Operation getOperation() {
        return operation;
    }

    public void setOperation(Operation operation) {
        this.operation = operation;
    }
}
