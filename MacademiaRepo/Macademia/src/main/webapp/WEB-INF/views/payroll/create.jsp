<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/css/common/common.css" %>
<style>
	<%@ include file="/resources/css/payroll/commonAside.css" %>


    main{
        display: grid;
        grid-template-rows: 0.5fr 1fr 8fr;
    }

   	#management-title{
		border-left: 5px solid #6667AB;
		margin: 30px 0px 30px 10px;
		padding-left: 20px;
	}
	
    #management-select-area{
        border-bottom: 2px solid #6667AB;
        
    }
    

	#management-select-area{
		display: grid;
		align-items: center;
	}

	#management-select-area > form{
		display: flex;
		justify-content: space-between;
	}

	#management-select-area > form > div{
		width: 100%;

		display: grid;
		grid-template-columns: 35% auto;
		align-items: center;
		justify-items: center;
	}

	#management-select-area > form > div > select{
		font-size: 1.3rem;
	}

	#management-select-area > form > div > label{
		font-size: 2rem;
	}


    #management-select-result{
        display: grid;
        grid-template-columns: repeat(8, 1fr) 1.5fr 1.5fr 1.5fr;
        grid-template-rows: repeat(11, 1fr);
        row-gap: 10px;
        align-content : center;
        align-items: center;
    }

	.content-form{
		grid-column: span 11;
		display: grid;
        grid-template-columns: repeat(8, 1fr) 1.5fr 1.5fr 1.5fr;
	}

    .management-table-header{
		margin-top: 15px;

        font-size: 1.5rem;
        text-align: center;
        color: #6667AB;
		font-weight: 900;

		border-right: 1px dashed #6667AB;
    }

    .management-table-content{
		height: 80%;

        font-size: 1.5rem;
        text-align: center;

		border-right: 1px dashed #6667AB;
    }

	.management-table-content > input{
		width: 100%;
		height: 90%;
		text-align: center;
		padding-top: 5px;
		font-weight: 400;
		border: none;
		align-items: center;
	}
</style>

