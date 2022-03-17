<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container-fluid">

<jsp:include page="header.jsp"></jsp:include>

<h1>${titlePage}</h1>

<a href="/list-product">List product</a>
<a href="/list-category">List categories</a>
<a href="/login">Login</a>
<a href="/auth/basic-insert">Add product</a>
<a href="/auth/add-category">Add category</a>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
