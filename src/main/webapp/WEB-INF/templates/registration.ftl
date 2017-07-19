<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
    <link href="/css/auth.css" rel="stylesheet" type="text/css">
</head>
<body>
<section class="auth_container">
    <div class="auth_container__logo">
        <div class="auth_container__logo--container">
            <img class="auth_container__logotype" src="/images/logotype.png">
            <p class="auth_container__logo--paragraph">Сервис учета расходов и планирования личных финансов</p>
        </div>

    </div>
    <div class="auth_container__window">
        <div class="auth_container__window--container">
            <form method="post" action="/registration">
                <h4 class="window__auth-title">Регистрация</h4>
                <input class="window__auth-form--field" type="text" placeholder="Имя" name="user_name">
                <input class="window__auth-form--field" type="text" placeholder="Фамилия" name="user_surname">
                <input class="window__auth-form--field" type="email" placeholder="Электронная почта" name="user_login">
                <input class="window__auth-form--field" type="password" placeholder="Пароль" name="user_password">
                <input class="window__auth-form--submit" type="submit" value="ЗАРЕГИСТРИРОВАТЬСЯ">
            </form>
            <p class="window__auth-form--sign-up">Уже есть аккаунт? <a class="window__auth-form--sign-up-link"
                                                                       href="/login">Войти</a></p>
        </div>
    </div>
</section>
</body>
</html>