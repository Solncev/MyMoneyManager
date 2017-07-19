package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
 * Created by Марат on 11.07.2017.
 */
@Controller
public class IncomeController {
    private final IncomeService incomeService;
    private final IncomeSourceService incomeSourceService;
    private final UserService userService;
    private final OperationTypeService operationTypeService;
    private final OperationService operationService;
    private final AccountService accountService;

    @Autowired
    public IncomeController(IncomeService incomeService, IncomeSourceService incomeSourceService, UserService userService, OperationTypeService operationTypeService, OperationService operationService, AccountService accountService) {
        this.incomeService = incomeService;
        this.incomeSourceService = incomeSourceService;
        this.userService = userService;
        this.operationTypeService = operationTypeService;
        this.operationService = operationService;
        this.accountService = accountService;
    }

    @RequestMapping(value = "/income_source/create", method = RequestMethod.POST)
    public String createIncomeSource(@RequestParam Map<String, String> allRequestParams) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = allRequestParams.get("income_source_name");
        IncomeSource incomeSource = new IncomeSource();
        incomeSource.setOwner(user);
        incomeSource.setName(name);
        incomeSource.setActualIncome(0.0);
        incomeSourceService.add(incomeSource);
        return "redirect:/";
    }

    @RequestMapping(value = "/income/create", method = RequestMethod.POST)
    public String addIncome(@RequestParam Map<String, String> allRequestParams) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long incomeSourceId = Long.valueOf(allRequestParams.get("sel3"));
        Double amount = Double.valueOf(allRequestParams.get("income_amount"));
        Long accountId = Long.valueOf(allRequestParams.get("sel4"));
        if (incomeSourceId != -1 && accountId != -1) {
            IncomeSource incomeSource = incomeSourceService.getOne(incomeSourceId);
            Account account = accountService.getOne(accountId);
            Double accountBalance = account.getBalance();
            account.setBalance(accountBalance + amount);
            account = accountService.update(account);
            Double incomeSourceBalance = incomeSource.getActualIncome();
            incomeSource.setActualIncome(incomeSourceBalance + amount);
            incomeSourceService.update(incomeSource);
            OperationType operationType = operationTypeService.getByName("income");
            Operation operation = new Operation();
            operation.setAmount(amount);
            operation.setDate(new Date(System.currentTimeMillis()));
            operation.setOperationType(operationType);
            operation.setAccount(account);
            operation.setComment(incomeSource.getName());
            operation.setOwner(user);
            operationService.add(operation);
            Income income = new Income();
            income.setIncomeSource(incomeSource);
            income.setOperation(operation);
            incomeService.add(income);
        }
        return "redirect:/";
    }


    @RequestMapping(value = "/income_source/{id}/delete")
    public String deleteIncomeSource(@PathVariable("id") String incomeSourceId) {
        Long id = Long.valueOf(incomeSourceId);
        List<Income> incomeList = incomeService.getAllByIncomeSourceId(id);
        IncomeSource deletedIncomeSource = incomeSourceService.getOne(id);
        IncomeSource incomeSource = new IncomeSource();
        incomeSource.setName(deletedIncomeSource.getName());
        incomeSource.setActualIncome(deletedIncomeSource.getActualIncome());
        incomeSource.setPicture(deletedIncomeSource.getPicture());
        for (Income income : incomeList) {
            income.setIncomeSource(incomeSource);
            incomeService.update(income);
        }
        incomeSourceService.delete(id);
        return "redirect:/";
    }
}
