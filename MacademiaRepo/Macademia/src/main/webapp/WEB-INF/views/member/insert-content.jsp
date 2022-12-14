<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    #insert-content{
        height: 80vh;
        width: 60vw;
        /* border: 1px solid black; */
        font-family:'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    h1{
        margin : 20px;
        color: rgb(61, 61, 61);
    }
    #member-form{
        width: 100%;  
    }
    #container{
        /* width: 100%; */
        display: grid;
        /* border: 1px solid grey; */
        /* border-radius: 15px; */
        grid-template-columns: 200px 200px 270px 200px 270px;
        grid-template-rows: repeat(9, 50px);
        margin:0 auto;
        font-size: 20px;
    }
    #container label{
        background-color: rgb(232, 230, 241);
        display: flex;
        /* width: 100%; */
        /* height: 100%; */
        align-items: center;
        justify-content: center;
    }
    #container input, #profile-wrap {
        border: 1px solid #d5d5e1;
    }
    #container input, #container select{
        padding-left: 10px;
    }
    #profile-img-wrap{
        width: 100%;
        height: 100%;
        grid-row: 1/6;
        display: grid;
        grid-template-rows: 4fr 1fr;
        position: relative;
    }
    #profile-img-wrap img{
        width: 100%;
        height: 200px;
    }
    #quitYnBadge{
        position: absolute;
        top: 5px;
        left: 5px;
    }
    .bg-success{background-color: rgb(39, 194, 39) !important;}
    .bg-danger{background-color: rgb(255, 30, 30) !important;}

    #name-wrap{
        /* border: 1px solid red; */
        display: grid;
        grid-template-columns: 1fr 2fr;
        text-align: center;
    }
    #name-wrap *{
        height: 100%;
        width: 100%;
        display: grid;
        align-items: center;
        justify-content: center;
        background-color: #9393c1 !important;
        color: white;
        font-weight: 700;
        border: none !important;
    }
    #address, #address2{
        grid-column: 2/6;
    }

    #profile-wrap{
        display: flex;
        align-items: center;
        width: 100%;
        grid-column: 2/6;
    }
    #profile{
        border : none !important;
    }


    #btn-wrap{
        /* border: 1px solid black; */
        display: flex;
        justify-content: center;
    }
    #submit-btn{
        background-color: rgb(131, 120, 180);
        width: 20%;
        height: 40px;
        border: none;
        border-radius: 20px;
        color: white;
        font-size: 20px;
        margin: 20px;
    }
    #submit-btn:hover{
        background-color: rgb(103, 93, 151);
        transition: 0.5s;
    }
    #pwd-change-btn{
        background-color: rgb(206, 80, 80);
        width: 20%;
        height: 40px;
        border: none;
        border-radius: 20px;
        color: white;
        font-size: 20px;
        margin: 20px;
    }
    #pwd-change-btn:hover{
        background-color: rgb(197, 49, 49);
        transition: 0.5s;
    }
    .modal-content{
        font-family:'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 20px;
    }
    .modal-body{
        display: grid;
        grid-template-columns: 1fr 2fr;
        grid-template-rows: 1fr 1fr;
        row-gap: 10px;
        column-gap: 10px;
        font-size: 20px;
    }
    .modal-body label{
        text-align: right;
    }
</style>



<div id="insert-content">
    <h1>?????? ????????????</h1>
    <hr>
    <form id="member-form" action="" method="post" enctype="multipart/form-data">
        <div id="container">
            <div id="profile-img-wrap">
                <img id="profile-thumbnail" src="/md/resources/upload/profile/guest12341234.png" alt="??????????????????">
                <div id="name-wrap">
                    <label id="name-label" for="name">??????</label>
                    <!-- <div>??????</div> -->
                    <input id="name" name="name" type="text" placeholder="??????????????????">
                </div>
            </div>
            <input type="hidden" id="profileName" name="profileName" value="${loginMember.profileName}">
            <input type="hidden" id="grade" name="grade" value="${loginMember.grade}">
            <input type="hidden" id="positionNo" name="positionNo" value="${loginMember.positionNo}">

            <label for="enrollDate">?????????</label>
            <input type="date" id="startDate" name="startDate" required> 
            <label for="quitDate">?????????</label>
            <input type="date" id="quitDate" name="quitDate" readonly> 
            <label for="dept">??????</label>
            <input type="text" id="dept" name="dept"> 
            <label for="phone">????????????</label>
            <input type="text" id="phone" name="phone">  
            <label for="position">??????</label>
            <input type="text" id="position" name="position">
            <label for="bank">??????</label>
            <select id="bank" name="bankNo">
            	<option value="none">=====??????=====</option>
            </select>
            <label for="rank">??????</label>
            <input type="text" id="rank" name="rank" readonly> 
            <label for="email">????????????</label>
            <input type="text" id="account" name="account"> 
            <label for="email">???????????????</label>
            <input type="text" id="email" name="email"readonly> 
            <label for="private-email">???????????????</label>
            <input type="text" id="private-email" name="privateEmail"> 

            <label for="address">??????</label>
            <input type="text" id="address" name="address"> 
            <label for="address2">????????????</label>
            <input type="text" id="address2" name="address2"> 

            <label for="email">???????????????</label>
            <div id="profile-wrap">
                <input type="file" id="profile" name="profile" onchange="readURL(this);"> 
            </div>
            
        </div>
        <div id="btn-wrap">
            <input type="button" id="pwd-change-btn" value="??????????????????" >
            <input type="button" id="submit-btn" value="????????????">
        </div>
        <!-- data-bs-toggle="modal" data-bs-target="#myModal" -->
    </form>
