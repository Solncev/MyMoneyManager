<!DOCTYPE html>
<html lang="en">
<head>
    <title>MyMoneyManager</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <h3>Регистрация</h3>
    <form method="post" action="/registration">
        <div class="form-group">
            <label>Имя</label>
            <p><input type="text" class="form-control" id="login2" name="user_name">
            </p>
        </div>
        <div class="form-group">
            <label>Фамилия</label>
            <p><input type="text" class="form-control" id="login2" name="user_surname">
            </p>
        </div>
        <div class="form-group">
            <label>Логин</label>
            <p><input type="text" class="form-control" id="login2" name="user_login">
            </p>
        </div>
        <div class="form-group">
            <label>Пароль</label>
            <input type="password" class="form-control" id="password2" name="user_password"
                   placeholder="Введите пароль">
        </div>
        <input type="submit" class="btn btn-default" value="Рег">
    </form>
</div>