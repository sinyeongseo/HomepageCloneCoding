<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href=" ${path}/resources/assets/favicon.ico" />
<title>비밀번호 변경</title>
</head>
<body>
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
		.editForm{
		 margin-top: 20px;
		  width: 80%;
		}
		.mb_pw input {
		  width:50%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		.mb_newpw input {
		  width: 60%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		.id_input_re_1{
			color : #3C5A91;
			display : none;
		}
		/* 중복아이디 존재하는 경우 */
		.id_input_re_2{
			color : red;
			display : none;
		}
		#editbtn{
		width: 150px;
   			margin: 0 auto; /* 수평 가운데 정렬을 위한 설정 */
   			display: none; /* a 태그를 블록 레벨 요소로 변경 */
   		}
   		</style>
   		
   		 <link href="${path}/resources/css/styles.css" rel="stylesheet" /> 

</head>
<body>
	<div class="login-wrapper">
	 <div class="login">
	<h1>비밀번호 변경</h1>
	기존의 비밀번호 확인이 되어야 변경 버튼이 생성됩니다.
 	<form action="/pweditservice.do" id="editpwForm" encType="UTF-8" method=POST>
 		<br>
 			<input type="hidden" name="mb_id" value="${mb_id}" />
 			<div class="mb_pw"><br>
 			기존&nbsp;&nbsp;&nbsp;&nbsp;PW :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="password" name="mb_pw" id="mb_pw" placeholder="PW"/>
 			<button id="check" type="button" onclick="pw_chk()">기존 pw 확인</button>
 			</div>
 			<span class="id_input_re_1">기존 비밀번호와 다릅니다.</span>
			<span class="id_input_re_2">비밀번호가 확인되었습니다.</span>
 			<div class="mb_pw">
 			변경할&nbsp;&nbsp;PW :&nbsp;&nbsp;&nbsp;&nbsp; <input type ="text" name="mb_newpw" id="mb_newpw" placeholder="New PW" value="${mb_newpw}" />
 			</div>
 			
 			<br>
 			<div class="editbtn">
 			<a class="btn btn-primary btn-xl text-uppercase" id="editbtn" onclick="edit()">EDIT</a>
 			</div>
 			
 	</form>
     </div>
	</div>
<script type="text/javascript" charset="UTF-8">	
	function pw_chk() {
	    var mb_pw = document.getElementById('mb_pw').value; // input 요소의 값을 가져옴
	    var idInputRe1 = document.querySelector('.id_input_re_1');
	    var idInputRe2 = document.querySelector('.id_input_re_2');
	    var joinbtn = document.querySelector('#editbtn');
	    var data = {
	    	login_pw:mb_pw // input_id에 실제 값 할당
	    };
	    
	    fetch("/editpwService.do", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify(data)
	    })
	    .then(function (response) {
	        if (!response.ok) {
	            throw new Error("Network response was not ok");
	        }
	        return response.json();
	    })
	    .then(function (result) {
	        console.log("성공 여부: " + result.result);
	        if (result.result !== 'fail') {
	            idInputRe1.style.display = "inline-block";
	            idInputRe2.style.display = "none";
	            joinbtn.style.display ="none";
	        } else {
	            idInputRe1.style.display = "none";
	            idInputRe2.style.display = "inline-block";
	            joinbtn.style.display = "block";
	        }
	    })
	    .catch(function (error) {
	        console.error("Fetch Error: ", error);
	    });
	}
	function edit() {
		 if (document.getElementById("mb_pw").value == '') {
		        alert("비밀번호를 입력해주십시오.");
		        return false;
		    }
		document.getElementById('editpwForm').submit();
		
		return true;
	}
	
	  function checkSession() {
		   fetch("/checksession.do") // 세션 유효성을 확인하는 엔드포인트를 호출
		     .then(response => response.json())
		     .then(data => {
		       if (data.sessionExpired) {
		         alert("로그인 시간이 만료되었습니다. 다시 로그인해주세요");
		         window.location.href = '/login.do'; // 로그인 페이지로 이동
		       }
		     })
		     .catch(error => {
		       console.error('An error occurred:', error);
		     });
		 }

		 // 최초 페이지 로딩 시 바로 세션 체크 수행
		 checkSession();

		 // 일정 간격으로 세션을 확인
		 setInterval(checkSession, 5000);
</script>
</body>
</html>