package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;

/**
 * Created by Марат on 11.07.2017.
 */
@Controller
public class OperationController {
    private final OperationService operationService;
    private final ExpenseService expenseService;
    private final AccountService accountService;
    private final IncomeService incomeService;
    private final TransferService transferService;

    @Autowired
    public OperationController(OperationService operationService, ExpenseService expenseService, AccountService accountService, IncomeService incomeService, TransferService transferService) {
        this.operationService = operationService;
        this.expenseService = expenseService;
        this.accountService = accountService;
        this.incomeService = incomeService;
        this.transferService = transferService;
    }

    @RequestMapping(value = "/operation/{id}/delete")
    public String deleteOperation(@PathVariable("id") String id) {
        Long operationId = Long.valueOf(id);
        Operation operation = operationService.getOne(operationId);
        String typeName = operation.getOperationType().getName();
        Account account = operation.getAccount();
        Double amount = operation.getAmount();
        switch (typeName) {
            case "expense":
                Expense expense = expenseService.getByOperationId(operationId);
                account.setBalance(account.getBalance() + amount);
                accountService.update(account);
                if (expense != null)
                    expenseService.delete(expense);
                break;
            case "income":
                Income income = incomeService.getByOperationId(operationId);
                account.setBalance(account.getBalance() - amount);
                accountService.update(account);
                if (income != null)
                    incomeService.delete(income);
                break;
            case "transfer":
                Transfer transfer = transferService.getByOperationId(operationId);
                account.setBalance(account.getBalance() + amount);
                Account secondAccount = transfer.getSecondAccount();
                secondAccount.setBalance(secondAccount.getBalance() - amount);
                accountService.update(account);
                accountService.update(secondAccount);
                if (transfer != null) {
                    transferService.delete(transfer);
                }
                break;
        }
        operationService.delete(operation);
        return "redirect:/";
    }
}
