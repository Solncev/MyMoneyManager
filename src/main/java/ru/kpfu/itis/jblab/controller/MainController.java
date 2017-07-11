package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kpfu.itis.jblab.model.Account;
import ru.kpfu.itis.jblab.model.ExpenseType;
import ru.kpfu.itis.jblab.model.Operation;
import ru.kpfu.itis.jblab.service.AccountService;
import ru.kpfu.itis.jblab.service.ExpenseTypeService;
import ru.kpfu.itis.jblab.service.OperationService;
import ru.kpfu.itis.jblab.service.UserService;

import java.util.List;

/**
 * Created by Марат on 07.07.2017.
 */
@Controller
public class MainController {
    private final AccountService accountService;
    private final ExpenseTypeService expenseTypeService;
    private final OperationService operationService;
    private final UserService userService;

    @Autowired
    public MainController(AccountService accountService, ExpenseTypeService expenseTypeService, OperationService operationService, UserService userService) {
        this.accountService = accountService;
        this.expenseTypeService = expenseTypeService;
        this.operationService = operationService;
        this.userService = userService;
    }

    @RequestMapping(value = "/")
    public String getMainPage(Model model) {
        Long ownerId = 1L;
        List<Account> accounts = accountService.getAllByOwnerId(ownerId);
        List<ExpenseType> expenseTypes = expenseTypeService.getAllByOwnerId(1L);
        List<Operation> operationList = operationService.getAllByOwnerId(ownerId);
        Double commonBalance = 0.0;
        for (Account a : accounts) {
            commonBalance += a.getBalance();
        }
        model.addAttribute("commonBalance", commonBalance);
        model.addAttribute("operationList", operationList);
        model.addAttribute("accounts", accounts);
        model.addAttribute("expenseTypes", expenseTypes);
        model.addAttribute("accounts1", accounts);
        model.addAttribute("expenseTypes1", expenseTypes);
        return "main";
    }
}
