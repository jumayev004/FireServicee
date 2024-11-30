<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FireService</title>
    <link rel="stylesheet" href="/static/css/fires.css">
    <style>
        /* Добавим стили для кнопок и контейнера */
        .button-container {
            display: flex; /* Устанавливаем контейнер как flex-контейнер */
            justify-content: space-between; /* Распределяем кнопки равномерно по горизонтали */
            margin-bottom: 20px; /* Отступ снизу, если нужно */
        }

        .ui-button {
            padding: 15px;
            margin: 0 5px; /* Отступ между кнопками */
            background-color: #2980b9;  /* Синий цвет кнопок */
            color: #fff;  /* Белый цвет текста на кнопках */
            border-radius: 5px;
            cursor: pointer;
            border: none; /* Убираем стандартные границы */
            transition: background-color 0.3s; /* Плавный переход цвета фона */
        }

        .ui-button:hover {
            background-color: #1a6f9a; /* Цвет фона при наведении */
        }

        /* Стили для кнопки "Создать запись" */
        .create-button-container {
            display: flex;
            justify-content: flex-end; /* Выравниваем кнопку по правому краю */
            margin-top: 20px; /* Отступ сверху, если нужно */
        }

        /* Стили для кнопки "Профиль" */
        .profile-button {
            display: flex;
            justify-content: flex-end; /* Выравниваем кнопку по правому краю */
            margin-top: 10px; /* Отступ сверху, если нужно */
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: olive">FireService</h1>
    <form action="/profile" method="get" class="profile-button">
        <input class="ui-button" type="submit" value="Профиль"/>
    </form>
    <hr>
    <#if user.email??>
        <h3>Здравствуйте, ${user.name}!</h3>
        <div class="button-container">
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input class="ui-button" type="submit" value="Выйти"/>
            </form>
            <#if user.isAdmin()>
                <form action="/admin" method="get">
                    <input class="ui-button" type="submit" value="Панель администратора"/>
                </form>
            </#if>
        </div>
    <#else>
        <form action="/login" method="post">
            <input class="ui-button" type="submit" value="Войти"/>
        </form>
    </#if>
    <h4>Данные о пожарах</h4>
    <form action="/" method="get">
        Поиск по теме: <input type="text" name="subject"/><br>
        <input type="submit" value="Поиск"/>
    </form>
    <#list fires as fire>
        <div>
            <p><b>${fire.subject}</b> ${fire.date} | <a class="detail" href="/fire/${fire.id}">Информация</a></p>
        </div>
        <#if user.isAdmin()>
            <form action="/fire/delete/${fire.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input class="ui-button" type="submit" value="Удалить"/>
            </form>
        </#if>
    <#else>
        <h3>Инцидентов нет</h3>
    </#list>
    <#if user.email??>
        <div class="create-button-container">
            <form action="/fire/create/" method="get">
                <input class="ui-button" type="submit" value="Создать запись"/>
            </form>
        </div>
    </#if>
</div>
</body>
</html>