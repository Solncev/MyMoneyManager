<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="/slick/slick-theme.css"/>

    <link rel="stylesheet" href="/css/main.css">

</head>
<body>
<section class="header">
    <div class="header-wrapper-first">
        <div class="header-logo">
            <a href="#">МмМ<img src="/images/logo.png"></a>
        <#if currentUser??>
            <a href="#">${currentUser.name} ${currentUser.surname}<img src="/images/user-icon.png"></a>
        <#else>
            <a href="#">ttl2.yadgar13@gmail.com<img src="/images/user-icon.png"></a>
        </#if>
        </div>
    </div>
    <div class="header-wrapper-second">
        <div class="header-content">
            <div class="header-numbers">
                <div class="balance">
                    <h1>${commonBalance} Р</h1><br>
                    <h3>Общий баланс</h3>
                </div>
                <div class="today-costs">
                    <h2>${expenseForToday} Р</h2>
                    <h3>Расходы за сегодня</h3>
                </div>
            </div>

            <div class="goals-container">
                <div class="goals-item" data-toggle="modal" data-target="#goals-modal-window">
                    <img class="goals-picture" src="images/goal-first.png">
                    <div class="bg">
                        <h2>Машина моей мечты</h2>
                        <span>200 000 из 1 800 000 Р</span>
                    </div>
                </div>
            </div>


            <div class="wallet-flex-container">
            <#if accounts?has_content>
                <#list accounts as account>
                    <div class="flex-wallet" data-toggle="modal" data-target="#wallet__modal-window">
                        <div>
                            <img src="/images/wallet.png">
                        </div>
                        <div>
                            <p>${account.name}</p>
                            <p>${account.balance} Р</p>
                        </div>
                    </div>
                </#list>
            </#if>
                <div class="flex-wallet" data-toggle="modal" data-target="#wallet__modal-window">
                    <div>
                        <img src="/images/wallet.png">
                    </div>
                    <div>
                        <p>Кошелёк</p>
                        <p>1000 Р</p>
                    </div>
                </div>
                <div class="flex-wallet" data-toggle="modal" data-target="#wallet__modal-window">
                    <div>
                        <img src="/images/card.png">
                    </div>
                    <div>
                        <p>Карта</p>
                        <p>1000 Р</p>
                    </div>
                </div>
                <div class="flex-wallet plus" data-toggle="modal" data-target="#create-wallet__modal-window">
                    <div>
                        <img src="/images/plus-iсon.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="container">
    <div class="modal fade" id="wallet-modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Кошелёк</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="name_wal" class="col-xs-4 control-label">Название:</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" id="name_wal" placeholder="Введите название">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sum_wal" class="col-xs-4 control-label">Сумма:</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" id="sum_wal" placeholder="Введите сумму">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-10">
                                <input type="submit" class="btn btn-default" value="Удалить">
                                <input type="submit" class="btn btn-default" value="Сохранить">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="modal fade" id="goals-modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="exampleInputFile">Прикрепить фотографию</label>
                            <input type="file" id="exampleInputFile">
                        </div>
                        <div class="form-group">
                            <label for="name_target">Название цели</label>
                            <input type="email" class="form-control" id="name_target" placeholder="Машина">
                        </div>
                        <div class="form-group">
                            <label for="sum_target">Необходимая сумма</label>
                            <input type="email" class="form-control" id="sum_target" placeholder="1 800 000 Р">
                        </div>
                        <div class="form-group">
                            <label for="have_target">Собрано</label>
                            <input type="email" class="form-control" id="have_target" placeholder="800 000 Р">
                        </div>
                        <button type="submit" class="btn btn-default">Cоздать</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="nav_block">
    <div class="menu">
        <ul class="menu__tabs">
            <li class="active-tab" id="one-tab" href="#content-one">
                <a class="simple-tab">РАСХОДЫ</a>
                <p class="sum">-${expenseForMonth} &#8381</p>
            </li>
            <li class="tab" id="two-tab" href="#content-two">
                <a class="simple-tab">ДОХОДЫ</a>
                <p class="sum">${incomeForMonth} &#8381</p>
            </li>
            <li class="tab" id="three-tab" href="#content-three">
                <a class="simple-tab">ПЕРЕВОДЫ</a>
            </li>
            <li class="tab" id="fourth-tab" href="#content-fourth">
                <a class="simple-tab">ДОЛГИ</a>
            </li>
        </ul>
    </div>
    <div class="content">
        <div id="content-one" class="content__container">
        <#if expenseTypes?has_content>
            <#list expenseTypes as expenseType>
                <div class="content__container__item">
                    <div class="edit_item"><a href="#" data-toggle="modal"
                                              data-target="#edit-category__modal-window"><img
                            src="/images/edit.png"></a></div>
                    <a>${expenseType.name}</a><br>
                    <img class="item__image" src="/images/food-icon.png" data-toggle="modal"
                         data-target="#transfer-window"><br>
                    <p>${expenseType.spent} &#8381</p>
                </div>
            </#list>
        </#if>
            <div class="content__container__item" data-toggle="modal" data-target="#create-category__modal-window">
                <div class="plus__border">
                    <h2 class="item__plus">+</h2>
                </div>
            </div>
        </div>

        <div id="content-two" class="content__container">
        <#if incomeSourceList ?has_content>
            <#list incomeSourceList as incomeSource>
                <div class="content__container__item">
                    <div class="edit_item"><a href="#" data-toggle="modal" data-target="#edit-income__modal-window"><img
                            src="images/edit.png"></a></div>
                    <a>${incomeSource.name}</a><br>
                    <img class="item__image" src="images/suitcase.png" data-toggle="modal"
                         data-target="#income-balance-window"><br>
                    <p>${incomeSource.actualIncome} &#8381</p>
                </div>
            </#list>
        </#if>
            <div class="content__container__item" data-toggle="modal" data-target="#create-income__modal-window">
                <div class="plus__border">
                    <h2 class="item__plus">+</h2>
                </div>
            </div>
        </div>

        <div id="content-three" class="content__container">
            <form class="content__container__form" method="post" action="/transfer/create">
                <table class="transfer_table">
                    <tr class="form__labels">
                        <td>Откуда</td>
                        <td></td>
                        <td>Сумма перевода</td>
                        <td></td>
                        <td>Куда</td>
                    </tr>
                    <tr>
                        <td>
                            <select class="content__container__form__select" id="select_out" name="sel5">
                                <option value="-1">Не выбрано</option>
                            <#if accounts3?has_content>
                                <#list accounts3 as account3>
                                    <option value="${account3.id}">${account3.name}</option>
                                </#list>
                            </#if>
                            </select>
                        </td>
                        <td class="form__hr"><img src="images/sh_arrow_1.png"></td>
                        <td><input type="number" class="form__input_text" name="transfer_amount"></td>
                        <td class="form__hr"><img src="images/sh_arrow_2.png"></td>
                        <td>
                            <select class="content__container__form__select" id="select_in" name="sel6">
                                <option value="-1">Не выбрано</option>
                            <#if accounts4?has_content>
                                <#list accounts4 as account4>
                                    <option value="${account4.id}">${account4.name}</option>
                                </#list>
                            </#if>
                            </select>
                        </td>
                    </tr>
                </table>
                <br>
                <input type="submit" value="Перевести" class="form__input_submit">
            </form>
        </div>

        <div id="content-fourth" class="content__container debt_p">
        <#if debtList?has_content>
            <#list debtList as debt>
                <div class="content__container__item">
                    <div class="edit_item"><a href="#" data-toggle="modal" data-target="#edit-dept__modal-window"><img
                            src="images/edit.png"></a></div>
                    <#if debt.ownerDebtor>
                        <p>Я должен</p>
                    <#else>
                        <p>Мне должен</p>
                    </#if>
                    <div class="overflow_text">
                        <a data-toggle="modal" data-target="#repay-dept__modal-window">${debt.name}</a><br>
                    </div>
                    <p>${debt.amount} &#8381</p>
                </div>
            </#list>
        </#if>
            <div class="content__container__item" data-toggle="modal" data-target="#create-dept__modal-window">
                <div class="plus__border">
                    <h2 class="item__plus">+</h2>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" rel="script" src="/js/tabs.js"></script>


    <section class="history">
        <h4>История</h4>
        <div class="history-flex-container">
        <#if last10Operations?has_content>
            <#list last10Operations as operation10>
                <div class="history-flex-item costs" data-toggle="modal" data-target="#history-costs__modal-window">
                    <div>
                        <strong>${operation10.comment}</strong><br>
                        <small>${operation10.account.name}</small>
                    </div>
                    <div>
                        <#if operation10.operationType.id==1>
                            <small>Расход</small>
                            <br>
                            <strong>-${operation10.amount} Р</strong>
                        </#if>
                        <#if operation10.operationType.id==2>
                            <small>Доход</small>
                            <br>
                            <strong>${operation10.amount} Р</strong>
                        </#if>
                        <#if operation10.operationType.id==3>
                            <small>Перевод</small>
                            <br>
                            <strong>${operation10.amount} Р</strong>
                        </#if>
                    </div>
                </div>
            </#list>
        </#if>

        </div>


        <div class="history-button">
            <p>
                <a href="/history">
                    <button type="button" class="">Вся история &nbsp; <img src="images/right-arrow-button.png"></button>
                </a>
            </p>
        </div>
    </section>

