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
   		</style>   		
   		 <link href="${path}/resources/css/styles.css" rel="stylesheet" /> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<div class="login-wrapper">
	 <div class="login">
	<h1>비밀번호 확인</h1>
	기존에 설정한 비밀번호 확인 되어야 <br>&nbsp;&nbsp;&nbsp;&nbsp;수정 및 삭제가 가능합니다.
 	<form action="/tablechkService.do" id="editpwForm" encType="UTF-8" method=POST>
 		<br>
 			<input type="hidden" id="tb_num" name="tb_num" value="${tb_num}" />
 			<input type="hidden" id="action" name="action" value="${action}" />
 			<div class="mb_pw"><br>
 			설정한&nbsp;PW :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="password" name="tb_pwd" id="tb_pwd" placeholder="PW"/>
 			&nbsp;&nbsp;<button  class="btn btn-sm btn-primary" id="check" type="button" onclick="pw_chk()">pw 확인</button>
 			</div>
 	</form>
     </div>
	</div>
<script type="text/javascript" charset="UTF-8">	
	function pw_chk() {
		var tb_pwd = document.getElementById('tb_pwd').value; // input 요소의 값을 가져옴
	    var tb_num = document.getElementById('tb_num').value;
	    var action = document.getElementById('action').value;
	    
	    var data = {
	    	tb_pwd: tb_pwd, // input_id에 실제 값 할당
	    	tb_num: tb_num,
	    	action : action
	    };
	    
	 fetch("/tablechkService.do", {
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
	        if (result.result !== 'success') { 
	        	Swal.fire({
	        		  title: '경고',
	        		  text: '비밀번호가 다릅니다.',
	        		  icon: 'error', // 'error' 아이콘 사용
	        		  confirmButtonText: '확인'
	        		});
	        } 
	        else {
	        	alert('확인되었습니다.');
	            if (result.action === 'remove') {
	                console.log('삭제하기');
	                removeController();
	            } else if (result.action === 'edit') {
	            	console.log('수정하기');
	            	editController();
	            } 
	        }
	    })
	    .catch(function (error) {
	        console.error("Fetch Error: ", error);
	    });
	}
	
	function removeController(){
		console.log('remove controller 호출');
		 var tb_num = document.getElementById('tb_num').value;
		 var data = {
			    	tb_num: tb_num,
			    };
			    fetch("/removeService.do", {
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
			    	alert(result.message);
			    	location.href = result.url; // URL 이동
			    })
			    .catch(function (error) {
			        console.error("Fetch Error: ", error);
			    });
		}
	
	function editController(){
		   var postNumber = document.getElementById('tb_num').value; // 여기에 게시물 번호를 설정
		   var url = 'tablesedit.do?postNumber=' + postNumber;
		   location.href =url; // URL 이동
		  
	}
	

</script>
</body>
</html>