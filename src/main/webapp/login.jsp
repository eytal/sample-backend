<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Portal Login</title>

    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/css/grayscale.css" rel="stylesheet">
</head>

<body id="page-top">

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
                        <a class="nav-link" href="/registration">Sign up</a>
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
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center">
            <div class="mx-auto text-center">
                <h1 class="mx-auto my-0">Administrator</h1>
                <form method="POST" action="${contextPath}/login" class="form-signin">
                    <div class="form-group ${error != null ? 'has-error' : ''}">
                        <span class="text-white-50">${message}</span>
                        <input name="username" type="text" class="form-control" placeholder="Username"
                            autofocus="true" />
                        <br />
                        <input name="password" type="password" class="form-control" placeholder="Password" />
                        <span class="text-white-50">${error}</span>
                        <br />
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
                        <br />
                        <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
                    </div>
                </form>
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