</section>


<section class="graphics">
    <div class="graphics__container">
        <div class="graph__pie">
            <section class="slider">
                <div id="arrow-left" class="slider-arrow slider-arrow--left">
                    <img src="/images/LeftArrow.png">
                </div>
                <div id="arrow-right" class="slider-arrow slider-arrow--right">
                    <img src="/images/RightArrow.png">
                </div>
                <div class="slider-content">
                    <div class="slider-frame">
                        <a id="a">Июнь</a><br>
                    </div>
                    <div class="slider-frame">
                        <a>Июль</a>
                    </div>
                    <div class="slider-frame">
                        <a>Август</a>
                    </div>
                </div>
            </section>
            <div id="donutchart"></div>
        </div>
        <div class="graph__column" id="columnchart_material">

        </div>
    </div>
</section>


<!-- pop up окно создание кошелька-->
<div class="container">
    <div class="modal fade" id="create-wallet__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Новый счёт</h4>
                </div>
                <div class="modal-body">
                    <form action="/account/create" method="post">
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><label for="create-wallet__name">Название счёта</label></td>
                                </tr>
                                <tr>
                                    <td class="td-container"><input type="text" class="form-control modal__name_cat"
                                                                    id="create-wallet__name" name="account_name">
                                        <img src="images/cart.png" class="dropdown-toggle rub__symbol"
                                             id="create-wallet__dropdown" data-toggle="dropdown">
                                        <div class="dropdown-menu change_icon" role="menu" aria-labelledby="dropdown">
                                            <div class="dropdown-menu-container">
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/cart.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/suitcase.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/camera.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/bag.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/wallet.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/shape.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/mobile.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_wallet_icon, this)"
                                                        src="images/grantma.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                            </div>
                                        </div>
                                        <script>
                                            var create_wallet_icon = document.getElementById("create-wallet__dropdown");

                                            function changeIcon(main_img, obj) {
                                                main_img.src = obj.src;
                                            }
                                        </script>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label for="create-wallet__balance">Баланс</label>
                            <input type="number" class="form-control modal__name_cat--bg" id="create-wallet__balance"
                                   name="account_balance">
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default" value="ДОБАВИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop up окно редактирования кошелька-->
<div class="container">
    <div class="modal fade" id="wallet__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Редактирование счёта</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><label for="edit-wallet__name">Название счёта</label></td>
                                </tr>
                                <tr>
                                    <td class="td-container"><input type="text" class="form-control modal__name_cat"
                                                                    id="edit-wallet__name">
                                        <img src="images/cart.png" class="dropdown-toggle rub__symbol"
                                             id="wallet-icon__dropdown" data-toggle="dropdown">
                                        <div class="dropdown-menu change_icon" role="menu"
                                             aria-labelledby="wallet-icon__dropdown">
                                            <div class="dropdown-menu-container">
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/cart.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/suitcase.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/camera.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/bag.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/wallet.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/shape.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/mobile.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_wallet_icon, this)"
                                                        src="images/grantma.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                            </div>
                                        </div>
                                        <script>
                                            var edit_wallet_icon = document.getElementById("wallet-icon__dropdown");
                                        </script>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label for="edit-wallet__balance">Баланс</label>
                            <td><input type="text" class="form-control modal__name_cat--bg" id="edit-wallet__balance">
                            </td>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для изменения категории -->
