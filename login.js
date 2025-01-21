document.addEventListener('DOMContentLoaded', function() {
    var loginForm = document.getElementById('loginForm');
    
    loginForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission
        
        // Validate username and password (You can add your validation logic here)
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        
        // For demonstration purposes, let's assume the login is successful if both fields are filled
        if (username && password) {
            // Redirect to the solar panel calculator page
            window.location.href = 'index.html';
        } else {
            // Display an error message or handle invalid login
            alert('Please enter valid credentials.');
        }
    });
});
