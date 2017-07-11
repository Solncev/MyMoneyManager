package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kpfu.itis.jblab.model.Account;
import ru.kpfu.itis.jblab.model.Expense;
import ru.kpfu.itis.jblab.model.Operation;
import ru.kpfu.itis.jblab.service.AccountService;
import ru.kpfu.itis.jblab.service.ExpenseService;
import ru.kpfu.itis.jblab.service.OperationService;

/**
 * Created by Марат on 11.07.2017.
 */
@Controller
public class OperationController {
    private final OperationService operationService;
    private final ExpenseService expenseService;
    private final AccountService accountService;

    @Autowired
    public OperationController(OperationService operationService, ExpenseService expenseService, AccountService accountService) {
        this.operationService = operationService;
        this.expenseService = expenseService;
        this.accountService = accountService;
    }

    @RequestMapping(value = "/operation/{id}/delete")
    public String deleteOperation(@PathVariable("id") String id) {
        Long operationId = Long.valueOf(id);
        Operation operation = operationService.getOne(operationId);
        String typeName = operation.getOperationType().getName();
        Account account = operation.getAccount();
        switch (typeName) {
            case "expense":
                Expense expense = expenseService.getByOperationId(operationId);
                account.setBalance(account.getBalance() + operation.getAmount());
                accountService.update(account);
                expenseService.delete(expense);
                break;
        }
        operationService.delete(operation);
        return "redirect:/";
    }
}
