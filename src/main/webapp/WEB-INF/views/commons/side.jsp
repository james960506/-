<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@charset "UTF-8";

    /* 공통 스타일 */
    .header-footer {
      background-color: rgb(255, 249, 204);
      color: white;
      height: 180px;
    }

    .header-footer .logo {
      margin-top: -50px;
      float: left;
      height: 300px;
      width: 600px;
      padding-left: 150px;
    }

    .header-footer .logo a {
      color: white;
      text-decoration: none;
      font-weight: normal;
      font-family: 'Nanum Myeongjo', serif;
    }

    .header-footer .logo a span {
      position: absolute;
      top: 80px;
      width: 300px;
      font-weight: bold;
      font-size: 1em;
    }

    .header-footer nav {
      padding-top: 50px;
      display: flex;
      justify-content: center;
      margin-bottom: 2em;
    }

    .header-footer nav a {
      text-decoration: none;
      color: black;
      margin: 0 1em;
      font-size: 1.5em;
      font-weight: bold;
      font-family: 'Nanum Myeongjo', serif;
    }

    .header-footer #login,
    .header-footer #manager {
      list-style: none;
      padding: 20px;
      position: absolute;
      color: black;
      font-size: 1em;
      top: 50px;
    }

    .header-footer #login a,
    .header-footer #manager a {
      text-decoration: none;
      color: black;
      font-family: 'Nanum Myeongjo', serif;
    }

    /* 사이드바 스타일 */
    .sidebar {
      text-align:left;
      position: fixed;
      top: 50%;
      transform: translateY(-50%);
      left: 30px;
      height: 425px;
      width: 250px;
      padding-top: 10px;
      background-color: #fff9c4; 
      border-radius: 8px;
      border-right: 1px solid #dee2e6;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .sidebar a {
      color: #856404;
      text-decoration: none;
      font-size: 22px;
      padding: 8px;
      display: block;
      transition: background-color 0.3s;
      margin-left: 12px;
      background: #fff9c4;
      border-radius: 15px;
    }

    .sidebar a:hover {
      background-color: #ffd700; /* 더 옅은 노란색으로 변경 */
      border-radius: 15px;
      cursor: pointer;
    }

    .sidebar a:hover,
    .sidebar a:visited {
      border-radius: 15px;
      text-decoration: none;
    }

    .content {
      margin-left: 184px;
    }

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
	   		<!-- Sidebar -->
			<nav class="col-md-2 d-none d-md-block sidebar">
				<div class="sidebar-sticky">
			     <!-- Sidebar 내용 -->
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link active" href="myRequest.do">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
								  <path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5z"/>
								</svg>
	              				&nbsp; 상담 예약 내역
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link active" href="selectMyResList.re">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
							  <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
							  <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
							</svg>
	              				&nbsp; 호텔 예약 내역
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="myWriter.go">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-heading" viewBox="0 0 16 16">
							  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
							  <path d="M3 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0-5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-1z"/>
							</svg>
	              				&nbsp; 내가 작성한 글
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="myInfo.me">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
							</svg>
								&nbsp; 내 정보 수정
							</a>
						</li>
						<!-- 추가적인 메뉴 항목들 -->
					</ul>
				</div>
			</nav>
		</div>
    </div>
</body>
</html>