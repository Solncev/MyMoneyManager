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


<div class="container">
    <h2>Кошельки</h2>
    <div class="list-group">
    <#if accounts?has_content>
        <#list accounts as account>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">${account.name}</h4>
                <p class="list-group-item-text">баланс: ${account.balance}</p>
                <form action="/account/${account.id}/delete">
                    <input type="checkbox" name="account_history" value="true">cохранить историю<br>
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </#if>
    </div>
</div>


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


<div class="container">
    <h2>Расходы</h2>
    <div class="list-group">
    <#if expenseTypes?has_content>
        <#list expenseTypes as expenseType>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">${expenseType.name}</h4>
                <form action="/expense_type/${expenseType.id}/delete">
                    <input type="checkbox" name="expense_type_history" value="true">cохранить историю<br>
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </#if>
    </div>
</div>


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


<div class="container">
    <h2>История</h2>
    <div class="list-group">
    <#if operationList?has_content>
        <#list operationList as operation>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">из ${operation.account.name} в ${operation.date}</h4>
                <p class="list-group-item-text">-${operation.amount} P</p>
                <p class="list-group-item-text">${operation.comment}</p>
                <form action="/operation/${operation.id}/delete" method="post">
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </#if>
    </div>
</div>


<div class="container">
    <h2>Добавить расход</h2>
    <form action="/expense/create" method="post" class="form-inline">
        <div class="form-group">
            <label for="sel1">Категория расходов:</label>
            <select class="form-control" id="sel1" name="sel1">
                <option value="-1">выбрать</option>
            <#if expenseTypes1?has_content>
                <#list expenseTypes1 as expenseType1>
                    <option value="${expenseType1.id}">${expenseType1.name}</option>
                </#list>
            </#if>
            </select>
        </div>
        <div class="form-group">

            <label for="sel2">Выберите кошелёк:</label>
            <select class="form-control" id="sel2" name="sel2">
                <option value="-1">выбрать</option>
            <#if accounts1?has_content>
                <#list accounts1 as account1>
                    <option value="${account1.id}">${account1.name}</option>
                </#list>
            </#if>
            </select>
        </div>
        <div class="form-group">
            <label for="operation_amount">Сумма:</label>
            <input type="number" class="form-control" name="operation_amount" id="operation_amount" value="0">
        </div>
        <div class="form-group">
            <label for="operation_comment">Комментарий:</label>
            <input type="text" class="form-control" id="operation_comment" name="operation_comment">
        </div>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
</div>


<div class="container">
    <h2>Источники дохода</h2>
    <div class="list-group">
    <#if incomeSourceList?has_content>
        <#list incomeSourceList as incomeSource>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">${incomeSource.name}</h4>
                <p class="list-group-item-text">+${incomeSource.actualIncome} P</p>
                <form action="/income_source/${incomeSource.id}/delete">
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </#if>
    </div>
</div>


<div class="container">
    <h2>Создать источник дохода</h2>
    <form action="/income_source/create" method="post" class="form-inline">
        <div class="form-group">
            <label for="income_source_name">Название источника дохода:</label>
            <input type="text" class="form-control" id="income_source_name" placeholder="Введите название"
                   name="income_source_name">
        </div>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
</div>


<div class="container">
    <h2>Добавить доход</h2>
    <form action="/income/create" method="post" class="form-inline">
        <div class="form-group">
            <label for="sel3">Выберите источник:</label>
            <select class="form-control" id="sel3" name="sel3">
                <option value="-1">выбрать</option>
            <#if incomeSourceList2?has_content>
                <#list incomeSourceList2 as incomeSource2>
                    <option value="${incomeSource2.id}">${incomeSource2.name}</option>
                </#list>
            </#if>
            </select>
            <br>
        </div>
        <div class="form-group">
            <label for="sel4">Выберите кошелёк:</label>
            <select class="form-control" id="sel4" name="sel4">
                <option value="-1">выбрать</option>
            <#if accounts2?has_content>
                <#list accounts2 as account2>
                    <option value="${account2.id}">${account2.name}</option>
                </#list>
            </#if>
            </select>
            <br>
        </div>
        <div class="form-group">
            <label for="operation_amount">Сумма:</label>
            <input type="number" class="form-control" name="income_amount" id="income_amount" value="0">
        </div>
        <div class="form-group">
            <label for="operation_comment">Комментарий:</label>
            <input type="text" class="form-control" id="income_comment" name="income_comment">
        </div>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
