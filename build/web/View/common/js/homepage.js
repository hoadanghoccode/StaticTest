let slider = document.querySelector('.slider .list');
let items = document.querySelectorAll('.slider .list .item');
let next = document.getElementById('next');
let prev = document.getElementById('prev');
let dots = document.querySelectorAll('.slider .dots li');

let lengthItems = items.length - 1;
let active = 0;
next.onclick = function(){
    active = active + 1 <= lengthItems ? active + 1 : 0;
    reloadSlider();
}
prev.onclick = function(){
    active = active - 1 >= 0 ? active - 1 : lengthItems;
    reloadSlider();
}
let refreshInterval = setInterval(()=> {next.click()}, 5000);
function reloadSlider(){
    slider.style.left = -items[active].offsetLeft + 'px';
    // 
    let last_active_dot = document.querySelector('.slider .dots li.active');
    last_active_dot.classList.remove('active');
    dots[active].classList.add('active');

    clearInterval(refreshInterval);
    refreshInterval = setInterval(()=> {next.click()}, 5000);

    
}

dots.forEach((li, key) => {
    li.addEventListener('click', ()=>{
         active = key;
         reloadSlider();
    })
})
window.onresize = function(event) {
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
        if (username === 'user' && password === 'password') {
            // Successful login, you can redirect or do something else here
            loginFormContainer.style.display = 'none';
        } else {
            // Display error message
            errorText.textContent = 'Invalid username or password';
        }
    });
});


