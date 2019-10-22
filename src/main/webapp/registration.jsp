<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Create an account</title>

    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/css/grayscale.css" rel="stylesheet">
</head>

<body>
     <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="#projects">Projects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#signup">Contact</a>
                    </li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- Header -->
    <header class="masthead-2">
        <div class="container d-flex h-100 align-items-center">
            <div class="mx-auto text-center">
                <form:form method="POST" modelAttribute="userForm" class="form-signin">
                <h1 class="mx-auto my-0">New Account</h1>
                <spring:bind path="username">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true"></form:input>
                        <span class="text-white-50"><form:errors path="username"></form:errors></span>
                    </div>
                </spring:bind>
                <spring:bind path="password">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                        <span class="text-white-50"><form:errors path="password"></form:errors></span>
                    </div>
                </spring:bind>
                <spring:bind path="passwordConfirm">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="passwordConfirm" class="form-control" placeholder="Confirm your password"></form:input>
                        <span class="text-white-50"><form:errors path="passwordConfirm"></form:errors></span>
                    </div>
                </spring:bind>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
            </form:form>
            </div>
        </div>
    </header>
    <!-- Footer -->
    <footer class="bg-black small text-center text-white-50">
        <div class="container">
            Copyright &copy; DSTA Admin Portal 2019
        </div>
    </footer>

    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Custom scripts for this template -->
    <script src="resources/js/grayscale.js"></script>
</body>

</html>