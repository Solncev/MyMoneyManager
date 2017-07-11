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

<#if commonBalance?has_content>
<div class="container">
    <h2>Общий баланс</h2>
    <div class="list-group">
        <a href="#" class="list-group-item">
            <h4 class="list-group-item-heading">общий баланс: ${commonBalance}</h4>
        </a>
    </div>
</div>
</#if>

<#if accounts?has_content>
<div class="container">
    <h2>Кошельки</h2>
    <div class="list-group">
        <#list accounts as account>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">${account.name}</h4>
                <p class="list-group-item-text">баланс: ${account.balance}</p>
                <form action="/account/${account.id}/delete">
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </div>
</div>
</#if>

<div class="container">
    <h2>Создать кошелёк</h2>
    <form action="/account/create" method="post" class="form-inline">
        <div class="form-group">
            <label for="account_name">Название:</label>
            <input type="text" class="form-control" id="account_name" placeholder="Введите название"
                   name="account_name">
        </div>
        <div class="form-group">
            <label for="account_balance">Сумма:</label>
            <input type="number" class="form-control" id="account_balance" placeholder="Введите текущую сумму"
                   name="account_balance" value="0">
        </div>
        <button type="submit" class="btn btn-default">Создать</button>
    </form>
</div>

<#if expenseTypes?has_content>
<div class="container">
    <h2>Расходы</h2>
    <div class="list-group">
        <#list expenseTypes as expenseType>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">${expenseType.name}</h4>
                <form action="/expense_type/${expenseType.id}/delete">
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </div>
</div>
</#if>

<div class="container">
    <h2>Создать категорию</h2>
    <form action="/expense_type/create" method="post" class="form-inline">
        <div class="form-group">
            <label for="expense_type_name">Название новой категории:</label>
            <input type="text" class="form-control" id="expense_type_name" placeholder="Введите название"
                   name="expense_type_name">
        </div>
        <button type="submit" class="btn btn-default">Создать</button>
    </form>
</div>

<#if operationList?has_content>
<div class="container">
    <h2>История</h2>
    <div class="list-group">
        <#list operationList as operation>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">из ${operation.account.name} в ${operation.date}</h4>
                <p class="list-group-item-text">-${operation.amount} P</p>
                <p class="list-group-item-text">${operation.comment}</p>
                <form action="/operation/${operation.id}/delete">
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </div>
</div>
</#if>

<div class="container">
    <h2>Добавить расход</h2>
    <form action="/expense/create" method="post" class="form-inline">
        <div class="form-group">
        <#if expenseTypes1?has_content>
            <label for="sel1">Категория расходов:</label>
            <select class="form-control" id="sel1" name="sel1">
                <#list expenseTypes1 as expenseType1>
                    <option value="${expenseType1.id}">${expenseType1.name}</option>
                </#list>
            </select>
        </#if>
        <#if accounts1?has_content>
            <label for="sel2">Выберите кошелёк:</label>
            <select class="form-control" id="sel2" name="sel2">
                <#list accounts1 as account1>
                    <option value="${account1.id}">${account1.name}</option>
                </#list>
            </select>
        </#if>
            <br>
        </div>
        <div class="form-group">
            <label for="operation_amount">Сумма:</label>
            <input type="number" class="form-control" name="operation_amount" id="operation_amount">
        </div>
        <div class="form-group">
            <label for="operation_comment">Комментарий:</label>
            <input type="text" class="form-control" id="operation_comment" name="operation_comment">
        </div>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
</div>

</body>
</html>