</head>
<body>
	    <div id="wrap">
            
			<header>
				<%@include file="/WEB-INF/views/common/header.jsp" %>
	        </header>
			<aside>		
				<%@ include file="/WEB-INF/views/payroll/commonAside.jsp" %>
			</aside>                

	        <main>
	        	
	        	<h1 id="management-title">???????????? ??????</h1>
	        	
	            <div id="management-select-area">
	                <form action="" method="post">
	
	                    <div>
	                        <label for="year-select" class="form-label">????????????</label>
	                        <select name="payDate" id="year-select" class="form-select" >
	                            <option value="2022-03">2022-03</option>
	                            <option value="2022-04">2022-04</option>
	                            <option value="2022-05">2022-05</option>
	                            <option value="2022-06">2022-06</option>
	                            <option value="2022-07">2022-07</option>
	                            <option value="2022-08">2022-08</option>
	                            <option value="2022-09">2022-09</option>
	                            <option value="2022-10">2022-10</option>
	                            <option value="2022-11" selected>2022-11</option>
	                        </select>
	                    </div>
	
	                    <div>
	                        <label for="dept-select" class="form-label">?????????</label>
	                        <select name="deptNo" id="dept-select" class="form-select" onchange="">
	                            <option value="0" selected>????????????</option>
	                            <option value="3">???????????????</option>
	                            <option value="4">???????????????</option>
	                            <option value="5" >???????????????</option>
	                            <option value="6" >????????????</option>
	                       	   <option value="7">?????????</option>
	                            <option value="8">?????????</option>
	                            <option value="9" >???????????????</option>
	                            <option value="10" >??????1???</option>
	                             <option value="11">??????2???</option>
	                            <option value="12">???????????????</option>
	                            <option value="13" >?????????</option>
	                            <option value="14" >?????????</option>
	                            <option value="15">?????????</option>
	                            <option value="16">???????????????</option>
							
	                        </select>
							
	                    </div>

						<!--  -->
	                  	<div>
	                        <label for="part-select" class="form-label">?????????</label>
	                        <select name="rankNo" id="rank-select" class="form-select">
	                            <option value="0" selected>????????????</option>
	                            <option value="1">??????</option>
	                            <option value="2">??????</option>
	                            <option value="3" >??????</option>
	                            <option value="4" >??????</option>
	                            <option value="5" >??????</option>
	                            <option value="6" >??????</option>
	                        </select>
	                    </div>
	
	                    <div>
	                        <input type="submit" value="??????" style="background-color: #6667AB; color:white; width: 70%; height: 80%;">
	                    </div>
						<h1>${prVoList}</h1>
	                </form>
	            </div>
	


	            <!-- ?????? ?????? -->
	            <div id="management-select-result">
	            
					<div class="management-table-header">????????????</div>
					<div class="management-table-header">??????</div>
					<div class="management-table-header">?????????</div>
					<div class="management-table-header">?????????</div>
					<div class="management-table-header">??????</div>
					
					
					<div class="management-table-header" style="grid-column: span 6;text-align: center; ">????????????</div>


	            
					
	            
	            	<c:forEach items="${prMemberList}" var="prMember">
	            	
	            		
						<!-- ???????????? ?????? -->
						<form class="content-form" action="/md/payroll/create/detail" method="post">
							
							<div class="management-table-content"><input type="text" value="${prMember.no}" name="no" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prMember.name}" name="name" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prMember.deptName}" name="deptName" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prMember.positionName}" name="positionName" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prMember.rankName}" name="rankName" style="width: 100%;" readonly></div>
							<input type="hidden" name="payDate" >
							<input type="hidden" name="deptNo" value="${prMember.deptNo}" >
							<input type="hidden" name="rankNo" value="${prMember.rankNo}" >
							<div style="grid-column: span 6;  text-align: center; ">
									<c:if test="${empty prMember.checkStatus}">
										<h2 style="width:100%; height: 90%; padding-top: 5px;"><input class="btn btn-secondary btn-lg" type="submit" value="?????? ?????? ????????????" style="width:40%;"></h2>
									</c:if>
									<c:if test="${prMember.checkStatus eq 'CONFIRM'}">
										<h2 style="width:100%; height: 90%; padding-top: 5px;"><input class="btn btn-outline-primary btn-lg" type="text" value="????????????" style="width:40%;" readonly></h2>
									</c:if>
									<c:if test="${prMember.checkStatus eq 'RETURN'}">
										<h2 style="width:100%; height: 90%; padding-top: 5px;"><input class="btn btn-outline-warning btn-lg" type="submit" value="??????" style="width:40%;"></h2>
									</c:if>
									<c:if test="${prMember.checkStatus eq 'WAIT'}">
										<h2 style="width:100%; height: 90%; padding-top: 5px;"><input class="btn btn-outline-warning btn-lg" type="submit" value="???????????????" style="width:40%;"></h2>
									</c:if>
							</div>
						</form>
						
	            	
	            	</c:forEach>
						
	
				
	            </div>
	
	
	        </main>	

		</div>


		<!--  -->
		<script>

			
				const yearSelect = document.querySelector('#year-select');
				const deptSelect = document.querySelector('#dept-select');
				const rankSelect = document.querySelector('#rank-select');

				const yearValue = '${yearValue}';
				const deptValue = '${deptValue}';
				const rankValue = '${rankValue}';

				console.log(yearValue);
				
				for (let i=0; i<yearSelect.options.length; i++){  
					//select box??? option value??? ?????? ?????? value??? ?????? ????????? ?????? selected
						if(yearSelect.options[i].value == yearValue){
							yearSelect.options[i].selected = true;
						};
				};
				
				
				for (let i=0; i<deptSelect.options.length; i++){  
				//select box??? option value??? ?????? ?????? value??? ?????? ????????? ?????? selected
					if(deptSelect.options[i].value == deptValue){
						deptSelect.options[i].selected = true;
					};
				};


				for (let i=0; i<rankSelect.options.length; i++){  
					//select box??? option value??? ?????? ?????? value??? ?????? ????????? ?????? selected
						if(rankSelect.options[i].value == rankValue){
							rankSelect.options[i].selected = true;
						};
					};

				

		</script>


		<script>
			const memberPayDate = document.querySelectorAll('input[name=payDate]');
	
			for(let i=0; i<memberPayDate.length; i++){
				memberPayDate[i].value = yearSelect.value;
			}	

		</script>


</body>
</html>