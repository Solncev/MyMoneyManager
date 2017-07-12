package ru.kpfu.itis.jblab.model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

/**
 * Created by Марат on 07.07.2017.
 */
@Entity
@Table(name = "expenses")
public class Expense {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @OneToOne
    @JoinColumn(name = "type_id")
    private ExpenseType expenseType;
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @OneToOne
    @JoinColumn(name = "operation_id")
    private Operation operation;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public ExpenseType getExpenseType() {
        return expenseType;
    }

    public void setExpenseType(ExpenseType expenseType) {
        this.expenseType = expenseType;
    }

    public Operation getOperation() {
        return operation;
    }

    public void setOperation(Operation operation) {
        this.operation = operation;
    }
}
