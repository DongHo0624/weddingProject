<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp" />
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp" />
<%-- 네이버 지도 API --%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<div>
			<!-- 상호명 table -->
			<table style="width: 100%;">
				<tr>
					<!-- 이전페이지 -->
					<td rowspan="2" style="width: 80px; height: 80px;">
						<button style="width: 60px; height: 60px; background-color: lightgray; border-radius: 2px;">이전</button>
					</td>
					<!-- 상호명 -->
					<td><span style="font-size: 28px;">${makeup.makeupName}</span></td>
					<!-- 스크랩북 -->
					<td style="float: right;">
						<c:choose>
							<c:when test="${not empty scrapbook}">
								<button class="scrapStar" id="${makeup.makeupNo}" name="${makeup.code}">
									<img src="/resources/img/star_b2.png" style="width: 30px; height: 30px;">
								</button>
							</c:when>
							<c:otherwise>
								<button class="defaultStar" id="${makeup.makeupNo}" name="${makeup.code}">
									<img src="/resources/img/star_b1.png" style="width: 30px; height: 30px;">
								</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<!-- 상세주소 -->
					<td>
						<a style="font-size: 15px;" href="#map">${makeup.makeupAddr}</a>
					</td>
				</tr>
			</table>
			<!-- 상호명 테이블 끝 -->
			<br>
			<!-- 사진 carousel -->
			<div>
				<div style="max-width: 1200px; height: 600px; background-color: pink; border-radius: 3px; overflow: hidden;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 0; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 0 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
			</div>
			<!-- 사진 carousel 끝 -->
			<br> <br> <br>
			<!-- 상세설명, 리뷰, 지도가 포함된 content 시작 -->
			<div style="position: relative;">
				<!-- 왼쪽 상세설명, 리뷰, 지도 -->
				<div style="width: 70%; display: inline-block;">
					<h2>상세설명</h2>
					<hr>
					${makeup.makeupContent}
					<br> <br> <br>
					<h2>가격확인 및 예약문의</h2>
					<br>

					<form>
						<table class="comm-tbl">
							<colgroup>
								<col width="30%">
								<col width="/">
							</colgroup>
							<tr>
								<th>예식일</th>
								<td colspan="2">
									<input type="text" name="weddingDate" id="weddingDate" class="datepicker wedding-date middle" placeholder="예식일을 선택해주세요" required>
								</td>
							</tr>
							<tr>
								<th>예식시간</th>
								<td colspan="2">
									<select name="weddingTime" id="weddingTime">
										<option value="default">::: 예식 시작 시간 선택 :::</option>
										<option>AM 11:00</option>
										<option>AM 11:30</option>
										<option>PM 12:00</option>
										<option>PM 12:30</option>
										<option>PM 1:00</option>
										<option>PM 1:30</option>
										<option>PM 2:00</option>
										<option>PM 2:30</option>
										<option>PM 3:00</option>
										<option>PM 3:30</option>
										<option>PM 4:00</option>
										<option>PM 4:30</option>
										<option>PM 5:00</option>
										<option>PM 5:30</option>
										<option>PM 6:00</option>
									</select>
								</td>
							</tr>
							<tr>
								<th colspan="2" style="text-align: center;">예약 옵션</th>
							</tr>
							<c:if test="${makeup.makeupBasicPrice != 0}">
								<tr>
									<th>기본 옵션</th>
									<td>
										<input type="checkbox" class="optionCheckBox" id="option1" name="makeupBasicPrice" value="신랑신부 메이크업" checked onclick="return false;"> 신랑신부 메이크업
										<span style="float: right;">가격 : <span id="option1Price">${makeup.makeupBasicPrice}</span>원</span>
									</td>
								</tr>
							</c:if>
							<c:if test="${makeup.makeupParentPrice != 0 || makeup.makeupVisitorPrice != 0}">
							<tr>
								<th id="makeupOption2-th" rowspan="3">부가 옵션</th>
							</tr>
							</c:if>
							<c:if test="${makeup.makeupParentPrice != 0}">
								<tr>
									<td>
										<input type="checkbox" class="optionCheckBox" id="option2" name="makeupParentPrice" value="혼주 메이크업"> 혼주 메이크업
										<span style="float: right;">가격 : <span id="option2Price">${makeup.makeupParentPrice}</span>원</span>
									</td>
								</tr>
							</c:if>
							<c:if test="${makeup.makeupVisitorPrice != 0}">
								<tr>
									<td>
										<input type="checkbox" class="optionCheckBox" id="option3" name="makeupVisitorPrice" value="하객 메이크업"> 하객 메이크업
										<span style="float: right;">가격 : <span id="option3Price">${makeup.makeupVisitorPrice}</span>원</span>
									</td>
								</tr>
							</c:if>
							<tr>
								<th colspan="2">
									총계
									<span style="float: right;"><span id="allPrice"></span>원</span>								
								</th>
							</tr>
						</table>
						<div class="common-tbl-btn-group">
							<button class="btn-style1" type="button" onclick="reservation();">예약하기</button>
						</div>
					</form>

					<br> <br> <br>
					<h2>후기 및 Q&A</h2>
					<hr>
				</div>
				<!-- 상세설명, 리뷰, 지도 끝 -->
				<!-- 오른쪽 실제사례, 인터뷰, 스크랩북, 전화번호 등이 포함된  position: static;-->
				<div
					style="position: static; background-color: pink; width: 28%; height: 500px; float: right;"></div>
				<!-- static 끝 -->
			</div>
		</div>


		<!-- 지도 위치 -->
		<div id="map" style="float: left; margin-left: 20px; width: 800px; height: 300px; margin-bottom: 50px;"></div>
	</div>
