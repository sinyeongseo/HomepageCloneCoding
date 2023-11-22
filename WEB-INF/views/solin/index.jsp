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
        <title>solinsystem</title>
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
        	}
        	section{
        		  margin-bottom: 0;
        	}
        	section#contact{
        	 background-image:url("${path}/resources/img/map-image.png");
        	}
        	.footer{
        		font-size:1em;
        		font-family: "Roboto Slab", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        		text-align:center;
        	}
        	.footer hr {
			    border: none; /* 기본 테두리 제거 */
			    height: 1px; /* 수평선의 높이 설정 */
			    background-color: white; /* 배경색을 흰색으로 설정 */
			}
			/* .footer 내부의 p 태그 안의 텍스트를 하얀색으로 설정 */
			.footer p {
			    color: white;
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
    </head>
    <body id="page-top" onload="showLogoutAlert()">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/"><img src="${path}/resources/img/navbar-logo.svg" alt="..." width="40%"/><br><font>(주) 솔인시스템</font></a>
   
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                         <li class="nav-item"><a class="nav-link" href="#announcement">announcement</a></li>
				        <li class="nav-item"><a class="nav-link" href="#contact">contact us</a></li>
				        <li class="nav-item" id="noticeLink"><a class="nav-link" href="/tables.do">notice</a></li>
				        <li class="nav-item" id="loginLink"><a class="nav-link" href="/login.do">login</a></li>
				        <li class="nav-item" id="joinLink"><a class="nav-link" href="/join.do">join</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Solinsystem!</div>
                <div class="masthead-heading text-uppercase">If you want to learn more, please click "tell me more."</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#announcement">Tell Me More</a>
            </div>
        </header>
        <!-- announcement-->
        <section class="page-section" id="announcement">
            <div class="container">
            	
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">announcement</h2>
          			<br><br>
                    <h3 style="font-size: 20px;" class="section-subheading text-muted" >(주) 솔인시스템은, </h3>
                    <h3 class="section-subheading text-muted"> WEB 및 WAS 서버에 대한 특화된 기술을 보유하고 있는 전문 기업으로
						공공 기관, 유통, 금융, 일반 기업에 이르는 다수의 고객을 지원하고 있습니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <div class="fa-stack fa-4x">
                        	<div class="circle">
                            <img src="${path}/resources/img/apache.jpg" width="105px">
                            </div>
                        </div>
                           <h4 class="my-3">Apache Tomcat</h4>
                        <p class="text-muted">
							Apache Tomcat은 Java Servlet, JavaServer Pages,<br> Java Expression Language 및 Java WebSocket<br> 기술을 실행할 수 있는 오픈 소스입니다.
							</p>
                    </div>
                    <div class="col-md-4">
                        <div class="fa-stack fa-4x">
                        	<div class="circle">
                            <img src="${path}/resources/img/resin.png" width="128px">
                            </div>
                        </div>
                        <h4 class="my-3">Resin</h4>
                        <p class="text-muted">
							Resin Web Server는 HTTP 프로토콜을 통하여<br> 전달된 브라우저의 요구를 처리하는 <br>Web 서버 소프트웨어입니다.<br>
							​</p>
                    </div>
                    <div class="col-md-4">
                        <div class="fa-stack fa-4x">
                        	<div class="circle">
                            <img src="${path}/resources/img/scouter.png" width="128px">
                            </div>
                        </div>
                        <h4 class="my-3">Scouter</h4>
                        <p class="text-muted">
							Scouter는 APM <br>(Application Performance Management)<br>프로그램으로 오픈소스 입니다. 
							</p>
                    </div>
                </div>
            </div>
        </section>
           <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Contact Us</h2>
                    <h3 class="section-subheading text-muted">이름, email, 전화번호를 남겨주시면 연락드리겠습니다.</h3>
                </div>
                <form action="/contact.do" id="contactForm" data-sb-form-api-token="API_TOKEN">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- Name input-->
                                <input type="hidden" id="mb_id" name="mb_id" value="${mb_id}">
                                <input type="hidden" id="mb_img" name="mb_img" value="${mb_img}">
                                <input class="form-control" id="name" name="mb_name" type="text"  value="${mb_name}" placeholder="Your Name *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="name:required" >A name is required.</div>
                            </div>
                            <div class="form-group">
                                <!-- Email address input-->
                                <input class="form-control" id="email" name="mb_mail"  type="email"  value="${mb_mail}" placeholder="Your Email *" data-sb-validations="required,email" />
                                <div class="invalid-feedback" data-sb-feedback="email:required" >An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <div class="form-group mb-md-0">
                                <!-- Phone number input-->
                                <input class="form-control" id="phone"  name="mb_phone" type="tel" value="${mb_phone}" placeholder="Your Phone *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                <!-- Message input-->
                                <textarea class="form-control" id="message"  name="mb_message"placeholder="Your Message *" data-sb-validations="required"></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                        </div>
                    </div>
                    <!-- Submit success message-->
                    <!---->
                    <!-- This is what your users will see when the form-->
                 
                    <!-- Submit error message-->
                    <!---->
                    <!-- This is what your users will see when there is-->
                    <!-- an error submitting the form-->
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                    <!-- Submit Button-->
                    <div class="text-center"><a class="btn btn-primary btn-xl text-uppercase" onclick="contact()">Contact</a></div>
                    </form>
                    
                    <div class="footer">
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <hr>
		  			 <p>
				        <span>저자 : solinsystem</span><br/>
				        <span>이메일 : http://www.solinsystem.co.kr/</span><br/>
				        <span>Copyright 2023. solinsystem. All Rights Reserved.</span>
				    </p>
				    </div>
                
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${path}/resources/js/scripts.js"></script>
        
        
   <script type="text/javascript" charset="UTF-8">
   window.onload = function showLogoutAlert() {
   	    var result = <%= request.getAttribute("result") %>;
		var mb_id = "<%= session.getAttribute("mb_id") %>";
		var alertShown = localStorage.getItem('alertShown');
		
		if (alertShown === null || alertShown === "false") {
			if (result === 0) {
				Swal.fire(mb_id + "님 로그인 되었습니다.");
			  }
		}
       var logoutresult = <%= request.getAttribute("logoutresult") %>;
       if (alertShown === null || alertShown === "false") {
	       if (logoutresult === 0) {
	    	   Swal.fire("로그아웃 되었습니다.");
	       }
       }
       var deleteMessage = "<%= request.getAttribute("deleteMessage") %>";
       if (alertShown === null || alertShown === "false") {
	       if (deleteMessage &&  deleteMessage.trim() !== "" && deleteMessage !== 'null') {
	    	   Swal.fire({ icon: 'success', text:deleteMessage});
	       }
       }
       var message = '<%= request.getParameter("message") %>';
       if (alertShown === null || alertShown === "false") {
		    if (message && message.trim() !== "" && message !== 'null') {
		    	Swal.fire(message);
		    }
       }
   }
   
   function updateLinks() {
	    var noticeLink = document.getElementById('noticeLink');
	    var loginLink = document.getElementById('loginLink');
	    var joinLink = document.getElementById('joinLink');
	    var mb_id= document.getElementById('mb_id');
	    
	    // AJAX 요청으로 세션 정보 가져오기
	    var xhr = new XMLHttpRequest();
	    xhr.open("GET", "/getsession.do", true);

	    xhr.onload = function () {
	        if (xhr.status === 200) {
	            var response = JSON.parse(xhr.responseText);
	            var mbId = response.mbId;

	            if (mbId) {
	                // mb_id 값이 존재하면 로그인된 상태로 간주
	                noticeLink.innerHTML = '<a class="nav-link" href="/tables.do?mb_id=' + mb_id.value + '">notice</a>';
	                loginLink.innerHTML = '<a class="nav-link" href="/mypage.do?mb_id=' + mb_id.value + '">my page</a>';
	                joinLink.innerHTML = '<a class="nav-link" href="/logout.do">logout</a>';
	            } else {
	                // mb_id 값이 없으면 로그아웃 상태로 간주
	                noticeLink.innerHTML = '<a class="nav-link" href="/tables.do">notice</a>';
	                loginLink.innerHTML = '<a class="nav-link" href="/login.do">login</a>';
	                joinLink.innerHTML = '<a class="nav-link" href="/join.do">join</a>';
	            }
	            
	            // 쿠키 값 확인
	            var isAutoLoggedIn = checkAutoLoginCookie();
	            if (isAutoLoggedIn) {
	                // 쿠키가 있으면 로그인된 상태로 간주
	                noticeLink.innerHTML = '<a class="nav-link" href="/tables.do?mb_id=' + mb_id.value + '">notice</a>';
	                loginLink.innerHTML = '<a class="nav-link" href="/mypage.do?mb_id=' + mb_id.value + '">my page</a>';
	                joinLink.innerHTML = '<a class="nav-link" href="/logout.do">logout</a>';
	            }
	        }
	    };

	    xhr.send();
	}

	// 페이지 로드 시에 링크 텍스트 업데이트
	updateLinks();

	// 일정 간격으로 링크 업데이트 함수를 호출 (예: 5초마다)
	setInterval(updateLinks, 5000); // 5초마다 업데이트

	function checkAutoLoginCookie() {
	    var cookies = document.cookie.split(';');
	    for (var i = 0; i < cookies.length; i++) {
	        var cookie = cookies[i].trim();
	        if (cookie.indexOf('mb_id') === 0) {
	            return true; // 자동 로그인 쿠키가 존재함
	        }
	    }
	    return false; // 자동 로그인 쿠키가 없음
	}
	   
	
    function contact() {
        document.getElementById('contactForm').submit();
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
