<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
		#box{
		
		  border : 1px solid #3C5A91;
		  border-radius : 5px;
		}
		.btn_wrap a{
		 text-decoration-line: none;
		 color: #3C5A91;
		}
		.btn_wrap a:hover{
		 color: #46BEFF;
		}
		.table{
	 	  margin : 20px; 
		  padding : 15px;
		  color: #3C5A91;
		}
		.table td{	
			color: black;
		}
		table.tbl_model{
			width : 400px;
		}
		.profile_photo{
			  padding : 20px;
		}
		#editbtn{
			width: 55px;
			height: 30px;
			background-color:#3C5A91;
		    color: #fff;
		    border:none; 
		    border-radius:10px; 
		    min-height:30px; 
		    min-width: 15px;
		    top:50%
   		}
   		#editbtn:hover {
	      background-color:#002ead;
	      transition: 0.7s;
	  }
		#pofile{
			width: 280px;
		}
		 #profile input{
			width: 50%;
		}
</style>
</head>
<body>
	<div class="login-wrapper">
	<div class="login">
	<h1>회원 정보</h1>
	<div class="table">
		<table border="0" class="tbl_model">
                <colgroup>
                    <col style="width:22%"><col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="thcell">프로필 사진</div>
                    </th>
                    <td>
                        <form action="/modifyimage.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
						<div class="profile_photo">
						<input type="hidden" name="memberId" id="memberId" value="${memberresult.mb_id}">
					    	<div id="profile">
					    		<img src="${memberresult.mb_img}" style="width:150px;  height: 180px;" onerror="this.src='${path}/resources/img/default.png'">  
								<input type="file" name="uploadImage"  id="uploadImage" >
								<button style="font-size: 0.4em" type="submit" id="editbtn">사진변경</button>
							</div>
						</div>
						</form>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell"><label for="inpNickname">I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D :  </label></div>
                    </th>
                    <td>
                    	${memberresult.mb_id}
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell"><label for="inpNickname">NAME : </label></div>
                    </th>
                    <td>
                    	 ${memberresult.mb_name}
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell"><label for="inpNickname">MAIL :  </label></div>
                    </th>
                     <td>
                    	${memberresult.mb_mail}
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell"><label for="inpNickname">PHONE : </label></div>
                    </th>
                     <td>
                    	${memberresult.mb_phone}
                    </td>
                </tr>
                 <tr>
                    <th scope="row">
                        <div class="thcell"><label for="inpNickname">가입일자 : </label></div>
                    </th>
                     <td>
                    	${memberresult.mb_regdate}
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="btn_wrap">
                <a href="/editme.do?mb_id=${memberresult.mb_id}" class="btn_model"><b id="btnConfirm" class="btn8">회원정보 수정 </b></a>|
                <a class="btn_model"><b id="btnCancel" class="btn2" onclick="deletemb()"> 회원탈퇴</b></a>
               <br><br><a href="/?mb_id=${memberresult.mb_id}" class="btn_model"><b id="btnConfirm" class="btn8">     main으로 돌아가기</b></a>
            </div>
	</div>
	</div>
	<script type="text/javascript" charset="UTF-8">
	function validateForm() {
        var uploadInput = document.getElementById("uploadImage");
        var fileName = uploadInput.value;
        if (fileName === "") {
            alert("파일을 선택해주세요.");
            return false; // 폼 제출을 중지합니다.
        }
        return true; // 폼 제출을 계속합니다.
    }
	
	function deletemb() {
		 if (confirm('정말 탈퇴하시겠습니까 ?')) {
	            location.href = `/delete.do?mb_id=${memberresult.mb_id}`;
	        }
	}
	window.onload = function() {
	        var message = "${message}";
	        if (message && message !== "") {
	        	 Swal.fire({ icon: 'success', text: message });
	        }
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