<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container-fluid">

<jsp:include page="header.jsp"></jsp:include>

<h1>Product list</h1>

<c:if test="${empty productList}">
    <p>no product yet.</p>
    <a href="/auth/add-product">Add product</a>
</c:if>

<c:if test="${!empty productList}">
    <table class="table col-8">
        <thead>
            <tr>
                <th scope="col" class="col-1">ID</th>
                <th scope="col" class="col-2">Name</th>
                <th scope="col" class="col-1">Price</th>
                <th scope="col" class="col-2">Category</th>
                <th scope="col" colspan="2" class="col-3">Actions</th>
            </tr>
        </thead>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.category.name}</td>
                <td><a href="/product-details?id=${product.id}" class="btn btn-info">Details</a></td>
                <td>
                    <form action="/auth/removeProduct" method="post">
                        <input hidden name="productId" value="${product.id}">
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
