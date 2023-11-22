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
		.postbtn #postbtn {
		    font-size: 15px; /* You can adjust the size as needed */
		  }
		#postbtn{
			width: 100px;
			height : 40px;
   			margin: 0 auto; /* 수평 가운데 정렬을 위한 설정 */
   			display: none; /*   a 태그를 블록 레벨 요소로 변경 */
		} 
		.mb-4{
			width : 80%;
			margin : 0 auto;
			height: 100%;
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
                <!-- End of Topbar -->

                 <!-- Begin Page Content -->
                <div class="container-fluid">
					<div><br>
					    <div class="d-flex justify-content-between align-items-center">
					        <div>
					            <h1 class="h3 mb-2 text-gray-800">공지사항 등록</h1>
					            <p class="mb-4" id="loginment"></p>
					        </div>
					    </div>
					</div><br>
                    <!-- Page Heading -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">NOTICE</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                              <article>
									<div class="container" role="main">
										<form action="/admin/noticeservice.do" encType="UTF-8" id="WriteForm" method="post">
											<div class="mb-3">
												<label for="title">제목</label>
												<input type="text" class="form-control" name="tb_title" id="tb_title" placeholder="제목을 입력해 주세요" >
											</div>
							
											
											<div class="mb-3">
												<label for="reg_id">작성자</label>
												<input type="text" class="form-control" name="tb_writer" id="tb_writer" placeholder="ID을 입력해 주세요" value="admin" readonly>
											</div>
							
											
											<div class="mb-3">
												<label for="content">내용</label>
												<textarea class="form-control" rows="5" name="tb_content" id="tb_content" placeholder="내용을 입력해 주세요" ></textarea>
											</div>
							
										</form>
							
										<div >
											<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="btnSave()">저장</button>
											<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="btnList()">목록</button>
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

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                         <span>Copyright 2023. solinsystem. All Rights Reserved.</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">logout 하시겠어요 ?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                <div class="modal-body">logout시 메인 페이지로 이동합니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/logout.do">Logout</a>
                </div>
            </div>
        </div>
    </div>

   
	<script type="text/javascript" charset="UTF-8">

	//목록으로 돌아가기
	function btnList(){
			location.href='/admin/notice.do';	
	}
	
	//저장 버튼을 눌렀을때 
	function btnSave(){
		if (document.getElementById("tb_title").value == '') {
	        alert("게시물 제목을 입력해주십시오.");
	        return false;
	    }
		if (document.getElementById("tb_writer").value == '') {
	        alert("작성자 이름을 입력해주십시오.");
	        return false;
	    }
		if (document.getElementById("tb_content").value == '') {
	        alert("게시물 내용을 입력해주십시오.");
	        return false;
	    }
		 document.getElementById('WriteForm').submit();
		 alert('게시글이 작성되었습니다.');
		 
		 return true;
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