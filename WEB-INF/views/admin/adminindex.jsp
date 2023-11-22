<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <meta charset="utf-8" />
        <title>solinsystem admin</title>
        <style type="text/css">
            *{
        		 margin: 0;
   				 padding: 0;
        	}
        	font{
        	 font-size: 0.8rem;
			  font-weight: 400;
			  font-style: italic;
			  font-family: "Roboto Slab", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
			  margin-bottom: 4rem;
        	}
        	.circle{
        		border: 2px solid #3C5A91;
        	}
        	.fa-stack{
        		width: 200px;
        		height: 168px;
        	}
        	.masthead{
        	 	background-image:url("${path}/resources/img/top-background.avif");
        	 	height: 70%;
        	}
        	section{
        		  margin-bottom: 0;
        	}
        	section#contact{
        	 background-image:url("${path}/resources/img/map-image.png");
        	}
        	.float{
			   position: fixed;
		        width: 100px;
		        height: 100px;
		        bottom: 40px;
		        right: 40px;
		        background-color: #0064CD;
		       
		        border-radius: 50px;
		        text-align: center;
		        box-shadow: 2px 2px 3px #999;
		        display: flex;
		        align-items: center;
		        justify-content: center; /* 중앙 정렬을 위해 추가 */
			}
			.float a{
				 color: #FFF;
			}
			.my-float{
			  margin-top:22px;
			}
			
        </style>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href=" ${path}/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/admin/index.do"><img src="${path}/resources/img/navbar-logo.svg" alt="..." width="40%"/><br><font>(주) 솔인시스템</font></a>
   
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
						<li class="nav-item"><a class="nav-link" href="/admin/member.do">Member List</a></li>
				        <li class="nav-item"><a class="nav-link" href="/admin/contact.do">contact List</a></li>
				        <li class="nav-item" id="noticeLink"><a class="nav-link" href="/admin/notice.do">notice List</a></li>
				         <li class="nav-item"><a class="nav-link" href="/admin/dashboard.do">admin DashBoard</a></li>
				        <li class="nav-item" id="loginLink"><a class="nav-link" href="/admin/logout.do">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Solinsystem!</div>
                <div class="masthead-heading text-uppercase">This is admin page</div>
                
            </div>
        </header>
       <br><br>
             <div class="footer">
                    <hr>
		  			 <p>
				        <span>저자 : solinsystem</span><br/>
				        <span>이메일 : http://www.solinsystem.co.kr/</span><br/>
				        <span>Copyright 2023. solinsystem. All Rights Reserved.</span>
				    </p>
				    </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${path}/resources/js/scripts.js"></script>
        
        
   <script type="text/javascript" charset="UTF-8">
	   $(document).ready(function() {
	       var message = "${message}"; // 모델에서 받은 메시지
	       
	       if (message !== "") {
	           Swal.fire({
	               text: message, // SweetAlert2에 표시할 메시지
	               icon: "info", // 아이콘 유형 (정보 아이콘을 사용하려면 "info")
	               confirmButtonText: "확인" // 확인 버튼의 텍스트
	           });
	       }
	   });
	   
	   function login() {
	       document.getElementById('loginForm').submit(); 
	   }
	</script>
   

    </body>
</html>
