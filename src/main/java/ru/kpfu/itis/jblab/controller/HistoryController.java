package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;
import ru.kpfu.itis.jblab.util.JsonConverter;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class HistoryController {
    private final AccountService accountService;
    private final ExpenseTypeService expenseTypeService;
    private final OperationService operationService;
    private final IncomeSourceService incomeSourceService;
    private final UserService userService;
    private final IntentionService intentionService;
    private final DebtService debtService;

    @Autowired
    public HistoryController(AccountService accountService, ExpenseTypeService expenseTypeService, OperationService operationService, IncomeSourceService incomeSourceService, UserService userService, IntentionService intentionService, DebtService debtService) {
        this.accountService = accountService;
        this.expenseTypeService = expenseTypeService;
        this.operationService = operationService;
        this.incomeSourceService = incomeSourceService;
        this.userService = userService;
        this.intentionService = intentionService;
        this.debtService = debtService;
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String getHistoryPage(Model model) {
        User currentUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long ownerId = currentUser.getId();
        List<Account> accounts = accountService.getAllByOwnerId(ownerId);
        List<ExpenseType> expenseTypes = expenseTypeService.getAllByOwnerId(ownerId);
        List<Operation> operationList = operationService.getAllByOwnerId(ownerId);
        List<Intention> intentionList = intentionService.getAllByOwnerId(ownerId);
        List<Debt> debtList = debtService.getAllByOwnerId(ownerId);
        List<Operation> last10Operations = operationService.getFirst10(ownerId);
        Double commonBalance = 0.0;
        Double expenseForToday = 0.0;
        Calendar calendar = Calendar.getInstance();
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
        for (Account a : accounts) {
            commonBalance += a.getBalance();
        }
        List<IncomeSource> incomeSourceList = incomeSourceService.getAllByOwnerId(ownerId);
        String[] operations = JsonConverter.getOperationJson(operationList);
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
        model.addAttribute("expenseForToday", expenseForToday);
        model.addAttribute("operations", Arrays.asList(operations));
        return "history-main-page";
    }
}
