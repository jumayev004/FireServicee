<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/static/css/fire-create.css">
</head>
<body>
    <div class = "container">
        <h1 class="bg_color" style="color: olive">FireService</h1>
        <hr>
        <h3>Создание записи</h3>
        <form action="/fire/create" method="post">
            Время происшествия: <input type="datetime-local" name="date" step="60"/><br><br>
            Описание инцидента: <input type="text" name="description"/><br><br>
            Местоположение инцидента: <input type="text" name="location"/><br><br>
            Статус пожара: <input type="text" name="status"/><br><br>
            Степень серьезности: <input type="text" name="severity"/><br><br>
            Тема: <input type="text" name="subject"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="input_fire" type="submit" value="Создать">
        </form>
    </div>
</body>
</html>