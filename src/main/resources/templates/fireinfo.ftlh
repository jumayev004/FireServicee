<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FireService</title>
    <link rel="stylesheet" href="/static/css/fireinfo.css">
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: olive">FireService</h1>
    <h3>Подробная информация об инциденте</h3>
    <b>Заявитель: </b><a class="moreinfo" href="/user/${fire.user.id}">${fire.user.name}</a><br>
    <b>Местоположение: </b>${fire.location}<br>
    <b>Дата: </b>${fire.date}<br>
    <b>Описание: </b>${fire.description}<br>
    <b>Тема инцидента: </b>${fire.subject}<br>
    <b>Приоритет: </b>${fire.severity}<br>
    <b>Статус: </b>
    <#if fire.status>
        True
        <#else>
        False
    </#if>
</div>

</body>
</html>