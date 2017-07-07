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
    @JoinColumn(name = "sender_id")
    private Account sender;
    @OneToOne
    @JoinColumn(name = "recipient_id")
    private Account recipient;
    @OneToOne
    @JoinColumn(name = "operation_id")
    private Operation operation;

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

    public Account getSender() {
        return sender;
    }

    public void setSender(Account sender) {
        this.sender = sender;
    }

    public Account getRecipient() {
        return recipient;
    }

    public void setRecipient(Account recipient) {
        this.recipient = recipient;
    }
}
