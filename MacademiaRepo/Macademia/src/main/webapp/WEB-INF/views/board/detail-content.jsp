<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="board_wrap">
        <div class="board_title">
          <strong>${vo.categoryNo}의 ${vo.no}번 게시물</strong>
        </div>
        <div class="board_view_wrap">
           
            <div class="board_view">
                
                <div class="title">
                    ${vo.title}
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${vo.no}</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${vo.userNo}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${vo.regdate}</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${vo.hit}</dd>
                    </dl>
                </div>
                <div class="cont" style="height: 500px">
                    ${vo.content}
                </div>
            </div>
            <div class="board_view">
             	<div>
				<textarea style="width:100%;" id="reply-content" name="content"></textarea>
					<p style="text-align: right;">
						<button id="reply-btn" class="reply"  >댓글작성</button>
					</p>
				</div>
             	
             	<div class="cont">
           		<c:forEach items="${replyVo}" var="x" >
                    <dl>
                        <dd>${x.name}</dd>
                        <dd>${x.content}</dd>
                        <dd>${x.regdate}</dd>
                    </dl>
                   
                     </c:forEach>
             	</div>
             </div>   
            <div class="bt_wrap">
                <a href="/md/board/main" class="on">목록</a>
                <a href="${root}/board/edit/${vo.no}">수정</a>
            </div>
        </div>
    </div>
    
    <script>
		const replyBtn = document.querySelector('#reply-btn');	
		replyBtn.addEventListener('click', function() {
			const replyContent = document.querySelector('#reply-content').value;
			const boardNo = ${vo.no};
			console.log(boardNo);
			const name = '${sessionScope.loginMember.name}'; 
			$.ajax({
				url : "/md/reply/write",
				type : "POST",
                data : {"content" : replyContent,
						"boardNo" : boardNo,
						"name" : name 
				},
				success : function(data){
					
						alert("댓글 작성 성공 !!!");	
						const target = document.querySelector('#reply-list')
						//기존에 입력한 내용 지우기
						document.querySelector('#reply-content').value = '';
						//다시 불러오기
						location.reload();
					},
					
				})
				
			
		})
		
	</script>
