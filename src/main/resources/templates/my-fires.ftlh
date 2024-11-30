<!DOCTYPE html>
<html>
<head>
    <title>FireService</title>
    <link rel="stylesheet" href="/static/css/my-fires.css">
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: olive">FireService</h1>
    <hr>
    <h4 class="big_block">Мои инциденты</h4>
    <hr class="no_hr">
    <div>
        <#list fires as fire>
            <a href="/fire/${fire.id}">
                <div>
                    <div>
                        <form action="/fire/delete/${fire.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </div>
                    <div>
                        <h3>Номер: INC${fire.id}</h3>
                        <p>Дата: ${fire.date}</p>
                    </div>
                    <form action="/fire/delete/${fire.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input class="ui-button" type="submit" value="Удалить"/>
                    </form>
                </div>
            </a>
        <#else>

            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
    <hr class="big_block">
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
</div>
</body>
</html>