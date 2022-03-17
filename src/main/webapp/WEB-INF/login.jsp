<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container-fluid">

<jsp:include page="header.jsp"></jsp:include>

<h1>Login</h1>
<form action="login" method="post">
    <label for="usernameInput"></label>
    <input id="usernameInput" type="text" name="username">
    <button type="submit" class="btn btn-primary">Login</button>
</form>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
