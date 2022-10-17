<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 

<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dokdo&family=Gowun+Dodum&family=Gugi&family=Poor+Story&display=swap');
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} 

@font-face {
    font-family: 'AppleSDGothicNeo';
    src: url('/md/resources/font/apple/AppleSDGothicNeoUL.ttf') format('truetype');
}

ul, li{

list-style:none;
}
#content{
width:100vw;
height:80vh;

display: flex;

}
#side_menu{
width:13vw;
height:80vh;
border-radius:0 7px 7px 0 ;

background-color:#6667AB;
}
#center_menu{
width:70vw;
height:80vh;
border: 1px solid blue;

}
#right_menu{
width:20vw;
height:80vh;

}
#test{
width: 100px;
height: 100px;
border: 1px solid red;
}
#menu{
width:100%;
margin:0;
padding:0;

border-top:1px solid #ffffff6e;;
}
#menu li {
    text-align: center;
    width: 100%;
    height: 8%;
    color: white;
    border-bottom: 1px solid #ffffff6e;;
    cursor: pointer;
    padding-top: 10px;

	font-weight:100;

	font-size:15px;
	/* font-family: 'Gowun Dodum', sans-serif;} */
	
	font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
	
}
#menu li:hover{
background-color:#fff;
color:#6667AB;

}
#right_menu{
}
#menu-top{
height:8%;
display:flex;
color:#fff;
margin-top:77px;
font-size:14px;
margin-left:-8px;

}
#menu-top li{
font-size:19px;
}
#menu-top li:nth-child(2){
width:100%;
height:10%;
margin: 0 auto;
margin-top:5px;
margin-left:20px;
font-family: 'GangwonEdu_OTFBoldA';
}
#menu-top li:nth-child(1){

font-size:13px;
}


</style>
	<title>마카데미아</title>
	
	<%@include file="/resources/css/common/common.css" %>
	
</head>
<body>
	
	
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		
		<div id="content">
		
			<div id="side_menu">
			<ul id="menu-top">
			<li> <i class="fa-solid fa-list-check fa-2x"></i></li>
                <li class="">업무 관리</li>
			</ul>
			<ul id="menu">
				
			<li>나의 일정</li>
			<li>일정 추가</li>
			<li>일정관리</li>
			<li>일정관리</li>
			</ul>
				
			</div>
			<div id="center_menu">
			

			</div>
			<div id="right_menu"></div>
		</div>	
			
		

</body>
</html>