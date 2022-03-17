<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container-fluid">

<jsp:include page="header.jsp"></jsp:include>

<h1>Category list</h1>

<c:if test="${empty categoryList}">
    <p>no category yet.</p>
    <a href="/auth/add-category">Add category</a>
</c:if>

<c:if test="${!empty categoryList}">
    <table class="table col-8">
        <thead>
            <tr>
                <th class="col-2">ID</th>
                <th class="col-3">Name</th>
                <th class="col-2">Suppression</th>
            </tr>
        </thead>
        <c:forEach items="${categoryList}" var="category">
            <tr>
                <td>${category.id}</td>
                <td>${category.name}</td>
                <td>
                    <form action="/auth/removeCategory" method="post">
                        <input hidden name="categoryId" value="${category.id}">
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
