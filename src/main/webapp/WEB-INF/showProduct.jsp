<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container-fluid">

<jsp:include page="header.jsp"></jsp:include>

<h1>Détails du produit</h1>

<c:if test="${ERROR_TYPE_ID_PRODUCT}">
    <p>product id must be an integer</p>
</c:if>

<c:if test="${ERROR_UNKNOWN_PRODUCT}">
    <p>Product does not exist</p>
</c:if>

<c:if test="${not empty product}">
    <table class="table col-8">
        <thead>
        <tr>
            <th class="col-2">ID</th>
            <th class="col-2">Name</th>
            <th class="col-3">Content</th>
            <th class="col-2">Price</th>
        </tr>
        </thead>
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.content}</td>
            <td>${product.price}</td>
        </tr>
    </table>

    <form action="/auth/panier" method="post" class="col-6">
        <input name="pId" value="${product.id}" hidden>
        <button type="submit" class="btn btn-primary">Ajouter au panier</button>
    </form>
</c:if>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