<div class="container">
    <div class="modal fade" id="edit-category__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Изменение категории</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><label for="edit-cat__name">Название</label></td>
                                </tr>
                                <tr>
                                    <td class="td-container"><input type="text" class="form-control modal__name_cat"
                                                                    id="edit-cat__name">
                                        <img src="images/cart.png" class="dropdown-toggle rub__symbol"
                                             id="edit-cat__dropdown" data-toggle="dropdown">
                                        <div class="dropdown-menu change_icon" role="menu"
                                             aria-labelledby="edit-cat__dropdown">
                                            <div class="dropdown-menu-container">
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/cart.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/suitcase.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/camera.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/bag.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/wallet.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/shape.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/mobile.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_category_icon, this)"
                                                        src="images/grantma.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                            </div>
                                            <script>
                                                var edit_category_icon = document.getElementById("edit-cat__dropdown");
                                            </script>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ"><br>
                                <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для перевода средств -->
<div class="container">
    <div class="modal fade" id="transfer-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Расходы</h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="/expense/create">
                        <div class="form-group">
                            <label for="select_category">Категория</label>
                            <select id="select_category" class="col-xs-6 cur_select" name="sel1">
                                <option value="-1">Не выбрано</option>
                            <#if expenseTypes1?has_content>
                                <#list expenseTypes1 as expenseType1>
                                    <option value="${expenseType1.id}">${expenseType1.name}</option>
                                </#list>
                            </#if>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="select_purse">Счёт</label>
                            <select id="select_purse" class="col-xs-6 cur_select" name="sel2">
                                <option value="-1">Не выбрано</option>
                            <#if accounts1?has_content>
                                <#list accounts1 as account1>
                                    <option value="${account1.id}">${account1.name}</option>
                                </#list>
                            </#if>
                            </select>
                        </div>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><input type="number" class="form-control modal__input--sum" id="sum_category"
                                               placeholder="Сумма расхода" name="operation_amount"></td>
                                    <td><label for="sum_category" class="rub_sym_label"><img class="rub__symbol"
                                                                                             src="images/rub.png"></label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="btn-group col-xs-14 cur_btns radios-as-buttons">
                            <div>
                                <input type="radio" name="expense_today" id="today_cat" class="radio_btn"/>
                                <label for="today_cat" id="today_label_cat" onclick="enterToday()">Сегодня</label>
                            </div>
                            <div>
                                <input type="radio" name="expense_yesterday" id="yesterday_cat" class="radio_btn"/>
                                <label for="yesterday_cat" id="yesterday_label_cat"
                                       onclick="enterYesterday()">Вчера</label>
                            </div>
                            <div id="other_cont_cat">
                                <input type="date" name="date" id="other_cat" class="radio-btn"
                                       onclick="enterDate()"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 transfer_save">
                                <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                            </div>
                        </div>
                        <script>
                            var date = document.getElementById('other_cat');
                            var input_today = document.getElementById('today_cat');
                            var input_yesterday = document.getElementById('yesterday_cat');

                            function enterDate() {
                                input_today.checked = false;
                                input_yesterday.checked = false;
                                date.style.background = '#ffffff';
                            }

                            function enterToday() {
                                date.style.background = '#eff0f0';
                                input_today.checked = true;
                                input_yesterday.checked = false;
                            }

                            function enterYesterday() {
                                date.style.background = '#eff0f0';
                                input_today.checked = false;
                                input_yesterday.checked = true;
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для создания категории -->
<div class="container">
    <div class="modal fade" id="create-category__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Создание категории</h4>
                </div>
                <div class="modal-body">
                    <form action="/expense_type/create" method="post">
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><label for="create-cat__name">Название</label></td>
                                </tr>
                                <tr>
                                    <td class="td-container"><input type="text" class="form-control modal__name_cat"
                                                                    id="create-cat__name"
                                                                    name="expense_type_name">
                                        <img src="images/cart.png" class="dropdown-toggle rub__symbol"
                                             id="create-cat__dropdown" data-toggle="dropdown">
                                        <div class="dropdown-menu change_icon" role="menu"
                                             aria-labelledby="create-cat__dropdown">
                                            <div class="dropdown-menu-container">
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)"
                                                        src="images/cart.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)"
                                                        src="images/suitcase.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)"
                                                        src="images/camera.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)" src="images/bag.png"
                                                        href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)"
                                                        src="images/wallet.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)"
                                                        src="images/shape.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)"
                                                        src="images/mobile.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_cat_icon, this)"
                                                        src="images/grantma.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                            </div>
                                            <script>
                                                var create_cat_icon = document.getElementById("create-cat__dropdown");
                                            </script>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default save_new" value="СОХРАНИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для изменения доходов -->
