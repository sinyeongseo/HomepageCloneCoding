<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
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
		    font-size:1.8em;
		}
		.JoinForm{
		 margin-top: 20px;
		  width: 80%;
		}
		.login_id input {
		
		  width:55%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		
		.login_pw input {
		
		  width: 55%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		
		.login_name input {
		  width: 55%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		
		.login_mail input {
		  width: 55%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		.login_phone input {
		  width: 55%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		#check{
			display: inline-block;
		}
		/* 중복아이디 존재하지 않는경우 */
		.id_input_re_1{
			color : #3C5A91;
			display : none;
		}
		/* 중복아이디 존재하는 경우 */
		.id_input_re_2{
			color : red;
			display : none;
		}
		#joinbtn{
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
	<h1>회원가입</h1>
	아이디 중복 체크를 해야만 회원가입 버튼이 생성됩니다.
 	<form action="/joinservice.do" id="JoinForm" encType="UTF-8" method=POST>
 		<br>
 			<div class="login_id">
 			ID : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mb_id" id="mb_id" placeholder="ID"/>
 			<button id="check" type="button" onclick="id_chk()">중복확인</button>
 			</div>
 			<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			<br>
 			
 			<div class="login_pw">
 			PASSWORD : <input type ="password" name="mb_pw" id="mb_pw" placeholder="PASSWORD"/><br>
 			
 			
 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="password" name="user_pw_comfirm" id="user_pw_comfirm" placeholder="PASSWORD 확인"/>
 			</div>
 			
 			<div class="login_name"><br>
 			이 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" name="mb_name" id="mb_name" placeholder="NAME"/>
 			
 			</div>
 			<div class="login_mail">
 			Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type ="text" name="mb_mail" id="mb_mail" placeholder="xxxx@xxxx.xxx"/>
 			</div>
 			<div class="login_phone">
 			전화&nbsp;&nbsp;&nbsp;번호 :&nbsp;&nbsp;&nbsp;&nbsp; <input type ="text" name="mb_phone" id="mb_phone" placeholder="010-xxxx-xxxx"/>
 			</div>
 			<br>
 			<div class="joinbtn">
 				<a class="btn btn-primary btn-xl text-uppercase" id="joinbtn" onclick="join()">JOIN</a>
 			</div>
 	 	</form>		
 	 </div>
	</div>

<script type="text/javascript" charset="UTF-8">

function join() {
    var p1 = document.getElementById("mb_pw").value;
    var p2 = document.getElementById("user_pw_comfirm").value;
  	//이메일 정규식
    var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var phoneRule = /^\d{2,3}-\d{3,4}-\d{4}$/;
    if (p1 != p2) {
        alert('비밀번호가 일치하지 않습니다');
        return false;
    }

    if (document.getElementById("mb_id").value == '') {
        alert("ID를 입력해주십시오.");
        return false;
    }

    if (document.getElementById("mb_pw").value == '') {
        alert("비밀번호를 입력해주십시오.");
        return false;
    }
    if (document.getElementById("mb_name").value == '') {
        alert("이름을 입력해주십시오.");
        return false;
    }
    if (document.getElementById("mb_mail").value == '') {
        alert("email을 입력해주십시오.");
        return false;
    }
    if (document.getElementById("mb_phone").value == '') {
        alert("전화번호를 입력해주십시오.");
        return false;
    }
    if (!emailRule.test(document.getElementById("mb_mail").value)) {
    	alert("email을 형식에 맞게 입력해주십시오.")
    	 return false;
    }
    if (!phoneRule.test(document.getElementById("mb_phone").value)) {
    	alert("전화번호를 형식에 맞게 입력해주십시오.")
    	 return false;
    }
    
    // 모든 조건이 만족할 경우 폼을 서버로 제출
    document.getElementById('JoinForm').submit();
    alert('회원가입 되었습니다. 로그인페이지로 이동합니다.')
    return true;
	
}
	
function id_chk() {
    var input_id = document.getElementById('mb_id').value; // input 요소의 값을 가져옴
    var idInputRe1 = document.querySelector('.id_input_re_1');
    var idInputRe2 = document.querySelector('.id_input_re_2');
    var joinbtn = document.querySelector('#joinbtn');
 // 입력값이 비어 있는지 확인
    if (input_id === "") {
        alert("아이디를 입력해주세요.");
        return;
    }
 
    var data = {
        input_id: input_id // input_id에 실제 값 할당
    };
    
    fetch("/idCheck.do", {
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
            joinbtn.style.display = "block";
        } else {
            idInputRe1.style.display = "none";
            idInputRe2.style.display = "inline-block";
            joinbtn.style.display ="none";
        }
    })
    .catch(function (error) {
        console.error("Fetch Error: ", error);
    });
}
</script>
</body>
</html>