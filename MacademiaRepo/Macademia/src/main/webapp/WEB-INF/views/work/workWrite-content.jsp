<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    body{
     font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    h3{
    margin: 15px 0 0	;
    font-weight:900;
    }
    a{
    	text-decoration:none;
    }
    a:hover{
    text-decoration:none;
    }
  
    #work {
    margin: 0 auto;
  
    width:1000px;
    height:300px;
    border:1px solid #6667AB;
    margin-top:30px;
    }
    
    #my_work{
    	width:100%;
    	height:100%;
    	
    }
    
     th{
    background-color:#6667AB;
    color: #fff;
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    text-align: center;
    }
    td{
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    text-align: center;
    border-bottom: solid 1px #0000001a;
    }
    #page-area{
    margin:20px 0 0 350px;
    }
    #page{
    display:flex;
    
    }
    #page li{
    width:25px;
    height:25px;
    text-align:center;
    color:#fff;
    border-radius:5px;
    margin-left:5px;
    
    background-color:#6667AB;
    }
    #title{
    width:567px;
    height:30px;
    }
    .text{
    margin-top:-15px;
     border-radius:5px;
      border:2px solid #6667AB;
      font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    input[type=file]::file-selector-button{
    background-color:#6667AB;
    color:#fff;
    border:none;
    border-radius:5px;
    }
    #date{
    margin-top:-15px;}
    
    h5{
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    font-weight:800;
    }
    #work_middle{
    display:flex;
    height:265px;
    width:100%;
    margin-top:20px;
    }
    #work_left{
    
    width:250px;
    
    height:300px;
    }
    #work_right{
    
    height:300px;
     width:400px;
    }
   
    
    #center-ment{
    border-right:2px solid black;
    }
    
    .line{
    border-left:
    2px solid black;
    height:
    50px;
    
    
    }
    .line *, .line input{
    margin-left:15px;
    }
    
    textarea{
    resize:none;
    border-radius:5px;
      border:2px solid #6667AB;
    }
    #write{
    float:right;
    color:#fff;
    background-color:#6667AB;
    border:none;
    border-radius:5px;
    margin-right: 390px;
    margin-top: -23px;
    
    }
    
    .modal-content{
 width:700px;
 height:680px;
 margin-left:-40px;
 }
 #m_title{
 margin-left:-570px;
 font-size:26px;
 	
 }
 .modal-header{
	border-bottom: 1px solid #6667AB;
 }
 .modal-footer{
	border-top: 1px solid #6667AB;
 }
 .btn-default{
	background-color: #6667AB;
	color:#fff
 }

 #modal-wrap{
 border: 1px solid red;
 height: 300px;
 width:300px;
 
 }
 #select_box{
 width:260px;
 height:370px;
 border: 3px solid #6667AB;
 border-radius: 5px;
 
 }
 #select_top{
 margin-left:-38px;
 height: 28px;
 border: 3px solid #6667AB;
 border-radius: 5px;
 }
 a{
	color:#6667AB;
	cursor:pointer;
 }
 #select_right{
	width:260px;
	height:370px;
	border: 3px solid #6667AB;
 border-radius: 5px;
 margin-top: 47px;
 }
 #slave{
 border: 1px solid #6667AB;
 width: 200px;
 height:27px;
 border-radius:5px;
 line-height:25px;
 }
 #userName{
 width:200px;
 }
    </style>
    
