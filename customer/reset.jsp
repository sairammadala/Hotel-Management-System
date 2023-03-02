<html>
<head>
  <link rel="stylesheet" href="css/new_css.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <style>
* {
  margin: 0px;
  padding: 0px;
}

body {
  background-image: url(bgimage.webp);
  background-repeat: no-repeat;
  background-size: cover;
  backface-visibility: visible;
}

#wrapper {
  width: 500px;
  height: 60%;
  overflow: hidden;
  border: 0px solid #000;
  margin: 50px auto;
  padding: 10px;
}

.main-content {
  width: 250px;
  height: 50%;
  margin: 10px auto;
  background-color: #fff;
  border: 2px solid #e6e6e6;
  padding: 40px 50px;
}

.header {
  border: 0px solid #000;
  margin-bottom: 15px;
}

.caption{
    margin-top: 5px;
}

.input-1,
.input-2 {
  width: 100%;
  margin-bottom: 5px;
  padding: 8px 12px;
  border: 1px solid #dbdbdb;
  box-sizing: border-box;
  border-radius: 3px;
}

.btn {
  width: 100%;
  background-color: #3897f0;
  border: 1px solid #3897f0;
  margin-top: 7px;
  padding: 7px 12px;
  color: #fff;
  font-weight: bold;
  cursor: pointer;
  border-radius: 3px;
}
#signup{
      background-color: #583672;
      margin-left: 100px;
      margin-top: 30px;
      color: white;
      border-radius: 8px;
      font-weight: bold;
      -webkit-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
      -moz-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
      box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
      border: none;
      padding: 15px 70px;
      border-radius: 8px;
      display: block;
      margin: auto;
      margin-top: 30px;
     }
input:focus {
    background-color: yellow;
}

</style>
</head>
<body>
    <%
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
		String usr =  (String)session.getAttribute("usr");
		if(session.getAttribute("usr") == null)
			response.sendRedirect("customer.html");
    %>
    <div class="login_box">
      <div class="left">
          <div class="contact">
            <form action="update_password.jsp" id="myform" method="post">
              <h2 style="text-align: center;color: purple;font-family:sans-serif;">Reset Password</h2>
              <br>
              <p style="text-align:center;color: black;">Please enter a new password to reset your password</p><br>
              <input type="text" name="np1"  placeholder="New Password" required>
              <input type="text" name="np2"  placeholder="Confirm new password" required>
              <button id="signup">Reset Password</button> 
            </form>
          </div>
        </div>
        <div class="right">
          <div class="right-text">
                <h2 style="color: blueviolet; font-family: Snell Roundhand, cursive; text-align: center;">Hotel Newbie</h2>
                <div class="caption">
                  <p style="color: black ;font-family: 'Times New Roman', Times, serif; font-size: large;text-align: center;">Join us today and get flat <br> 15% off</p>
                </div>
              </div>
          
        </div>
      </div>

    
    
  
</body>
</html>