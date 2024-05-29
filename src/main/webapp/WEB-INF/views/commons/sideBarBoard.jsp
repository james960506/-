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
      position: fixed;
      top: 50%;
      transform: translateY(-50%);
      left: 30px;
      height: 250px;
      width: 300px;
      padding-top: 50px;
      background-color: #fff9c4; 
      border-radius: 8px;
      border-right: 1px solid #dee2e6;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      font-size: 22px;
    }

    .sidebar a {
      color: #856404;
      text-decoration: none;
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
							<a class="nav-link active" href="list.go">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-text-fill" viewBox="0 0 16 16">
								  <path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353V2zM3.5 3h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1zm0 2.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1zm0 2.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1z"/>
								</svg>
	              				&nbsp; 커뮤니티 게시판  
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link active" href="moveToAttmList.at">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
							  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
							</svg>
	              				&nbsp; 갤러리 게시판
							</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
    </div>
</body>
</html>