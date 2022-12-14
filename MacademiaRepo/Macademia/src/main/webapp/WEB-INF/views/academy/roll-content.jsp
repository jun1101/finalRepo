<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    #roll-content-wrap{
        width: 60vw;
        padding: 2vw;
        display: grid;
        /* grid-template-rows: 10vh 10vh; */
        row-gap: 10px;
    }
    #choose-class-title, #my-class-title{
        display: flex;
        justify-content: flex-start;
        align-items: center;
        height: 10vh;
    }
    #class-list-search-area>form{
        display: flex;
        justify-content: flex-start;
        align-items: center;
        height: 10vh;
    }
    #class-list-search-area>form>select{
        height: 30px;
        margin-right: 5px;
    }
    #class-list-search-area>form>input[type='text']{
        width: 200px;
        height: 30px;
        border: none;
        border: 1px solid black;
        margin-right: 5px;
        padding-left: 10px;
    }
    #class-list-search-area>form>input[type='submit']{
        width: 70px;
        height: 30px;
        border: none;
        background-color: #6667AB;
        color: white;
    }
    #class-list-search-area>form>input[type='submit']:hover{
        font-weight: bolder;
    }
    
    /* 테이블 */
    #class-list{
        border-top: 1px solid gray;
        margin-bottom: 50px;
    } 
    #my-class-list{
        border-top: 1px solid gray;
        margin-bottom: 50px;
        max-height: 60vh;
        overflow-y: auto;
    } 
    #my-class-list::-webkit-scrollbar{
        width: 5px;
    }
    #my-class-list::-webkit-scrollbar-thumb{
        background-color: #6667AB;
        border-radius: 50px;
    }
    #my-class-list::-webkit-scrollbar-track{
        background-color: white;
        border-radius: 50px;
    }
    #class-list-head, #my-class-list-head{
        display: grid;
        grid-template-columns: 1fr 1.5fr 3fr 1fr 1fr 1fr 1.3fr 0.7fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-bottom: 1px solid gray; 
        font-size: 13px;
    }
    .select-one-class{
        display: grid;
        grid-template-columns: 1fr 1.5fr 3fr 1fr 1fr 1fr 1.3fr 0.7fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-bottom: 1px solid gray;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    /* 히든부분 */
    .hidden-area{
        grid-column: span 8;
        /* background-color: #6667AB; */
        width: 100%;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .hidden-modal-btn{
        height: 30px;
        width: 70px;
        /* border-radius: 20px; */
        background-color: #6667AB;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 30px;
    }
        
    /* 페이징 */
    #page-area{
        height: 4vh;
        display: flex;
        flex-wrap: nowrap;
        justify-content: center;
        align-content: center;
        justify-items: center;
        align-items: center;
        column-gap: 5px;
    }
    #page-area>div{
        width: 3vh;
        height: 3vh;
    }
    #page-area a{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
        color: #6667AB;
    }
    #page-area a:hover, #page-area a:hover>i{
        cursor: pointer;
        background-color: #6667AB;
        color: white;
        font-weight: bolder;
    }
    #page-area a>i{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
    }

    /* 모달관련 */
    .addbgc{
        background-color: #6667AB;
        border: none;
        color: white;
    }
    .addbgc:hover{
        background-color: #6667AB;
        border: none;
        color: white;
        font-weight: bolder;
    }
    .modal-body{
        display: grid;
        grid-template-columns: 2fr 1fr 2fr;
        height: 600px;
    }
    .modal-footer{
        display: flex;
        justify-content: center;
    }
    /* 모달바디 */
    .student-list{
        width: 100%;
        height: 550px;
        border: 1px solid #6667AB;
        border-radius: 5px;
    }
    .student-list-online,.student-list-offline{
        width: 100%;
        height: 270px;
    }
    .student-list-online{
        margin-bottom: 10px;
    }
    .student-list-title{
        height: 50px;
        font-size: 13px;
        font-weight: bolder;
        display: flex;
        justify-items: center;
        align-items: center;
        padding-left: 10px;
    }
    .student-list-head{
        height: 30px;
        background-color: #6667AB;
        color: white;
        font-weight: bolder;
        display: grid;
        grid-template-columns: 30px 1fr;
        justify-items: center;
        align-items: center;
    }
    .student-list-online-title, .student-list-offline-title{
        background-color: #6667AB;
        color: white;
        height: 50px;
        font-size: 13px;
        font-weight: bolder;
        display: flex;
        justify-items: center;
        align-items: center;
        padding-left: 10px;
        border-top-right-radius: 10px;
        border-top-left-radius: 10px;
    }
    .student-list-online-body, .student-list-offline-body{
        border-right: 1px solid #6667AB;
        border-left: 1px solid #6667AB;
        border-bottom: 1px solid #6667AB;
        padding-bottom: 10px;
        height: 220px;
        overflow-y: scroll;
    }
    .student-list-bot{
        /* border: 1px solid red; */
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .time-input-btn, #insert-btn{
        border: none;
        border-radius: 5px;
        width: 70px;
        height: 27px;
        background-color: #6667AB;
        color: white;
    }
    .time-input-btn:hover, #insert-btn:hover{
        font-weight: bolder;
    }
    .student-list-body{
        /* background-color: black; */
        height: 410px;
        overflow-y: scroll;
    }
    .individual-student-list{
        height: 30px;
        border-bottom: 1px solid lightgray;
        display: grid;
        grid-template-columns: 30px 1fr;
        justify-items: center;
        align-items: center;
    }
    .student-list-body::-webkit-scrollbar, .student-list-online-body::-webkit-scrollbar, .student-list-offline-body::-webkit-scrollbar{
        width: 5px;
    }
    .student-list-body::-webkit-scrollbar-thumb, .student-list-online-body::-webkit-scrollbar-thumb, .student-list-offline-body::-webkit-scrollbar-thumb{
        background-color: #6667AB;
        border-radius: 50px;
    }
    .student-list-body::-webkit-scrollbar-track, .student-list-online-body::-webkit-scrollbar-track, .student-list-offline-body::-webkit-scrollbar-track{
        background-color: white;
        border-radius: 50px;
    }
    .after-time-check{
        display: grid;
        grid-template-columns: 40px;
        grid-template-rows: 1fr 1fr;
        justify-content: center;
        align-items: center;
    }
    .online-btns{
        display: grid;
        grid-template-rows: 40px 40px;
        /* justify-content: center;
        align-content: center; */
    }
    .after-time-check button{
        background-color: white;
        border: 1px solid #6667AB;
        color: #6667AB;
        font-weight: bolder;
        margin: 5px;
    }
    .after-time-check button:hover{
        background-color: #6667AB;
        color: white;
    }
