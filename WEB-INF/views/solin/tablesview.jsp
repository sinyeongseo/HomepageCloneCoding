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
      .btn-like{
         width:10%;
         float : right;
         margin : 0 auto;
         margin-right: 500px;
         font-size : 0.9em;
      }
      #likecount{
         color: #4e73df;
      }
      .mb-4{
         width : 50%;
         margin : 0 auto;
         height: 100%;
      }
      .m-0{
         margin : 0 auto;
      }
     .comment {
       margin : 0 auto;
       margin-bottom: 15px;
       padding: 10px;
       border: 1px solid #ccc;
       width : 80%;
     }
     .comment .comment-content {
       font-size: 14px;
     }
     .comment .comment-writer {
       font-weight: bold;
       font-size: 16px;
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

                         <!-- Nav Item - User Information -->
                        <!-- Nav Item - User Information -->
                  <li class="nav-item dropdown no-arrow" style="display: flex; align-items: center;">
                      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="mr-2 d-none d-lg-inline text-gray-600 small" id="userGreeting">${mb_id}님</span>
                          <img class="img-profile rounded-circle"  src="${mb_img}" onerror="this.src='${path}/resources/img/default.png'">
                      </a>
                      <!-- Dropdown - User Information -->
                      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                          aria-labelledby="userDropdown" id="userMenu">
                          <a class="dropdown-item" href="/mypage.do">
                              <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                              Profile
                          </a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="/logout.do" data-toggle="modal" data-target="#logoutModal">
                              <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                              Logout
                          </a>
                      </div>
                  </li>
                    </ul>

                </nav>
              
                 <!-- Begin Page Content -->
                <div class="container-fluid">
               <div><br>
                   <div class="d-flex justify-content-between align-items-center">
                       <div>
                           <h1 class="h3 mb-2 text-gray-800"><span id="tb_num" style='color:#4e73df;'>${tableContent.tb_num}</span>번  &nbsp;게시물 정보</h1>
                           <p  id="loginment">수정 및 삭제가 필요한 경우 등록시 지정한 비밀번호가 필요합니다</p>          
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
                           		 <c:if test="${tableContent.tb_writer eq 'admin'}">
						              <img src="${path}/resources/img/contact.png" alt="Admin Image" style="width: 50px; margin-right: 5px;"><br><br>
						          </c:if>
                                 <div class="mb-3">
                                    <label for="title">제목</label>
                                    <div>${tableContent.tb_title}</div>
                                 </div>
                     
                                 
                                 <div class="mb-3">
                                    <label for="reg_id">작성자</label>
                                    <div>${tableContent.tb_writer}</div>
                                 </div>
                     
                                 
                                 <div class="mb-3">
                                    <label for="content">내용</label>
                                    <div>${tableContent.tb_content}</div>
                                 </div>
                                 <div class="mb-3">
                                    <label for="tag">작성날짜</label>
                                    <div>${tableContent.tb_postdate}</div>
                                    <div style="display:none">${tablerole}</div>
                                 </div>
                                 	

                              <div class = "btn">
                                 <button type="button" class="btn btn-sm btn-primary" id="btnEdit" onclick="btnEdit()">수정</button>
                                 <button type="button" class="btn btn-sm btn-primary" id="btnRemove" onclick="btnRemove()">삭제</button>
                                 <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="btnList()">목록</button>
                              </div>
                              
                              <div class ="btn-like">
                                 <button type="button" id="like" onclick="btnLike()" style="border: none; background-color: transparent;">
                                     <img src="${path}/resources/img/buttonht.gif" style="width:30px"><br><span id="likecount">${tableContent.tb_like}</span>
                                 </button>
                              </div>
                           </div>
                        </article>      
                            </div><!-- table div -->
                        </div><!--  card- body -->
                     <div id="commentDiv">
	                <h6 class="m-0 font-weight-bold text-primary">&nbsp;&nbsp;&nbsp;&nbsp;Comment:</h6><br>
	                </div>
                    </div>
                  
               <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Leave a Comment:</h6>
                        </div>
                        <div class="card-body">
                        <form name="comment-form" action="/commentservice.do" method="post" autocomplete="off">
                     <div class="form-group">
                        <input type="hidden" id="co_writer" name="co_writer" value="${mb_id}" />
                        <input type="hidden" name="tb_num" value="${tableContent.tb_num}" />
                        <textarea name="co_content" class="form-control" rows="3"></textarea>
                     </div>
                     <button type="submit" class="btn btn-primary">comment</button>
                  </form>
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
   window.onload = function getCommentList() {
        // 서버로 요청을 보내는 URL을 지정합니다.
        const url = `/getCommentList.do?tb_num=${tableContent.tb_num}`;
        
		var tablerole = "${tablerole}";
        if(tablerole == "admin"){
        	 document.getElementById('btnEdit').style.display = 'none';
             document.getElementById('btnRemove').style.display = 'none';
        }
        
        // Fetch API를 사용하여 서버로 GET 요청을 보냅니다.
        fetch(url)
          .then(response => {
            if (!response.ok) {
              throw new Error('네트워크 오류');
            }
            return response.json(); // JSON 형식의 응답 데이터를 파싱합니다.
          })
          .then(data => {
            const commentDiv = document.getElementById('commentDiv');

            if (data == null || data.length === 0) {
              // 댓글이 없는 경우 메시지를 출력합니다.
              commentDiv.innerHTML = "&nbsp;&nbsp;&nbsp;아직 등록된 댓글이 없습니다.";
            } else {
              // 댓글을 출력합니다.
               data.forEach(comment => {
                   const div = document.createElement('div');
                   div.className = 'comment'; // CSS 클래스를 추가

                   const writerDiv = document.createElement('div');
                   writerDiv.className = 'comment-writer';
                   writerDiv.textContent = "작성자  : " + comment.co_writer;
                   div.appendChild(writerDiv);

                   const contentDiv = document.createElement('div');
                   contentDiv.className = 'comment-content';
                   contentDiv.textContent = "댓글 내용  -> " + comment.co_content;
                   div.appendChild(contentDiv);

                   commentDiv.appendChild(div);
               });

            }
          })
          .catch(error => {
            console.error('오류 발생:', error);
          });
      };

   
   document.addEventListener('DOMContentLoaded', function() {
       var userGreeting = document.getElementById('userGreeting');
       var userDropdown = document.getElementById('userDropdown');
       var userMenu = document.getElementById('userMenu');
         
       var mb_id = "<%= session.getAttribute("mb_id") %>"; // JSP에서 전달한 mb_id 값
       var co_writerInput = document.getElementById('co_writer');
       
       if (mb_id && mb_id.trim() !== "" && mb_id !== 'null') {
           userGreeting.innerText = mb_id + '님';
           
           // 로그인된 경우 드롭다운 메뉴 표시
           userDropdown.addEventListener('click', function() {
               userMenu.style.display = 'block';
           });
       } else {
           userGreeting.innerText = '비회원';
           co_writerInput.value = '비회원';
           // 비회원인 경우 드롭다운 메뉴 표시하지 않도록 이벤트 리스너 제거
           userDropdown.removeEventListener('click', function() {
               userMenu.style.display = 'block';
           });

           // JOIN 링크를 생성하여 드롭다운 메뉴에 추가
           var joinLink = document.createElement('a');
           joinLink.classList.add('dropdown-item');
           joinLink.setAttribute('href', '/join.do');
           joinLink.innerText = '회원가입 하러가기';
           
           // "MYPAGE" 및 "LOGOUT" 항목을 찾아서 숨깁니다.
           var myPageLink = userMenu.querySelector('a[href="/mypage.do"]');
           var logoutLink = userMenu.querySelector('a[href="/logout.do"]');

           if (myPageLink) {
               myPageLink.style.display = 'none';
           }
           if (logoutLink) {
               logoutLink.style.display = 'none';
           }

           userMenu.appendChild(joinLink);
       }
   });
   
   //목록으로 돌아가기
   function btnList(){
         location.href='/tables.do';   
   }
   
   // 게시글 삭제
   function btnRemove() {
       var tb_num = ${tableContent.tb_num}; // 해당 게시물의 tb_num 값을 가져옴
       var action = 'remove'; // 삭제 동작을 구분하는 매개변수 추가
       var url = '/tablepwck.do?tb_num=' + tb_num + '&action=' + action; // 매개변수를 추가한 URL 생성
       location.href = url; // URL 이동
      
   }

   // 게시글 수정
   function btnEdit() {
       var tb_num = ${tableContent.tb_num}; // 해당 게시물의 tb_num 값을 가져옴
       var action = 'edit'; // 수정 동작을 구분하는 매개변수 추가
       var url = '/tablepwck.do?tb_num=' + tb_num + '&action=' + action; // 매개변수를 추가한 URL 생성
       location.href = url; // URL 이동
   }
   
   function btnLike(){
      var tb_num = ${tableContent.tb_num};
      var tb_like = ${tableContent.tb_like};
      var url = '/likeservice.do?tb_like=' + tb_like+ '&tb_num=' + tb_num;
      location.href = url;
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