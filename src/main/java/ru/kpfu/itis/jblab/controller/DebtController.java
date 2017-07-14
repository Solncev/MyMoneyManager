package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;

import java.util.Date;
import java.util.Map;

/**
 * Created by Марат on 14.07.2017.
 */
@Controller
public class DebtController {
    private final UserService userService;
    private final OperationService operationService;
    private final DebtService debtService;
    private final AccountService accountService;
    private final OperationTypeService operationTypeService;

    @Autowired
    public DebtController(UserService userService, OperationService operationService, DebtService debtService, AccountService accountService, OperationTypeService operationTypeService) {
        this.userService = userService;
        this.operationService = operationService;
        this.debtService = debtService;
        this.accountService = accountService;
        this.operationTypeService = operationTypeService;
    }

    @RequestMapping(value = "/debt/create", method = RequestMethod.POST)
    public String createDebt(@RequestParam Map<String, String> allRequestParams) {
        Long userId = 1L;
        User user = userService.getOne(userId);
        String name = allRequestParams.get("debtor_name");
        int whoIsDebtor = Integer.parseInt(allRequestParams.get("sel9"));
        Double amount = Double.valueOf(allRequestParams.get("debt_amount"));
        Long accountId = Long.valueOf(allRequestParams.get("sel10"));
        if (whoIsDebtor != -1 && accountId != -1) {
            Operation operation = new Operation();
            OperationType operationType;
            Account account = accountService.getOne(accountId);
            Double accountBalance = account.getBalance();
            Debt debt = new Debt();
            debt.setOwner(user);
            debt.setOwnerDebtor(false);
            if (whoIsDebtor == 1) {
                debt.setOwnerDebtor(true);
                account.setBalance(accountBalance + amount);
                operationType = operationTypeService.getByName("income");
                operation.setComment("взял в долг у" + name);
            } else {
                account.setBalance(accountBalance - amount);
                operationType = operationTypeService.getByName("expense");
                operation.setComment("дал в долг" + name);
            }
            accountService.update(account);
            operation.setOwner(user);
            operation.setAccount(account);
            operation.setDate(new Date(System.currentTimeMillis()));
            operation.setAmount(amount);
            operation.setOperationType(operationType);
            operationService.add(operation);
            debt.setName(name);
            debt.setAmount(amount);
            debt.setAccount(account);
            debtService.add(debt);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/debt/{id}/delete", method = RequestMethod.POST)
    public String deleteDebt(@RequestParam Map<String, String> allRequestParam, @PathVariable("id") String debtId) {
        Long userId = 1L;
        User user = userService.getOne(userId);
        Long id = Long.valueOf(debtId);
        Debt debt = debtService.getOne(id);
        Operation operation = new Operation();
        operation.setOwner(user);
        OperationType operationType;
        Double amount = debt.getAmount();
        Long accountId = Long.valueOf(allRequestParam.get("sel11"));
        if (accountId != -1) {
            Account account = accountService.getOne(accountId);
            Double accountBalance = account.getBalance();
            if (debt.getOwnerDebtor()) {
                operationType = operationTypeService.getByName("expense");
                account.setBalance(accountBalance - amount);
                accountService.update(account);
            } else {
                operationType = operationTypeService.getByName("income");
                account.setBalance(accountBalance + amount);
                accountService.update(account);
            }
            operation.setOperationType(operationType);
            operation.setAmount(amount);
            operation.setDate(new Date(System.currentTimeMillis()));
            operation.setAccount(account);
            operation.setOwner(user);
            operation.setComment("долг");
            operationService.add(operation);
            debtService.delete(debt);
        }
        return "redirect:/";
    }
}
