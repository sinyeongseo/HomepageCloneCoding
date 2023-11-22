<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 찾기</title>
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
		.login_mail {
		  margin-top: 20px;
		  width: 80%;
		  display: inline-block;
		}
		
		.login_mail input {
		  width: 60%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		
		.login_name {
		  margin-top: 20px;
		  width: 80%;
		  display: inline-block;
		}
		
		.login_name input {
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
		#footer a{
		 text-decoration-line: none;
		 color: #3C5A91;
		 
		}
		#footer a:hover{
		color: #46BEFF;
		 
		}
		h3{
			color: #3C5A91;
		    font-size: 2em;
		}
		</style>
		<link href="${path}/resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="login-wrapper">
		 <div class="login">
			<h3>ID 찾기</h3>
		 	<form action="/idsearchservice.do" method="post" id="idsearchForm" encType="UTF-8">
		 	
		 		<br>
		 			<div class="login_name">
		 			      <label for="user_name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		 				 <input type ="text" name="mb_name" id="mb_name" placeholder="NAME"/>
		 			</div>
		 			<div class="login_mail">
		 			    <label for="user_mail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		 				<input type="text" name="mb_mail" id="mb_mail" placeholder="EMAIL"/>
		 				
		 			</div>
		 		<br>	
		 		<br>
		 			<div id="button">
		 				<a class="btn btn-primary btn-xl text-uppercase" onclick="idsearch()" >id 찾기</a>
		 			</div>
		 		<br><br>
		 	</form>
		 	 	
	 	 </div>
	</div>
<script type="text/javascript" charset="UTF-8">
function idsearch(){
	 document.getElementById('idsearchForm').submit();
}
	
</script>
 	
</body>
</html>
