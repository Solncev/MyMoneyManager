package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;

import java.util.List;

/**
 * Created by Марат on 07.07.2017.
 */
@Controller
public class MainController {
    private final AccountService accountService;
    private final ExpenseTypeService expenseTypeService;
    private final OperationService operationService;
    private final IncomeSourceService incomeSourceService;
    private final UserService userService;
    private final IntentionService intentionService;
    private final DebtService debtService;

    @Autowired
    public MainController(AccountService accountService, ExpenseTypeService expenseTypeService, OperationService operationService, IncomeSourceService incomeSourceService, UserService userService, IntentionService intentionService, DebtService debtService) {
        this.accountService = accountService;
        this.expenseTypeService = expenseTypeService;
        this.operationService = operationService;
        this.incomeSourceService = incomeSourceService;
        this.userService = userService;
        this.intentionService = intentionService;
        this.debtService = debtService;
    }

    @RequestMapping(value = "/")
    public String getMainPage(Model model) {
        Long ownerId = 1L;
        List<Account> accounts = accountService.getAllByOwnerId(ownerId);
        List<ExpenseType> expenseTypes = expenseTypeService.getAllByOwnerId(ownerId);
        List<Operation> operationList = operationService.getAllByOwnerId(ownerId);
        List<Intention> intentionList = intentionService.getAllByOwnerId(ownerId);
        List<Debt> debtList = debtService.getAllByOwnerId(ownerId);
        Double commonBalance = 0.0;
        for (Account a : accounts) {
            commonBalance += a.getBalance();
        }
        List<IncomeSource> incomeSourceList = incomeSourceService.getAllByOwnerId(ownerId);
        model.addAttribute("incomeSourceList", incomeSourceList);
        model.addAttribute("incomeSourceList2", incomeSourceList);
        model.addAttribute("commonBalance", commonBalance);
        model.addAttribute("operationList", operationList);
        model.addAttribute("accounts", accounts);
        model.addAttribute("accounts1", accounts);
        model.addAttribute("accounts2", accounts);
        model.addAttribute("accounts3", accounts);
        model.addAttribute("accounts4", accounts);
        model.addAttribute("accounts5", accounts);
        model.addAttribute("accounts6", accounts);
        model.addAttribute("accounts7", accounts);
        model.addAttribute("expenseTypes", expenseTypes);
        model.addAttribute("expenseTypes1", expenseTypes);
        model.addAttribute("intentionList", intentionList);
        model.addAttribute("intentionList2", intentionList);
        model.addAttribute("debtList", debtList);
        return "main";
    }
}