</style>



<div id="roll-content-wrap">

	<c:if test="${not empty classByInstructor}">
    <div id="my-class-title"><h4>나의 강의</h4></div>

    <div id="my-class-list">
        <div id="my-class-list-head">
            <div><b>개강일자</b></div>
            <div><b>카테고리</b></div>
            <div><b>강의명</b></div>
            <div><b>담당강사</b></div>
            <div><b>강의실</b></div>
            <div><b>종강일자</b></div>
            <div><b>수업 시간</b></div>
            <div><b>인원</b></div>
        </div>

		<c:forEach items="${classByInstructor}" var="cl">
	        <div class="select-one-class">
                <input type="hidden" id="hidden-classNo" value="${cl.no}">
	            <div>${cl.beginDate}</div>
	            <div>${cl.categoryNo}</div>
	            <div>${cl.name}</div>
	            <div>${cl.memberNo}</div>
	            <div>${cl.classroom}</div>
	            <div>${cl.endDate}</div>
	            <div>${cl.startTime} ~ ${cl.finishTime}</div>
	            <div>${cl.max}명</div>
	
	            <div class="hidden-area">
	                <div class="hidden-modal-btn">출석체크</div>
	                <button type="button" class="addbgc btn" data-bs-toggle="modal" data-bs-target="#myModal">
	                    출석체크
	                </button>
	                <!-- The Modal -->
	                    <div class="modal fade" id="myModal">
	                        <div class="modal-dialog modal-lg">
	                        <div class="modal-content">
	                    
	                            <!-- Modal Header -->
	                            <div class="modal-header">
	                            <h4 class="modal-title">
	                                <i class="fa-solid fa-clipboard-user"></i>
	                                출석 체크</h4>
	                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	                            </div>
	                    
	                            <!-- Modal body -->
	                            <div class="modal-body">
	                                <div class="student-list">
	                                    <div class="student-list-title">수강생목록</div>
	                                    <div class="student-list-head">
	                                        <div><input type="checkbox" id="checkAll"></div>
	                                        <div><label for="checkAll">전체</label></div>
	                                    </div>
	                                    <div class="student-list-body">
                                            <div class="tot-student-list"></div>
	                                        <!-- <div class="individual-student-list"> -->
	                                            <!-- <div><input type="checkbox" id="student" class="checkEach"></div>
	                                            <div><label for="student">김철수</label></div> -->
	                                        <!-- </div> -->
	                                    </div>
                                        <div class="student-list-bot"><button class="time-input-btn">입실체크</button></div>
	                                </div>
                                    
	                                <div class="after-time-check">
                                        <div class="online-btns">
                                            <button class="add-to-online">></button>
                                            <button class="remove-from-online"><</button>
                                        </div>
                                        <div class="online-btns">
                                            <button class="add-to-offline">></button>
                                            <button class="remove-from-offline"><</button>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="student-list-online">
                                            <div class="student-list-online-title">온라인 수강</div>
                                            <div class="student-list-online-body">
                                                <div class="online-student-list">
                                                    <!-- <div><input type="checkbox" class=""></div>
                                                    <div><label for="">김철수</label></div> -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="student-list-offline">
                                            <div class="student-list-offline-title">오프라인 수강</div>
                                            <div class="student-list-offline-body">
                                                <div class="offline-student-list">
                                                    <!-- <div><input type="checkbox" class=""></div>
                                                    <div><label for="">김철수</label></div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
	                            </div>
	                    
	                            <!-- Modal footer -->
	                            <div class="modal-footer">
                                <button type="button" id="insert-btn">등록</button>    
	                            <button type="button" id="modal-close-btn" class="addbgc btn" data-bs-dismiss="modal">닫기</button>
	                            </div>
	                    
	                        </div>
	                        </div>
	                    </div>
	                <!-- ---- -->
	            </div>
	        </div>
		</c:forEach>
        
    </div>
	</c:if>

    <div id="choose-class-title"><h4>강의별 출결 조회</h4></div>

    <div id="class-list-search-area">
        <form action="">
            <select name="categoryNo">
                <option value="">카테고리 전체</option>
                <c:forEach items="${categoryList}" var="t">
                <option value="${t.no}">${t.name}</option>
                </c:forEach>
            </select>
            <input type="text" name="keyword" value="${keyword}" placeholder="강의명을 입력해주세요">
            <input type="submit" value="강의 검색">
        </form>
    </div>
    
    <div id="class-list">
        <div id="class-list-head">
            <div><b>개강일자</b></div>
            <div><b>카테고리</b></div>
            <div><b>강의명</b></div>
            <div><b>담당강사</b></div>
            <div><b>강의실</b></div>
            <div><b>종강일자</b></div>
            <div><b>수업 시간</b></div>
            <div><b>인원</b></div>
        </div>

    	<c:forEach items="${classList}" var="c">
	        <div class="select-one-class" onclick="location.href='/md/academy/roll/detail/${c.no}'">
	            <div>${c.beginDate}</div>
	            <div>${c.categoryNo}</div>
	            <div>${c.name}</div>
	            <div>${c.memberNo}</div>
	            <div>${c.classroom}</div>
	            <div>${c.endDate}</div>
	            <div>${c.startTime} ~ ${c.finishTime}</div>
	            <div>${c.max} 명</div>
	        </div>
        </c:forEach>

        
        
    </div>

    <div id="page-area">
        <c:if test="${pvo.startPage gt 5}">
        	<div><a href="${root}/academy/roll/1"><i class="fa-solid fa-angles-left"></i></a></div>
        </c:if>
        
        <c:if test="${pvo.startPage ne 1}">
	        <div><a href="${root}/academy/roll/${pvo.startPage-1}"><i class="fa-solid fa-angle-left"></i></a></div>
        </c:if>
        
        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="i">
	        <div><a href="${root}/academy/roll/${i}">${i}</a></div>
        </c:forEach>
        
        <c:if test="${pvo.endPage ne pvo.maxPage}">
        	<div><a href="${root}/academy/roll/${pvo.endPage+1}"><i class="fa-solid fa-angle-right"></i></a></div>
        </c:if>
        <c:if test="${pvo.endPage ne pvo.maxPage}">
        	<div><a href="${root}/academy/roll/${pvo.maxPage}"><i class="fa-solid fa-angles-right"></i></a></div>
        </c:if>	
    </div>

