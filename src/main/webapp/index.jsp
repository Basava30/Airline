<%
if (session.getAttribute("name") == null) {
    response.sendRedirect("login.jsp");
}
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <title>Airline Reservation System</title>
	<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    background-image: url("images/bgimage1.jpg");
    background-size: cover;
}

.logo {
    height: 60px; /* Adjust height as needed */
    margin-right: 20px; /* Space between logo and title */
}

.container {
    width: 80%;
    margin: auto;
    overflow: hidden;
}

header {
    background: #004d66; /* Deep Teal */
    color: #ffffff;
    padding: 20px 0;
    text-align: center;
    position: relative;
}

.logout-button {
    position: absolute;
    top: 40px;
    right: 20px;
    background-color: #FF5733; /* Burnt Orange */
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

.logout-button:hover {
    background-color: #cc4626; /* Darker Orange on Hover */
}

nav {
    margin-top: 20px;
    text-align: center;
    text-shadow: 1px 1px 3px rgba(255,255,255,0.4);
}

nav a {
    text-decoration: none;
    color: #333; /* Dark Gray */
    padding: 10px 20px;
    border: 1px solid #004d66; /* Teal Border */
    margin-bottom: 30px;
    margin-left: 8px;
    display: inline-block;
    border-radius: 8px;
    transition: background-color 0.3s, color 0.3s;
}

nav a:hover {
    background-color: #003d52; /* Darker Teal on Hover */
    color: white;
}

.form-container {
    margin-top: auto;
    background: #F9F9F9; /* Soft White Background */
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle Shadow */
    width: 100%;
    max-width: 600px;
    box-sizing: border-box;
    margin: 0 auto;
}

.form-container h2 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    color: #555;
}

.form-group input[type="text"],
.form-group input[type="date"],
.form-group select {
    width: 100%;
    padding: 8px;
    border: 1px solid #e0e0e0; /* Light Gray Inputs */
    border-radius: 4px;
    background-color: #f0f0f0; /* Very Light Gray */
    box-sizing: border-box;
    color: #333; /* Dark Text */
}

.namee {
    position: absolute;
    top: 40px;
    left: 25px;
    background-color: #28a745; /* Cool Teal */
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

.form-group button {
    width: 100%;
    padding: 10px;
    background-color: #28a745; /* Cool Teal Button */
    border: none;
    border-radius: 4px;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.form-group button:hover {
    background-color: #218838; /* Darker Teal on Hover */
}

.button-logout {
    background-color: #dc3545; /* Red for Logout */
}

.button-logout:hover {
    background-color: #c82333;
}

.button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 16px;
    color: #fff;
    position: absolute;
    top: 40px;
    right: 20px;
}

h3 {
    position: absolute;
    top: 20%;
    right: 8%;
    background-color: #28a745; /* Cool Teal */
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        width: 90%;
    }

    .form-container {
        margin-left: 0; /* Remove margin to use full width */
        width: 100%;
    }

    nav {
        text-align: left;
        padding: 10px;
    }

    nav a {
        display: block;
        margin: 5px 0;
    }

    header {
        padding: 15px 0;
    }

    .logout-button {
        top: 5px;
        right: 10px;
        font-size: 14px;
    }

    h3 {
        top: 10%;
        right: 5%;
        font-size: 14px;
        padding: 8px 16px;
    }
    
    header h1 {
        font-size: 24px;
    }
}

@media (max-width: 480px) {
    header h1 {
        font-size: 20px;
    }
    .form-container {
        margin-left: 0;
        margin-bottom: 10px;
        width: 100%;
    }

    .form-group button {
        font-size: 14px;
        padding: 8px;
    }

    .button {
        font-size: 14px;
        padding: 8px 16px;
    }

    .logout-button {
        top: 5px;
        right: 10px;
        font-size: 14px;
    }
}
</style>
</head>
<body>
    <header>
   
       
        <input type='button' value='<%= session.getAttribute("name") %>' class = 'namee' />
     
        <h1>Airline Reservation System</h1>
        
        
       <form action='logout' method='post'>
       
               <input type='submit' name='Logout' value='Logout' class='button button-logout' />
                    </form>
    </header>
    <div class="container">
        <nav>
            <a href="domesticFlight?<%session.setAttribute("a", true);%>" >View Domestic Flights</a>
            <a href="BookingServlet">My Bookings</a>
            <a href="internationalFlight?<%session.setAttribute("a", true);%>">View International Flights</a>
            
            
        </nav>
        <div class="form-container">
            <h2>Flight Booking Form</h2>
            <form action="Home" method="post">
                <div class="form-group">
                    <label for="source">Source:</label>
                    <input type="text" id="source" name="Sor" required>
                </div>
                <div class="form-group">
                    <label for="destination">Destination:</label>
                    <input type="text" id="destination" name="Des" required>
                </div>
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" id="date" name="Date" required>
                </div>
                <div class="form-group">
                    <label for="selection">Select:</label>
                    <select id="selection" name="Sel" required>
                        <option value="Domestic">Domestic</option>
                        <option value="International">International</option>
                    </select>
                </div>
                <div class="form-group">
                <input type="hidden" name="b" value="true">
                    <button type="submit">Search</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>