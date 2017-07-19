<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/auth.css">
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
            <form method="post" action="/login/process">
                <h4 class="window__auth-title">Вход</h4>
                <input class="window__auth-form--field" type="email" placeholder="Электронная почта" name="login">
                <input class="window__auth-form--field" type="password" placeholder="Пароль" name="password">
                <input class="window__auth-form--submit" type="submit" value="ВОЙТИ">
            </form>
            <p class="window__auth-form--sign-up">Нет аккаунта? <a class="window__auth-form--sign-up-link"
                                                                   href="/registration">Зарегистрироваться</a></p>
        </div>
    </div>
</section>
</body>
</html>