</section>
<script>

	/* 페이지 로드 시 이벤트 */
	$(document).ready(function(){
		/* 페이지 로드 시 총계 변경 */
		var allPrice = 0;
		if($('#option1').attr('checked') == 'checked'){
			allPrice += parseInt($('#option1Price').text());
		}
		if($('#option2').attr('checked') == 'checked'){
			allPrice += parseInt($('#option2Price').text());
		}
		if($('#option3').attr('checked') == 'checked'){
			allPrice += parseInt($('#option3Price').text());			
		}
		$('#allPrice').text(allPrice);
		/* 페애지 로드 시 총계 변경 끝 */
		/* 부가 옵션이 없을 경우 rowspan 변경 */
		var parentPrice = ${makeup.makeupParentPrice};
		var visitorPrice = ${makeup.makeupVisitorPrice};
		if(parentPrice == 0 || parentPrice == null || visitorPrice == 0 || visitorPrice == null){
			$('#makeupOption2-th').prop('rowspan', 2);			
		}
		/* 부가 옵션이 없을 경우 rowspan 변경 끝 */
	});
	/* 페에지 로드 시 이벤트 끝 */
	
	/* 체크박스 체크 시 총계 변경 */
	$('.optionCheckBox').on("click",function(){
		var allPrice = 0;
		if($('#option1').attr('checked') == 'checked'){
			allPrice += parseInt($('#option1Price').text());
		}
		if($('#option2').prop('checked') == true){
			allPrice += parseInt($('#option2Price').text());
		}
		if($('#option3').prop('checked') == true){
			allPrice += parseInt($('#option3Price').text());			
		}
		$('#allPrice').text(allPrice);		
	});
	/* 체크박스 체크 시 총계 변경 끝 */
		
	/* 버튼 클릭 시 예약 */
	function reservation(){
		if($('#weddingTime option:selected').val() == 'default'){
			alert("예식 시작 시간을 선택해주세요.");
		}else{
			if($('#option1').attr('checked') == false && $('#option2').attr('checked') == false && $('#option3').attr('checked') == false){
				alert("옵션을 한 가지 이상 선택해주세요.");
			}else{
				submitReservation();							
			}
		}
	}
	
	function submitReservation(){
		var code = "M";
		var prdNo = ${makeup.makeupNo};
		var prdName = '${makeup.makeupName}';
		var weddingDate = $('#weddingDate').val().replace(/-/gi,'/');
		var weddingTime = $('#weddingTime option:selected').val();
		var totalPrice = $('#allPrice').text();
		var option1 = $('#option1').val();
		var option2 = null;
		var option3 = null;
		if($('#option2').prop('checked') == true){
			option2 = $('#option2').val();
		}
		if($('#option3').prop('checked') == true){
			option3 = $('#option3').val();
		}
		$.ajax({
			url : "/reservationMakeup.do",
			data : {code:code,prdNo:prdNo,prdName:prdName,weddingDate:weddingDate,weddingTime:weddingTime,totalPrice:totalPrice,option1:option1,option2:option2,option3:option3},
			type : "post",
			success : function(data){
				if(data > 0){
					alert("예약을 완료했습니다. 주문장으로 이동합니다.");
					location.href="/reservationView.do?reservationNo="+data;
				}else if(data == -1){
					alert("로그인 후 다시 시도해주세요.");
					location.href="/loginPage.do";
				}else{
					alert("지금은 예약할 수 없습니다.");
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});		
	}
	/* 버튼 클릭 시 예약 끝 */
	
	
	/* 옵션 select 박스 change 시 가격 변경 */
	$('.studioSelectOption').on("change",function(){
		var allPrice = 0;
		if($('#option1 option:selected').val() != 'default'){
			allPrice += parseInt($('#option1 option:selected').val());
		}
		if($('#option2 option:selected').val() != 'default'){
			allPrice += parseInt($('#option2 option:selected').val());			
		}
		if($('#option3 option:selected').val() != 'default'){
			allPrice += parseInt($('#option3 option:selected').val());
		}
		console.log($('#option1 option:selected').text().substring(0,$('#option1 option:selected').text().indexOf("(")));
		$('#allPrice').text(allPrice);
	});
	/* 옵션 select 박스 change 시 가격 변경 끝 */	
	
	/* 스크랩북 on/off */
	$(document).on("click",".defaultStar",function(){
		var select = $(this);
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		$.ajax({
			url : "/scrapOn.do",
			type : "get",
			data : {objectNo:objectNo,code:code},
			success : function(data){
				if(data == 1){					
					select.find('img').remove();
					select.append('<img src="/resources/img/star_b2.png" style="width:30px;height:30px;">');
					select.addClass('scrapStar');
					select.removeClass('defaultStar');
					alert("스크랩북에 추가되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
	$(document).on("click",".scrapStar",function(){
		var select = $(this);
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		$.ajax({
			url : "/scrapOff.do",
			type : "get",
			data : {objectNo:objectNo,code:code},
			success : function(data){
				if(data == 1){
					select.find('img').remove();
					select.append('<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">');
					select.removeClass('scrapStar');
					select.addClass('defaultStar');
					alert("스크랩북에서 삭제되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");					
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
	/* 스크랩북 on/off 끝 */	
	
	//네이버 지도 API
	window.onload = function(){
	//	var map = new naver.maps.Map('map');		//시청 기준 map
		var map = new naver.maps.Map('map',{		//위도,경도 기준 map
			center : new naver.maps.LatLng(${makeup.makeupLatitude},${makeup.makeupLongitud}),
			zoom:10,
			zoomControl : true,						//zoom 콘트롤러
			zoomControlOptions : {					//zoom 콘트롤러 설정
				position : naver.maps.Position.TOP_RIGHT,		//위치:상단 오른쪽
				style : naver.maps.ZoomControlStyle.SMALL		//사이즈:최소
			}
		});
		var marker = new naver.maps.Marker({		//조건에 맞는 위치를 지도에 찍어주는 핀(마커)
			position : new naver.maps.LatLng(${makeup.makeupLatitude},${makeup.makeupLongitud}),
			map : map
		});
		naver.maps.Event.addListener(map, 'click', function(e){
			if(infoWindow.getMap()){
				infoWindow.close();
			}
			//위도 경도는 바로 구할 수 있음
			//geocode 서브모듈을 이용한 위경도 -> 주소변환
			//geocede : 주소 -> 위경도 / reverseGeocode : 위경도 -> 주소
			naver.maps.Service.reverseGeocode({
				location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng()),		//위도,경도를 클릭한 곳으로 바꿔줌(마커 위치)
				},function(status,response){
					if(status !== naver.maps.Service.Status.OK){					//위도,경도를 못 얻어온 경우
						return alert("못찾음");
					}
					var result = response.result,
					items = result.items;
					address = items[0].address;
			});
		});
		var contentString = [						//마커 클릭 시 출력할 주소 배열
	        '   <h3 style="display:inline-block;padding:10px;">${makeup.makeupName}</h3>',
	        '       <img src="/img/header_logo.png" width="100" height="100" alt="KS" style="float:right;" class="thumb" />',
	        '   	<p style="font-size:13px;padding:10px;">${makeup.makeupAddr}<br />',
	        '       TEL : ${makeup.makeupTel}<br />',
	        '       <a href="http://www.kssports.go.kr" target="_blank" style="text-decoration:none;">http://www.kssports.go.kr/</a>',
	        '   </p>',
	        '</div>'
		].join('');									//배열 값을 String으로 합침
		var infoWindow = new naver.maps.InfoWindow();		//마커 클릭 시 띄우는 창
		naver.maps.Event.addListener(marker,'click',function(){
			if(infoWindow.getMap()){				//infoWindow가 열려있는지 판단
				infoWindow.close();					//열려있을 때 닫음
			}else{
				infoWindow.setContent(contentString);		//정보창에 글시 세팅
				infoWindow.open(map,marker);
			}
		});
	}
	</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp" />