</div>
  
<!-- The Modal -->
<div class="modal fade" id="myModal">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">???????????? ??????</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <form action="">
            <!-- Modal body -->
            <div class="modal-body">
                <label id="" for="pwd">??????????????????</label>
                <input type="password" id="modal-pwd" name="pwd" placeholder="4?????? ???????????? ??????????????????"> 
                <label id="" for="pwd2">??????????????????</label>
                <input type="password" id="modal-pwd2" name="pwd2">   
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">??????</button>
            </div>
        </form>

    </div>
</div>
</div>

<!-- ??????????????? ?????? -->
<script>
    console.log('${loginMember}')
</script>

<!-- ???????????? API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const width = 500;
const height = 500;
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ 
        new daum.Postcode({
            width:width,
            height:height,
            oncomplete: function(data) { 
                document.getElementById("address").value = data.address; 
                document.getElementById("address2").focus(); 
            }
        }).open({
            top:window.screen.height/2-width/2,
            left:window.screen.width/2-height/2
        });
    });
}
</script>

<!-- ???????????? ???????????? -->
<script>
    $.ajax({
        url : '/md/member/bank/list',
        method : 'get',
        success : function(result){
            console.log(result);
            $('#bank').children('option:not(:first)').remove();
            let myBankNo = '${loginMember.bankNo}'
            $(result).each(function(i){ 
                if(result[i].no == myBankNo){
                    $('#bank').append("<option value='"+result[i].no+"' selected>"+result[i].name+"</option>");
                } else {
                    $('#bank').append("<option value='"+result[i].no+"'>"+result[i].name+"</option>");
                }
            })
        },
        error : function(e){
            console.log("????????????");
        }
    })
</script>

<!-- ????????? ?????? ???????????? -->
<script type="text/javascript">
    $(function() {
        $("#profile").on('change', function(){
        readURL(this);
        });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            $('#profile-thumbnail').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<!-- ???????????? ????????? ?????? -->
<script>
    function pwdCheck(pwd,pwd2){
        if(pwd=="" || pwd2==""){
            Swal.fire({
                title : "??????????????? ?????? ???????????????????",
                icon : 'question'
            })
            return false;
        }
        else if(pwd != pwd2){
            Swal.fire({
                title : "????????????/????????? ??????????????????",
                icon : 'warning'
            })
            return false;
        }
        else if(pwd.length < 4 || pwd2.length < 4){
            Swal.fire({
                title : "???????????? ????????? ????????????",
                text : "??????????????? ?????? 4?????????????????? ??????????????????",
                icon : 'warning'
            })
            return false;
        }
        return true;
    }
</script>

<!--?????????????????? ??? ???????????? ?????? ??? ?????? -->
<script>
    $('#submit-btn').on('click',function(){
        const pwd = $('#pwd').val();
        const pwd2 = $('#pwd2').val();
        if(pwdCheck(pwd,pwd2)){
           document.getElementById('member-form').submit(); 
        } 
    });

</script>

<!--?????????????????? ??? ????????? ?????????????????? ?????? ??? ?????? -->
<script>
    $('#pwd-change-btn').on('click',function(){
        const no = $('#no').val();
        const pwd = $('#pwd').val();
        const pwd2 = $('#pwd2').val();
        if(pwdCheck(pwd,pwd2)){
            $.ajax({
                url : "/md/member/checkpwd",
                type : "post",
                data : {
                    "no" : no,
                    "pwd" : pwd
                },
                success : function(response){
                    if(response==0) Swal.fire({title : "???????????? ?????????", icon : 'error'});
                    else{
                        changePwd();
                    }
                },
                error : function(e){
                    Swal.fire({title : "????????????", icon : 'warning'})
                }
            })
        }
    });
</script>








