<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="product.model.vo.*, java.util.*, shop.model.vo.*"%>
<%@ include file="/views/common/coinheader.jsp"%>
<%
	Product p = (Product) request.getAttribute("p"); // 상품
	String option = (String) request.getAttribute("option"); // 옵션
	String[] opArr = option.split("\\/"); // 옵션 배열로 나눔

	ArrayList<Review> rList = (ArrayList<Review>) request.getAttribute("rList"); // 유저의 리뷰와 QnA질문
	ArrayList<Answer> aList = (ArrayList<Answer>) request.getAttribute("aList"); // 관리자의 리뷰 답변과 QnA질문 답변
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShopDetailView</title>

<link href="<%=request.getContextPath()%>/css/shop/shopDetailView.css?ver=1" rel="stylesheet">
</head>
<body>
	<!--
      해야할 것 :

         1) 사진 왼쪽 오른쪽 버튼에 따라 바뀌는거
         3) 배송정보 칸의 안내창(물음표) 이미지 hover이벤트(시간남으면)
   -->
	<!-- 상세 페이지 전체 감싸는 div -->
	<div id="Index" class="flex column">
		<!-- 소분류 카테고리 -->
		<nav id="shopCategory">
			<ul id="sct_ul">
				<%
					for (int i = 1; i <= 5; i++) {
						String[] str = {"스피커", "헤드셋", "헤드폰 / 이어폰", "블루투스 사운드", "마이크"};
				%>
				<li>
					<div class="sct_btn">
						<a href="<%=request.getContextPath()%>/shopList.do?cid=<%=i * 10%>"><span><%=str[i - 1]%></span></a>
					</div>
				</li>
				<%
					}
				%>
			</ul>
		</nav>
		<!-- 상단 nav 제외 전체 감싸는 div -->
		<div id="content">
			<!-- 사진, 상품정보 영역 감싸는 div -->
			<div id="content_top">
				<!-- 사진 영역 -->
				<div id="ct_col_lft">
					<div id="bigImg">
						<img alt="" src="<%=request.getContextPath()%>/img/shopImg/다운로드.jpg">
					</div>
				</div>
				<!-- // 사진영역 끝 -->
				<!-- 상품정보 영역 -->
				<div id="ct_col_rgt">
					<table>
						<thead>
							<tr>
								<td colspan='2' id="title"><%=p.getpName()%></td>
							</tr>
							<tr>
								<td colspan='2' id="oneOrdPrice"><%=p.getPrice()%>원
								</td>
							</tr>
						</thead>
						<tbody id="itemTableTbody">
							<tr>
								<td>배송정보</td>
								<td>
									<span>택배배송</span> 평균 2일 이내 배송(토,일,공휴일제외) <img alt="안내창" src="<%=request.getContextPath()%>/img/shopImg/question-mark.png">
								</td>
							</tr>
							<!-- 옵션이 있을 시 -->
							<%
								if (!option.isEmpty()) {
							%>
							<tr>
								<td>OPTION</td>
								<td>
									<select required id="select" class="group">
										<option value="" disabled selected>SELECT YOUR OPTION</option>
										<%
											for (int i = 0; i < opArr.length; i++) {
										%>
										<option value="<%=i%>*10"><%=opArr[i]%></option>
										<%
											}
										%>
									</select>
								</td>
							</tr>
							<!-- 옵션이 없을 시 -->
							<%
								} else {
							%>
							<tr>
								<td>수량</td>
								<td>
									<div id="noOption" class="amount_Btns">
										<button class="amount_Btn group" type="button" onclick="plus(); totalPrice(); selectOp();">▲</button>
										<input type="text" value="1">
										<button class="amount_Btn group" type="button" onclick="minus(); totalPrice(); selectOp();">▼</button>
									</div>
								</td>
							</tr>

							<%
								}
							%>
						</tbody>
						<tr>
							<td>합계</td>
							<td id="totPrice"><%=p.getPrice()%></td>
						</tr>
					</table>
					<!-- 장바구니/구매 -->
				<div class="ct_btn">
						<ul id="ct_btn_ul">
							<li>
								<form name="itemForm" method="post" id="itemForm">
									<input type="hidden" id="pId" name="pId" value="<%=p.getpId()%>">
									<input type="hidden" id="pName" name="pName" value="<%=p.getpName()%>">
									<input type="hidden" id="price" name="price" value="<%=p.getPrice()%>">
									<input type="hidden" id="brand" name="brand" value="<%=p.getBrand()%>">
									<input type="hidden" id="category" name="category" value="<%=p.getCategory()%>">
									<input type="hidden" id="subCategory" name="subCategory" value="<%=p.getSubCategory()%>">
									<input type="hidden" id="stock" name="stock" value="<%=p.getStock()%>">
									<input type="hidden" id="sellCount" name="sellCount" value="<%=p.getSellCount()%>"> <input type="hidden" id="option" name="option" value=""> <input type="hidden" id="regDate" name="regDate" value="<%=p.getRegDate()%>"> <input type="hidden" id="amount" name="amount" value="1"> <input type="hidden" id="modifyDate" name="modifyDate" value="<%=p.getModifyDate()%>">
									<div id="ct_btn_cart">
										<button style="width: 100%; height: 100%;">CART</button>
									</div>
								</form>
							</li>
							<li>
								<div id="ct_btn_buy">
									<button style="width: 100%; height: 100%;" form="itemForm">BUY</button>
								</div>
							</li>
						</ul>
					</div>

					<!-- 옵션 선택하면 추가될 tr -->
					<table style="display: none">
						<tbody id="addTr">
							<tr class="amountTr">
								<td colspan="2" class="amount">
									<div class="amount_div">
										<div class="amount_name"></div>
										<div class="amount_dltBtn group" onclick="deleteItem();">X</div>
										<div class="amount_Btns">
											<button class="amount_Btn group" type="button" onclick="plus(); totalPrice(); selectOp();">▲</button>
											<input type="text" value="1">
											<button class="amount_Btn group" type="button" onclick="minus(); totalPrice(); selectOp();">▼</button>
										</div>
										<div class="itemPrice">
											<span class="itemPrice_span"><%=p.getPrice()%></span>원
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 상품정보 영역 끝 -->
			</div>
			<!-- 사진, 상품정보 감싸는 top영역 끝 -->
			<!-- 하단영역 시작 -->
			<div id="content_bottom">

				<div id="cb_detail">
					<div class="cb_cate">
						<ul>
							<li class="clicked_category"><a href="#cb_detail" class="clicked_category">DETAIL</a></li>
							<li><a href="#cb_review">REVIEW </a></li>
							<li><a href="#cb_qna">Q&#38;A </a></li>
							<li><a href="#cb_info">INFO</a></li>
						</ul>
					</div>
					<img alt="상세정보" src="<%=request.getContextPath()%>/img/shopImg/photo2.jpg">
				</div>
				<div id="cb_review">
					<div class="cb_cate">
						<ul>
							<li><a href="#cb_detail">DETAIL</a></li>
							<li class="clicked_category"><a href="#cb_review" class="clicked_category">REVIEW </a></li>
							<li><a href="#cb_qna">Q&#38;A </a></li>
							<li><a href="#cb_info">INFO</a></li>
						</ul>
					</div>

					<div class="cb_review_inner">
						<table class="cb_table">
							<tr class="table_header">
								<td>No</td>
								<td>TITLE</td>
								<td>WRITER</td>
								<td>DATE</td>
								<td>VIEW</td>
							</tr>
							<%
								if (rList.isEmpty()) {
							%>
							<tr>
								<td colspan="5">게시글이 없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < rList.size(); i++) {
										if (rList.get(i).getrType() == 1) {
							%>

							<!-- DB 데이터 수에 따라 추가될 tr 부분 시작 -->
							<tr class="reviewTitle">
								<td id="rId<%=i%>"><%=rList.get(i).getrId()%></td>
								<td id="rtitle<%=i%>"><%=rList.get(i).getrTitle()%></td>
								<td id="rWriter<%=i%>" class="writer"><%=rList.get(i).getrWriter()%></td>
								<td id="modifyDate<%=i%>"><%=rList.get(i).getModifyDate()%></td>
								<td id="rcount<%=i%>"><%=rList.get(i).getrCount()%></td>
							</tr>
							<tr class="reviewContent" style="display: none;">
								<td colspan="5">
									<div class="text_box">
										<blockquote id="rContent<%=i%>">
											<%=rList.get(i).getrContent()%>
											<br> <br> <br>
										</blockquote>
										<span id="updateR<%=i%>" class="update" style="display: none"> <a href="views/shop/shopReviewView.jsp">UPDATE</a>
										</span>

									</div>
									<%
										if (!aList.isEmpty() && rList.get(i).getrId() == aList.get(i).getaRId()) {
									%>
									<div class="text_box_title">
										<blockquote>
											<b id="aWriter<%=i%>" class="writer"><%=aList.get(i).getaWriter()%></b>&nbsp;&nbsp;<%=aList.get(i).getModifyDate()%>
										</blockquote>
									</div>
									<div class="text_box">
										<blockquote id="aContent<%=i%>">
											<%=aList.get(i).getaContent()%>
										</blockquote>
										<span id="updateA<%=i%>" class="update" style="display: none"> <a href="#">UPDATE</a>
										</span>
									</div>
								</td>
							</tr>
							<%
								}
										}
									}
								}
							%>

							<!-- DB 데이터 수에 따라 추가될 tr 부분 끝 -->
						</table>
					</div>
				</div>
				<div id="cb_qna">
					<div class="cb_cate">
						<ul>
							<li><a href="#cb_detail">DETAIL</a></li>
							<li><a href="#cb_review">REVIEW </a></li>
							<li class="clicked_category"><a href="#cb_qna" class="clicked_category">Q&#38;A </a></li>
							<li><a href="#cb_info">INFO</a></li>
						</ul>
					</div>
					<div class="cb_review_inner">
						<table class="cb_table">
							<tr class="table_header">
								<td>No</td>
								<td>TITLE</td>
								<td>WRITER</td>
								<td>DATE</td>
								<td>VIEW</td>
							</tr>
							<%
								if (rList.isEmpty()) {
							%>
							<tr>
								<td colspan="5">게시글이 없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < rList.size(); i++) {
										if (rList.get(i).getrType() == 2) {
							%>

							<!-- DB 데이터 수에 따라 추가될 tr 부분 시작 -->
							<tr class="reviewTitle">
								<td id="qId<%=i%>"><%=rList.get(i).getrId()%></td>
								<td id="qTitle<%=i%>"><%=rList.get(i).getrTitle()%></td>
								<td id="qWriter<%=i%>" class="writer"><%=rList.get(i).getrWriter()%></td>
								<td id="qModifyDate<%=i%>"><%=rList.get(i).getModifyDate()%></td>
								<td id="qCount<%=i%>"><%=rList.get(i).getrCount()%></td>
							</tr>
							<tr class="reviewContent" style="display: none;">
								<td colspan="5">
									<div class="text_box">
										<blockquote id="rContent<%=i%>">
											<%=rList.get(i).getrContent()%>
											<br> <br> <br>
										</blockquote>
										<span id="updateQ<%=i%>" class="update"> <a href="views/shop/shopReviewView.jsp">UPDATE</a>
										</span>

									</div>
									<%
										if (!aList.isEmpty() && rList.get(i).getrId() == aList.get(i).getaRId()) {
									%>
									<div class="text_box_title">
										<blockquote>
											<b id="qnaWriter<%=i%>" class="writer"><%=aList.get(i).getaWriter()%></b>&nbsp;&nbsp;<%=aList.get(i).getModifyDate()%>
										</blockquote>
									</div>
									<div class="text_box">
										<blockquote id="qnaContent<%=i%>">
											<%=aList.get(i).getaContent()%>
										</blockquote>
										<span id="updateQna<%=i%>" class="update"> <a href="#">UPDATE</a>
										</span>
									</div>
								</td>
							</tr>
							<%
								}
										}
									}
								}
							%>
						</table>
						<!-- DB 데이터 수에 따라 추가될 tr 부분 끝 -->
					</div>
				</div>
				<div id="cb_info">
					<div class="cb_cate">
						<ul>
							<li><a href="#cb_detail">DETAIL</a></li>
							<li><a href="#cb_review">REVIEW </a></li>
							<li><a href="#cb_qna">Q&#38;A </a></li>
							<li class="clicked_category"><a href="#cb_info" class="clicked_category">INFO</a></li>
						</ul>
					</div>
					<div class="cb_info_inner">
						<h3 class="h3_title">상품결제정보</h3>
						<br>
						<div class="text_box">
							고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.<br> 확인 과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br> 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.<br> 주문시 입력한 입금자명과 실제 입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.<br>
						</div>
					</div>
					<div class="cb_info_inner">
						<h3 class="h3_title">배송정보</h3>
						<br>
						<div class="text_box">
							배송 방법: 택배<br> 배송 지역: 전국지역<br> 배송 비용: 3,000원<br> 배송 기간: 2일 ~ 5일<br> 배송 안내: 산간 벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다<br> 고객님께서 주문하신 상품은 입금 확인 후 배송해 드립니다. 다만, 상품 종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
						</div>
					</div>
					<div class="cb_info_inner">
						<h3 class="h3_title">교환 및 반품정보</h3>
						<br>
						<div class="text_box">
							<b>교환 및 반품정보 교환 및 반품이 가능한 경우</b> <br> - 상품을 공급 받으신 날로부터 10일이내 교환 및 반품이 가능합니다. <br>- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내 <br> <br> <b>교환 및 반품이 불가능한 경우</b> <br> - 고객님의 책임있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외 <br>- 포장된 상품의 일부를 소모하거나 훼손되어 상품가치가 하락된 경우(주문하신 상품 외 기타 동봉된 내용물은 해당사항 없음) <br>- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 <br>- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우 <br>- 복제가 가능한 상품등의 포장을 훼손한 경우 (자세한 내용은 카카오톡 1:1 / E-MAIL / 전화 상담을 이용해 주시기 바랍니다.) <br> <br>※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 옵션이 선택되면 td추가
		$('#select').on("change", function() {
			var item = $(this).children('option:selected').text();
			$('#addTr .amount_name').text(item);
			for (i = 0; i <= $('#itemTableTbody .amount_name').length; i++) {
				if (item == $('#itemTableTbody .amount_name').eq(i).text()) {
					alert('이미 동일한 항목이 선택되어 있습니다.');
					return;
				}
			}
			var tr = $('#addTr').html();
			$('#itemTableTbody').append(tr);
		});

		// X누르면 td 제거
		function deleteItem() {
			$(event.target).closest('.amountTr').remove();
		}
		// puls
		function plus() {
			var currVal = parseInt($(event.target).next().val()) + 1;

			if (currVal <= 5) {
				$(event.target).next().val(currVal);
				$(event.target).parent().next().children().text(<%=p.getPrice()%>* currVal);
			} else {
				alert('최대 주문가능수량은 5개 입니다.');
			}
		}

		// minus
		function minus() {
			var currVal = parseInt($(event.target).prev().val()) - 1;
			if (currVal > 0) {
				$(event.target).prev().val(currVal);
				$(event.target).parent().next().children().text(<%=p.getPrice()%> * currVal);
			}
		}

		// 합계금액
		function totalPrice() {
			var totalPrice = 0;
			var eleCount = $('.itemPrice_span').length - 1;

			<%if (!option.isEmpty()) {%>
			for (var i = 0; i < eleCount; i++) {
				totalPrice += parseInt($('#itemTableTbody .itemPrice_span').eq(i).text());
			}
			<%} else {%>
				totalPrice = <%=p.getPrice()%> * $('#noOption input[type=text]').val();
			<%}%>
			$('#totPrice').text(totalPrice);
			$('#price').val(totalPrice);
			console.log(totalPrice);
		}

		$('.group').on('click', function() {
			totalPrice();
			selectOp();
		});

		// 옵션
		function selectOp() {
			var selectOption = "";
			console.log(1234);
			var eleCount = $('.itemPrice_span').length - 1;
			var amount = 0;
			<%if (!option.isEmpty()) {%>
			for (var i = 0; i < eleCount; i++) {
				if (i == eleCount - 1) {
					selectOption += $('.amount_name').eq(i).text() + ","
							+ $('input[type=text]').eq(i + 1).val();
					amount += parseInt($('#Index input[type=text]').eq(i).val());
				} else {
					selectOption += $('.amount_name').eq(i).text() + ","
							+ $('input[type=text]').eq(i + 1).val() + ",";
					amount += parseInt($('#Index input[type=text]').eq(i).val());
				}
			}
			<%} else {%>
				amount = $('#noOption input[type=text]').val();
			<%}%>
			console.log(selectOption);
			console.log(amount);
			$('#option').val(selectOption);
			$('#amount').val(amount);
		}

		// update popUp
		$('.update').on('click', function(){
			window.open("views/shop/shopReviewView.jsp", "상품평 수정", 'width=600px, height=700px, left=0, top=0, toolbar=0, location=0, resizable=0, status=0, menubar=0, scrollbars=0');
			System.out.println("바뀜?");
		});


		// 리뷰 제목 누르면 펼쳐지는 이벤트
		$('.reviewTitle').on('click', function() {
			$(event.target).parents('.reviewTitle').next().toggle();
		});

		// review와 QnA에서 로그인 유저의 아이디와 일치하면 수정하는 버튼 보이기
		 $(function(){
			for(var i = 0; i < <%=rList.size()%>; i++) {
	 			<%if (loginUser != null) {%>
	 			var rWriter = $('#rWriter'+i); /* 리뷰 작성자 */
	 			var aWriter = $('#aWriter'+i); /* 리뷰 답변인 */
	 			var qWriter = $('#qWriter'+i); /* QnA 작성자 */
	 			var qnaWriter = $('#qnaWriter'+i); /* QnA 답변인 */
				var userId = "<%=loginUser.getId()%>";
				if (userId == $('#rWriter' + i).text()) {
					$('#updateR' + i).toggle();
				} else if (userId == $('#aWriter' + i).text()) {
					$('#updateA' + i).toggle();
				} else if (userId == $('#qWriter' + i).text()) {
					$('#updateQ' + i).toggle();
				} else if (userId == $('#qnaWriter' + i).text()) {
					$('#updateQna' + i).toggle();
				}
	<%}%>
		}
		});
		// 창 사이즈 줄어들면 화면 css변경
		var windowWidth = $(window).width();
		function cssResize() {
			if (windowWidth <= 900) {
				$('#content_top').css('flex-direction', 'column');
				$('#ct_col_lft').css({
					'width' : '100%',
					'margin-bottom' : '3vh'
				});
				$('#ct_col_rgt').css('width', '100%')
						.css('font-size', '1.2rem');
			} else {
				$('#content_top').css('flex-direction', '');
				$('#ct_col_lft').css({
					'width' : '',
					'margin-bottom' : ''
				});
				$('#ct_col_rgt').css('width', '').css('font-size', '');
			}
		}
		$(function() {
			cssResize();
		});
		$(window).resize(function() {
			windowWidth = $(window).width();
			cssResize();
		});
	</script>
	<%@ include file="/views/common/coinfooter.jsp"%>
</body>
</html>
