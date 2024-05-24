<%-- 
    Document   : header
    Created on : May 18, 2024, 10:00:00 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/cf7f67d5b1.js" crossorigin="anonymous"></script>
        <link href="${pageContext.request.contextPath}/View/common/css/styleHeaderHomepage.css" rel="stylesheet" />
        <!--    <link ref="@(Url.Content("View/common/css/styleHeaderHomepage.css"))" rel="stylesheet">-->
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
            <div class="header-logo">
                <img src="${pageContext.request.contextPath}/View/common/img/logo.png" alt="Logo">
            </div>
            <div class="header-search">
                <input class="header-input" type="text" placeholder="search">
                <a class="header-search-icon" href=""><i class="fa-solid fa-magnifying-glass"></i></a>
            </div>
            <div class="header-infor">
                <a class="header-cart" href="#">
                    <i class="fa-solid fa-cart-shopping"></i>
                </a>
                <a class="header-user" href="#">
                    <i class="fa-solid fa-user"></i>
                </a>
            </div>
        </div>
        <div class="navbar">
            <div class="navbar-left">
                <ul class="navigation">

                    <li class="active"> <a id="test" href="">Home</a> </li>

                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Shop</a></li>
                </ul>
            </div>
            <div class="navbar-right">
                <c:if test="${sessionScope.userAccount == null && sessionScope.userGoogle == null}">
                    <button id="openLoginFormBtn">Login</button>
                    
                    <a href="${pageContext.request.contextPath}/register" target="_blank"><button>Register</button></a>
                </c:if>
                <c:if test="${sessionScope.userAccount != null || sessionScope.userGoogle != null}">
                    <a href="${pageContext.request.contextPath}/logout">Logout</a>  
                </c:if>
                  
            </div>
        </div>
        
    </body>
</html>
