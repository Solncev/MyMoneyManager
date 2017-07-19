package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;

import java.util.Calendar;
import java.util.Date;
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
        User currentUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long ownerId = currentUser.getId();
        List<Account> accounts = accountService.getAllByOwnerId(ownerId);
        List<ExpenseType> expenseTypes = expenseTypeService.getAllByOwnerId(ownerId);
        List<Operation> operationList = operationService.getAllByOwnerId(ownerId);
        List<Intention> intentionList = intentionService.getAllByOwnerId(ownerId);
        List<Debt> debtList = debtService.getAllByOwnerId(ownerId);
        List<Operation> last10Operations = operationService.getFirst10(ownerId);
        Double commonBalance = 0.0;
        Double expenseForMonth = 0.0;
        Double incomeForMonth = 0.0;
        Double expenseForToday = 0.0;
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        Date firstDateOfMonth = calendar.getTime();
        calendar.add(Calendar.MONTH, 1);
        calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
        Date lastDateOfMonth = calendar.getTime();
        calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date today = calendar.getTime();
        calendar.add(Calendar.DATE, 1);
        Date tomorrow = calendar.getTime();
        List<Operation> expnesesForToday = operationService.getAllByDateAfterAndDateBeforeAndOwner(today, tomorrow, currentUser);
        for (Operation operation : expnesesForToday) {
            switch (operation.getOperationType().getName()) {
                case "expense":
                    expenseForToday += operation.getAmount();
                    break;
            }
        }
        List<Operation> operationsForMonth = operationService.getAllByDateAfterAndDateBeforeAndOwner(firstDateOfMonth,
                lastDateOfMonth, currentUser);
        for (Operation operation : operationsForMonth) {
            switch (operation.getOperationType().getName()) {
                case "expense":
                    expenseForMonth += operation.getAmount();
                    break;
                case "income":
                    incomeForMonth += operation.getAmount();
                    break;
            }
        }
        for (Account a : accounts) {
            commonBalance += a.getBalance();
        }
        List<IncomeSource> incomeSourceList = incomeSourceService.getAllByOwnerId(ownerId);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("incomeSourceList", incomeSourceList);
        model.addAttribute("incomeSourceList2", incomeSourceList);
        model.addAttribute("commonBalance", commonBalance);
        model.addAttribute("operationList", operationList);
        model.addAttribute("last10Operations", last10Operations);
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
        model.addAttribute("expenseForMonth", expenseForMonth);
        model.addAttribute("incomeForMonth", incomeForMonth);
        model.addAttribute("expenseForToday", expenseForToday);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginPage() {
        return "login";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String getSignUpPage() {
        return "registration";
    }

}