</div>

<script>/* 클릭하면 hidden보여주기 */
    $('.hidden-area').hide();
    // $('.hidden-area').attr('style', 'display:none')
    $('.select-one-class').on('click', function(){
        // if($(this).children('div:eq(8)').css('display') == 'none'){
            $(this).children('div:eq(8)').show(400);
            // $(this).children('div:eq(8)').attr('style', 'display:flex')
        // }else{
            // $(this).children('div:eq(8)').attr('style', 'display:none')
        // }
    });
</script>

<script>
    let checkAll = $('#checkAll')
    checkAll.on('click', function(){
        if(checkAll.is(':checked') == true){
            $('.checkEach').prop("checked", true);
        }else{
            $('.checkEach').prop("checked", false);
        }
    })
</script>

<script>
    let cno = $('#hidden-classNo').val();
    $('#myModal').on('show.bs.modal', getStudentList());
    
    function getStudentList(){
        console.log(cno);

        $.ajax({
            type : 'get',
            url : '${root}/academy/my/' + cno,
            success : function(svo){
                console.log('good');
                console.log(svo);
                console.log(svo[0].no);
                let l = svo.length;
                for(let i = 0; i < l; i++){
                    $('.student-list-body').append('<div class="individual-student-list"> <div><input type="checkbox" id="' + svo[i].no + '" class="checkEach" value="' + svo[i].no + '"></div> <div><label for="' + svo[i].no + '">' + svo[i].name + '</label></div> </div>');
                }

                
            },
            error : function(){
                console.log('not good');
            }
        });

    };
