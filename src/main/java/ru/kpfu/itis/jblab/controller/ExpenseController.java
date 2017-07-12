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
import java.util.List;
import java.util.Map;

/**
 * Created by Марат on 10.07.2017.
 */
@Controller
public class ExpenseController {
    private final UserService userService;
    private final ExpenseTypeService expenseTypeService;
    private final ExpenseService expenseService;
    private final OperationService operationService;
    private final OperationTypeService operationTypeService;
    private final AccountService accountService;

    @Autowired
    public ExpenseController(UserService userService, ExpenseTypeService expenseTypeService, ExpenseService expenseService, OperationService operationService, OperationTypeService operationTypeService, AccountService accountService) {
        this.userService = userService;
        this.expenseTypeService = expenseTypeService;
        this.expenseService = expenseService;
        this.operationService = operationService;
        this.operationTypeService = operationTypeService;
        this.accountService = accountService;
    }

    @RequestMapping(value = "/expense_type/create", method = RequestMethod.POST)
    public String createAccount(@RequestParam Map<String, String> allRequestParams) {
        String name = allRequestParams.get("expense_type_name");
        User user = userService.getOne(1L);
        if (!name.equals("")) {
            ExpenseType expenseType = new ExpenseType();
            expenseType.setName(name);
            expenseType.setOwner(user);
            expenseTypeService.add(expenseType);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/expense_type/{id}/delete")
    public String deleteAccount(@PathVariable(name = "id") String id,
                                @RequestParam Map<String, String> allRequestParams) {
        String expenseHistory = allRequestParams.get("expense_type_history");
        Boolean flag = (expenseHistory != null);
        Long expenseTypeId = Long.valueOf(id);
        List<Expense> expenseList = expenseService.getAllByExpenseTypeId(expenseTypeId);
        if (flag) {
            ExpenseType deletedExpenseType = expenseTypeService.getOne(expenseTypeId);
            ExpenseType expenseType = new ExpenseType();
            expenseType.setName(deletedExpenseType.getName());
            expenseType.setPicture(deletedExpenseType.getPicture());
            expenseTypeService.add(expenseType);
            for (Expense expense : expenseList) {
                expense.setExpenseType(expenseType);
                expenseService.update(expense);
            }
        } else {
            for (Expense expense : expenseList) {
                Operation operation = expense.getOperation();
                expenseService.delete(expense);
                operationService.delete(operation);
            }
        }
        expenseTypeService.delete(expenseTypeId);
        return "redirect:/";
    }

    @RequestMapping(value = "/expense/create", method = RequestMethod.POST)
    public String createExpense(@RequestParam Map<String, String> allRequestParams) {
        User user = userService.getOne(1L);
        Long accountId = Long.valueOf(allRequestParams.get("sel2"));
        String comment = allRequestParams.get("operation_comment");
        Long expenseTypeId = Long.valueOf(allRequestParams.get("sel1"));
        Double amount = Double.parseDouble(allRequestParams.get("operation_amount"));
        if (accountId != -1 && expenseTypeId != -1) {
            Account account = accountService.getOne(accountId);
            Double accountBalance = account.getBalance();
            account.setBalance(accountBalance - amount);
            account = accountService.update(account);
            OperationType operationType = operationTypeService.getByName("expense");
            Operation operation = new Operation();
            operation.setAmount(amount);
            operation.setDate(new Date(System.currentTimeMillis()));
            operation.setOperationType(operationType);
            operation.setAccount(account);
            operation.setComment(comment);
            operation.setOwner(user);
            operationService.add(operation);
            Expense expense = new Expense();
            ExpenseType expenseType = expenseTypeService.getOne(expenseTypeId);
            expense.setExpenseType(expenseType);
            expense.setOperation(operation);
            expenseService.add(expense);
        }
        return "redirect:/";
    }
}
