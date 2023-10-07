<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.CityDto"%>
<%@page import="dao.CityDao"%>
<%@page import="dto.CityPlanDto"%>

<%
	int pno=0;
	int idx=0;
	if(session.getAttribute("idx")!=null){
		idx = (int)session.getAttribute("idx");
	}
	if(session.getAttribute("pno")!=null){
		pno = (int)request.getAttribute("pno");
	}
	ArrayList<CityDto> CityList = (ArrayList<CityDto>)request.getAttribute("CityList");
	ArrayList<CityDto> CityLike =  (ArrayList<CityDto>)request.getAttribute("CityLike");
	ArrayList<CityPlanDto> CityPlan = (ArrayList<CityPlanDto>)request.getAttribute("CityPlan");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/planner.css">
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDuc8Cndo6uSieIk-xKj1tCtcIE-7ewKes&callback=initMap"></script>
	<link rel="stylesheet" href="resources/css/popup.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="resources/js/datepicker.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
</head>
	<script>
	$(function() {
		$("#addtrip").on("click",function(){
/*시작날짜*/	let start = $.datepicker.formatDate("yy/mm/dd",$("#datepicker").datepicker("getDate"));
			let cnt = $("section").length;
			let enddate = $("#datepicker").datepicker("getDate");
			let answer = confirm("일정을 저장하시겠습니까?")
			if(answer){
				let sum=0;
				for(var i = 0; i<cnt; i++){
					sum = sum+Number($(".addday > .visitday:eq("+i+")").text());
					let id = $(".addday:eq("+i+")").attr("cityid");
					let order = $("section:eq("+i+")").attr("plan_order");
					let visitday = $(".visitday:eq("+i+")").text();
			 		list.push({cityid:id , plan_day:visitday});
				}
/*종료날짜*/		enddate.setDate(enddate.getDate()+sum);
				enddate = $.datepicker.formatDate("yy/mm/dd",enddate);
			 	list.push({pno:<%=pno%>,p_cnt:cnt,idx:<%=idx%>,p_start:start,p_end:enddate});
			 	/*cityroute에 선택된 도시들과 정보들과 참조하는 하나의값 전달  */
			 	var list2 = {"list":JSON.stringify(list)};
			 	$.ajax({
					 type: "POST",
					 url : "Controller?command=setmyplan",
					 data : list2,
					 traditional : true,
					 success : function (){
						 alert("일정이 저장되었습니다.");
						 location.href = "Controller?command=MainPage";
					 },
						 error:function(e){
							 console.log(e);
							 alert("실패");
						 }
				});
			};
		});
		/*체류기간 팝업창 체류기간 선택 효과와 cityroute의 체류기간 값 변화  */
		$(document).on("click",".select",function() {
			const day = $(this).children().attr("class");
			$(this).removeClass("active");
			$(this).parent().parent().children().children("th").removeClass("active");
			$(this).addClass("active");//그 요소에게 효과주고
			const selectday=$(this).closest(".popup2").attr("num");
			switch(day){
				case "select0":
					$("section[num="+selectday+"]").find(".visitday").text(0);
					break;
				case "select1":
					$("section[num="+selectday+"]").find(".visitday").text(1);
					break;
				case "select2":
					$("section[num="+selectday+"]").find(".visitday").text(2);
					break;
				case "select3":
					$("section[num="+selectday+"]").find(".visitday").text(3);
					break;
				case "select4":
					$("section[num="+selectday+"]").find(".visitday").text(4);
					break;
				case "select5":
					$("section[num="+selectday+"]").find(".visitday").text(5);
					break;
				case "select6":
					$("section[num="+selectday+"]").find(".visitday").text(6);
					break;
				case "select7":
					$("section[num="+selectday+"]").find(".visitday").text(7);
					break;
				case "select8":
					$("section[num="+selectday+"]").find(".visitday").text(8);
					break;
				case "select9":
					$("section[num="+selectday+"]").find(".visitday").text(9);
					break;
			}
			resetdate();
		});
	});

	var num = 10;
	var nowdate=$("datepicker").val();
	var city = [];
	var list = [];
	/* 마커와 마커팝업에 뿌려줄 도시 정보들 city[]에 값 전달 */
	<% for(int i = 0 ; i <=CityList.size()-1 ; i++){ 
		int natid = CityList.get(i).getNatid();
		int Cityid = CityList.get(i).getCityid();
		int rank = CityList.get(i).getRank();
		double lat = CityList.get(i).getLat();
		double lon = CityList.get(i).getLon();
		String name = CityList.get(i).getName();
		String why = CityList.get(i).getWhy();
		String tip = CityList.get(i).getTip();
		why = why.replaceAll("[^ㄱ-ㅎ가-힣a-zA-Z0-9\s.!]", "");
		tip = tip.replaceAll("[^ㄱ-ㅎ가-힣a-zA-Z0-9\s.!]", "");
		%>
		city.push({natid:<%=natid%>, idx:<%=Cityid%>, rank:<%=rank%>, lat:<%=lat%>, lng:<%=lon%>, name:"<%=name%>",img_src: "resources/images/city/<%=name%>.jpg", why:"<%=why%>", tip:"<%=tip%>"});
	<%
	}
	%>