</script>

<script>
    $('.time-input-btn').on('click', function(){

        let classNo = $('input:hidden').val();
        console.log('classNo : ' + $('input:hidden').val());

        let checkedStudents = [];

        $('input:checkbox[class=checkEach]:checked').each(function(i){
            checkedStudents.push($(this).val());
        });

            console.log(checkedStudents);

        if(checkedStudents.length != 0){
            $.ajax({
                method : 'post',
                url : '${root}/academy/time',
                data : {
                    "studentNo" : JSON.stringify(checkedStudents),
                    "classNo" : classNo
                },
                success : function(x){
                    console.log('success!');
                    
                    if(x == 'checkedStudents'){
                        Swal.fire({
                            icon: 'success',
                            title: '시간이 입력되었습니다.'
                        });

                        $('#checkAll').prop('checked', false);
                        $('.checkEach').prop('checked', false);

                        $('.time-input-btn').prop('disabled', true);
                        $('.time-input-btn').css('color', 'lightgray');
                        $('.time-input-btn').unbind('hover');

                    }else{
                        Swal.fire({
                            icon: 'warning',
                            title: 'Something got wrong!'
                        });
                    }
                },
                error : function(){
                    console.log('time-input failed!');
                }
            });
        }else{
            Swal.fire({
                icon: 'warning',
                title: '수강생을 선택해주세요!'
            });
        }
    });

    
</script>

<script>
    $('.add-to-online').on('click', function(){
        $('input:checkbox[class=checkEach]:checked').parent().parent().insertAfter($('.online-student-list'));
        $('input:checkbox[class=checkEach]:checked').prop('checked', false);
        $('input:checkbox[id=checkAll]:checked').prop('checked', false);
    });

    $('.remove-from-online').on('click', function(){
        $('input:checkbox[class=checkEach]:checked').parent().parent().insertAfter($('.tot-student-list'));
        $('input:checkbox[class=checkEach]:checked').prop('checked', false);
        $('input:checkbox[id=checkAll]:checked').prop('checked', false);
    });

    $('.add-to-offline').on('click', function(){
        $('input:checkbox[class=checkEach]:checked').parent().parent().insertAfter($('.offline-student-list'));
        $('input:checkbox[class=checkEach]:checked').prop('checked', false);
        $('input:checkbox[id=checkAll]:checked').prop('checked', false);
    });

    $('.remove-from-offline').on('click', function(){
        $('input:checkbox[class=checkEach]:checked').parent().parent().insertAfter($('.tot-student-list'));
        $('input:checkbox[class=checkEach]:checked').prop('checked', false);
        $('input:checkbox[id=checkAll]:checked').prop('checked', false);
    });

    $('#insert-btn').on('click', function(){
        let online = [];
        let offline = [];
        $('.student-list-online-body').find('input:checkbox[class=checkEach]').each(function(i){
            online.push($(this).val());
        })
            console.log('online : ' + online);
        $('.student-list-offline-body').find('input:checkbox[class=checkEach]').each(function(i){
            offline.push($(this).val());
        })
            console.log('offline : ' + offline);

        if(online.length == 0 && offline.length == 0){
            Swal.fire({
                icon: 'warning',
                title: '온,오프라인 여부를 선택해주세요!'
            });
        }else{
            $.ajax({
                
            });
        }
    });
</script>

