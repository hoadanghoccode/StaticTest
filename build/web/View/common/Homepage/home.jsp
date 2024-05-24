<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage</title>
        <link href="${pageContext.request.contextPath}/View/common/css/styleContainerHomepage.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/cf7f67d5b1.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="slider">
                <div class="list">
                <c:forEach items="${sessionScope.listS}" var="s">
                    <div class="item">
                        <div class="content">
                            <h2 class="item-heading">${s.sliderTitle}</h2>
                            <div class="item-description">very good</div>
                        </div>
                            <a href="${s.backlink}"><img src="${pageContext.request.contextPath}/View/${s.sliderImg}" alt="image"></a>
                        
                    </div>
                </c:forEach>
            </div>
            <div class="buttons">
                <button id="prev">
                    <</button>
                <button id="next">></button>
            </div>
            <ul class="dots">
                <li class="active"></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    <!-- login form -->
    <jsp:include page="form.jsp"></jsp:include>
        <!-- log in form end -->

        <div class="blog-trending">
            <h1>Top blog trending</h1>
        </div>
        <section class="post container">
        <c:forEach begin="1" end="3" var="o">
            <div class="post-box">
                <img src="img/blog3.webp" alt="img" srcset="" class="post-img">
                <h2 class="category">Mobile</h2>
                <a href="post-page.html" class="post-title">
                    How to create best project to pass swp391
                </a>
                <span class="post-date">19/07/2003</span>
                <p class="post-description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto rem
                    animi
                    corrupti.</p>
                <div class="profile">
                    <span class="profile-name">Auther by:<a href="facebook.com">HoaND</a></span>
                </div>
            </div>
        </c:forEach>

    </div>
</section>
<div class="blog-trending">
    <h1>Product</h1>
</div>
<div class="product">
    <div class="product-filter container">
        <span class="filter-item">All</span>
        <span class="filter-item">Casio</span>
        <span class="filter-item">Hublot</span>
        <span class="filter-item">Rolex</span>
    </div>
    <section class="product-list">
    <c:forEach items="${sessionScope.listP}" var="p">
            <div class="row">
                <div class="row-img">
                    <img src="${pageContext.request.contextPath}/View/${p.imgProduct.imageUrl}" alt="" srcset="">
                </div>
                <h3>${p.product.productName}</h3>
                <div class="row-stars">
                    <a href="#"><i class="fa-solid fa-star"></i></a>
                    <a href="#"><i class="fa-solid fa-star"></i></a>
                    <a href="#"><i class="fa-solid fa-star"></i></a>
                    <a href="#"><i class="fa-solid fa-star"></i></a>
                    <a href="#"><i class="fa-solid fa-star"></i></a>
                    <a href="#">4.5/5</a>
                </div>
                <div class="row-in">
                    <div class="row-left">
                        <a href="#">
                            Add to cart
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                    </div>
                    <div class="row-right">
                        <h6>${p.product.originalPrice}</h6>
                    </div>
                </div>
            </div>
        </c:forEach>
    </section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    let slider = document.querySelector('.slider .list');
    let items = document.querySelectorAll('.slider .list .item');
    let next = document.getElementById('next');
    let prev = document.getElementById('prev');
    let dots = document.querySelectorAll('.slider .dots li');

    let lengthItems = items.length - 1;
    let active = 0;
    next.onclick = function () {
        active = active + 1 <= lengthItems ? active + 1 : 0;
        reloadSlider();
    }
    prev.onclick = function () {
        active = active - 1 >= 0 ? active - 1 : lengthItems;
        reloadSlider();
    }
    let refreshInterval = setInterval(() => {
        next.click()
    }, 5000);
    function reloadSlider() {
        slider.style.left = -items[active].offsetLeft + 'px';
        // 
        let last_active_dot = document.querySelector('.slider .dots li.active');
        last_active_dot.classList.remove('active');
        dots[active].classList.add('active');

        clearInterval(refreshInterval);
        refreshInterval = setInterval(() => {
            next.click()
        }, 5000);


    }

    dots.forEach((li, key) => {
        li.addEventListener('click', () => {
            active = key;
            reloadSlider();
        })
    })
    window.onresize = function (event) {
        reloadSlider();
    };



    document.addEventListener("DOMContentLoaded", function () {
        const loginFormContainer = document.getElementById('loginFormContainer');
        const openLoginFormBtn = document.getElementById('openLoginFormBtn');
        const loginForm = document.getElementById('loginForm');
        const errorText = document.getElementById('errorText');

        openLoginFormBtn.addEventListener('click', function () {
            loginFormContainer.style.display = 'block';
        });

        loginForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            // Here you can add your login authentication logic
//            if (username === 'user' && password === 'password') {
//                // Successful login, you can redirect or do something else here
//                loginFormContainer.style.display = 'none';
//            } else {
//                // Display error message
//                errorText.textContent = 'Invalid username or password';
//            }
        });
    });
</script>
</body>

</html>