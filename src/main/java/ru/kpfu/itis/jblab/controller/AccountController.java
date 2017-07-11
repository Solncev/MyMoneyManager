package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.jblab.model.Account;
import ru.kpfu.itis.jblab.model.User;
import ru.kpfu.itis.jblab.service.AccountService;
import ru.kpfu.itis.jblab.service.UserService;

import java.util.Map;

/**
 * Created by Марат on 10.07.2017.
 */
@Controller
public class AccountController {
    private final AccountService accountService;
    private final UserService userService;

    @Autowired
    public AccountController(AccountService accountService, UserService userService) {
        this.accountService = accountService;
        this.userService = userService;
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
    public String deleteAccount(@PathVariable(name = "id") String id) {
        accountService.delete(Long.valueOf(id));
        return "redirect:/";
    }
}
