<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="icon" type="image/x-icon" href=" ${path}/resources/assets/favicon.ico" />
<title>나의 페이지</title>
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
		  height: 600px;
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
		.login_mail input {
		
		  width:60%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
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
		.login_phone input {
		  width: 60%;
		  height: 20px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		#editbtn{
			width: 150px;
   			margin: 0 auto; /* 수평 가운데 정렬을 위한 설정 */
   			display:block;
   		}
   		#btn_model a{
   		 margin: 0 auto;
		 text-decoration-line: none;
		 color: #3C5A91;
		}
		#btn_model a:hover{
		 color: #46BEFF;
		}
		.profile_photo{
			  padding : 40px;
			   text-align: center;
		}
   		</style>
   		 <link href="${path}/resources/css/styles.css" rel="stylesheet" /> 

</head>
<body>
	<div class="login-wrapper">
	 <div class="login">
	<h1>회원 정보 수정</h1>
	<div class="tdcell">
       <input type="hidden" name="memberId" id="memberId" value="${memberresult.mb_id}">
            <div class="profile_photo">
            <img src="${memberresult.mb_img}" style="max-width:35%;  height: auto;" onerror="this.src='${path}/resources/img/default.png'">   
            </div>
    </div>
	
 <form action="/editservice.do?mb_id=${memberresult.mb_id}" id="editForm" encType="UTF-8">
    <input type="hidden" name="mb_id" value="${memberresult.mb_id}" />
    <input type="hidden" name="mb_img" value="${memberresult.mb_img}" />
    <div class="login_name">
        이 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="mb_name" id="mb_name" placeholder="이름" value="${memberresult.mb_name}" />
    </div>

    <div class="login_phone">
        전화&nbsp;&nbsp;&nbsp;번호 :&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="mb_phone" id="mb_phone" placeholder="전화번호" value="${memberresult.mb_phone}" />
    </div>

    <div class="login_mail">
        EMAIL :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="mb_mail" id="mb_mail" placeholder="이메일" value="${memberresult.mb_mail}" />
    </div>

    <br>

    <div class="editbtn">
        <a class="btn btn-primary btn-xl text-uppercase" id="editbtn" onclick="edit()">EDIT</a>
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="btn_model"  onclick="editpw()">
            비밀 번호를 변경하고 싶다면 ?
        </a>
    </div>
</form>
     </div>
	</div>
	
	<script type="text/javascript" charset="UTF-8">
	function edit() {
		  	//이메일 정규식
		    var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		    var phoneRule = /^\d{2,3}-\d{3,4}-\d{4}$/;
	
		    if (!emailRule.test(document.getElementById("mb_mail").value)) {
		    	alert("email을 형식에 맞게 입력해주십시오.")
		    	 return false;
		    }
		    if (!phoneRule.test(document.getElementById("mb_phone").value)) {
		    	alert("전화번호를 형식에 맞게 입력해주십시오.")
		    	 return false;
		    }
		    
		    // 모든 조건이 만족할 경우 폼을 서버로 제출
		    document.getElementById('editForm').submit();
		    alert('회원정보 수정을 하시겠습니까 ?');
		    return true;
	}
	
	function editpw(){
		 location.href = `/editpw.do?mb_id=${memberresult.mb_id}`;
	}
      // URL에서 메시지 파라미터 가져오기
      var urlParams = new URLSearchParams(window.location.search);
      var message = urlParams.get("message");

      // 메시지가 존재하면 경고 창으로 표시
      if (message) {
    	  Swal.fire(message);
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