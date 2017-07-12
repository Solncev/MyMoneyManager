package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.jblab.model.Account;
import ru.kpfu.itis.jblab.model.Expense;
import ru.kpfu.itis.jblab.model.Operation;
import ru.kpfu.itis.jblab.model.User;
import ru.kpfu.itis.jblab.service.AccountService;
import ru.kpfu.itis.jblab.service.ExpenseService;
import ru.kpfu.itis.jblab.service.OperationService;
import ru.kpfu.itis.jblab.service.UserService;

import java.util.List;
import java.util.Map;

/**
 * Created by Марат on 10.07.2017.
 */
@Controller
public class AccountController {
    private final AccountService accountService;
    private final OperationService operationService;
    private final UserService userService;
    private final ExpenseService expenseService;

    @Autowired
    public AccountController(AccountService accountService, OperationService operationService, UserService userService, ExpenseService expenseService) {
        this.accountService = accountService;
        this.operationService = operationService;
        this.userService = userService;
        this.expenseService = expenseService;
    }

    @RequestMapping(value = "/account/create", method = RequestMethod.POST)
    public String createAccount(@RequestParam Map<String, String> allRequestParams) {
        String name = allRequestParams.get("account_name");
        String balance = allRequestParams.get("account_balance");
        User user = userService.getOne(1L);
        if (!name.equals("")) {
            Account account = new Account();
            account.setBalance(Double.parseDouble(balance));
            account.setName(name);
            account.setOwner(user);
            accountService.add(account);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/account/{id}/delete")
    public String deleteAccount(@PathVariable(name = "id") String accountId,
                                @RequestParam Map<String, String> allRequestParams) {
        Long id = Long.valueOf(accountId);
        String accountHistory = allRequestParams.get("account_history");
        Boolean flag = (accountHistory != null);
        List<Operation> operationList = operationService.getAllByAccountId(id);
        Account account = new Account();
        if (flag) {
            if (operationList != null) {
                Account deletedAccount = operationList.get(0).getAccount();
                account.setName(deletedAccount.getName());
                account.setPicture(deletedAccount.getPicture());
            }
            accountService.add(account);
            for (Operation operation : operationList) {
                operation.setAccount(account);
                operationService.update(operation);
            }
        } else {
            for (Operation operation : operationList) {
                Expense expense = expenseService.getByOperationId(operation.getId());
                expenseService.delete(expense);
                operationService.delete(operation);
            }
        }
        accountService.delete(id);
        return "redirect:/";
    }
}
