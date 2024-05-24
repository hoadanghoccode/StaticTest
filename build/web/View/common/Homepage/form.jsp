<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="${pageContext.request.contextPath}/View/common/css/styleContainerHomepage.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <!-- Login Modal -->
    <div id="loginModal">
        <div id="loginFormContainer">
            <div class="loginForm">
                <h2>Login</h2>
                <form id="loginForm" method="post">
                    <input type="text" id="username" placeholder="Gmail" name="username" required>
                    <input type="password" id="password" placeholder="Password" name="password" required>
                    <div class="service">
                        <a href="${pageContext.request.contextPath}/register">Register</a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/SWP/googlelogin&response_type=code&client_id=675131106923-bg01es6k51rtcg4esbahcnig61dho789.apps.googleusercontent.com&approval_prompt=force">login by google</a>
                        <a href="${pageContext.request.contextPath}/register">Reset password</a>
                    </div>
                    <button type="submit">Login</button>
                    <div class="alert alert-danger" style="color:red" role="alert">
                        <p id="errorText" style="color:red"></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            // Show the modal
            $('#loginModal').show();

            // AJAX form submission
            $('#loginForm').submit(function(event) {
                event.preventDefault();
                var formData = $(this).serialize();
                $.ajax({
                    url: '${pageContext.request.contextPath}/accountlogin',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        if (response.success) {
                            window.location.href = 'View/common/Homepage/home.jsp';
                        } else {
                            $('#errorText').text(response.message);
                            $('#loginModal').show();
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