<div id="center_menu">
	<h3>업무 요청</h3>
	<hr>
	<div id="work_top">
		<h5>업무 요청 제목</h5> <input id="write" type="submit" value="업무요청하기">
		<br>
		<input class="text"type="text" id="title"name="wTitle">
	</div>
	<div id="work_middle">
		<div id="work_left">
		<div class="line">
			<h5>등록자</h5>
			<br>
			<input type="text" class="text" id="userName"name="userName" readonly value="${loginMember.name}">
		</div>
		
			<br>
			<br>
			<div class="line">
			<h5>담당자</h5>
			<a data-toggle="modal" href="#myModal" id="plus"><h6><i class="fa-solid fa-plus"></i> 추가/변경</h6></a>
				<span id="slaveOne"><h6 id="slave"></h6></span>
			</div>
			
			<br>
			<br>
			
			
		</div>
		
		<div id="work_right">
		<div class="line">
		<h5 >등록일</h5>
			<br>
			<h6 id="date">자동 등록</h6>
		
		</div>
			
			
			<br>
			<br>
			<div class="line">
			<h5 id="type">업무 종류</h5>
			<select name="select_work" id="select_work">
				<option vlaue="문서작성">문서작성</option>
				<option vlaue="업무의뢰">업무의뢰</option>
				<option vlaue="설문조사">설문조사</option>
				<option vlaue="인원조사">인원조사</option>
				<option vlaue="기타">기타</option>
			</select>
			</div>
			
			
			<br>
			<br>
			
			<div class="line">
			<h5>요청 기한</h5>
			<input type="date"  id="dead_line">
			
			</div>
			
		</div>
		
	</div>
	<div id="work_bottom">
		<h5>업무 내용</h5>
		<textarea rows="10" cols="100" id="workContent"></textarea>
		
		</div>
		</div>
		
					
		
				
				
			
			</div>
			
						
					<!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
        <h6 id="m_title">업무 요청 지정</h4>
	
        </div>
        <div class="modal-body w-100">

			<div class="modal-wrap d-inline-flex w-100">
				<div class="w-50">
		          <select id="select_top">
						<option value="0">전체</option>
						<option value="1">대표이사</option>
						<option value="2">부원장</option>
						<option value="3">운영기획부</option>
						<option value="4">교육훈련부</option>
						<option value="5">취업지원부</option>
						<option value="6">마케팅부</option>
						<option value="7">행정팀</option>
						<option value="8">재정팀</option>
						<option value="9">시설지원팀</option>
						<option value="10">교육1팀</option>
						<option value="11">교육2팀</option>
						<option value="12">교육지원팀</option>
						<option value="13">취업팀</option>
						<option value="14">상담팀</option>
						<option value="15">홍보팀</option>
						<option value="16">대외협력팀</option>
					</select> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
					
					<br>
					<br> 
					<select multiple id="select_box">
						<c:forEach items="${memberList}" var="x">
							<option value="${x.no}" }>${x.name} (${x.deptName} - ${x.positionName})</option>
						</c:forEach>
					</select>
				</div>
				<div class="w-25 d-flex flex-column justify-content-center align-items-center">
					<a id="addUser" class="fe-arrow-right-square">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
						  </svg></a>
						  <br>
					<a id="deleteUser" class="bi bi-arrow-left-circle"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
					  </svg></a>
				</div>
				<div class="w-50">
					<select multiple id="select_right">


					</select>
				</div>
			</div>

        </div>


        <div class="modal-footer">
		  <button type="button"  id="select_complete" data-dismiss="modal">선택완료</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

			<script>
			$('option[name=all]').attr('value', '0');
			$('#plus').on('click', function(){
				
				$('#select_right *').remove();
			})
			
			$('#select_top').on('change', function(){
				let deptCode = $('#select_top option:selected').val();
				
				console.log(deptCode)
				$.ajax({
					url:"/md/work/deptList",
					mehod : "post",
					data :{dept : deptCode },
					dataType: 'json',
					success: function(data){
						console.log("성공")
						
						$('#select_box option').remove();
						 let str;
						$.each(data, function(i){
							str += '<option value="' + data[i].no +'">' + data[i].name+' ('+data[i].deptName +' - ' + data[i].positionName + ')</option>'
							 
						}) 
						$('#select_box').append(str);
						
					}
					,error: function(data){
					    	console.log("실패");
					    	console.log(data)
					    }
				})

				})
				
				
				$('#addUser').on('click', function(){
	var userCode = $('#select_box option:selected').val();
	let userOption = $('#select_box option[value=' + userCode + ' ]')[0].outerHTML;

	$('#select_right').append(userOption)
})

$("#deleteUser").on('click',function(){
	let userCode = $('#select_right option:selected').val();
	let userOption = $('#select_right option[value=' + userCode+']');

	$('#select_right option[value='+userCode+']').remove();


})
$('#select_complete').on('click',function(){
		console.log("이거 클릭함 ㅋ")
		var userCode = $('#select_box option:selected').val();
		$('#slave').html($('#select_box option[value=' + userCode + ' ]')[0].outerHTML)
			})

$('#write').on('click',function(){
	let workUserCode = $('#select_right option').val();
	let selectWork = $('#select_work').val();
	let title = $('#title').val();
	let deadLine= $('#dead_line').val();
	let content = $('#workContent').val();
	console.log(content);
	
	result = confirm("업무를 요청 하시겠습니까?")
	if(result==1){
		if(workUserCode == null){
			alert("업무 담당자를 지정해주세요")
		}else if(selectWork == null){
			alert("업무 타입을 지정해주세요")
		}else if(title == null || title==""){
			alert('업무 제목을 입력해주세요')
		}else if(deadLine == null || deadLine=="연도-월-일"){
			alert('업무 기한을 지정해주세요')
		}else if(content == null || content==""){
			alert("업무 내용을 입력해주세요")
		}else {
			$.ajax({
				url:"/md/work/workWrite",
				method : "post",
				data :{wNo : workUserCode,
						select: selectWork,
						title : title,
						deadLine :deadLine,
						content : content
				},
				dataType: 'json',
				success: function(data){
					console.log("성공")
					console.log(data)
					alert("요청이 완료 되었습니다")
				    	 window.location.href = "/md/work/bossList/1";
					
					
					
					
					
				}
				,error: function(data){
				    	console.log("실패");
				    	console.log(data)
				    }
			})
			
		}
		
		
		
		
	}

})

			</script>