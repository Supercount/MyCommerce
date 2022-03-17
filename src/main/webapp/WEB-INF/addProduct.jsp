<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container-fluid">

<jsp:include page="header.jsp"></jsp:include>

<h1>Add product</h1>
<form action="/auth/add-product" method="post" class="col-6">
    <div class="mb-3 row">
        <label for="name" class="col-2">Name</label>
        <input id="name" type="text" name="pName" class="col-3">
    </div>
    <div class="mb-3 row">
        <label for="content" class="col-2">Content</label>
        <input id="content" type="text" name="pContent" class="col-3">
    </div>
    <div class="mb-3 row">
        <label for="price" class="col-2">Price</label>
        <input id="price" type="number" name="pPrice" class="col-3">
    </div>
    <div class="mb-3 row">
        <label for="category-select" class="col-2">Category</label>
        <select name="pCategory" id="category-select" class="form-select col-3">
            <option value="">Choose a category</option>
            <c:forEach items="${categoryList}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Add</button>
</form>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
