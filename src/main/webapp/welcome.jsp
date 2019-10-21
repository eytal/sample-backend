<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Logged in</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-dark bg-dark">
            <span class="navbar-brand mb-0 h1">${pageContext.request.userPrincipal.name}</span>
            <button class="btn btn-primary" onclick="document.forms['logoutForm'].submit()">Logout</button>
    </nav>
    <div class="container">
        <!-- As a heading -->
        
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </c:if>
        <p>
            <h2>
                Users (Admin Only Access)
            </h2>
        </p>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Username</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <th scope="row">${user.id} </th>
                        <td> ${user.username} </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>

</html>