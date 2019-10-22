<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="contextPath" value="${pageContext.request.contextPath}" />

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>Logged in</title>
            <link href="resources/css/bootstrap.min.css" rel="stylesheet">
            <link href="resources/css/admin.css" rel="stylesheet">
        </head>

        <body>
            <nav class="navbar navbar-dark bg-dark">
                <span class="navbar-brand mb-0 h1">${pageContext.request.userPrincipal.name}</span>
                <button class="btn btn-primary" onclick="document.forms['logoutForm'].submit()">Logout</button>
            </nav>
            <div class="admin-bg">
                <div class="container">
                    <div class="jumbotron d-flex justify-content-center admin-welcome">
                        <h1> Welcome Administrator!</h1>
                    </div>
                </div>

                <div class="container">
                    <!-- As a heading -->

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </c:if>
                    <p>
                        <h2 class="text-white">
                            Users
                        </h2>
                    </p>
                    <p>
                        <span class="text-white">${message}</span>
                    </p>
                    <table class="table table-dark table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Username</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${userList}" var="user" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.count} </th>
                                    <td> ${user.username} </td>
                                    <td>
                                        <c:if test="${!user.username.equals(loggedInUser)}">
                                            <form method="POST" action="${contextPath}/delete/${user.username}">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <button class="btn btn-danger" type="submit">Delete</button>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <script src="resources/js/jquery.min.js"></script>
            <script src="resources/js/bootstrap.min.js"></script>
        </body>

        </html>