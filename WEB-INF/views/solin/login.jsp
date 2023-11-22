<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
	<title>login</title>
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
		.login_ck {
		  margin-top: 20px;
		  width: 80%;
		  display: inline-block;
		  text-align: center; 
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
		</style>
		<link href="${path}/resources/css/styles.css" rel="stylesheet" />
</head>
<body onload="showLoginAlert()">
	<div class="login-wrapper">
	 <div class="login">
	 <a href="/"><img src="${path}/resources/img/solinsystem-logo.png" alt="" width="180" height="80"></a>
 	<form id="loginForm" method="post" accept-charset="UTF-8">
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
 		<div class="login_ck">
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input type="checkbox" id="loginchk"> 로그인 유지</label>
 		</div>
 		<br><br>
 		<div id="button">
 			<a class="btn btn-primary btn-xl text-uppercase" onclick="login()" >LOGIN</a>
 		</div>
 	</form>
 	 	<br>	
 			<div id="footer">
                <a href="/idsearch.do"><b id="btnConfirm" class="btn8" onclick="clickcr(this,'prf.apply','','',event);">아이디 찾기  |</b></a>
                <a href="/pwsearch.do"><b id="btnCancel" class="btn2" onclick="clickcr(this,'prf.cancel','','',event);">  비밀번호 찾기</b></a>
            </div> 
 			<br>
 			<div id="footer"><a href="/join.do">회원이 아니신가요 ?</a></div>
 			
 	 </div>
	</div>
<script type="text/javascript" charset="UTF-8">
	function login(){
		var chk = document.getElementById('loginchk');
		  if (chk.checked) {
		        // 체크가 되어 있을 경우
		        document.getElementById('loginForm').action = "/keeploginservice.do";
		    } else {
		        // 체크가 안되어 있을 경우
		        document.getElementById('loginForm').action = "/loginservice.do";
		    }
		    document.getElementById('loginForm').submit();
		 
	}
	
	function showLoginAlert() {
	    var result = <%= request.getAttribute("result") %>;
	    if (result === 0) {
	    	Swal.fire({
	    		  icon: 'error',
	    		  text:"아이디 또는 비밀번호가 일치하지 않습니다.",
	    		  footer: '<a href="/idsearch.do">id를 잊으셨나요 ?</a>'});
	    }
	}
	
	 var sessionmessage = '<%= request.getParameter("sessionmessage") %>';
	    
	 if (sessionmessage && sessionmessage.trim() !== "" && sessionmessage !== 'null') {
	        alert(sessionmessage);
	 }
	
</script>
 	
</body>
</html>
