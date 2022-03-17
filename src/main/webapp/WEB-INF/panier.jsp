<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Panier</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<h1>Panier</h1>
<div class="container">
<div class="col-md-5 col-lg-4 order-md-last">
    <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-primary">Votre Panier</span>
        <span class="badge bg-primary rounded-pill">${panier.size()}</span>
    </h4>
    <ul class="list-group mb-3">
        <c:forEach items="${panier}" var="entry">
            <li class="list-group-item d-flex justify-content-between lh-sm">
                <div>
                    <h6 class="my-0">${entry.name}</h6>
                </div>
                <span class="text-muted">${entry.price} €</span>
            </li>
        </c:forEach>
        <li class="list-group-item d-flex justify-content-between">
            <span>Total</span>
            <strong>total €</strong>
        </li>
    </ul>

</div>
<div class="col-md-7 col-lg-8">
    <h4 class="mb-3">Adresse de facturation</h4>
    <form class="needs-validation" novalidate="">
        <div class="row g-3">
            <div class="col-sm-6">
                <label for="firstName" class="form-label">Prénom</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                <div class="invalid-feedback">
                    Un prénom valide est requis.
                </div>
            </div>

            <div class="col-sm-6">
                <label for="lastName" class="form-label">Nom</label>
                <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
                <div class="invalid-feedback">
                    Un nom valide est requis.
                </div>
            </div>

            <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com">
                <div class="invalid-feedback">
                    Merci d'indiquer une adresse email valide.
                </div>
            </div>

            <div class="col-12">
                <label for="address" class="form-label">Adresse</label>
                <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
                <div class="invalid-feedback">
                    Entrez l'adresse de livraison.
                </div>
            </div>

            <div class="col-12">
                <label for="address2" class="form-label">Adresse 2 <span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
            </div>

            <div class="col-md-3">
                <label for="zip" class="form-label">Code Postal</label>
                <input type="text" class="form-control" id="zip" placeholder="" required="">
                <div class="invalid-feedback">
                    Indiquez votre code postal.
                </div>
            </div>

            <div class="col-md-3">
                <label for="city" class="form-label">Ville</label>
                <input type="text" class="form-control" id="city" placeholder="" required="">
                <div class="invalid-feedback">
                    Indiquez votre ville.
                </div>
            </div>

            <div class="col-md-5">
                <label for="country" class="form-label">Pays</label>
                <input type="text" class="form-control" id="country" placeholder="France">
                <div class="invalid-feedback">
                    Indiquez votre pays.
                </div>
            </div>

        </div>

        <hr class="my-4">

        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">L'adresse de livraison est la même que celle de facturation</label>
        </div>

        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">Enregistrer ces informations pour la prochaine fois</label>
        </div>

        <hr class="my-4">

        <h4 class="mb-3">Payment</h4>

        <div class="my-3">
            <div class="form-check">
                <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="" required="">
                <label class="form-check-label" for="credit">Credit card</label>
            </div>
            <div class="form-check">
                <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required="">
                <label class="form-check-label" for="debit">Debit card</label>
            </div>
            <div class="form-check">
                <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required="">
                <label class="form-check-label" for="paypal">PayPal</label>
            </div>
        </div>

        <div class="row gy-3">
            <div class="col-md-6">
                <label for="cc-name" class="form-label">Nom de la carte</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                    Name on card is required
                </div>
            </div>

            <div class="col-md-6">
                <label for="cc-number" class="form-label">Numéros de carte</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                <div class="invalid-feedback">
                    Credit card number is required
                </div>
            </div>

            <div class="col-md-3">
                <label for="cc-expiration" class="form-label">Date d'expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                <div class="invalid-feedback">
                    Expiration date required
                </div>
            </div>

            <div class="col-md-3">
                <label for="cc-cvv" class="form-label">Code de sécurité</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                <div class="invalid-feedback">
                    Security code required
                </div>
            </div>
        </div>

        <hr class="my-4">

        <button class="w-100 btn btn-primary btn-lg" type="submit">Confirmer la commande</button>
    </form>
</div>


</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
