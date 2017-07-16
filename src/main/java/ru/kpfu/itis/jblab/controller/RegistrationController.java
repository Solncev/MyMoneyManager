package ru.kpfu.itis.jblab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kpfu.itis.jblab.model.Credential;
import ru.kpfu.itis.jblab.model.User;
import ru.kpfu.itis.jblab.service.CredentialService;
import ru.kpfu.itis.jblab.service.UserService;

import java.util.Map;

/**
 * Created by Марат on 16.07.2017.
 */
@Controller
public class RegistrationController {
    private static final PasswordEncoder encoder = new BCryptPasswordEncoder();
    private final CredentialService credentialService;
    private final UserService userService;

    @Autowired
    public RegistrationController(CredentialService credentialService, UserService userService) {
        this.credentialService = credentialService;
        this.userService = userService;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String SignUp(@RequestParam Map<String, String> allRequestParams, Model model) {
        User user = new User();
        Credential credential = new Credential();
        String userName = allRequestParams.get("user_name");
        String userSurname = allRequestParams.get("user_surname");
        String login = allRequestParams.get("user_login");
        String password = allRequestParams.get("user_password");
        if (login != null && !login.isEmpty() && credentialService.getOneByLogin(login) == null
                && password != null && !password.isEmpty() && userName != null && !userName.isEmpty()
                && userSurname != null && !userSurname.isEmpty()) {
            user.setName(userName);
            user.setSurname(userSurname);
            userService.add(user);
            credential.setLogin(login);
            credential.setPassword(encoder.encode(password));
            credential.setOwner(user);
            credentialService.add(credential);
        } else {
            return "redirect:/";
        }
        return "redirect:/";
    }
}
