var num = 0;
var plan_order=0;
var nowdate=$("datepicker").val();
var city = [
	{ idx: 1100, rank: "프랑스 1위", lat: 48.857696094342, lng: 2.34874913191027, name: "파리", img_src: "../Images/city/파리.jpg", why: "낭만의 대명사, 파리! 무슨 설명이 더 필요하랴! 맛있는 빵집,카페,디저트,미슐랭 5스타 레스토랑 등 세계 최고의 식도락여행 루브르 박물관, 오르세 미술관 등 예술여행 몽셍미셸, 지베르니, 오베르 쉬르 우아즈 등 아름다운 근교 마을까지 당일치기", tip: "파리를 어느 정도 제대로 보려면 최소한 2박 이상은 해야 한다. 걷고, 자전거 타고, 카페에서 여유도 즐기고, 쇼핑도 하고 싶다면 3박 이상, 박물관과 미술관 및 근교의 마을들을 꼼꼼하게 보려면 4박도 추천한다. 몽셍미셸은 야경이 아름다운 곳이라 그곳에서 1박을 하는 경우도 많으니, 참고해서 일정을 짜자. 모네 등 인상파 거장들이 풍경을 그리던 마을들도 근교에 있다. 미술에 관심이 없어도 충분히 아름다운 곳이니, 시간을 내서 방문해보자." },
	{ idx: 1128, rank: "이탈리아 1위", lat: 41.9058646669163, lng: 12.4982220173738, name: "로마", img_src: "../Images/city/로마.jpg", why: "2000년 전 유럽을 지배하던 거대 제국의 흔적 교황이 살고 있는 가장 신성한 나라 바티칸 공국", tip: "시내 유적과 바티칸 구경만해도 최소 이틀은 필요해요.떼르미니역 근처로 숙소를 잡는 게 편해요.간단한 역사적 배경지식이 있으면 좋아요!" },
	{ idx: 1111, rank: "스위스 1위", lat: 46.686465524631, lng: 7.86289667436329, name: "인터라켄", img_src: "../Images/city/인터라켄.jpg", why: "스위스 하면 가장 먼저 떠오르는 융프라우 지역을 즐기기 위한 교통 거점 융프라우요흐의 출발지점이자, 그 주변 지역으로 여행하기 위한 교통의 요지", tip: "융프라우를 등정하고 돌아오는 일정은 최소 반나절, 대개는 하루가 통째로 소요됩니다. 2박 이상의 일정을 추천해요! 도착하는 날엔 휴식을 취하며 정비하고, 그 다음날 아침 일찍부터 움직이세요.인터라켄에서 갈 곳은 융프라우만 있는게 아니라는 거! 오래 머무르며 다양한 자연의 매력을 가진 곳들도 방문해보세요." },
	{ idx: 1119, rank: "영국 1위", lat: 51.5080165008986, lng: -0.1263264396377, name: "런던", img_src: "../Images/city/런던.jpg", why: "유구한 역사를 자랑하는 영국의 수도 해리포터, 영드 셜록, 뮤지컬 등 매니아들의 덕심을 자극하는 곳", tip: "랜드마크만 찍기에도 여유 있게 2박은 필요해요. 4-5일 정도의 일정이 있다면 근교로 당일치기 여행을 추천합니다." },
	{ idx: 1146, rank: "독일 2위", lat: 48.135638446290, lng: 11.5830321517684, name: "뮌헨", img_src: "../Images/city/뮌헨.jpg", why: "뮌헨은 맥주 축제하면 떠오르는 세계 최대의 맥주 축제 옥토버페스트가 열리는 곳입니다. 축구 팬들에게는 분데스리가의 명불허전 1등, FC 바이에른 뮌헨의 홈구장이죠. 세계에서 가장 멋진 축구경기장인 알리안츠 아레나를 보러 전세계에서 축구팬들이 오는 곳입니다.", tip: "옥토버페스트 기간에 뮌헨을 방문한다면 저녁 일정을 넉넉하게 잡아야겠죠! 축제기간에는 2박 정도를 추천하지만 숙소값과 교통비가 천정부지로 뛰니까 미리 예약해두셔야 합니다. 비싼 값을 내고도 예약할 수 없는 경우도 많습니다. 축구를 좋은 자리에서 직접 관전하고 싶으시면 한국에서 미리 표를 알아보고 예약하고 오는 것이 좋습니다. 축제 시즌이나 축구 관전이 아니라면, 1박도 괜찮습니다." },
	{ idx: 1151, rank: "네덜란드 1위", lat: 52.36958529602, lng: 4.90251287105007, name: "암스테르담", img_src: "../Images/city/암스테르담.jpg", why: "암스테르담에서 30분, 작은 풍차마을", tip: "네덜란드의 수도, 운하의 도시" },
	{ idx: 1153, rank: "벨기에 1위", lat: 50.8477253283556, lng: 4.35721879785903, name: "브뤼셀", img_src: "../Images/city/브뤼셀.jpg", why: "벨기에의 핵심, 음식과 관광, 문화의 중심지", tip: "원하는 만큼 있어도 좋은 곳" },
	{ idx: 1156, rank: "아일랜드 1위", lat: 53.3509743797639, lng: -6.25880520637006, name: "더블린", img_src: "../Images/city/더블린.jpg", why: "영화 〈Once〉의 배경이 된 곳 깊고 진한 맛의 흑맥주 기네스의 고향", tip: null },
	{ idx: 1200, rank: "스페인 1위", lat: 41.3910930614436, lng: 2.16833893594376, name: "바르셀로나", img_src: "../Images/city/바르셀로나.jpg", why: "모더니즘 건축의 중심지 가우디를 비롯한 예술가들이 사랑한 도시 볼거리와 먹을거리로 꽉 찬 매력적인 여행지", tip: "" },
	{ idx: 1213, rank: "포르투갈 1위", lat: 38.7228636829631, lng: -9.14011955560284, name: "리스본", img_src: "../Images/city/리스본.jpg", why: "리스본은 대항해 시대 세계를 호령했던 포르투갈의 흔적이 남아있는 수도입니다. 그만큼 포르투갈의 진면목을 알 수 있는 곳이기도 하죠! 빨간 지붕과 푸르른 물결이 만드는 아름다운 풍경부터 포르투갈의 역사, 문화 등이 총집합한 리스본, 놓쳐서는 안 될 도시겠죠?", tip: "리스본은 당일치기로 보기엔 담을 게 많은 도시입니다! 1박이나 2박은 해야 아쉬운 것 없이 둘러볼 수 있어요! 포르투갈의 여유를 느끼고 싶다면 그 이상도 ok입니다!" },
	{ idx: 1218, rank: "그리스 1위", lat: 37.9837946751122, lng: 23.7258073769709, name: "아테네", img_src: "../Images/city/아테네.jpg", why: "그리스의 중심, 화려한 문화와 역사", tip: "볼 거리 많아 원하는 만큼 있어도 좋습니다" },
	{ idx: 1225, rank: "터키 1위", lat: 41.0193574728228, lng: 28.9654456777962, name: "이스탄불", img_src: "../Images/city/이스탄불.jpg", why: "터키의 중심", tip: "원하는 만큼 둘러보아도 좋은 장소" },
	{ idx: 1700, rank: "모로코 1위", lat: 31.988163084142, lng: -6.37401578122457, name: "모로코", img_src: "../Images/city/모로코.jpg", why: null },
	{ idx: 1300, rank: "체코 1위", lat: 50.0732164774499, lng: 14.4374618180949, name: "프라하", img_src: "../Images/city/프라하.jpg", why: "붉은 지붕으로 뒤덮인 아름다운 야경 아름다운, 연금술사들의 거리 황금소로 전통을 느낄 수 있는 하벨시장", tip: "시내 구경은 한나절이면 충분해요!체스키크롬로프까지는 왕복 6시간 걸려요.중앙역/안델역 근처로 잡으면 이동하기 편해요!" },
	{ idx: 1303, rank: "오스트리아 1위", lat: 48.2127887763842, lng: 16.372840155036, name: "비엔나", img_src: "../Images/city/비엔나.jpg", why: "아름다운 야경과 질리지 않는 아름다운 골목들 달달한 디저트와 저렴한 오페라 공연의 천국 합스부르크 왕가의 아름다움과 역사가 깃들어 있는 곳", tip: "비엔나는 동유럽 주요 도시와 기차 및 버스로 연결된 교통의 요지입니다.브라티슬라바, 할슈타트를 당일치기 하기에도 좋아요!" },
	{ idx: 1302, rank: "헝가리 1위", lat: 47.4996539321024, lng: 19.037596506029, name: "부다페스트", img_src: "../Images/city/부다페스트.jpg", why: "해가 져도 어두워지지 않는, 야경이 아름다운 도시 부담스럽지 않은 가격에 힐링할 수 있는 세체니 온천 영화 글루미 선데이의 배경", tip: "세체니 다리나 데악역 쪽 숙소가 관광지랑 가까워요.여유롭다면 야경은 어부의 요새와 겔레르트 언덕에서 이틀에 나눠 보는 걸 추천!겨울에는 빈에서 당일치기 야경도 가능!" },
	{ idx: 1306, rank: "크로아티아 1위", lat: 42.6500237064563, lng: 18.0947294466996, name: "두브로브니크", img_src: "../Images/city/두브로브니크.jpg", why: "크로아티아 대표 휴양지", tip: "숙소가 그리 많지 않고 예약이 금방 마감되기 때문에 2-3개월 전에 숙소를 예약해두세요!겨울에는 소금광산 입장이 불가능해요ㅠㅠ관광지라 물가가 상당하니 저비용 여행자에게는 당일치기를 추천합니다." },
	{ idx: 1409, rank: "아이슬란드 1위", lat: 64.1476928868254, lng: -21.9406780126318, name: "레이캬비크", img_src: "../Images/city/레이캬비크.jpg", why: "아이슬란드 여행의 시작과 끝", tip: "관광은 하루 정도, 이 곳을 숙소 삼아 아이슬란드 여행" },
	{ idx: 1402, rank: "노르웨이 1위", lat: 59.914411173682, lng: 10.7576430500636, name: "오슬로", img_src: "../Images/city/오슬로.jpg", why: "백야의 도시, 노르웨이의 중심", tip: "원하는 만큼 있어도 좋은 장소" },
	{ idx: 1401, rank: "덴마크 1위", lat: 55.6770477369262, lng: 12.5704757940115, name: "코펜하겐", img_src: "../Images/city/코펜하겐.jpg", why: "덴마크의 수도, 여행의 중심", tip: "원하는 만큼!" },
	{ idx: 1408, rank: "스웨덴 1위", lat: 59.3307665972791, lng: 18.0630689150509, name: "스톡홀름", img_src: "../Images/city/스톡홀름.jpg", why: "세련된 북유럽의 베네치아", tip: "1박 혹은 2박으로 도시를 둘러보고 인근 여행을 추천" },
];
var isComplete = false;
$("#search_input").keyup(function() {
	var txt = $(this).val();
	if (txt != '') {
		$("#autoMaker").children().remove();

		city.forEach(function(arg) {
			if (arg.name.indexOf(txt) > -1) {
				$("#autoMaker").append(
					$("<li>").text(arg.name).attr({ "cityid": arg.idx })
				);
			}
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
	}
});
function initMap() {
	 const lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,};
	var myIcon = new google.maps.MarkerImage("../Images/marker.png", null, null, null, new google.maps.Size(15, 15));
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
	function setMarkers(map) {
		city.forEach(({ name, lat, lng, img_src, why, rank, idx, tip }) => {
			const ctt = '<div class="fl infol"><div><img src="' + img_src + '"/></div><button class="book">가이드북</button></div><div class="fl inforr"><img src="../Images/flag.gif"><span id="title">' + name + '</span><span id="rank">' + rank + '</span><div id="discript">' + why + '</div></div><div class="fl"><button class="addcity" cityid="' + idx + '"><img src="../Images/addcity.png"></button></div>';
			const marker = new google.maps.Marker({
				position: { lat, lng },
				title: ctt,
				map: map,
				icon: myIcon,
			});
			
			marker.setZIndex(-1);
			$(function() {    //ADDCITY
				$(document).on("click", 'button.addcity[cityid="' + idx + '"]', function() {
					plan_order=Number(plan_order)+1;
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
						+ '<div id="popup2main">'
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
					$("#cityroute").append(str1);
					$("#popup2body").append(str2);
					resetdate();
					infowindow.close();
					poly.getPath().push(new google.maps.LatLng($('section:last').attr("lat"), $('section:last').attr("lng")));
					$('section:last').attr("num", num);
					$('.popup2:last').attr("num", num);
					num = num + 1;
				});
			$("#cityroute").sortable({
				stop: function(event, ui) {
					resetdate();
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
			
				$(document).on("click", 'button.addday[cityid="' + idx + '"]', function() {
					$('div.popup2[cityid="' + idx + '"]').show();
				});
				$(document).on("click", 'button.xbox[cityid="' + idx + '"]', function() {
					$('div.popup2[cityid="' + idx + '"]').hide();
				});
			});

			$(document).on("click", 'li[cityid="' + idx + '"]', function() {
				map.setCenter(marker.getPosition());
				infowindow.setContent(marker.getTitle());
				infowindow.open(marker.getMap(), marker);
			});

			marker.addListener('click', function() {
				
				infowindow.close();
				map.setCenter(marker.getPosition());
				infowindow.setContent(marker.getTitle());
				infowindow.open(marker.getMap(), marker);
			});
		});
		$(document).on("click", "#del_plan", function() {
				let answer = confirm('정말 삭제하시겠습니까?');
				if (answer) {
					$(this).closest('section').remove();
					resetdate();
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
		function delPolyline() {
			poly.setMap(null);
		};
	}
	setMarkers(map);
}
window.initMap = initMap;
