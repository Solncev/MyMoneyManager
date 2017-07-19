<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>История</title>

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


    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>

    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<section class="header">
    <div class="header-wrapper-first">
        <div class="header-logo">
            <a href="#">МмМ<img src="images/logo.png"></a>
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
                        <h2>Машина моей мечты ыааааа</h2>
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
                        <img src="images/wallet.png">
                    </div>
                    <div>
                        <p>Кошелёк</p>
                        <p>1000 Р</p>
                    </div>

                </div>
                <div class="flex-wallet" data-toggle="modal" data-target="#wallet__modal-window">
                    <div>
                        <img src="images/card.png">
                    </div>
                    <div>
                        <p>Рокетбанк</p>
                        <p>1000 Р</p>
                    </div>

                </div>
                <div class="flex-wallet" data-toggle="modal" data-target="#wallet__modal-window">
                    <div>
                        <img src="images/card.png">
                    </div>
                    <div>
                        <p>Карта Сбербанк</p>
                        <p>1000 Р</p>
                    </div>

                </div>

                <div class="flex-wallet plus" data-toggle="modal" data-target="#create-wallet__modal-window">
                    <div>
                        <img src="images/plus-iсon.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="history-navigation">
    <div class="return-button">
        <p>
            <a href="/">
                <button type="button" class=""><img src="images/left-arrow-button.png"> &nbsp;&nbsp; Назад</button>
            </a>
        </p>
    </div>
    <div class="history-filtration">
        <select class="select" id="select_way" onchange="fillDataType()">
            <option>Не выбрано</option>
        <#if accounts3?has_content>
            <#list accounts4 as account4>
                <option>${account4.name}</option>
            </#list>
        </#if>
        </select>
    <#--<#assign mappedArray = []>-->
    <#--<#list operations as item>-->
    <#--<#assign mappedArray +=["<p>${item}</p>"]>-->
    <#--</#list>-->
        <select class="select" id="select_type" onchange="fillDataType()">
            <option value="Не выбрано">Не выбрано</option>
            <option value="Расходы">Расходы</option>
            <option value="Доходы">Доходы</option>
            <option value="Переводы">Переводы</option>
            <option value="Долги">Долги</option>
        </select>
        <select class="select" id="select_category" onchange="fillDataType()">
        <#--<option value="Не выбрано">Не выбрано</option>-->
        <#--<option value="Покупки">Покупки</option>-->
        <#--<option value="Автомобиль">Автомобиль</option>-->
        <#--<option value="Дом">Дом</option>-->
        <#--<option value="Спорт">Спорт</option>-->
        <#--<option value="Техника">Техника</option>-->
        <#--<option value="Еда">Еда</option>-->
        <#--<option value="Одежда">Одежда</option>-->
            <option>Не выбрано</option>
        <#if expenseTypes1?has_content>
            <#list expenseTypes1 as expenseType1>
                <option>${expenseType1.name}</option>
            </#list>
        </#if>
        </select>
    </div>
</div>

