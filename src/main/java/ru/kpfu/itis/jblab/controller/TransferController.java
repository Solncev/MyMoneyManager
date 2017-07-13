package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.jblab.model.*;
import ru.kpfu.itis.jblab.service.*;

import java.util.Date;
import java.util.Map;

/**
 * Created by Марат on 13.07.2017.
 */
@Controller
public class TransferController {
    private final OperationService operationService;
    private final TransferService transferService;
    private final UserService userService;
    private final AccountService accountService;
    private final OperationTypeService operationTypeService;

    @Autowired
    public TransferController(OperationService operationService, TransferService transferService, UserService userService, AccountService accountService, OperationTypeService operationTypeService) {
        this.operationService = operationService;
        this.transferService = transferService;
        this.userService = userService;
        this.accountService = accountService;
        this.operationTypeService = operationTypeService;
    }

    @RequestMapping(value = "/transfer/create")
    public String createTransfer(@RequestParam Map<String, String> allRequestParams) {
        Long userId = 1L;
        User user = userService.getOne(userId);
        Long firstAccountId = Long.valueOf(allRequestParams.get("sel5"));
        Long secondAccountId = Long.valueOf(allRequestParams.get("sel6"));
        OperationType operationType = operationTypeService.getByName("transfer");
        String comment = allRequestParams.get("transfer_comment");
        Double amount = Double.valueOf(allRequestParams.get("transfer_amount"));
        if (firstAccountId != -1 && secondAccountId != -1) {
            Account firstAccount = accountService.getOne(firstAccountId);
            Account secondAccount = accountService.getOne(secondAccountId);
            Double firstBalance = firstAccount.getBalance();
            Double secondBalance = secondAccount.getBalance();
            firstAccount.setBalance(firstBalance - amount);
            secondAccount.setBalance(secondBalance + amount);
            accountService.update(firstAccount);
            accountService.update(secondAccount);
            Operation operation = new Operation();
            operation.setAccount(firstAccount);
            operation.setOwner(user);
            operation.setOperationType(operationType);
            operation.setDate(new Date(System.currentTimeMillis()));
            operation.setAmount(amount);
            operation.setComment(comment);
            operationService.add(operation);
            Transfer transfer = new Transfer();
            transfer.setOperation(operation);
            transfer.setSecondAccount(secondAccount);
            transferService.add(transfer);
        }
        return "redirect:/";
    }
}
