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
		
	 
	</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					        
					             <input type="hidden" id="pktb_num" value="${NoticeContent.tb_num}">
					        </div>
					    </div>
					</div><br><br><br><br>
                    <!-- Page Heading -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><span id="tb_num" style='color:#4e73df;'>${NoticeContent.tb_num}</span>번  &nbsp;게시물 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                              <article>
									<div class="container" role="main">
											 <c:if test="${NoticeContent.tb_writer eq 'admin'}">
									              <img src="${path}/resources/img/contact.png" alt="Admin Image" style="width: 50px; margin-right: 5px;"><br><br>
									          </c:if>
											<div class="mb-3">
												<label for="title">제목</label>
												<div>${NoticeContent.tb_title}</div>
											</div>
							
											
											<div class="mb-3">
												<label for="reg_id">작성자</label>
												<div>${NoticeContent.tb_writer}</div>
											</div>
							
											
											<div class="mb-3">
												<label for="content">내용</label>
												<div>${NoticeContent.tb_content}</div>
											</div>
											<div class="mb-3">
												<label for="tag">작성날짜</label>
												<div>${NoticeContent.tb_postdate}</div>
											</div>

										<div class = "btn">
											
											<button type="button" class="btn btn-sm btn-primary" id="btnRemove" onclick="btnRemove()">삭제</button>
											<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="btnList()">목록</button>
										</div>
										
										
									</div>
								</article>
                         
                           <div class="card-header py-3">
								    <h6 class="m-0 font-weight-bold text-primary">Comment list:</h6><br>
								    <c:choose>
								        <c:when test="${empty CommentContent}">
								            <p>댓글이 없습니다.</p>
								        </c:when>
								        <c:otherwise>
								            <c:forEach items="${CommentContent}" var="comment">
								                <div style="display: flex; align-items: center;">
								                    <div style="flex: 1;">
								                        <label for="title">댓글 내역:</label>
								                        <c:out value="${comment.co_content}" />
								                        <br>
								                        <label for="title">댓글 작성자:</label>
								                        <c:out value="${comment.co_writer}" />
								                    </div>
								                    <form action="/admin/commentdelete.do"  method="post">
								                        <input type="hidden" name="co_no" value="${comment.co_no}" />
								                        <input type="hidden" name="tb_num" value="${NoticeContent.tb_num}" />
								                        <button class="btn btn-sm btn-primary" type="submit" value="삭제" >삭제</button>
								                    </form>
								                </div><hr>
								            </c:forEach>
								        </c:otherwise>
								    </c:choose>
									</div>
		                          </div>
		                      </div>
		                  </div>
					   </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
				
            </div>
            <!-- End of Main Content -->

  
   
	<script type="text/javascript" charset="UTF-8"> 		
	  $(document).ready(function() {
	        var message = "${message}"; // 컨트롤러에서 보낸 메시지
	        if (message && message.trim() !== "") {
	            // SweetAlert 라이브러리를 사용하여 알림창 띄우기
	            Swal.fire({
	                title: "알림",
	                text: message,
	                icon: "success", // 알림 아이콘 설정 (성공 아이콘)
	                confirmButtonText: "확인",
	            });
	        }
	    });
	  
	//목록으로 돌아가기
	function btnList(){
			location.href='/admin/notice.do';	
	}
	// 게시글 삭제
	function btnRemove() {
		let tb_num = document.getElementById("pktb_num").value;
	    location.href = '/admin/noticeremove.do?tb_num='+ tb_num; // URL 이동
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