<div class="container">
    <div class="modal fade" id="edit-income__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Изменение дохода</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><label for="edit-income__name">Название</label></td>
                                </tr>
                                <tr>
                                    <td class="td-container"><input type="text" class="form-control modal__name_cat"
                                                                    id="edit-income__name">
                                        <img src="images/cart.png" class="dropdown-toggle rub__symbol"
                                             id="edit-income__dropdown" data-toggle="dropdown">
                                        <div class="dropdown-menu change_icon" role="menu"
                                             aria-labelledby="edit-income__dropdown">
                                            <div class="dropdown-menu-container">
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/cart.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/suitcase.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/camera.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/bag.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/wallet.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/shape.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/mobile.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(edit_income_icon, this)"
                                                        src="images/grantma.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                            </div>
                                        </div>
                                        <script>
                                            var edit_income_icon = document.getElementById("edit-income__dropdown");
                                        </script>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    <#--<div class="form-group">-->
                    <#--<label for="select_purse_income">Счёт</label>-->
                    <#--<select id="select_purse_income" class="col-xs-7 cur_select">-->
                    <#--<option>Не выбрано</option>-->
                    <#--<option>Кошелек</option>-->
                    <#--<option>Сбербанк</option>-->
                    <#--</select>-->
                    <#--</div>-->
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для изменения баланса доходов -->
<div class="container">
    <div class="modal fade" id="income-balance-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Добавить доход</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="income-select_purse">Счёт</label>
                            <select id="income-select_purse" class="col-xs-7 cur_select">
                            <#--<#--<option>Сбербанк</option>-->
                            <#if accounts2?has_content>
                                <#list accounts2 as account2>
                                    <option value="${account2.id}">${account2.name}</option>
                                </#list>
                            </#if>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="edit-income-balance__sum">Сумма</label>
                            <input type="number" class="form-control modal__name_cat--bg" id="edit-income-balance__sum">
                        </div>

                        <div class="btn-group col-xs-14 cur_btns radios-as-buttons">
                            <div>
                                <input type="radio" name="option" id="today" class="radio_btn"/>
                                <label for="today" id="today_label" onclick="changeToday()">Сегодня</label>
                            </div>
                            <div>
                                <input type="radio" name="option" id="yesterday" class="radio_btn"/>
                                <label for="yesterday" id="yesterday_label" onclick="changeYesterday()">Вчера</label>
                            </div>
                            <div id="other_cont">
                                <input type="date" name="option" id="other" class="radio-btn" onclick="changeDate()"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="СОХРАНИТЬ">
                            </div>
                        </div>
                        <script>
                            var date_input = document.getElementById('other');
                            var input_today_label = document.getElementById('today_label');
                            var input_yesterday_label = document.getElementById('yesterday_label');

                            function changeDate() {
                                input_today_label.checked = false;
                                input_yesterday_label.checked = false;
                                date_input.style.background = '#ffffff';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#eff0f0';
                            }

                            function changeToday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#ffffff';
                                input_yesterday_label.style.background = '#eff0f0';
                                input_today_label.checked = true;
                                input_yesterday_label.checked = false;
                            }

                            function changeYesterday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#ffffff';
                                input_today_label.checked = false;
                                input_yesterday_label.checked = true;
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для создания дохода -->
<div class="container">
    <div class="modal fade" id="create-income__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Создание дохода</h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="/income_source/create">
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><label for="new-income__name">Название</label></td>
                                </tr>
                                <tr>
                                    <td class="td-container"><input type="text" class="form-control modal__name_cat"
                                                                    id="new-income__name" name="income_source_name">
                                        <img src="images/cart.png" class="dropdown-toggle rub__symbol"
                                             id="new-income__dropdown" data-toggle="dropdown">
                                        <div class="dropdown-menu change_icon" role="menu"
                                             aria-labelledby="new-income__dropdown">
                                            <div class="dropdown-menu-container">
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/cart.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/suitcase.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/camera.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/bag.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/wallet.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/shape.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/mobile.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item"><img
                                                        onclick="changeIcon(create_income_icon, this)"
                                                        src="images/grantma.png" href="#"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                                <div role="presentation" class="dropdown-menu-item empty"></div>
                                            </div>
                                        </div>
                                        <script>
                                            var create_income_icon = document.getElementById("new-income__dropdown");
                                        </script>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="СОХРАНИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для создания долга -->
