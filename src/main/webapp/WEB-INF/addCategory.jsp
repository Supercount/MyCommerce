<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container-fluid">

<jsp:include page="header.jsp"></jsp:include>

<h1>Add category</h1>
<form action="/auth/add-category" method="post" class="col-6">
    <div class="mb-3 row">
        <label for="name" class="col-1">Name</label>
        <input id="name" type="text" name="pName" class="col-2">
    </div>
    <button type="submit" class="btn btn-primary">Add</button>
</form>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
