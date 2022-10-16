<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	    <%@ include file="/resources/css/messenger/commonHeaderAside.css" %>

		main > form{
			margin-top : 50px;
			height: 100%;
			display: grid;
			grid-template-rows: 5% 5% 5% 35% 25% 25%;
		}
	
		.write-header-area{
			display: grid; grid-template-columns: 15% 70% 5%;
			justify-content: center;
		}

		#profile-img-wrap{
			display: grid;
			grid-template-rows: 80% 20%;
		}

		


    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>


    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
       

        <main>
            <form action="">
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">받는사람</span>
					<div class="form-control"><h5>쪽지번호로 가져온 이름</h5></div>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">참조인</span>
					<input type="text" class="form-control" >
					<a href="/md/messenger/note/recipient"> 검색하기 </a>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">제목</span>
					<input type="text" class="form-control" >
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">내용</span>
					<textarea class="form-control" name="" id="" cols="30" rows="10">
                        
                        
                        
                        
                        
                        
                        
                                                                                                                  원래있던내용가져오기
                    </textarea>
				</div>
			
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">파일첨부</span>
					<div id="profile-img-wrap" class="form-control">
						<img id="profile-img-thumb" src="" width="60%" height="100%">
						<input  type="file" name="profile">
					</div>
				</div>


				<!--  -->
				<div style="text-align: center; margin-top:50px;">
					<input  class="btn btn-primary" type="submit" value="전송">
					<button class="btn btn-primary" onclick="" >닫기</button>
				</div>

			</form>
        </main>


    </div>

</html>