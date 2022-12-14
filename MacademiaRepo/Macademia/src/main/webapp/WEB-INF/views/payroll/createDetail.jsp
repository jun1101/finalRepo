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
        grid-template-columns: 1fr 1fr;
        grid-template-rows: repeat(3, 8%) 10% 66%;
        text-align : center;
    }


    .main-table-span{
        grid-column : span 2;
        display: grid;
        align-items: center;
        justify-items: center;
        
    }

    .main-table-span > div{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: space-between;
    }

    .main-table-span > div > div{
        width: 40%;
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
    }


    #detail-form-area{
        grid-column: span 2;
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 90% 10%;
    }

    .main-table-grid{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: repeat(12, 1fr);

        text-align: center;
        align-items: center;
        justify-items: center;

        border: 3px solid #6667AB;
        border-radius: 10px;

        margin: 5px;
    }

    .main-table-grid > h4{
        grid-column: span 2;
        background-color: #6667AB;
        color: white;
        width: 100%;
        height: 90%;

        display: grid;
        align-items: center;
    }

    #detail-price{
        border: 5px solid #6667AB;
        border-radius: 30px;
        padding : 10px 0px;
        display: grid;
        grid-template-columns : 1fr 1fr;
    }


    .main-table-grid > div{
        border: 1px solid black;
        width: 100%;
        height: 100%;

        display: grid;
        align-items: center;
    }

    .repair-price-area{
        width: 100%;
        height: 100%;
        text-align: center;
    }

    .deduction-price-area{
        width: 100%;
        height: 100%;
        text-align: center;
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

            <div class="main-table-span"><h2 style="border-bottom: 3px solid #1315a6; width: 50%;">?????? ?????? ?????????</h2></div>

            <div class="main-table-span" style="color:#6667AB"><h1>${prVo.payDate}??? - ????????????</h1></div>

            <div class="main-table-span">
                <div>
                    <div>
                        <h3>?????? : ${prVo.deptName}</h3>
                        <h3>?????? : ${prVo.name}</h3>
                    </div>
                    <div>
                        <h3>???????????? : ${prVo.no}</h3>
                        <h3>?????? : ${prVo.rankName}</h3>    
                    </div>
                </div>
            </div>
            <div class="main-table-span" id="detail-price"><h3>?????? ??? ????????? : </h3><h3 id="realAmount"></h3></div>

            <form  action="/md/payroll/create/detail/write" method="post" id="detail-form-area">
            	<input type="hidden" name="targetNo" value="${prVo.no}">
            	<input type="hidden" name="payDate" value="${prVo.payDate}">
            	<input type="hidden" name="deptNo" value="${prVo.deptNo}">
            	<input type="hidden" name="rankNo" value="${prVo.rankNo}">
                <div class="main-table-grid">
                    <h4>??????</h4>
                    <div>?????????</div>
                    <div><input class="" type="text" name="totalRepair"  style="width:100%; height:100%;" onfocus="this.oldvalue = this.value;"></div>
                    <div>??? ?????????</div>
                    <div><input class="repair-price-area" type="text"  value="0" name="pay" onfocus="this.oldvalue = this.value;"></div>
                    <div>????????????</div>
                    <div><input class="repair-price-area" type="text"  value="0" name="attendance" onfocus="this.oldvalue = this.value;"></div>
                    <div>???????????????</div>
                    <div><input class="repair-price-area" type="text"  value="0" name="attendancePlus" onfocus="this.oldvalue = this.value;"></div>
                    <div>??????????????????</div>
                    <div><input class="repair-price-area" type="text" value="0" name="technical" onfocus="this.oldvalue = this.value;"></div>
                    <div>??????????????????</div>
                    <div><input class="repair-price-area" type="text" value="0" name="specialduty" onfocus="this.oldvalue = this.value;"></div>
                    <div>??????????????????</div>
                    <div><input class="repair-price-area" type="text" value="0" name="emergency" onfocus="this.oldvalue = this.value;"></div>
                    <div>???????????????</div>
                    <div><input class="repair-price-area" type="text" value="0" name="lunchFee" onfocus="this.oldvalue = this.value;"></div>
                    <div>???????????????</div>
                    <div><input class="repair-price-area" type="text" value="0" name="holiday" onfocus="this.oldvalue = this.value;"></div>
                    <div>???????????????</div>
                    <div><input class="repair-price-area" type="text" value="0" name="subsidy" onfocus="this.oldvalue = this.value;"></div>
                    <div>???????????????</div>
                    <div><input class="repair-price-area" type="text" value="0" name="publicActivity" onfocus="this.oldvalue = this.value;"></div>

                   
                </div>

                <div class="main-table-grid">
                    <h4 >??????</h4>
                    <div>?????????</div>
                    <div><input class="deduction-price-area" type="text" value="0" name="totalDeduction" style="width:100%; height:100%;" onfocus="this.oldvalue = this.value;"></div>
                    <div>?????????</div>
                    <div><input class="deduction-price-area" type="text" value="0" name="contribution" onfocus="this.oldvalue = this.value;"></div>
                    <div>??????????????????</div>
                    <div><input class="deduction-price-area" type="text" value="0" name="mutualFee" onfocus="this.oldvalue = this.value;"></div>
                    <div>??????????????????</div>
                    <div><input class="deduction-price-area" type="text" value="0" name="safeDeposit" onfocus="this.oldvalue = this.value;"></div>
                    <div>????????????</div>
                    <div><input class="deduction-price-area" type="text" value="0" name="other" onfocus="this.oldvalue = this.value;"></div>
                    
                   
                </div>

                <div style="grid-column: span 2; align-items: center; width: 100%; height: 100%;">
                    <input type="submit"  id="please" value="????????????" class="btn btn-light btn-lg" style="background-color: #1315a6 ; color:white;">
                    <input type="button"   value="????????????" class="btn btn-light btn-lg">
                </div>
            </form>
        </main>


    </div>
</body>

<!-- form ????????? ??????????????? + ?????? ????????? ????????? ?????? -->
<script>

    const please = document.querySelector('#please');
    
    please.addEventListener('click',function(){
        
        for(let i=0; i<repairPrice.length; i++){
            
            var temp = (repairPrice[i].value).replace(/,/g, "");
            if(isNaN(temp)==true){
                temp = 1;
            }
            repairPrice[i].type = "number";
            repairPrice[i].value = parseInt(temp);
        }
        
        for(let i=0; i<deductionPrice.length; i++){
            
            var temp = (deductionPrice[i].value).replace(/,/g, "");
            if(isNaN(temp)==true){
                temp = 1;
            }
            deductionPrice[i].type = "number";
            deductionPrice[i].value = parseInt(temp);
        }
        
        

    });


</script>
 



<!--  -->
<script>
			
       const repairPrice = document.querySelectorAll('.repair-price-area');
       const deductionPrice = document.querySelectorAll('.deduction-price-area');

       const totalRepair = document.querySelector('input[name=totalRepair]');
       const totalDeduction = document.querySelector('input[name=totalDeduction]');
       
       const realPay = document.querySelector('#realAmount');

       

        // ?????? ??? + ???????????? ??????
       for(let i=0; i<repairPrice.length; i++){

    	   repairPrice[i].addEventListener('change',function(){
                //?????? ???
                let totalValue = (totalRepair.value).replace(/,/g, "");
                let inputValue = (repairPrice[i].value).replace(/,/g, "");
                let oldvalue = (repairPrice[i].oldvalue).replace(/,/g, "");
                totalRepair.value = parseInt(totalValue) +  parseInt(inputValue) - parseInt(oldvalue);

                //????????????
                let totalRepairValue = totalRepair.value.replace(/,/g, "");;
                let totalDeductionValue = totalDeduction.value.replace(/,/g, "");;
                realPay.innerText = parseInt(totalRepairValue) - parseInt(totalDeductionValue);

                //????????????
                let num01;
                let num02;
                num01 = inputValue;
                num02 = num01.replace(/\D/g,""); 
                num01 = setComma(num02);
                repairPrice[i].value =  num01;

                totalRepair.value = setComma((totalRepair.value).replace(/\D/g,""));
                totalDeduction.value = setComma((totalDeduction.value).replace(/\D/g,""));
                realPay.innerText = setComma((realPay.innerText).replace(/\D/g,""));
            })
        } 

        // ?????? ??? + ???????????? ??????
        for(let i=0; i<deductionPrice.length; i++){

            deductionPrice[i].addEventListener('change',function(){
               //?????? ???
                let totalValue = (totalDeduction.value).replace(/,/g, "");
                let inputValue = (deductionPrice[i].value).replace(/,/g, "");
                let oldvalue = (deductionPrice[i].oldvalue).replace(/,/g, "");
                totalDeduction.value = parseInt(totalValue) +  parseInt(inputValue) - parseInt(oldvalue);

                 //????????????
                let totalRepairValue = totalRepair.value.replace(/,/g, "");;
                let totalDeductionValue = totalDeduction.value.replace(/,/g, "");;
                realPay.innerText = parseInt(totalRepairValue) - parseInt(totalDeductionValue);

                //????????????
                let num01;
                let num02;
                num01 = inputValue;
                num02 = num01.replace(/\D/g,""); 
                num01 = setComma(num02);
                deductionPrice[i].value =  num01;

                totalRepair.value = setComma((totalRepair.value).replace(/\D/g,""));
                totalDeduction.value = setComma((totalDeduction.value).replace(/\D/g,""));
                realPay.innerText = setComma((realPay.innerText).replace(/\D/g,""));
            })


            
        } 


       //??????????????????
       function setComma(n) {
            var reg = /(^[+-]?\d+)(\d{3})/;
            n += '';         
            while (reg.test(n)) {
                n = n.replace(reg, '$1' + ',' + '$2');
            }         
            return n;
        }

</script>


<!-- ?????? ??? ????????? ?????? -->
<script>

    const payRankName = '${prVo.rankName}';
    const monthPay = document.querySelector('input[name=pay]');

    switch(payRankName){

        case '??????' : monthPay.value = 2000000; totalRepair.value = 2000000; realPay.innerText = 2000000; break;
        case '??????' : monthPay.value = 4000000; totalRepair.value = 4000000; realPay.innerText = 4000000; break;
        case '??????' : monthPay.value = 6000000; totalRepair.value = 6000000; realPay.innerText = 6000000; break;
        case '??????' : monthPay.value = 8000000; totalRepair.value = 8000000; realPay.innerText = 8000000; break;
        case '??????' : monthPay.value = 10000000; totalRepair.value = 10000000; realPay.innerText = 10000000; break;
        case '??????' : monthPay.value = 12000000; totalRepair.value = 12000000; realPay.innerText = 12000000; break;
        default : monthPay.value = 2000000; totalRepair.value = 2000000; realPay.innerText = 2000000;

    }
    
        
    //???????????? - 
    monthPay.value = setComma((monthPay.value).replace(/\D/g,""));
    totalRepair.value = setComma((totalRepair.value).replace(/\D/g,""));
    realPay.innerText = setComma((realPay.innerText).replace(/\D/g,""));
    

    

</script>





</html>