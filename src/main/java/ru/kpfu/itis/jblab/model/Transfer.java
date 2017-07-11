package ru.kpfu.itis.jblab.model;

import javax.persistence.*;

/**
 * Created by Марат on 07.07.2017.
 */
@Entity
@Table(name = "transfers")
public class Transfer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OneToOne
    @JoinColumn(name = "second_account_id")
    private Account secondAccount;
    @OneToOne
    @JoinColumn(name = "operation_id")
    private Operation operation;

    public Account getSecondAccount() {
        return secondAccount;
    }

    public void setSecondAccount(Account secondAccount) {
        this.secondAccount = secondAccount;
    }

    public Operation getOperation() {
        return operation;
    }

    public void setOperation(Operation operation) {
        this.operation = operation;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
