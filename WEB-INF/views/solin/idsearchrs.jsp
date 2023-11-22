<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 조회 결과</title>
<style type="text/css">	
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
		    font-size: 2em;
		}
		#box{
		  margin : 20px; 
		  padding : 30px;
		  border : 1px solid #3C5A91;
		  border-radius : 5px;
		}
		#footer a{
		 text-decoration-line: none;
		 color: #3C5A91;
		}
		#footer a:hover{
		color: #46BEFF;
		}
		span{
			color:#3C5A91;
		}
</style>

</head>
<body>
<% if (request.getAttribute("mb_id") == null) { %>
    <script>
   		 var link = '/idsearch.do';
    
        alert("회원정보를 다시 입력해주세요.");
        location.href=link;
    </script>
<% } %>
	<div class="login-wrapper">
	 <div class="login">
		   <a href="/"><img src="${path}/resources/img/solinsystem-logo.png" alt="" width="180" height="80"></a>
		 <h1>ID 조회 결과</h1> <!-- 컨트롤러에서 전달한 데이터 출력 --><br>
		 <div id="box">
		<div><span  style="font-weight:bold">${mb_name}</span> 님의 정보와 일치하는 id입니다.</div><br>
		<div><span  style="font-weight:bold">ID</span> : <span  style="font-weight:bold">${mb_id}</span></div><br><br>
		 <div><span style="font-size : 10pt;">가입일 : ${mb_regdate}</span></div>
		 </div>
		 <div id="footer"><a href="/login.do">로그인 하러 가기</a></div>
		 <div id="footer"><a href="/pwsearch.do">비밀번호 찾으러 가기</a></div>
	 </div>
	 </div>
	 
</body>
</html>