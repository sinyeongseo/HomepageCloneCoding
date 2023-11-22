<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>admin dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="${path}/resources/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<style type="text/css">
		.card-body {
			height : 50%;
		}
		 .custom-shadow {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
		
	
	</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
			  <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">
				 <div class="logo-container" style="display: flex; align-items: center;">
				        <a href="/admin/index.do"><img src="${path}/resources/img/solinsystem-logo.png" alt="로고 이미지" class="logo" style="width:40%"></a>
				 </div>
				 </nav>
            <!-- Main Content -->
            <div id="content">
				
                <!-- End of Topbar -->
				<br>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                
					<div id="pdfDiv">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">DashBoard</h1>
                        <form action="/admin/dashboard.do">
						  <label for="years"><span style="color: blue; font-size:1.5em;">${selectedYear}</span> 년도</label><br>
						  <select name="years" id="years">
						        <option value="2023" ${selectedYear == '2023' ? 'selected' : ''}>2023</option>
					            <option value="2022" ${selectedYear == '2022' ? 'selected' : ''}>2022</option>
					            <option value="2021" ${selectedYear == '2021' ? 'selected' : ''}>2021</option>
					            <option value="2020" ${selectedYear == '2020' ? 'selected' : ''}>2020</option>
					            <option value="2019" ${selectedYear == '2019' ? 'selected' : ''}>2019</option>
					            <option value="2018" ${selectedYear == '2018' ? 'selected' : ''}>2018</option>
					            <option value="2017" ${selectedYear == '2017' ? 'selected' : ''}>2017</option>
					            <option value="2016" ${selectedYear == '2016' ? 'selected' : ''}>2016</option>
						  </select>
						  <input type="submit" value="조회" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" />
						</form>
                        <button type="button" id="savePdf" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Report 생성</button>
                    </div>

					
                    <!-- Content Row -->

                    <div class="row">
						  <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                               	총 회원수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${TotalMemCount}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                	총 게시글 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${TotalNotCount}개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">문의 체크률
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${TotalConCount}%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: ${TotalConCount}%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                	총 댓글 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${TotalComCount}개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    

                   <!-- Content Row -->
                       <!-- Area Chart -->
                       <div class="col-xl-8 col-lg-7">
                           <div class="card shadow mb-4">
                               <!-- Card Header - Dropdown -->
                               <div
                                   class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                   <h6 class="m-0 font-weight-bold text-primary">월별 게시판 개수</h6>
                               </div>
                               <!-- Card Body -->
                               <div class="card-body">
                                    <div class="chart-area" id="NoticeChart" data-jan-count="${JanCount}" data-feb-count="${FebCount}" 
                                    data-mar-count="${MarCount}"  data-apr-count="${AprCount}" data-may-count="${MayCount}" 
                                    data-jun-count="${JunCount}"  data-jul-count="${JulCount}" data-aug-count="${AugCount}" data-sep-count="${SepCount}"
                                       data-oct-count="${OctCount}" data-nov-count="${NovCount}" data-dec-count="${DecCount}" >
							        <canvas></canvas>
							    </div>
                               </div>
                           </div>
                       </div>

                       <!-- Pie Chart -->
                       <div class="col-xl-4 col-lg-5">
                           <div class="card shadow mb-4">
                               <!-- Card Header - Dropdown -->
                               <div
                                   class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                   <h6 class="m-0 font-weight-bold text-primary">지원 문의 회원 | 비회원 비율</h6>
                               </div>
                               <!-- Card Body -->
                               <div class="card-body"> 
                               	
                               	<div class="chart-pie pt-4 pb-2" id="ContactChart" data-mem-count="${MemCount}" data-no-count="${NoCount}"  >
							        <canvas></canvas>
							    </div>
                                   
                                   <div class="mt-4 text-center small">
                                       <span class="mr-2">
                                           <i class="fas fa-circle text-primary"></i> 회원
                                       </span>
                                       <span class="mr-2">
                                           <i class="fas fa-circle text-success"></i> 비회원
                                       </span>
                                  
                                   </div>
                               </div>
                           </div>
                       </div>
                   
                        </div>
  							 <!-- Bar Chart -->
                             <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 회원 유입수</h6>
                                </div>
                                 <div class="card-body">
                                	<div class="chart-bar" id="memberChart" data-mjan-count="${mJanCount}" data-mfeb-count="${mFebCount}" 
                                     data-mmar-count="${mMarCount}"  data-mapr-count="${mAprCount}" data-mmay-count="${mMayCount}" 
                                     data-mjun-count="${mJunCount}"  data-mjul-count="${mJulCount}" data-maug-count="${mAugCount}" data-msep-count="${mSepCount}"
                                        data-moct-count="${mOctCount}" data-mnov-count="${mNovCount}" data-mdec-count="${mDecCount}">
								        <canvas></canvas>
								    </div>
                                </div>
                            </div>
					</div>
                </div>
                <!-- /.container-fluid -->
				</div>
        </div></div>
            <!-- End of Main Content -->
			<hr>
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright 2023. solinsystem. All Rights Reserved.</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

   

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
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${path}/resources/js/jquery.min.js"></script>
    <script src="${path}/resources/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/resources/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${path}/resources/js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${path}/resources/js/chart-notice-demo.js"></script>
    <script src="${path}/resources/js/chart-contact-demo.js"></script>
	<script src="${path}/resources/js/chart-member-demo.js"></script>
	<script src="${path}/resources/js/html2canvas.js"></script>
	<script src="${path}/resources/js/jspdf.min.js"></script>
	
	<script>
	$(document).ready(function () {
	    $('#savePdf').click(function () {
	        html2canvas($('#pdfDiv')[0]).then(function (canvas) {
	            var imgData = canvas.toDataURL('image/png');

	            // A4 용지의 가로 길이 설정
	            var a4Width = 210; // mm

	            var imgWidth = a4Width * 1.7;
	            var imgHeight = canvas.height * imgWidth / canvas.width;
	            var pageWidth = imgHeight * 1.414; // 출력 페이지 가로 길이 계산 A4 기준
	            var margin = 10; // 출력 페이지 여백설정
	            var doc = new jsPDF('l', 'mm'); // 'l'은 landscape(가로), 'p'는 portrait(세로)

	            var position = 0;

	            doc.addImage(imgData, 'PNG', margin, position, pageWidth, imgHeight);

	            // 파일 저장
	            doc.save('report.pdf');
	        });
	    });
	});




	</script>
</body>

</html>