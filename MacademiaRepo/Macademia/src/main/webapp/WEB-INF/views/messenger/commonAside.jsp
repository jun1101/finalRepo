<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 루트 경로 지정 -->
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- 제이쿼리 -->    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
<!-- 스위트 알랏 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

    
            <div id="side_menu">

			    <ul id="menu-top">
			        <li><i class="fa-solid fa-comments fa-2x"></i></li>
			        <li class="">메신저</li>
			    </ul>
			
			    <ul id="menu">
			        <a href="${root}/messenger/profile"><li>나의 프로필</li></a>
		            <a href="${root}/messenger/noteReceiveBox"><li>받은 쪽지함</li></a>
		            <a href="${root}/messenger/noteSendBox"><li>보낸 쪽지함</li></a>
		            <a href="${root}/messenger/imgFileBox"><li>파일 보관함</li></a>
		            <a href="${root}/messenger/notice/1"><li>공지 톡</li></a>
			    </ul>
				
				
			        
			</div>
