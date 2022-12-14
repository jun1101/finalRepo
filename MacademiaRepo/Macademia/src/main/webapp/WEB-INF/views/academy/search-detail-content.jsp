<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    #search-detail-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh;
        row-gap: 10px;
    }
    #search-detail-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /* 정보부분 */
    #student-info-area{
        display: grid;
        grid-template-columns: 1fr 4fr;
        grid-auto-rows: 60px;
        align-content: center;
        border-top: 1px solid black;
    }
    #student-profile, .comment-area{
        grid-row: span 4;
    }
    #student-name{
        grid-row: span 2;
        margin-top: 20px;
        margin-left: 20px;
    }
    #student-phone, #student-email{
        /* margin-top: 0px; */
        margin-left: 20px;
    }
    .info-title{
        border-right: 1px solid lightgray;
        border-top: 1px solid lightgray;
    }
    .info-border-top{
        border-top: 1px solid lightgray;
    }
    #student-info-area>div{
        padding: 15px 0px 0px 10px;
    }
    textarea{
        border-radius: 0px;
        padding-left: 10px;
        resize: none;
    }
    #student-info-area i{
        color: #6667AB;
        width: 30px;
    }
    #search-detail-content-wrap input{
        border-radius: 0px;
        height: 30px;
        border: 1px solid gray;
    }
    #student-dob>input{
        width: 140px;
        text-align: center;
    }
    #student-gender>input{
        margin-right: 10px;
    }
    #student-gender{
        display: grid;
        grid-template-columns: repeat(4, 30px);
        grid-auto-rows: 30px;
        align-items: center;
    }
    #student-addr-title{
        grid-row: span 2;
    }
    #student-addr{
        display: grid;
        grid-template-columns: 200px 100px 100px;
        column-gap: 10px;
        grid-row: span 2;
        text-align: center;
    }
    #sample4_jibunAddress{
        grid-column: span 2;
    }
    #student-addr>input{
        padding-left: 10px;
    }
    #addr-search-btn{
        background-color: #6667AB;
        color: white;
    }
    #student-degree>input, #student-major>input{
        width: 200px;
        padding-left: 10px;
    }
    #student-class>input{
        width: 400px;
        padding-left: 10px;
    }

    /* 하단버튼 */
    #edit-btn-area{
        height: 4vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #edit-btn-area>button{
        width: 100px;
        height: 30px;
        background-color: #6667AB;
        color: white;
        border: none;
        margin: 0px 5px 0px 5px;
    }
    #edit-btn-area>button>a{
        color: white;
        display: grid;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    #edit-btn-area>button:hover{
        font-weight: bolder;
    }
</style>

<script>
    $(function(){
        let gender = '${svo.gender}'
        if(gender === 'M'){
            $('input[value="M"]').attr('checked', true)
        }else{
            $('input[value="F"]').attr('checked', true)
        }

        let ph = '${svo.phone}'
        const pre = ph.substring(0,3)
        const mid = ph.substring(3,7)
        const last = ph.substring(7,11)
        const phone = pre + '-' + mid + '-' +  last
        $('#student-phone > b').text(phone)

        let birth = '${svo.birth}'
        const year = birth.substring(0,4)
        const month = birth.substring(5,7)
        const day = birth.substring(8,11)

        $('input[id="year"]').attr('value', year)
        $('input[id="month"]').attr('value', month)
        $('input[id="day"]').attr('value', day)

    })
</script>

<script>
    $(function(){
               
        <c:if test="${not empty msg}">
	    	Swal.fire({
	    		icon: 'success',
	    		title: '${msg}'
	    	});
	   	</c:if>
        
    });
</script>

<div id="search-detail-content-wrap">
    <div><h4>수강생 정보조회</h4></div>

    <div id="student-info-area">
        <div id="student-profile">
            <img src="${root}/resources/upload/profile/studentProfile/${svo.profile}" width="160px" height="180px" alt="수강생 프로필">
        </div>
        <div id="student-name"><h3>${svo.name}</h3></div>
        <div id="student-phone">
            <i class="fa-solid fa-mobile-screen-button fa-2xl"></i>
            <b>${svo.phone}</b>
        </div>
        <div id="student-email">
            <i class="fa-solid fa-envelope fa-xl"></i>
            <b>${svo.email}</b>
        </div>
        <div class="info-title"><b>생년월일</b></div>
        <div class="info-border-top" id="student-dob">
            <input type="text" id="year" value="" readonly>
            <input type="text" id="month" value="" readonly>
            <input type="text" id="day" value="" readonly>
        </div>
        <div class="info-title"><b>성별</b></div>
        <div class="info-border-top" id="student-gender">
            <input type="radio" id="m" value="M" name="gender" disabled>
            <label for="m">남</label>
            <input type="radio" id="f" value="F" name="gender" disabled>
            <label for="f">여</label>
        </div>
        <div class="info-title" id="student-addr-title"><b>주소</b></div>
            <div class="info-border-top" id="student-addr">
                <!-- <input type="text" id="sample4_postcode" value="" readonly> -->
                <!-- <input type="button" id="addr-search-btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> -->
                <input type="text" id="sample4_roadAddress" value="${svo.newAddress}" readonly>
                <input type="text" id="sample4_jibunAddress" value="${svo.oldAddress}" readonly>
                <input type="text" id="sample4_detailAddress" value="${svo.detailAddress}" readonly>
                <span id="guide" style="color:#999;display:none"></span>
                <input type="hidden" id="sample4_extraAddress" readonly>
            </div>
        <div class="info-title"><b>최종학력</b></div>
        <div class="info-border-top" id="student-degree"><input type="text" value="${svo.finalDegree}" readonly></div>
        <div class="info-title"><b>전공</b></div>
        <div class="info-border-top" id="student-major"><input type="text" value="${svo.major}" readonly></div>
        <div class="info-title"><b>수강</b></div>
        <div class="info-border-top" id="student-class">${svo.enrolledClassName}</div>
        <div class="info-title comment-area"><b>코멘트</b></div>
        <div class="comment-area info-border-top"><textarea name="" id="" cols="110" rows="8" readonly>${svo.stdComment}</textarea></div>
    </div>

    <div id="edit-btn-area">
        <button><a href="${root}/academy/search/1">뒤로가기</a></button>
        <button><a href="${root}/academy/search/detail/edit/${svo.no}">정보수정</a></button>
    </div>

</div>