</div>

<div class="container">
    <h2>Выполнить перевод</h2>
    <form action="/transfer/create" method="post" class="form-inline">
        <div class="form-group">
            <label for="sel5">Откуда:</label>
            <select class="form-control" id="sel5" name="sel5">
                <option value="-1">выбрать</option>
            <#if accounts3?has_content>
                <#list accounts3 as account3>
                    <option value="${account3.id}">${account3.name}</option>
                </#list>
            </#if>
            </select>
            <br>
        </div>
        <div class="form-group">
            <label for="transfer_amount">Сумма:</label>
            <input type="number" class="form-control" name="transfer_amount" id="transfer_amount" value="0">
        </div>
        <div class="form-group">
            <label for="sel6">Куда:</label>
            <select class="form-control" id="sel6" name="sel6">
                <option value="-1">выбрать</option>
            <#if accounts3?has_content>
                <#list accounts4 as account4>
                    <option value="${account4.id}">${account4.name}</option>
                </#list>
            </#if>
            </select>
            <br>
        </div>
        <div class="form-group">
            <label for="transfer_comment">Комментарий:</label>
            <input type="text" class="form-control" id="transfer_comment" name="transfer_comment">
        </div>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
</div>

<div class="container">
    <h2>Цели</h2>
    <div class="list-group">
    <#if intentionList?has_content>
        <#list intentionList as intention>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">${intention.name}</h4>
                <img class="profile-photo" src="${intention.photo}">
                <p class="list-group-item-text">небоходимо: ${intention.plannedAmount} P</p>
                <p class="list-group-item-text">накоплено: ${intention.currentAmount} P</p>
                <form action="/intention/${intention.id}/delete" method="post">
                    <input type="submit" id="submit-btn" value="Удалить">
                </form>
            </a>
        </#list>
    </#if>
    </div>
</div>

<div class="container">
    <h2>Создать цель</h2>
    <form action="/intention/create" method="post" class="form-inline" enctype="multipart/form-data">
        <div class="form-group">
            <label for="intention_name">Название:</label>
            <input type="text" class="form-control" id="intention_name" placeholder="Введите название"
                   name="intention_name">
        </div>
        <div class="form-group">
            <label for="intention_planned_amount">Необходимая сумма:</label>
            <input type="number" class="form-control" name="intention_planned_amount"
                   id="intention_planned_amount" value="0">
        </div>
        <div class="form-group">
            <label for="intention_current_amount">Собранная сумма:</label>
            <input type="number" class="form-control" name="intention_current_amount"
                   id="intention_current_amount" value="0">
        </div>
        <input type="file" name="file" id="file-btn">
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
</div>

<div class="container">
    <h2>Перевести средства на цель</h2>
    <form action="/intention_fee/create" method="post" class="form-inline">
        <div class="form-group">
            <label for="sel7">Откуда:</label>
            <select class="form-control" id="sel7" name="sel7">
                <option value="-1">выбрать</option>
            <#if accounts5?has_content>
                <#list accounts5 as account5>
                    <option value="${account5.id}">${account5.name}</option>
                </#list>
            </#if>
            </select>
            <br>
        </div>
        <div class="form-group">
            <label for="sel8">Выберите цель:</label>
            <select class="form-control" id="sel8" name="sel8">
                <option value="-1">выбрать</option>
            <#if intentionList2?has_content>
                <#list intentionList2 as intention2>
                    <option value="${intention2.id}">${intention2.name}</option>
                </#list>
            </#if>
            </select>
            <br>
        </div>
        <div class="form-group">
            <label for="intention_fee_amount">Сумма:</label>
            <input type="number" class="form-control" name="intention_fee_amount"
                   id="intention_fee_amount" value="0">
        </div>
        <div class="form-group">
            <label for="intention_fee_comment">Комментарий:</label>
            <input type="text" class="form-control" id="intention_fee_comment" name="intention_fee_comment">
        </div>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
</div>


</body>
</html>