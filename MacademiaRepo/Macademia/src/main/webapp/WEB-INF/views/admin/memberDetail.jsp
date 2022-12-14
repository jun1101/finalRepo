<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Member Detail</title>
<style>
	.profile-photo img{width: 150px; height: 150px; margin-top: 30px; margin-left: 30px;}
	.member-info{color: black; font-size: medium;}
	.col-form-label{font-weight: bolder; width: 150px;}
	.form-col{padding-left: 15px;}
	.member-info input[type=date], .member-info input[type=text], .member-info select{display: inline;  width: 150px;}
</style>
    
    <!-- flatpicker css  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<body>

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">	

		<c:import url="../common/menubar_admin.jsp"/>
    
        <!--**********************************
            Content body start
        ***********************************-->
 		<div class="content-body">
            <div class="container-fluid">
             	<div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                       <b style="color: black; font-size: large;">사원 상세</b>
                   	</div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">조직 관리</li>
                            <li class="breadcrumb-item active">사원 상세</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                           		<div class="member-info">
                                    <form action="${root}/admin/mupdate.ad" method="post">
                                    	<div class="email-left-box px-0 mb-5">
		                                	<div class="profile-photo">
		                                    	<c:if test="${ member.imgChangeName eq null }">
				                                	<img src="${root}/resources/assets/images/empty-profile.png" alt="profile-image">
				                               	</c:if>
				                               	<c:if test="${ member.imgChangeName ne null }">
				                                 	<img src="${root}/resources/uploadFiles/${ member.imgChangeName }" alt="profile-image">
				                               	</c:if>
				                       		</div>
		                               	</div>	
		                               	<br>
		                               	<div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
			                               	<label class="col-form-label">이름</label>${ member.name }
			                               	<br>
			                               	<label class="col-form-label">아이디</label>${ member.email }
			                               	<input type="hidden" name="email" value="${ member.email }">
											<br>
			                               	<label class="col-form-label">개인 이메일</label>${ member.privateEmail }
			                               	<br>
			                               	<label class="col-form-label">전화번호</label>${ member.phone }
			                               	<br>
			                               	<label class="col-form-label">주소</label>${ member.address }
			                               	<br>
			                               	<label class="col-form-label">상세주소</label>${ member.address2 }
			                               	<br>
			                               	<div class="form-group row">
	                                             <label class="form-col col-form-label">자기소개</label>
	                                             <div class="col-lg-6">
	                                                 <textarea rows="3" class="form-control" style="resize: none; width: 400px;" disabled>${ member.profile }</textarea>
	                                             </div>
	                                        </div>
	                                        <label class="col-form-label">부서</label>
	                                        <select class="form-control" name="deptNo">
	                                        	<option value="">부서 선택</option>
	                                        	<c:forEach var="d" items="${ dList }">
	                                        		<c:if test="${ member.deptNo == d.deptNo }">
	                                        			<option value="${ d.deptNo }" selected>${ d.deptName }</option>
	                                        		</c:if>
	                                        		<c:if test="${ member.deptNo != d.deptNo }">
	                                        			<option value="${ d.deptNo }">${ d.deptName }</option>
	                                        		</c:if>	                                        		
	                                        	</c:forEach>
	                                        </select>
	                                        <br>
	                                        <label class="col-form-label">직위</label>
	                                        <select class="form-control" name="positionNo">
	                                        	<option value="">직위 선택</option>
						                    	<c:forEach var="p" items="${ pList }">
						                    		<c:if test="${ member.positionNo == p.no }">
						                    			<option value="${ p.no }" selected>${ p.name }</option>
						                    		</c:if>
						                    		<c:if test="${ member.positionNo != p.positionNo }">
						                    			<option value="${ p.no }">${ p.name }</option>
						                    		</c:if>
						                    	</c:forEach>	                                        	
	                                        </select>
	                                        <br>
	                                        <label class="col-form-label">입사일</label>
	                                        <div class="flatpickr" style="display: inline-block;">
												<input type="text" id="startDate" name="inputstartDate" class="form-control"  value="${ member.startDate }"  data-input>
												<a class="input-button" title="toggle" data-toggle>
													<i class="icon-calendar"></i>
												</a>
												 
												<a id="clearBtn1" class="input-button" title="clear" data-clear>
													<i class="icon-close"></i>
												</a>
											</div>
	                                        <br>                                        
	                                        <label class="col-form-label">퇴사일</label>
	                                        <div class="flatpickr" style="display: inline-block;">
												<input type="text" id="quitDate" name="inputQuitDate" class="form-control"  value="${ member.quitDate }"  data-input>
												<a class="input-button" title="toggle" data-toggle>
													<i class="icon-calendar"></i>
												</a>
												 
												<a id="clearBtn2" class="input-button" title="clear" data-clear>
													<i class="icon-close"></i>
												</a>
											</div>
	                                        <br>                   
	                                        <label class="col-form-label">계정 상태</label>
	                                        <c:if test="${ member.quitYn == 'Y' }">
	                                        	<input id="normal" type="radio" name="quitYn" value="N" checked> 정상&nbsp;&nbsp; &nbsp;
	                                        	<input id="pause" type="radio" name="quitYn" value="Y"> 중지
	                                        </c:if>
	                                        <c:if test="${ member.quitYn == 'N' }">
	                                        	<input id="normal" type="radio" name="quitYn" value="N"> 정상&nbsp;&nbsp; &nbsp;
	                                        	<input id="pause" type="radio" name="quitYn" value="Y" checked> 중지
	                                        </c:if>
	                                        <%-- <c:if test="${ member.status == 2 }">
	                                        	<input type="hidden" name="status" value="2"> 승인 대기
	                                        </c:if> --%>                                        
	                                        <br>
	                                       
	                                        <c:if test="${ member.grade == 'A' && member.quitYn != 'N' && member.email != 'admin'}">
	                                        	<label class="col-form-label">관리자로 설정</label>
	                                        	<input type="checkbox" name="grade" value="Y" checked> 
	                                        	<span style="color: gray; font-size: small">&nbsp;관리자로 설정</span>
	                                        </c:if>
	                                        <c:if test="${ member.grade != 'A' && member.quitYn != 'N' && member.email != 'admin'}">
	                                        	<label class="col-form-label">관리자로 설정</label>
	                                        	<input type="checkbox" name="grade" value="A">
	                                        	<span style="color: gray; font-size: small">&nbsp;관리자로 설정</span>
	                                        </c:if>
	                                        <c:if test="${ member.email == 'admin' }"> <!-- 최초 관리자 계정은 관리자 설정 해제 불가 -->
	                                        	<label class="col-form-label">관리자로 설정</label>
	                                        	<input type="checkbox" name="grade" value="A" checked readonly>
	                                        	<span style="color: gray; font-size: small">&nbsp;관리자 해제 불가</span>
	                                        </c:if>	
	                                        <c:if test="${ member.quitYn == 'Y' }">
	                                        	<input type="hidden" name="grade" value="N">
	                                        </c:if>		                                        	                                                                            
	                                        <br><br>
                                       </div>
                                       <input type="hidden" name="page" value="${ page }">
                                       <c:if test="${ searchValue != null }">
									   	   <input type="hidden" name="selectDept" value="${ selectDept }">
	                                       <input type="hidden" name="selectPosi" value="${ selectPosi }">
	                                       <input type="hidden" name="searchValue" value="${ searchValue }">		
                                       </c:if>
                                        <div align="center">
                                        	<button class="btn btn-primary" id="btnSubmit">저장</button>
	                                        <button type="reset" class="btn btn-outline-primary">취소</button>
	                                        <c:if test="${ searchValue != null }"> 
		                                        <c:url value="msearch.ad" var="msearch">
		                                        	<c:param name="page" value="${ page }"/>
													<c:param name="selectDept" value="${ selectDept }"/>
													<c:param name="selectPosi" value="${ selectPosi }"/>
													<c:param name="searchValue" value="${ searchValue }"/>
		                                        </c:url>
		                                        <button type="button" class="btn btn-outline-primary" onclick="location.href='${ msearch }'">목록으로</button>
	                                        </c:if>
	                                        <c:if test="${ searchValue == null }">
	                                        	<button type="button" class="btn btn-outline-primary" onclick="location.href='mlist.ad?page=' + '${ page }'">목록으로</button>
	                                        </c:if>
                                        </div>
                                    </form>
                                </div>
                                <script>
									$('#pause').on('click', function(){
										if($(this).val() == 1 && $('input[name=grade]').prop('checked')) {
											alert('계정을 중지하려면 먼저 관리자 설정을 해제하여 주세요.');
											$('#normal').prop('checked', true);
										} 
									});                 
                                	
									$('input[name=grade]').on('click', function(){
										if($('#pause').prop('checked') && $(this).prop('checked')) {
											alert('관리자로 설정하려면 계정 상태가 정상이어야 합니다.');
											$(this).prop('checked', false);
										} 
									}); 
									
									// 수정 성공시 success 알럿창 띄우기
		                			$(function(){
		                				console.log('${selectDept}')
		                				if ('${message}' != '') {
		                					Swal.fire({
	    				        				position: 'top', // top : 상단 중앙에 띄우기
	    				        				background: '#292B30', // 알럿창 배경색
	    					       				color: 'white', // 글자색
	    				        				text : '변경되었습니다.', // 내용(작은 글씨)
	    				        				timer : 2000, // 자동 종료 타이머
	    				        				customClass : 'sweet-size', 
	    				        				showConfirmButton : false // ok버튼 표시 여부
	    				        			});
		                					<c:remove var="message" scope="request"/>
		                					
		                					var url = location.pathname + "?no=" + '${member.no}' + "&page=" + '${page}';
											if ('${searchValue}' != 'null') {
												url += "&selectDept=" + '${selectDept}' + "&selectPosi=" + '${selectPosi}' + "&searchValue=" + '${searchValue}';
											}
		                					history.replaceState({}, null, url);
		                				}
		                			});
									
		                					// sweet alert customize
		    				        		var alert = function(msg, title, icon) {
		    				        			Swal.fire({
		    				        				// position: 'top', // top : 상단 중앙에 띄우기
		    				        				background: '#292B30', // 알럿창 배경색
		    					       				color: 'white', // 글자색
		    				        				title : title, // 제목(큰 글씨)
		    				        				text : msg, // 내용(작은 글씨)
		    				        				icon: icon, // info, error 등 icon type
		    				        				//timer : 2000, // 자동 종료 타이머
		    				        				customClass : 'sweet-size', 
		    				        				//showConfirmButton : false // ok버튼 표시 여부
		    				        			});
		    				        		}
                                </script>
                                
                                <!-- flatpicker cdn  -->
								<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
								<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
								<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
                            	<script>
	                            	const $flatpickr1 = $("#startDate").flatpickr();
	                            	const $flatpickr2 = $("#quitDate").flatpickr();
	                            	
	                            	flatpickr.localize(flatpickr.l10ns.ko);
	                            	flatpickr("mySelector");

	                            	// 입력한 데이터 지우기 버튼
	                            	$("#clearBtn1").click(function() {
	                            	   $flatpickr1.clear();
	                            	});
	                            	
	                            	$("#clearBtn2").click(function() {
		                            	$flatpickr2.clear();
		                            });
	                            	
	                            	// 입사일은 퇴사일 이전 날짜만 선택 가능
	                            	$("#startDate").flatpickr({
	                            		dateFormat: "Y-m-d",
	                            		"locale": "ko", // 언어 한글로 설정
	                            		onChange: function(selectedDates, dateStr, instance) {
	                            			$('#quitDate').flatpickr({"minDate": new Date(dateStr)});
	                            		},
	                            		maxDate : new Date('${ member.quitDate }'),
	                            	})
	                            	
	                            	// 퇴사일은 입사일 이후 날짜만 선택 가능
	                            	$("#quitDate").flatpickr({
	                            		dateFormat: "Y-m-d",
	                            		"locale": "ko", // 언어 한글로 설정
	                            		onChange: function(selectedDates, dateStr, instance) {
	                            			$('#startDate').flatpickr({"maxDate": new Date(dateStr)});
	                            		},
	                            		minDate : new Date('${ member.startDate }'),
	                            	});
	                            	
                            	</script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">MacademiA</a> 2022</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->      
          
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->    
    
   <!--**********************************
        Scripts
    ***********************************-->
</body>
</html>