<div class="container">
    <div class="modal fade" id="create-dept__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Новый долг</h4>
                </div>
                <div class="modal-body">
                <#--<form>-->
                    <div class="change_dept">
                        <ul class="dept__tabs">
                            <li class="d_tab">
                                <a href="#dept-content-one" id="one-dept-tab"
                                   class="active-dept-tab dept_tab__label">Я должен</a>
                            </li>
                            <li class="d_tab">
                                <a href="#dept-content-two" id="two-dept-tab" class="dept-tab dept_tab__label">Мне
                                    должны</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dept-content">
                        <div id="dept-content-one" class="dept-content__container">
                            <form method="post" action="/debt/create/i">
                                <div class="form-group">
                                    <label for="cr-name_lendor">Кому я должен</label>
                                    <input type="text" class="form-control modal__name_cat--bg" id="cr-name_lendor"
                                           name="debtor_name">
                                </div>
                                <div class="form-group">
                                    <label for="cr-sum_lendor">Сумма</label>
                                    <input type="number" class="form-control modal__name_cat--bg" id="cr-sum_lendor"
                                           name="debt_amount">
                                </div>
                                <div class="form-group">
                                    <label for="select_purse_lendor">Положить на счёт</label>
                                    <select id="select_purse_lendor" class="col-xs-7 cur_select" name="sel10">
                                        <option value="-1">не выбрано</option>
                                    <#if accounts6?has_content>
                                        <#list accounts6 as account6>
                                            <option value="${account6.id}">${account6.name}</option>
                                        </#list>
                                    </#if>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                        <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                        <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="dept-content-two" class="dept-content__container">
                            <form method="post" action="/debt/create/y">
                                <div class="form-group">
                                    <label for="cr-name_deptor">Должник</label>
                                    <input type="text" class="form-control modal__name_cat--bg" id="cr-name_deptor"
                                           name="debtor_name">
                                </div>
                                <div class="form-group">
                                    <label for="cr-sum_deptor">Сумма</label>
                                    <input type="number" class="form-control modal__name_cat--bg" id="cr-sum_deptor"
                                           name="debt_amount">
                                </div>
                                <div class="form-group">
                                    <label for="select_purse_deptor">Снять со счёта</label>
                                    <select id="select_purse_deptor" class="col-xs-7 cur_select" name="sel10">
                                        <option value="-1">выбрать</option>
                                    <#if accounts6?has_content>
                                        <#list accounts6 as account6>
                                            <option value="${account6.id}">${account6.name}</option>
                                        </#list>
                                    </#if>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                        <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                        <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <script type="text/javascript" rel="script" src="js/dept_tabs.js"></script>
                <#--</form>-->
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для изменения чужого долга -->
<div class="container">
    <div class="modal fade" id="edit-dept__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Изменение долга</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="name_deptor">Должник</label>
                            <input type="text" class="form-control modal__name_cat--bg" id="name_deptor">
                        </div>
                        <div class="form-group">
                            <label for="sum_deptor">Сумма</label>
                            <input type="number" class="form-control modal__name_cat--bg" id="sum_deptor">
                        </div>
                        <div class="form-group">
                            <label for="select_purse_dept">Снять со счёта</label>
                            <select id="select_purse_dept" class="col-xs-7 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для изменения своего долга -->
