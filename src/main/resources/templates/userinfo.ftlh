<!DOCTYPE html>
<html>
<head>
    <title>FireService</title>
    <link rel="stylesheet" href="/static/css/userinfo.css">
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: olive">FireService</h1>
    <h4>Профиль пользователя</h4>
    <hr class="no_hr">
    <br>
    <div>
        <h2 class="big_block">${user.name}</h2>
        <br>
        Электронная почта: <b>${user.email}</b>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br>
        <br>
        <a class="big_block" href="/my/fire/${user.id}">
            Инциденты пользователя
        </a>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn_registration" type="submit">
                Выйти из аккаунта
            </button>
        </form>
    </div>
</div>

</body>
</html>