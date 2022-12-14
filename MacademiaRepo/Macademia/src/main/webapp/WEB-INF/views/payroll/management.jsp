<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/css/common/common.css" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        grid-template-columns: repeat(7, 1fr) 1.5fr 1.5fr 1.5fr 1fr 1fr;
        grid-template-rows: repeat(11, 1fr);
		grid-auto-rows: 1fr;
        row-gap: 10px;
        align-content : center;
        align-items: center;
    }

	.result-area{
		grid-column: span 11;
		display: grid;
		grid-template-columns: repeat(7, 1fr) 1.5fr 1.5fr 1.5fr 1fr ;
		row-gap: 10px;
        align-content : center;
        align-items: center;
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
        font-size: 1.3rem;
        text-align: center;
		width : 100%;
		border : none;
		border-right: 1px dashed #6667AB;
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
	                <form action="/md/payroll/management" method="post">
	
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
	                </form>
	            </div>
	


	            <!-- ?????? ?????? -->
	            <div id="management-select-result">
	            
		            <div class="management-table-header">????????????</div>
					<div class="management-table-header">????????????</div>
					<div class="management-table-header">?????????</div>
					<div class="management-table-header">?????????</div>
					<div class="management-table-header">??????</div>
					<div class="management-table-header">????????????</div>
					<div class="management-table-header">??????</div>
					<div class="management-table-header">????????????</div>
					<div class="management-table-header">??????</div>
					<div class="management-table-header">????????????</div>
					<div class="management-table-header">??????</div>
					<div class="management-table-header">??????</div>

	            
					<c:forEach items="${prVoList}" var="prVo">
	            		
						<!-- ?????? ??? ?????? ????????? ??????  -->
						<form action="/md/payroll/history/detail" method="post" class="result-area">
							<input type="text" class="management-table-content salNo" value="${prVo.salNo}" name="salNo" readonly>
							<input type="text" class="management-table-content" value="${prVo.payDate}" name="payDate" readonly>
							<input type="text" class="management-table-content" value="${prVo.deptName}" name="deptName" readonly>
							<input type="text" class="management-table-content" value="${prVo.rankName}" name="rankName" readonly>
							<input type="text" class="management-table-content" value="${prVo.name}" name="name" readonly>
							<input type="text" class="management-table-content commaC" value="${prVo.pay}" name="pay" readonly>
							<input type="text" class="management-table-content commaC" value="${prVo.taxfree}" name="taxfree" readonly>
							<input type="text" class="management-table-content commaC" value="${prVo.totalPayment}" name="totalPayment" readonly>
							<input type="text" class="management-table-content commaC" value="${prVo.totalDeduction + prVo.nationalPension + prVo.healthPremium + prVo.incomeTax + prVo.localTax}" name="totalDeduction" readonly>
							<input type="text" class="management-table-content commaC" value="${prVo.actualPayment}" name="actualPayment" readonly >
							<input type="submit" class="management-table-content submit-Btn" value="???????????????" style="font-size:1.2rem;" >
							
							
							
							<!-- ????????? -->
	                        <input type="hidden" value="${prVo.attendance}" name="attendance">
	                        <input type="hidden" value="${prVo.attendancePlus}" name="attendancePlus">
	                        <input type="hidden" value="${prVo.technical}" name="technical">
	                        <input type="hidden" value="${prVo.specialduty}" name="specialduty">
	                        <input type="hidden" value="${prVo.emergency}" name="emergency">
	                        <input type="hidden" value="${prVo.lunchFee}" name="lunchFee">
	                        <input type="hidden" value="${prVo.holiday}" name="holiday">
	                        <input type="hidden" value="${prVo.subsidy}" name="subsidy">
	                        <input type="hidden" value="${prVo.publicActivity}" name="publicActivity">
	                        
	                        <!-- ????????? -->
	                        <input type="hidden" value="${prVo.contribution}" name="contribution">
	                        <input type="hidden" value="${prVo.mutualFee}" name="mutualFee">
	                        <input type="hidden" value="${prVo.safeDeposit}" name="safeDeposit">
	                        <input type="hidden" value="${prVo.other}" name="other">
	                        <input type="hidden" value="${prVo.longtermCare}" name="longtermCare">
	                        <input type="hidden" value="${prVo.employmentPay}" name="employmentPay">
	                        
	                        <!-- ???????????? -->
	                        <input type="hidden" value="${prVo.position}" name="position">
	                        <input type="hidden" value="${prVo.nationalPension}" name="nationalPension">
	                        <input type="hidden" value="${prVo.healthPremium}" name="healthPremium">
	                        <input type="hidden" value="${prVo.position}" name="position">
	                        <input type="hidden" value="${prVo.incomeTax}" name="incomeTax">
	                        <input type="hidden" value="${prVo.localTax}" name="localTax">
	                        <input type="hidden" value="${prVo.baseMonthPay}" name="baseMonthPay">
	                        
						</form>	
						
						<!-- action?????? alert?????? ??????????????? -->
						<form action="" method="post" class="status-form">
							<c:if test="${prVo.checkStatus eq 'WAIT'}">
								<input type="button" class="management-table-content status-choice btn btn-outline-dark" style="width: 100%; margin-left: 5%;" value="??????"></input>
								<input type="hidden" class="stFormDate">
								<input type="hidden" class="stDeptName">
							</c:if>
							<c:if test="${prVo.checkStatus eq 'CONFIRM'}">
								<div class="management-table-content badge bg-primary status-choice" style="width:80%; margin-left:10%;">??????</div>
							</c:if>
							<c:if test="${prVo.checkStatus eq 'RETURN'}">
								<div class="management-table-content badge bg-warning status-choice" style="width:80%; margin-left:10%;">??????</div>
							</c:if>
						</form>	
					</c:forEach>

					
	            </div>
	
	
	        </main>	

		</div>

		<script>
			const commaCreate = document.querySelectorAll('.commaC');

			for(let i=0; i<commaCreate.length; i++){

				//????????????
				let num01;
				let num02;
				num01 = commaCreate[i].value;
				num02 = num01.replace(/\D/g,""); 
				num01 = setComma(num02);
				commaCreate[i].value =  num01;

			}

			//??????????????????
			function setComma(n) {
				var reg = /(^[+-]?\d+)(\d{3})/;
				n += '';         
				while (reg.test(n)) {
					n = n.replace(reg, '$1' + ',' + '$2');
				}         
				return n;
			};

			// ?????? ??????
			function deleteComma(){

				for(let i=0; i<commaCreate.length; i++){

					let number = commaCreate[i].value.replace(/,/g, "");
					commaCreate[i].value = number;
					
				}

			}

		</script>



		<!-- ?????? ??? ?????? -->
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

		<!-- ????????? ??? ???????????? ???????????? -->
		<script>
			const submitBtn = document.querySelectorAll('.submit-Btn');
			const totalDeduction = document.querySelectorAll('input[name="totalDeduction"]');
			const healthPremium = document.querySelectorAll('input[name="healthPremium"]');
			const incomeTax = document.querySelectorAll('input[name="incomeTax"]');
			const localTax = document.querySelectorAll('input[name="localTax"]');
			const nationalPension = document.querySelectorAll('input[name="nationalPension"]');

			for(let i=0; i<submitBtn.length; i++){
				submitBtn[i].addEventListener('click',function(){
					deleteComma();
					totalDeduction[i].value = totalDeduction[i].value - healthPremium[i].value - incomeTax[i].value - localTax[i].value - nationalPension[i].value;
				});
			}
			

		</script>



		<!-- ?????? ?????? -->
		<script>
				const statusChoice = document.querySelectorAll('.status-choice');
				const salNo = document.querySelectorAll('.salNo')
				const statusForm = document.querySelectorAll('.status-form');

				for(let i=0; i<statusChoice.length; i++){

					statusChoice[i].addEventListener('click',function(){
						if(statusChoice[i].value == '??????'){
							
							let checkSalNo = salNo[i].value;
							let stFormDate = document.querySelectorAll('.stFormDate');
							let stDeptName = document.querySelectorAll('.stDeptName');
							let deptSelect = document.querySelector('#dept-select');
							
							
							Swal.fire({
								title: '????????? ????????? ?????????',
								showDenyButton: true,
								showCancelButton: true,
								confirmButtonText: '??????',
								denyButtonText: '??????'
								}).then((result) => {
								/* Read more about isConfirmed, isDenied below */
								if (result.isConfirmed) {
									statusChoice[i].type= "submit";
									statusForm[i].action = "/md/payroll/checkStatus/CONFIRM/"+salNo[i].value;

									stFormDate[i].value = yearSelect.value;
									stDeptName[i].value = deptSelect.value;
									
									console.log(salNo[i].value);							
									Swal.fire('?????? ?????? ????????????.', '', 'success');
										
									statusChoice[i].value = "??????????????????";

								} else if (result.isDenied) {
									statusChoice[i].type= "submit";
									statusForm[i].action = "/md/payroll/checkStatus/RETURN/"+salNo[i].value;

									stFormDate[i].value = yearSelect.value;
									stDeptName[i].value = deptSelect.value;

									Swal.fire('?????? ?????? ????????????.', '', 'info')
									statusChoice[i].value = "??????????????????";
								}
							})
						}

					});
		}

		</script>


</body>
</html>