<div class="container">
    <div class="modal fade" id="edit-own-dept__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Изменение долга</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="name_lendor">Кому я должен</label>
                            <input type="text" class="form-control modal__name_cat--bg" id="name_lendor">
                        </div>
                        <div class="form-group">
                            <label for="sum_lendor">Сумма</label>
                            <input type="number" class="form-control modal__name_cat--bg" id="sum_lendor">
                        </div>
                        <div class="form-group">
                            <label for="select_purse_lend">Положить на счёт</label>
                            <select id="select_purse_lend" class="col-xs-7 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default" value="СОХРАНИТЬ">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для погашения чужого долга -->
<div class="container">
    <div class="modal fade" id="repay-dept__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Долг</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="select_purse_repay_dept">Положить на счёт</label>
                            <select id="select_purse_repay_dept" class="col-xs-7 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="Погасить">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop-up окно для погашения своего долга -->
<div class="container">
    <div class="modal fade" id="repay-own-dept__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">Долг</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="select_purse_repay_own_dept">Снять со счёта</label>
                            <select id="select_purse_repay_own_dept" class="col-xs-7 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-14 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="Погасить">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- pop up окно для истории расходов-->
<div class="container">
    <div class="modal fade" id="history-costs__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">История: расходы</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="income-select_purse">Категория</label>
                            <select id="income-select_purse" class="col-xs-7 cur_select">
                                <option>Покупки</option>
                                <option>Еда</option>
                                <option>Автомобиль</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="select_purse">Счёт</label>
                            <select id="select_purse" class="col-xs-6 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><input type="number" class="form-control modal__input--sum" id="sum_category"
                                               placeholder="Сумма расхода"></td>
                                    <td><label for="sum_category" class="rub_sym_label"><img class="rub__symbol"
                                                                                             src="images/rub.png"></label>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="btn-group col-xs-14 cur_btns radios-as-buttons">
                            <div>
                                <input type="radio" name="option" id="today" class="radio_btn"/>
                                <label for="today" id="today_label" onclick="changeToday()">Сегодня</label>
                            </div>
                            <div>
                                <input type="radio" name="option" id="yesterday" class="radio_btn"/>
                                <label for="yesterday" id="yesterday_label" onclick="changeYesterday()">Вчера</label>
                            </div>
                            <div id="other_cont">
                                <input type="date" name="option" id="other" class="radio-btn" onclick="changeDate()"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default btn_margin" value="СОХРАНИТЬ">
                            </div>
                        </div>
                        <script>
                            var date_input = document.getElementById('other');
                            var input_today_label = document.getElementById('today_label');
                            var input_yesterday_label = document.getElementById('yesterday_label');

                            function changeDate() {
                                input_today_label.checked = false;
                                input_yesterday_label.checked = false;
                                date_input.style.background = '#ffffff';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#eff0f0';
                            }

                            function changeToday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#ffffff';
                                input_yesterday_label.style.background = '#eff0f0';
                                input_today_label.checked = true;
                                input_yesterday_label.checked = false;
                            }

                            function changeYesterday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#ffffff';
                                input_today_label.checked = false;
                                input_yesterday_label.checked = true;
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- pop up окно для истории доходов-->
<div class="container">
    <div class="modal fade" id="history-earnings__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">История: доходы</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="income-select_purse">Категория</label>
                            <select id="income-select_purse" class="col-xs-7 cur_select">
                                <option>Покупки</option>
                                <option>Еда</option>
                                <option>Автомобиль</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="select_purse">Счёт</label>
                            <select id="select_purse" class="col-xs-6 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><input type="number" class="form-control modal__input--sum" id="sum_category"
                                               placeholder="Сумма дохода"></td>
                                    <td><label for="sum_category" class="rub_sym_label"><img class="rub__symbol"
                                                                                             src="images/rub.png"></label>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="btn-group col-xs-14 cur_btns radios-as-buttons">
                            <div>
                                <input type="radio" name="option" id="today" class="radio_btn"/>
                                <label for="today" id="today_label" onclick="changeToday()">Сегодня</label>
                            </div>
                            <div>
                                <input type="radio" name="option" id="yesterday" class="radio_btn"/>
                                <label for="yesterday" id="yesterday_label" onclick="changeYesterday()">Вчера</label>
                            </div>
                            <div id="other_cont">
                                <input type="date" name="option" id="other" class="radio-btn" onclick="changeDate()"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default btn_margin" value="СОХРАНИТЬ">
                            </div>
                        </div>
                        <script>
                            var date_input = document.getElementById('other');
                            var input_today_label = document.getElementById('today_label');
                            var input_yesterday_label = document.getElementById('yesterday_label');

                            function changeDate() {
                                input_today_label.checked = false;
                                input_yesterday_label.checked = false;
                                date_input.style.background = '#ffffff';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#eff0f0';
                            }

                            function changeToday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#ffffff';
                                input_yesterday_label.style.background = '#eff0f0';
                                input_today_label.checked = true;
                                input_yesterday_label.checked = false;
                            }

                            function changeYesterday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#ffffff';
                                input_today_label.checked = false;
                                input_yesterday_label.checked = true;
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- pop up окно для истории долгов, которые отдали мне-->
<div class="container">
    <div class="modal fade" id="history-dept__modal-window" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">╳</button>
                    <h4 class="modal-title">История: долги</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="name_lendor">Мне должен</label>
                            <input type="text" class="form-control modal__name_cat--bg" id="name_lendor">
                        </div>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><input type="number" class="form-control modal__input--sum" id="sum_category"
                                               placeholder="Сумма долга"></td>
                                    <td><label for="sum_category" class="rub_sym_label"><img class="rub__symbol"
                                                                                             src="images/rub.png"></label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label for="select_purse">Счёт</label>
                            <select id="select_purse" class="col-xs-6 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <div class="col-xs-offset-2 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default btn_margin" value="СОХРАНИТЬ">
                            </div>
                        </div>
                        <script>
                            var date_input = document.getElementById('other');
                            var input_today_label = document.getElementById('today_label');
                            var input_yesterday_label = document.getElementById('yesterday_label');

                            function changeDate() {
                                input_today_label.checked = false;
                                input_yesterday_label.checked = false;
                                date_input.style.background = '#ffffff';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#eff0f0';
                            }

                            function changeToday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#ffffff';
                                input_yesterday_label.style.background = '#eff0f0';
                                input_today_label.checked = true;
                                input_yesterday_label.checked = false;
                            }

                            function changeYesterday() {
                                date_input.style.background = '#eff0f0';
                                input_today_label.style.background = '#eff0f0';
                                input_yesterday_label.style.background = '#ffffff';
                                input_today_label.checked = false;
                                input_yesterday_label.checked = true;
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    (function (b, o, i, l, e, r) {
        b.GoogleAnalyticsObject = l;
        b[l] || (b[l] =
                function () {
                    (b[l].q = b[l].q || []).push(arguments)
                });
        b[l].l = +new Date;
        e = o.createElement(i);
        r = o.getElementsByTagName(i)[0];
        e.src = 'https://www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e, r)
    }(window, document, 'script', 'ga'));
    ga('create', 'UA-XXXXX-X');
    ga('send', 'pageview');
</script>

<!-- build:js scripts/vendor.js -->
<!-- bower:js -->
<script src="js/jquery.js"></script>
<!-- endbower -->
<!-- endbuild -->


<script rel="script" type="text/javascript" src="js/slider_graph.js"></script>
<script rel="script" type="text/javascript" src="js/graphic_pie.js"></script>
<script rel="script" type="text/javascript" src="js/graphic_column.js"></script>


<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
        crossorigin="anonymous"></script>

<script type="text/javascript" src="slick/slick.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.wallet-flex-container').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 3
        });
    });
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>

</body>
</html>