<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	
	    <%@ include file="/resources/css/messenger/commonHeaderAside.css" %>


		main{
			display: grid;
			grid-template-rows: 10% 40% 20%;
		}

		#profile-main-content{
			display: grid;
			grid-template-columns: 1.5fr 1.5fr 1fr;
			grid-template-rows: 1fr 1fr 1fr;
			border: 3px solid #1315a6;
			border-radius: 15px;
			align-items: center;
			text-align: center;
		}

		#main-content-img-wrap{
			grid-row: span 3;
			height: 100%;
			padding:10px 20px;
			border: 1px solid black;
		}

		
		#profile-main-content>div>button{
			width: 80%;
		}


		#profile-bottom-content{
			display: grid;
			grid-template-rows: repeat(3, 1fr);
			align-items: center;
			padding-left: 50px;
		}

    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>
            
			<div style="margin-top: 20px;"><h2>기본 프로필 관리</h2></div>

			<div id="profile-main-content">
				<div id="main-content-img-wrap" >
					<img src="" alt="" width="100%" height="90%" style="border:1px solid black">
					<span style="height: 10%;">파일명</span>
				</div>
				<div>직원명</div>
				<div>3-공백</div>
				<div style="grid-row: span 2;">자기소개글</div>
				<div><button onclick="" class="btn btn-primary"><a href="/md/messenger/profile/edit" style="color: white;">편집</a></button></div>
				<div>6-공백</div>
			</div>

			<div id="profile-bottom-content">
				<div>부서명-직책</div>
				<div>개인정보들</div>
				<div>개인정보들</div>
			</div>
			
        </main>


    </div>

</html>