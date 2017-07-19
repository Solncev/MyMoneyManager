package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;
import ru.kpfu.itis.jblab.util.FileUploader;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Марат on 13.07.2017.
 */
@Controller
public class IntentionController {
    private final OperationService operationService;
    private final UserService userService;
    private final IntentionService intentionService;
    private final OperationTypeService operationTypeService;
    private final AccountService accountService;
    private final IntentionFeeService intentionFeeService;

    @Autowired
    public IntentionController(OperationService operationService, UserService userService, IntentionService intentionService, OperationTypeService operationTypeService, AccountService accountService, IntentionFeeService intentionFeeService) {
        this.operationService = operationService;
        this.userService = userService;
        this.intentionService = intentionService;
        this.operationTypeService = operationTypeService;
        this.accountService = accountService;
        this.intentionFeeService = intentionFeeService;
    }

    @RequestMapping(value = "/intention/create", method = RequestMethod.POST)
    public String createIntention(@RequestParam Map<String, String> allRequestParams,
                                  @RequestParam("file") MultipartFile file) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String intentionName = allRequestParams.get("intention_name");
        if (intentionName != null && !intentionName.isEmpty()) {
            Double plannedAmount = Double.valueOf(allRequestParams.get("intention_planned_amount"));
            Double currentAmount = Double.valueOf(allRequestParams.get("intention_current_amount"));
            if (plannedAmount > currentAmount) {
                String fileName = FileUploader.uploadFile(file);
                Intention intention = new Intention();
                intention.setOwner(user);
                intention.setName(intentionName);
                intention.setPlannedAmount(plannedAmount);
                intention.setCurrentAmount(currentAmount);
                intention.setPhoto(fileName);
                intentionService.add(intention);
            }
        }
        return "redirect:/";
    }


    @RequestMapping(value = "/intention_fee/create")
    public String createIntentionFee(@RequestParam Map<String, String> allRequestParams) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Long intentionId = Long.valueOf(allRequestParams.get("sel8"));
        Long accountId = Long.valueOf(allRequestParams.get("sel7"));
        Double amount = Double.valueOf(allRequestParams.get("intention_fee_amount"));
        String comment = allRequestParams.get("intention_fee_comment");
        OperationType operationType = operationTypeService.getByName("intention");
        if (intentionId != -1 && accountId != -1) {
            Intention intention = intentionService.getOne(intentionId);
            Account account = accountService.getOne(accountId);
            Double accountBalance = account.getBalance();
            Operation operation = new Operation();
            account.setBalance(accountBalance - amount);
            intention.setCurrentAmount(amount);
            intentionService.update(intention);
            operation.setAmount(amount);
            accountService.update(account);
            operation.setOwner(user);
            operation.setOperationType(operationType);
            operation.setAccount(account);
            operation.setComment(comment);
            operation.setDate(new Date(System.currentTimeMillis()));
            operationService.add(operation);
            IntentionFee intentionFee = new IntentionFee();
            intentionFee.setIntention(intention);
            intentionFee.setOperation(operation);
            intentionFeeService.add(intentionFee);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/intention/{id}/delete")
    public String deleteIntention(@PathVariable("id") String id) {
        Long intentionId = Long.valueOf(id);
        Intention deletedIntention = intentionService.getOne(intentionId);
        List<IntentionFee> intentionFeeList = intentionFeeService.getAllByIntentionId(intentionId);
        Intention intention = new Intention();
        intention.setName(deletedIntention.getName());
        intention.setCurrentAmount(deletedIntention.getCurrentAmount());
        intention.setPlannedAmount(deletedIntention.getPlannedAmount());
        intention.setPhoto(deletedIntention.getPhoto());
        intentionService.add(intention);
        for (IntentionFee intentionFee : intentionFeeList) {
            intentionFee.setIntention(intention);
            intentionFeeService.update(intentionFee);
        }
        intentionService.delete(deletedIntention);
        return "redirect:/";
    }
}