<section class="history-page">

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
                    <form>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><label for="create-wallet__name">Название счёта</label></td>
                                </tr>
                                <tr>
                                    <td class="td-container"><input type="text" class="form-control modal__name_cat"
                                                                    id="create-wallet__name">
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
                            <input type="text" class="form-control modal__name_cat modal__name_cat--bg"
                                   id="create-wallet__balance">
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
                            <td><input type="text" class="form-control modal__name_cat modal__name_cat--bg"
                                       id="edit-wallet__balance"></td>
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
                            <label for="income-select_purse__cat-history">Категория</label>
                            <select id="income-select_purse__cat-history" class="col-xs-7 cur_select">
                                <option>Покупки</option>
                                <option>Еда</option>
                                <option>Автомобиль</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="select_purse__cat-history">Счёт</label>
                            <select id="select_purse__cat-history" class="col-xs-6 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control modal__input--sum"
                                               id="sum_category__cat-history" placeholder="Сумма расхода">
                                    </td>
                                    <td>
                                        <label for="sum_category__cat-history" class="rub_sym_label"><img
                                                class="rub__symbol" src="images/rub.png"></label>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="btn-group col-xs-14 cur_btns radios-as-buttons">
                            <div>
                                <input type="radio" name="option" id="today__cat-history" class="radio_btn"/>
                                <label for="today__cat-history" id="today_label__cat-history"
                                       onclick="changeToday(dch, itch, iych)">Сегодня</label>
                            </div>
                            <div>
                                <input type="radio" name="option" id="yesterday__cat-history" class="radio_btn"/>
                                <label for="yesterday__cat-history" id="yesterday_label__cat-history"
                                       onclick="changeYesterday(dch, itch, iych)">Вчера</label>
                            </div>
                            <div id="other_cont__cat-history">
                                <input type="date" name="option" id="other__cat-history" class="radio-btn"
                                       onclick="changeDate(dch, itch, iych)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default btn_margin" value="СОХРАНИТЬ">
                            </div>
                        </div>
                        <script>
                            var dch = document.getElementById('other__cat-history');
                            var itch = document.getElementById('today_label__cat-history');
                            var iych = document.getElementById('yesterday_label__cat-history');
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
                            <label for="income-select_purse__history">Категория</label>
                            <select id="income-select_purse__history" class="col-xs-7 cur_select">
                                <option>Покупки</option>
                                <option>Еда</option>
                                <option>Автомобиль</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="select_purse__history">Счёт</label>
                            <select id="select_purse__history" class="col-xs-6 cur_select">
                                <option>Не выбрано</option>
                                <option>Кошелек</option>
                                <option>Сбербанк</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><input type="text" class="form-control modal__input--sum"
                                               id="sum_category__history"
                                               placeholder="Сумма дохода"></td>
                                    <td><label for="sum_category__history" class="rub_sym_label"><img
                                            class="rub__symbol"
                                            src="images/rub.png"></label></td>
                                </tr>
                            </table>
                        </div>

                        <div class="btn-group col-xs-14 cur_btns radios-as-buttons">
                            <div>
                                <input type="radio" name="option" id="today__history" class="radio_btn"/>
                                <label for="today__history" id="today_label__history"
                                       onclick="changeToday(dhi, ithi, iyhi)">Сегодня</label>
                            </div>
                            <div>
                                <input type="radio" name="option" id="yesterday__history" class="radio_btn"/>
                                <label for="yesterday__history" id="yesterday_label__history"
                                       onclick="changeYesterday(dhi, ithi, iyhi)">Вчера</label>
                            </div>
                            <div id="other_cont__history">
                                <input type="date" name="option" id="other__history" class="radio-btn"
                                       onclick="changeDate(dhi, ithi, iyhi)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-2 transfer_save">
                                <input type="submit" class="btn btn-default btn_margin" value="УДАЛИТЬ">
                                <input type="submit" class="btn btn-default btn_margin" value="СОХРАНИТЬ">
                            </div>
                        </div>
                        <script>
                            var dhi = document.getElementById('other__history');
                            var ithi = document.getElementById('today_label__history');
                            var iyhi = document.getElementById('yesterday_label__history');
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
                            <label for="name_lendor__history">Мне должен</label>
                            <input type="text" class="form-control modal__name_cat--bg" id="name_lendor__history">
                        </div>
                        <div class="form-group">
                            <table>
                                <tr>
                                    <td><input type="text" class="form-control modal__input--sum" id="sum_category"
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

<!-- build:js scripts/main.js -->
<script src="js/main.js"></script>
<!-- endbuild -->

<script type="text/javascript">
    $(document).ready(function () {
        $('.wallet-flex-container').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 3
        });
    });
</script>

<script type="text/javascript" src="slick/slick.min.js"></script>
<script type="text/javascript" src="js/filtration.js"></script>
</body>
</html>