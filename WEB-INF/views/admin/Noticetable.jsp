<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <title>게시판 내역</title>

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
		/* .postbtn #postbtn {
		    font-size: 15px; /* You can adjust the size as needed */
		  }
		#postbtn{
			width: 100px;
			height : 40px;
   			margin: 0 auto; /* 수평 가운데 정렬을 위한 설정 */
   			display: none; /*   a 태그를 블록 레벨 요소로 변경 */
		} 
		.page{
		  text-align: center;  // div 사이즈 영역 안에서의 center
		  width: 50%;}
		
		.pagination {
		     list-style: none;
		    display: flex; /* 이전, 페이지 버튼, 다음을 가로로 정렬 */
		    justify-content: center; /* 중앙 정렬 */
		    padding: 0;
		    margin-top: 20px;
		    position: relative; /* 이전과 같이 표시되도록 변경 */
		    /* bottom: 0; */ /* 이 부분을 주석 처리해 제거 */
		}

		.pagination li {
		    display: inline;
		    text-align: center;
		}
		
		.pagination a {
		    display: block;
		    font-size: 14px;
		    text-decoration: none;
		    padding: 5px 12px;
		    color: #96a0ad;
		    line-height: 1.5;
		}
		
		.pagination-arrow-left,
		.pagination-arrow-right {
		    margin: 0 15px;
		}
		
		.pagination a:hover {
		    color: #4e73df;
		}
		
		.pagination a.active {
		    cursor: default;
		    color: #ffffff;
		}
		
		.pagination a:active {
		  outline: none;}
		
		.modal .num {
		  margin-left: 3px;
		  padding: 0;
		  width: 30px;
		  height: 30px;
		  line-height: 30px;
		  -moz-border-radius: 100%;
		  -webkit-border-radius: 100%;
		  border-radius: 100%;}
		
		.modal .num:hover {
		  background-color:#4e73df;
		  color: #ffffff;}
		
		.modal .num.active, .modal .num:active {
		  background-color:#4e73df;
		  cursor: pointer;}
		
		.arrow-left {
		  width: 0;
		  height: 0;
		  border-top: 10px solid transparent;
		  border-bottom: 10px solid transparent;
		  border-right:10px solid blue; }
		  
		 #align{
		 	  margin: 10px;
			  width: 240px;
			  height: 50px;
			  margin: 0 auto; /* 수평 가운데 정렬을 위한 설정 */
		 }
		 .mb-4{
			width : 80%;
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
					   <!-- 로고 이미지 -->
				    <div class="logo-container" style="display: flex; align-items: center;">
				        <a href="/admin/index.do"><img src="${path}/resources/img/solinsystem-logo.png" alt="로고 이미지" class="logo" style="width:40%"></a>
				    </div>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
						
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>

                        <div class="topbar-divider d-none d-sm-block"></div>

                         <!-- Nav Item - User Information -->
                       
                    </ul>

                </nav>
                <!-- End of Topbar -->

                 <!-- Begin Page Content -->
               <div class="container-fluid">
				    <div><br>
				        <div class="d-flex justify-content-between align-items-center">
				            <div>
				                <a href="/admin/notice.do" style="text-decoration: none; color: inherit;">
				                    <h1 class="h3 mb-2 text-gray-800">게시판  리스트</h1>
				                </a>
				                <p id="loginment"></p>
				            </div>
				            <div class="postbtn">
				                <a href="/admin/noticewrite.do" class="btn btn-primary btn-xl text-uppercase" id="postbtn">공지사항 등록</a>
				            </div>
				        </div>
			
				    </div><br>

                    <!-- Page Heading -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Table List</h6>
	                         
		                    <form action="/admin/ntsearchService.do" style="width: 20%; float: right;" id="searchForm">
			                    <div>
			                        <div class="input-group" id="search">
			                            <input type="text" class="form-control bg-light border-1 small" placeholder="Search by Title..."
			                                aria-label="Search" aria-describedby="basic-addon2" name="tb_title">
			                            <div class="input-group-append">
			                                <button class="btn btn-primary" type="button" onclick="searchservice()">
			                                  	  🔍
			                                </button>
			                            </div>
			                        </div>
			                    </div>
		                    </form>
                        </div><br>
                         
                        <div class="card-body">
                            <div class="table-responsive">
                            	 
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                          <th>글 번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>날짜</th>
                                            <th>댓글 수 </th>
                                            <th>조회수</th>
                                            <th>추천수</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Number</th>
                                            <th>Title</th>
                                            <th>Writer</th>
                                            <th>Date</th>
                                            <th>Comment</th>
                                            <th>View</th>
                                            <th>Like</th>
                                        </tr>
                                    </tfoot>
                                     <c:forEach var="row" items="${list}">
									    <tbody>
									         <tr <c:if test="${row.tb_writer eq 'admin'}">style="background-color: rgba(167, 238, 255, 0.3);"</c:if>>
								                <td width=5%>${row.tb_num}</td>
								                <td width=40%>
									                <!-- mb_role이 admin인 경우 이미지 추가 -->
									                <c:if test="${row.tb_writer eq 'admin'}">
									                    <img src="${path}/resources/img/contact.png" alt="Admin Image" style="width: 20px; margin-right: 5px;">
									                </c:if>
									                <a href="/admin/ntview.do?tb_num=${row.tb_num}&tb_visit=${row.tb_visit}">${row.tb_title}</a>
									            </td>
								                <td>${row.tb_writer}</td>
								                <td width=20%>${row.tb_postdate}</td>        
								                <td width=5%>${row.tb_comment}</td>                    
								                <td width=5%>${row.tb_visit}</td>
								                <td width=5%>${row.tb_like}</td>
								            </tr>
									    </tbody>
									</c:forEach>

                                   
                                </table>
                              <!-- /.container-fluid -->
                              <div class="page">
		                         <ul class="pagination modal">
		                             <c:if test="${pageMaker.prev}">
		                                 <li>
		                                     <a href='<c:url value="/admin/notice.do?page=${pageMaker.startPage - 1}" />' class="arrow left">이전</a>
		                                 </li>
		                             </c:if>
		                             <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
		                                 <li>
		                                     <a href='<c:url value="/admin/notice.do?page=${pageNum}" />' class="num" onclick="pagenum(${pageNum})">${pageNum}</a>
		                                 </li>
		                             </c:forEach>
		                             <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		                                 <li>
		                                     <a href='<c:url value="/admin/notice.do?page=${pageMaker.endPage + 1}" />' class="arrow right">다음</a>
		                                 </li>
		                             </c:if>
		                         </ul>
		                     </div>
                           </div>
                       </div>
                   </div>
               </div>
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
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	
   
	

<!-- 다른 HTML 코드... -->

	<script type="text/javascript">
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
	
	    function searchservice() {
	        document.getElementById('searchForm').submit();
	    }
	</script>

</body>

</html>