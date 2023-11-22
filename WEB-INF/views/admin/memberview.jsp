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
		 table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
	 
  
	</style>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
					            
					              <input type="hidden" id="pkmb_id" value="${MemberContent.mb_id}">
					        </div>
					    </div>
					</div><br><br><br><br>
                    <!-- Page Heading -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><span id="tb_num" style='color:#4e73df;'>${MemberContent.mb_id}</span>님   회원 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <article>
									<div class="container" role="main">
											<div class="mb-3" style="float: left; margin: 80px; height:400px ">
											 	<label for="tag">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 프로필</label><br>
										        <!-- 이미지를 오른쪽으로 정렬하는 스타일 추가 -->
										        <img src="${MemberContent.mb_img}" alt="프로필 이미지" width="150" height="150"  onerror="this.src='${path}/resources/img/default.png'">
										    </div>
										    <br><br>
											 <div class="col-md-8">
										        <div class="mb-3">
										            <label for="title">회원 id</label>
										            <div>${MemberContent.mb_id}</div>
										        </div>
										        <div class="mb-3">
										            <label for="title">회원 이름</label>
										            <div>${MemberContent.mb_name}</div>
										        </div>
										        <div class="mb-3">
										            <label for="reg_id">회원 mail</label>
										            <div>${MemberContent.mb_mail}</div>
										        </div>
										        <div class="mb-3">
										            <label for="content">회원 전화번호</label>
										            <div>${MemberContent.mb_phone}</div>
										        </div>
										        <div class="mb-3">
										            <label for="tag">회원가입 날짜</label>
										            <div>${MemberContent.mb_regdate}</div>
										        </div>
										    </div>
											
										<div class = "btn">
											
											<button type="button" class="btn btn-sm btn-primary" id="btnRemove" onclick="btnRemove()">삭제</button>
											<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="btnList()">목록</button>
										</div>
									</div>
								</article>
                            </div>
                        </div>
                    </div>
					<br><br><br>
					 <div class="card shadow mb-4">
					<div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><span id="tb_num" style='color:#4e73df;'>${MemberContent.mb_id}</span>님   게시글목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <article>
									<div class="container" role="main">
									 <h7 class="m-0 font-weight-bold text-primary"><span id="tb_num" style='color:#4e73df;'>게시글</span></h7>
										<table border="1">
										    <thead>
										        <tr>
										            <th width="5%">번호</th>
										            <th width="20%">게시글 제목</th>
										            <th width="50%">게시글 내용</th>
										            <th width="25%">게시글 등록일</th>
										        </tr>
										    </thead>
										    <tbody>
										    	 <c:if test="${empty TableContent}">
										            <tr>
										                <td colspan="4">등록한 게시글이 없습니다.</td>
										            </tr>
										        </c:if>
										        <c:forEach var="table" items="${TableContent}" varStatus="loop">
										            <tr>
										                <td>${loop.index + 1}</td>
										                <td>${table.tb_title}</td>
										                <td>${table.tb_content}</td>
										                <td>${table.tb_postdate}</td>
										            </tr>
										        </c:forEach>
										    </tbody>
										</table>
										<br><br>
										<h7 class="m-0 font-weight-bold text-primary"><span id="tb_num" style='color:#4e73df;'>댓글</span></h7>
										<table border="1">
									    <thead>
									        <tr>
									            <th width="10%"> 번호</th>
									            <th width="20%">테이블 번호</th>
									            <th width="80%">댓글 내용</th>
									        </tr>
									    </thead>
									    <tbody>
									    	 <c:if test="${empty CommentContent}">
										            <tr>
										                <td colspan="4">등록한 댓글이 없습니다.</td>
										            </tr>
										        </c:if>
									        <c:forEach var="comment" items="${CommentContent}" varStatus="loop">
									            <tr>
									                <td>${loop.index + 1}</td>
									                <td>${comment.tb_num}</td>
									                <td>${comment.co_content}</td>
									            </tr>
									        </c:forEach>
									    </tbody>
									</table>

									</div>
								</article>
                            </div>
                        </div>
                    </div>
					<br><br><br>
					 <div class="card shadow mb-4">
					<div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><span id="tb_num" style='color:#4e73df;'>${MemberContent.mb_id}</span>님   문의등록 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <article>
									<div class="container" role="main">
										<h7 class="m-0 font-weight-bold text-primary"><span id="tb_num" style='color:#4e73df;'>문의</span></h7>
										<table border="1">
										    <thead>
										        <tr>
										            <th width="10%">번호</th>
										            <th width="50%">문의 내용</th>
										            <th width="10%">체크 여부</th>
										        </tr>
										    </thead>
										    <tbody>
										    	 <c:if test="${empty ContactContent}">
										            <tr>
										                <td colspan="4">등록한 문의가 없습니다.</td>
										            </tr>
										        </c:if>
										        <c:forEach var="contact" items="${ContactContent}" varStatus="loop">
										            <tr>
										                <td>${loop.index + 1}</td>
										                <td>${contact.mb_message}</td>
										                <td <c:if test="${!contact.ct_check}">style="color: red;"</c:if>>${contact.ct_check}</td>
										            </tr>
										        </c:forEach>
										    </tbody>
										</table>

									</div>
								</article>
                            </div>
                        </div>
                    </div>
					<br><br><br>
                </div>
                <!-- /.container-fluid -->
				
            </div>
            <!-- End of Main Content -->

         

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
			location.href='/admin/member.do';	
	}
	
	// 게시글 삭제
	function btnRemove() {
	    let mb_id = document.getElementById("pkmb_id").value;
	    location.href = '/admin/memberremove.do?mb_id=' + mb_id; // URL 이동
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