package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;

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
    private final TransferService transferService;
    private final IncomeService incomeService;
    private final IntentionFeeService intentionFeeService;
    private final DebtService debtService;

    @Autowired
    public AccountController(AccountService accountService, OperationService operationService, UserService userService,
                             ExpenseService expenseService, TransferService transferService, IncomeService incomeService, IntentionFeeService intentionFeeService, DebtService debtService) {
        this.accountService = accountService;
        this.operationService = operationService;
        this.userService = userService;
        this.expenseService = expenseService;
        this.transferService = transferService;
        this.incomeService = incomeService;
        this.intentionFeeService = intentionFeeService;
        this.debtService = debtService;
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
        Account deletedAccount = accountService.getOne(id);
        if (deletedAccount != null) {
            account.setName(deletedAccount.getName());
            account.setPicture(deletedAccount.getPicture());
            accountService.add(account);
            List<Debt> debtList = debtService.getAllByAccountId(id);
            for (Debt debt : debtList) {
                debt.setAccount(account);
                debtService.update(debt);
            }
            if (flag) {
                List<Transfer> transfers = transferService.getAllBySecondAccountId(deletedAccount.getId());
                for (Transfer transfer : transfers) {
                    transfer.setSecondAccount(account);
                    transferService.update(transfer);
                }
                for (Operation operation : operationList) {
                    operation.setAccount(account);
                    operationService.update(operation);
                }
            } else {
                List<Transfer> transfers = transferService.getAllBySecondAccountId(deletedAccount.getId());
                for (Transfer transfer : transfers) {
                    transferService.delete(transfer);
                }
                for (Operation operation : operationList) {
                    String operationName = operation.getOperationType().getName();
                    switch (operationName) {
                        case "expense":
                            Expense expense = expenseService.getByOperationId(operation.getId());
                            if (expense != null)
                                expenseService.delete(expense);
                            break;
                        case "income":
                            Income income = incomeService.getByOperationId(operation.getId());
                            if (income != null)
                                incomeService.delete(income);
                            break;
                        case "transfer":
                            Transfer transfer = transferService.getByOperationId(operation.getId());
                            if (transfer != null)
                                transferService.delete(transfer);
                            break;
                        case "intention":
                            IntentionFee intentionFee = intentionFeeService.getByOperationId(operation.getId());
                            if (intentionFee != null)
                                intentionFeeService.delete(intentionFee);
                            break;
                    }
                    operationService.delete(operation);
                }
            }
        }
        accountService.delete(id);
        return "redirect:/";
    }
}

