package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    private final IntentionFeeService intentionFeeService;
    private final IntentionService intentionService;

    @Autowired
    public OperationController(OperationService operationService, ExpenseService expenseService, AccountService accountService, IncomeService incomeService, TransferService transferService, IntentionFeeService intentionFeeService, IntentionService intentionService) {
        this.operationService = operationService;
        this.expenseService = expenseService;
        this.accountService = accountService;
        this.incomeService = incomeService;
        this.transferService = transferService;
        this.intentionFeeService = intentionFeeService;
        this.intentionService = intentionService;
    }

    @RequestMapping(value = "/operation/{id}/delete", method = RequestMethod.POST)
    public String deleteOperation(@PathVariable("id") String id) {
        Long operationId = Long.valueOf(id);
        Operation operation = operationService.getOne(operationId);
        String typeName = operation.getOperationType().getName();
        Account account = operation.getAccount();
        Double amount = operation.getAmount();
        switch (typeName) {
            case "expense":
                Expense expense = expenseService.getByOperationId(operationId);
                if (expense != null) {
                    account.setBalance(account.getBalance() + amount);
                    accountService.update(account);
                    expenseService.delete(expense);
                }
                break;
            case "income":
                Income income = incomeService.getByOperationId(operationId);
                if (income != null) {
                    account.setBalance(account.getBalance() - amount);
                    accountService.update(account);
                    incomeService.delete(income);
                }
                break;
            case "transfer":
                Transfer transfer = transferService.getByOperationId(operationId);
                if (transfer != null) {
                    account.setBalance(account.getBalance() + amount);
                    Account secondAccount = transfer.getSecondAccount();
                    secondAccount.setBalance(secondAccount.getBalance() - amount);
                    accountService.update(account);
                    accountService.update(secondAccount);
                    transferService.delete(transfer);
                }
                break;
            case "intention":
                IntentionFee intentionFee = intentionFeeService.getByOperationId(operationId);
                if (intentionFee != null) {
                    Intention intention = intentionFee.getIntention();
                    intention.setCurrentAmount(intention.getCurrentAmount() - amount);
                    intentionService.update(intention);
                    account.setBalance(account.getBalance() + amount);
                    accountService.update(account);
                    intentionFeeService.delete(intentionFee);
                }
                break;
        }
        operationService.delete(operation);
        return "redirect:/";
    }
}
