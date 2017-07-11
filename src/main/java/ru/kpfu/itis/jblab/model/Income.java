package ru.kpfu.itis.jblab.model;

import javax.persistence.*;

/**
 * Created by Марат on 07.07.2017.
 */
@Entity
@Table(name = "incomes")
public class Income {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OneToOne
    @JoinColumn(name = "income_source_id")
    private IncomeSource incomeSource;
    @OneToOne
    @JoinColumn(name = "operation_id")
    private Operation operation;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public IncomeSource getIncomeSource() {
        return incomeSource;
    }

    public void setIncomeSource(IncomeSource incomeSource) {
        this.incomeSource = incomeSource;
    }

    public Operation getOperation() {
        return operation;
    }

    public void setOperation(Operation operation) {
        this.operation = operation;
    }
}
