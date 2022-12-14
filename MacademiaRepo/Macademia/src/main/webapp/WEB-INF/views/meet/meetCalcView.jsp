<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회의실 예약 - 예약 캘린더 </title>
    <link href="${root}/resources/assets/vendor/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="${root}/resources/assets/css/style.css" rel="stylesheet">
    
    <style type="text/css">
        
    </style>
</head>

<body>

    <!-- Main wrapper start -->
    <div id="main-wrapper">	

		<c:import url="../common/menubar.jsp"/>
    
        <!-- Content body start -->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>회의실 예약 캘린더</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">회의실 예약</li>
                            <li class="breadcrumb-item active"><a href="mrcalview.mr">예약 캘린더</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div id="calendar" class="app-fullcalendar"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="d-flex justify-content-start">
                            <span class="badge badge-success">예약 완료</span>
                            <span class="badge badge-secondary">사용 완료</span>
                            <span class="badge badge-warning">예약 취소</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--Content body end -->


        <!-- Footer start -->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">MacademiA</a> 2022</p>
            </div>
        </div>
        <!-- Footer end -->      
          
    </div>
    <!--Main wrapper end-->
    
    
    <!-- vendors -->
    <script src="${root}/resources/assets/vendor/global/global.min.js"></script>
    <script src="${root}/resources/assets/js/quixnav-init.js"></script>
    <script src="${root}/resources/assets/js/custom.min.js"></script>



    <script src="${root}/resources/assets/vendor/jqueryui/js/jquery-ui.min.js"></script>
    <script src="${root}/resources/assets/vendor/moment/moment.min.js"></script>

    <script src="${root}/resources/assets/vendor/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="${root}/resources/assets/js/plugins-init/fullcalendar-init.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.0/dist/locale/ko.js"></script>
    
    <script>
        $('#calendar').fullCalendar('destroy');
        var uNo = '${ loginMember.no }';
        
        $('#calendar').fullCalendar({
            locale: 'ko',
            lang: 'ko',
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek'
            },
            views: {
                basicWeek: {
                    hiddenDays: [ 0, 6 ]
                }
            },
            themeSystem: 'bootstrap4',
            height: 'parent',
            timeFormat: 'HH:mm',
            handleWindowResize: false,
            displayEventEnd: true,
            eventLimit: true,
            events: function(start, end, timezone, callback) {
                $.ajax({
                    url: 'mr/mrcal.mr',
                    dataType: 'json',
                    success: function(data) {
                        console.log(data);
                        
                        var events = [];
                        
                        $.each(data, function(index, item) {
                            if(data.length > 0) {
                                events.push({
                                    title: item.meet_name + ' [' + item.rev_no + '] ' + item.mName,
                                    start: item.rev_start_time,
                                    end: item.rev_end_time,
                                    no: item.rev_no,
                                    color: item.rev_status == 0 ? '#71d540' : (item.rev_status == 1 ? '#6e32b3' : '#ffad33'),
                                    url: (item.mNo != uNo || (item.mNo == uNo &&item.rev_status != 0)) ? ('mrdetail.mr?rNo=' + item.rev_no + '&page1=1&cal=1') : ('mrupdateview.mr?rNo=' + item.rev_no + '&page2=1&cal=1')
                                });
                            }
                        });
                        
                        callback(events);
                    },
                    error: function(data) {
                        console.log(data);
                    }
                });
            },
            eventRender: function(event, element) {
                element.css('font-size', '0.85em');
                element.css('padding', '1px');
                element.css('font-weight', 'lighter');
            }
        });
        
        $('#calendar').fullCalendar('render');
    </script>

</body>

</html>