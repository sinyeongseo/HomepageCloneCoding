<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>게시판</title>

    <!-- Custom fonts for this template -->
    <link href="${path}/resources/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${path}/resources/css/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style type="text/css">
		.btn{
			margin: 0 auto;
			margin-left: 5px;
		}
		.mb-3 label {
			text-size : 30px;
			color: #4e73df;
			text-decoration: bold;
		}
		.mb-4{
			width : 50%;
			margin : 0 auto;
			height: 100%;
		}
		.m-0{
			margin : 0 auto;
		}
		#processbtn{
			background-color: red;
			border-color: red;
		}
		#processwaitbtn{
			background-color: green;
			border-color: green;
		}
	</style>
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
          
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
			  <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>

                        <div class="topbar-divider d-none d-sm-block"></div>

                      
                    </ul>

                </nav>
                 <!-- Begin Page Content -->
                <div class="container-fluid">
					<div><br>
					    <div class="d-flex justify-content-between align-items-center">
					        <div>
					                <input type="hidden" id="pkct_num" value="${ContactContent.ct_num}">
					        </div>
					    </div>
					</div><br><br><br><br><br>
                    <!-- Page Heading -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">
                            <span id="tb_num" style='color:#4e73df;'> ${not empty ContactContent.mb_id ? ContactContent.mb_id : '비회원'}
    						</span>님 &nbsp;문의 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                              <article>
									<div class="container" role="main">
										
											<div class="mb-3">
												<label for="title">문의 작성자</label>
												<div> ${not empty ContactContent.mb_id ? ContactContent.mb_id : '비회원'}</div>
											</div>
											<div class="mb-3">
												<label for="reg_id">작성자 전화번호</label>
												<div>${ContactContent.mb_phone}</div>
											</div>
											<div class="mb-3">
												<label for="content">작성자 메일</label>
												<div>${ContactContent.mb_mail}</div>
											</div>
											<div class="mb-3">
												<label for="tag">문의 메시지</label>
												<div>${ContactContent.mb_message}</div>
											</div>
											
										<div class = "btn">
											<button type="button" class="btn btn-sm btn-primary" id="btnRemove" onclick="btnRemove()">삭제</button>
											<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="btnList()">목록</button>
											<button type="button" id="processbtn" class="btn btn-sm btn-primary" id="btnList" onclick="Process()">처리 완료</button>
											<button type="button" id="processwaitbtn" class="btn btn-sm btn-primary" id="btnList" onclick="Processwait()">처리 대기</button>
										</div>
										
										
									</div>
								</article>
                         
                               				
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
				
            </div>
            <!-- End of Main Content -->


   
	<script type="text/javascript" charset="UTF-8"> 		

	//목록으로 돌아가기
	function btnList(){
			location.href='/admin/contact.do';	
	}
	
	// 게시글 삭제
	function btnRemove() {
		let ct_num = document.getElementById("pkct_num").value;
	   
	    location.href = '/admin/contactremove.do?ct_num=' + ct_num;

	}
	
	function Process(){
		let ct_num = document.getElementById("pkct_num").value;
		location.href ='/admin/contactcheck.do?ct_num=' + ct_num;
	}

	function Processwait(){
		let ct_num = document.getElementById("pkct_num").value;
		location.href ='/admin/contactcheckno.do?ct_num=' + ct_num;
	}

	</script>
	 <!-- Bootstrap core JavaScript-->
    <script src="${path}/resources/js/jquery.min.js"></script>
    <script src="${path}/resources/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/resources/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${path}/resources/js/jquery.dataTables.min.js"></script>
    <script src="${path}/resources/js/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${path}/resources/js/datatables-demo.js"></script>
</body>

</html>