$(function(){
	var isComplete = false;
/* 검색창 키 입력시 값이 포함된 도시리스트 생성 */
	$("#search_input").keyup(function() {
		let txt = $(this).val();
		if (txt != '') {
			$("#autoMaker").children().remove();
			city.forEach(function(arg) {
				if (arg.name.indexOf(txt) > -1) {
					$("#autoMaker").append(
						$("<li>").text(arg.name).attr({ "cityid": arg.idx })
					);
				};
			});
		$("#autoMaker").children().each(function() {
			$(this).click(function() {
				$("#search_input").val($(this).text());
				$("#autoMaker").children().remove();
				isComplete = true;
			});
		});
		} else {
		$("#autoMaker").children().remove();
		};
});
/*검색창에 아무 값이 없을때 검색창 클릭시 모든 도시 리스트 생성 */
	$("#search_input").click(function(e){
		$("#autoMaker").children().remove();
		let result = $(this).val();
		if(result==''){
			city.forEach(function(arg) {
				$("#autoMaker").append(
					$("<li>").text(arg.name).attr({ "cityid": arg.idx }))
			});
		};
		$("#autoMaker").children().each(function() {
			$(this).click(function() {
				$("#search_input").val($(this).text());
				$("#autoMaker").children().remove();
				isComplete = true;
			});
		});
		$("#map").mousedown(function(){
			$("#autoMaker").children().remove();
		});
	});
	/* MY 위시리스트 도시 목록에서 제거  */
	$(document).on("click",".ico_like",function(){
		let cityid = $(this).prev().attr("cityid");
		let answer = confirm("찜한 도시에서 삭제하시겠습니까?")
		let box = $(this).closest(".list");
		if(answer){
			$.ajax({
				type:"POST",
				url:"Controller?command=cityLikeBtn",
				data:{idx:${idx},cityId:cityid},
				success : function(){
					console.log("성공");
					box.remove();
				}, error : function(){
					console.log("실패");
				}
			});
		}
	});
});
		/* 지도정보,폴리라인 정의 */
	function initMap() {
		const lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,};
		var myIcon = new google.maps.MarkerImage("resources/images/marker.png", null, null, null, new google.maps.Size(10, 10));
		let map = new google.maps.Map(document.getElementById("map"), {
			center: { lat: 48.857696094342, lng: 2.34874913191027 },
			zoom: 5,
			disableDefaultUI: true,
			mapId: '82e2842e320ebf9a'

		});
		poly = new google.maps.Polyline({
			strokeColor: "#000000",
			strokeOpacity: 1.0,
			strokeWeight: 3,
			scale: 5,
			icons:[{icon:lineSymbol,offset:"100%"}],
			zIndex:10
		});
		poly.setMap(map);
		const infowindow = new google.maps.InfoWindow();
		/* 구글맵API 위도,경도에 맞게 마커생성 */
		function setMarkers(map) {
			city.forEach(({ name, lat, lng, img_src, why, rank, idx, tip, natid }) => {
				const ctt = '<div class="fl infol"><div><img src="' + img_src + '"/></div><button class="book"><a href="SearchSub.jsp?nat_id='+natid+'&city_id='+idx+'" target="_blank">가이드북</a></button></div><div class="fl inforr"><img src="resources/images/flag.gif"><span id="title">' + name + '</span><span id="rank">' + rank + '</span><div id="discript">' + why + '</div></div><div class="fl"><button class="addcity" cityid="' + idx + '"><img src="resources/images/addcity.png"></button></div>';
				const marker = new google.maps.Marker({
					position: { lat, lng },
					title: ctt,
					map: map,
					icon: myIcon,
				});
				
				marker.setZIndex(-1);
				$(function() {    //MY 위시리스트 도시 '+' 버튼 클릭시 cityroute에 도시 일정추가
					
					$(document).on("click", 'button.addcity[cityid="' + idx + '"]', function() {
						const str1 = '<section class="plan" lat=' + lat + ' lng=' + lng + '>'
							+ ' <div id="planday" class="fl">'
							+ ' <div class="line"></div>'
							+ ' <div class="circle"><button class="addday" cityid="' + idx + '"><span class=visitday>4</span>박</button><span>∨</span></div>'
							+ ' <div class="line"></div>'
							+ ' </div>'
							+ ' <div id="planbox" class="fl">'
							+ ' <div id="plantitle" >' + name + '<button id="del_plan"></button></div>'
							+ ' <div class="plandate"> <span class="date"></span><span class="plusdate"></span></div>'
							+ ' </div>'
							+ ' <div style="clear:both"></div>'
							+ ' </section >';
						const str2 = '<div class="popup2" cityid="' + idx + '">'
							+ '<div class="popup2main">'
							+ '<div>'
							+ '<h1>' + name + ' 체류기간 선택</h1>'
							+ '<div>'
							+ '<button class="fr xbox" cityid="' + idx + '"></button>'
							+ '</div>'
							+ '</div>'
							+ '<div id="popup2day">'
							+ '<table>'
							+ '<tr>'
							+ '<th class="select"><div class="select0">무박</div></th>'
							+ '<th class="select"><div class="select1">1박</div></th>'
							+ '<th class="select"><div class="select2">2박</div></th>'
							+ '<th class="select"><div class="select3">3박</div></th>'
							+ '<th class="select active"><div class="select4">4박</div></th>'
							+ '</tr>'
							+ '<tr>'
							+ '<th class="select"><div class="select5">5박</div></th>'
							+ '<th class="select"><div class="select6">6박</div></th>'
							+ '<th class="select"><div class="select7">7박</div></th>'
							+ '<th class="select"><div class="select8">8박</div></th>'
							+ '<th class="select"><div class="select9">9박</div></th>'
							+ '</tr>'
							+ '</table>'
							+ '</div>'
							+ '<div id="popup2ctt">'
							+ '<h2>체류기간 선택TIP</h2>'
							+ '<br/>'
							+ '<p>' + tip + '</p>'
							+ '<br/>'
							+ '<h2>Why ' + name + '?</h2>'
							+ '<br/>'
							+ '<p>' + why + '</p>'
							+ '</div>'
							+ '</div>'
							+ '</div>'
						$("#popup2body").append(str2);
						$("#cityroute").append(str1);
						resetdate();
						infowindow.close();
						poly.getPath().push(new google.maps.LatLng($('section:last').attr("lat"), $('section:last').attr("lng")));
						$('section:last').attr("num", num);
						$('.popup2:last').attr("num", num);
						num = num + 1;
						sortPlanorder(); 
					});
				$("#cityroute").sortable({	//cityroute의 생성한 도시들 sortable로 관리
					stop: function(event, ui) {
						resetdate();
						sortPlanorder();
						const plancnt = $("section.plan").length;
						delPolyline();
						poly = new google.maps.Polyline({
							strokeColor: "#000000",
							strokeOpacity: 1.0,
							strokeWeight: 3,
							zindex: 101,
							icons:[{icon:lineSymbol,offset:"100%"}]
						});
					poly.setMap(map);
						for (var i = 0; i < plancnt; i++) {
							    var lat = parseFloat($('section:eq(' + i + ')').attr("lat"));
							    var lng = parseFloat($('section:eq(' + i + ')').attr("lng"));
							    poly.getPath().push(new google.maps.LatLng(lat, lng));
						}		
						poly.setMap(map);
					}
				});
					/* 도시 체류기간팝업창 열기/닫기 */
					$(document).on("click", 'button.addday[cityid="' + idx + '"]', function() {
						let planday=$(this).parents("section").attr("num")
						$('div.popup2[num=' + planday + ']').show();
					});
					$(document).on("click", 'button.xbox[cityid="' + idx + '"]', function() {
						$('div.popup2[cityid="' + idx + '"]').hide();
					});
				});
				
				/* 검색창 리스트 클릭시 해당 마커로 이동/마커팝업OPEN  */
				$(document).on("click", 'li[cityid="' + idx + '"]', function() {
					map.setCenter(marker.getPosition());
					infowindow.setContent(marker.getTitle());
					infowindow.open(marker.getMap(), marker);
				});
				/* 마커클릭시 마커팝업 열기 */
				marker.addListener('click', function() {
					infowindow.close();
					map.setCenter(marker.getPosition());
					infowindow.setContent(marker.getTitle());
					infowindow.open(marker.getMap(), marker);
				});
			});
			/* 리스트 삭제시 폴리라인/날짜 재정렬 */
			$(document).on("click", "#del_plan", function() {
					let answer = confirm('정말 삭제하시겠습니까?');
					if (answer) {
						$(this).closest('section').remove();
						resetdate();
						sortPlanorder();
						const plancnt = $(".plan").length;
						delPolyline();
						poly = new google.maps.Polyline({
							strokeColor: "#000000",
							strokeOpacity: 1.0,
							strokeWeight: 3,
							zindex: 101,
							icons:[{icon:lineSymbol,offset:"100%"}]
						});
						poly.setMap(map);
						for (var i = 0; i < plancnt; i++) {
							    var lat = parseFloat($('section:eq(' + i + ')').attr("lat"));
							    var lng = parseFloat($('section:eq(' + i + ')').attr("lng"));
							    poly.getPath().push(new google.maps.LatLng(lat, lng));
						}	
					}
				});
			/* 나의 일정 로드시 날짜/폴리라인 재정렬 */
			$(document).ready(function(){
				const plancnt = $(".plan").length;
				delPolyline();
				poly.setMap(map);
				for (var i = 0; i < plancnt; i++) {
					    var lat = parseFloat($('section:eq(' + i + ')').attr("lat"));
					    var lng = parseFloat($('section:eq(' + i + ')').attr("lng"));
					    poly.getPath().push(new google.maps.LatLng(lat, lng));
				}	
				sortPlanorder();
				resetdate();
			})
			function delPolyline() {
				poly.setMap(null);
			};
		}
		setMarkers(map);
	window.initMap = initMap;
	}
	</script>




