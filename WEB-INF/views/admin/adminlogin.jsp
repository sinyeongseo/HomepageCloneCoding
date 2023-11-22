<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
	<title>admin login</title>
	<style type="text/css">
	@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
		*{
		    padding: 0;
		    margin: 0;
		    border: none;
		    font-family: 'Spoqa Han Sans Neo', 'sans-serif',"Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
		}
		.login-wrapper{
		  height: 100vh;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  background: rgba(0, 0, 0, 0.1);
		 /*  background-image:url("${path}/resources/img/login_background.jpg"); */
		  background-repeat: no-repeat;
		  background-attachment: scroll;
		  background-position: center center;
		  background-size: cover;
		}
		.login {
		  width: 30%;
		  height: 500px;
		  background: white;
		  border-radius: 20px;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  flex-direction: column;
		}
		h1{
			color: #3C5A91;
		    font-size: 1.8em;
		}
		.loginForm{
		  margin-top: 20px;
		   width: 80%;
		}
		.login_id {
		  margin-top: 20px;
		  width: 80%;
		  display: inline-block;
		}
		
		.login_id input {
		  width: 60%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		
		.login_pw {
		  margin-top: 20px;
		  width: 80%;
		  display: inline-block;
		}
		
		.login_pw input {
		  width: 60%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		button {
		  margin:0 5px; /* Optional margin for spacing between buttons */
		  width: 20%;
		  height: 45px;
		  border: 10px;
		  outline: none;
		  border-radius: 40px;
		  background: linear-gradient(to left,  #0064CD, rgb(255, 250, 255));
		  color: white;
		  font-size: 1em;
		  letter-spacing: 2px;
		  position:center;
		}
		#button{
		 display: inline-block; /* Change display to inline-block */
		 width: 600px;
		 height : 60px;
		 text-align: center; /* Center align its children horizontally */
		}	
		h2{
			color: gray;
		}
		</style>
		<link href="${path}/resources/css/styles.css" rel="stylesheet" />
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<div class="login-wrapper">
	 <div class="login">
	<img src="${path}/resources/img/solinsystem-logo.png" alt="" width="180" height="80">
	 <h2>관리자 페이지 로그인</h2>
 	<form action="/admin/login.do" id="loginForm" method="post" accept-charset="UTF-8">
 		<br>
 			<div class="login_id">
 			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<input type="text" name="mb_id" id="mb_id" placeholder="ID"/>
 				
 			</div>
 			<div class="login_pw">
 			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PW:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				 <input type ="password" name="mb_pw" id="mb_pw" placeholder="PASSWORD"/>
 			</div>
 		<br>
 		<br><br>
 		<div id="button">
 			<a class="btn btn-primary btn-xl text-uppercase" onclick="login()" >LOGIN</a>
 		</div>
 	</form>
 	 	<br>			
 	 </div>
	</div>
<script type="text/javascript" charset="UTF-8">
		$(document).ready(function() {
		    var message = "${message}"; // 모델에서 받은 메시지
		    var logoutmessage = "${logoutmessage}";
		
		    if (message !== "null" && message !== "") {
		        Swal.fire({
		            text: message,
		            icon: "info",
		            confirmButtonText: "확인"
		        });
		    }
		
		    if (logoutmessage !== "null" && logoutmessage !== "") {
		        Swal.fire({
		            text: logoutmessage,
		            icon: "info",
		            confirmButtonText: "확인"
		        });
		    }
		});

 
    function login() {
        document.getElementById('loginForm').submit(); 
    }
</script>
 	
</body>
</html>