<body>
	<div id="mapcontrolleft">
		<div id="header">
			<div id="box">
				<a href="Controller?command=MainPage">
				<img id="mainlink" src="resources/images/plannerlogo.png" />
				</a>
				<div id="calendar">
					<label for="datepicker">📅출발</label> <input type="text" id="datepicker">
				</div>
			</div>
		</div>
		<div id="cityroute">
		<%	if(!(CityPlan==null)){
				for(int i = 0 ; i <= CityPlan.size()-1 ; i ++){
					%>
					<section class="plan" lat=<%=CityPlan.get(i).getLat()%> lng=<%=CityPlan.get(i).getLon()%> num=<%=CityPlan.get(i).getPlanOrder()%>>
					<div id="planday" class="fl">
					<div class="line"></div>
					<div class="circle"><button class="addday" cityid=<%=CityPlan.get(i).getCityId()%>><span class=visitday><%=CityPlan.get(i).getPlanDay()%></span>박</button><span>∨</span></div>
					<div class="line"></div>
					</div>
					<div id="planbox" class="fl">
					<div id="plantitle" ><%=CityPlan.get(i).getName()%><button id="del_plan"></button></div>
					<div class="plandate"> <span class="date"></span><span class="plusdate"></span></div>
					</div>
					<div style="clear:both"></div>
					</section >
			<%
				}
		}
			 %>
			<!--일정 리스트--> 
		</div>
	</div>
	<!-- 팝업창 -->
	<div>
	<div id="seach">
		<div class="fl">
			<input id="search_input" type="text" placeholder="도시이름을 입력하세요." autocomplete='off'>
			<img src="resources/images/magnifier.svg" />
			<ul id="autoMaker"></ul>
		</div>
		<div id="my" class="fl">
			<button onclick="javascript:popOpen1();">MY★</button>
		</div>
		<div style="clear: both"></div>
	</div>
	<button id="addtrip">작업완료</button>
	</div>
	<div id="popup1">
		<div id="popheader">
			<!--title  -->
			<div id="poptit" class="fl">MY 위시리스트 도시</div>
			<button onclick="javascript:popClose1();" id="box1" class="fr"></button>

			<div style="clear: both"></div>
		</div>
		<div id="citylist" class="">
			<!--CITYLIST-->
		<%
		for(int i = 0 ; i <= CityLike.size()-1 ; i++){
 			%>
			<div class="list fl">
				<!--도시 하나-->
				<div>
					<!--이미지-->
					<button class="addcity btn" cityid=<%=CityLike.get(i).getCityid()%>></button>
					<button class="ico_like"></button>
					<img src="resources/images/city/<%=CityLike.get(i).getName()%>.jpg" />
				</div>
				<div class="content">
					<!--이름, 설명-->
					<h5><%=CityLike.get(i).getName() %></h5>
					<p><%=CityLike.get(i).getSum()%></p>
				</div>
			</div>
		<%
		}
		%>
		<div style="clear:both;"></div>
		</div>
	</div>
	<!-- 팝업창 -->
	<!--체류기간 팝업창  -->
	<div id="popup2body">
		<% 
		if(!(CityPlan==null)){
			for(int i = 0 ; i <= CityPlan.size()-1 ; i++){
				%>
		<div class="popup2" cityid=<%=CityPlan.get(i).getCityId()%> num=<%=CityPlan.get(i).getPlanOrder()%>>
			<div class="popup2main">
				<div>
					<h1><%=CityPlan.get(i).getName()%> 체류기간 선택</h1>
					<div>
						<button class="fr xbox" cityid=<%=CityPlan.get(i).getCityId()%>></button>
					</div>
				</div>
				<div id="popup2day">
					<table>
						<tr>
							<th class="select"><div class="select0">무박</div></th>
							<th class="select"><div class="select1">1박</div></th>
							<th class="select"><div class="select2">2박</div></th>
							<th class="select"><div class="select3">3박</div></th>
							<th class="select active"><div class="select4">4박</div></th>
						</tr>
						<tr>
							<th class="select"><div class="select5">5박</div></th>
							<th class="select"><div class="select6">6박</div></th>
							<th class="select"><div class="select7">7박</div></th>
							<th class="select"><div class="select8">8박</div></th>
							<th class="select"><div class="select9">9박</div></th>
						</tr>
					</table>
				</div>
				<div id="popup2ctt">
					<h2>체류기간 선택TIP</h2><br/>
					<p><%=CityPlan.get(i).getTip()%></p><br/>
					<h2>Why <%=CityPlan.get(i).getName()%>?</h2><br/>
					<p><%=CityPlan.get(i).getWhy()%></p>
				</div>
			</div>
		</div>
				<%
			}
		}
		%>
	
	</div>
	<!-- 구글맵API  -->
	<div id="map">
	</div>
	<script>
		function popOpen1() {
			var modalPop = $('#popup1');
			$(modalPop).show();
		};
		function popClose1() {
			var modalPop = $('#popup1');
			$(modalPop).hide();
		};
		function sortPlanorder(){
			let plan_order = 1;
			$("section").each(function(){
				$(this).attr("plan_order",plan_order);
				plan_order = plan_order+1;
			})
		};
		
	</script>
</body>
</html>







