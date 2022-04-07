<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>기업고객 : 주문 이력 조회 (refundRequest)</title>
            <jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
            <link href="${CTX_PATH}/css/epc/style.css" rel="stylesheet" type="text/css">
        </head>

        <body>

            <div id="mask"></div>
            <div id="wrap_area">


                <!-- header 영역 -->
                -- header
                <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
                header --


                <!-- main 영역 -->
                <div id="container">
                    <ul>
                        <li class="lnb">
                            <!-- lnb 영역 -->
                            <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
                        </li>
                        <li class="contents">
                            <div class="content">
                                <p class="Location">
                                    <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
                                    <span class="btn_nav bold">주문 이력 조회</span>
                                </p>

                                <!-- 주문 이력 목록 검색 -->
                                <div id="divSearchOrderList">
                                    <div>
                                        <span>모델명: </span><input type="text" name="" id="">
                                    </div>
                                    <div>
                                        <span>구매일자: </span>
                                        <input type="date" name="purDateStart" id="purDateStart" class=""> ~
                                        <input type="date" name="purDateEnd" id="purDateEnd" class="">
                                    </div>
                                    <div>
                                        <a href="" class="btnType blue" name="btn"><span>검색</span></a>
                                    </div>
                                </div>
                                <!-- 주문 이력 목록 테이블 -->

                                <div class="orderListContainer">
                                    <table class="col">
                                        <caption>caption</caption>
                                        <colgroup>
                                            <col width="8%">
                                            <col width="8%">
                                            <col width="19%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="15%">
                                            <col width="10%">
                                        </colgroup>

                                        <thead>
                                            <tr>
                                                <th scope="col">일련번호</th>
                                                <th scope="col">주문 수량</th>
                                                <th scope="col">결제 금액</th>
                                                <th scope="col">구매 일자</th>
                                                <th scope="col">배송 희망 날짜</th>
                                                <th scope="col">배송 상태</th>
                                                <th scope="col">반품 신청</th>
                                            </tr>
                                        </thead>
                                        <tbody id="orderListMain"></tbody>
                                    </table>
                                </div>
                                <div class="paging_area" id="comnGrpCodPagination"> </div>


                                <div class="orderDetailContainer">
                                    <table class="col">
                                        <caption>caption</caption>
                                        <colgroup>
                                            <col width="6%">
                                            <col width="17%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="10%">
                                            <col width="15%">
                                            <col width="10%">
                                        </colgroup>

                                        <thead>
                                            <tr>
                                                <th scope="col">체크</th>
                                                <th scope="col">반품 수량</th>
                                                <th scope="col">주문 번호</th>
                                                <th scope="col">장비 구분</th>
                                                <th scope="col">모델명</th>
                                                <th scope="col">제조사</th>
                                                <th scope="col">판매 가격</th>
                                                <th scope="col">주문 수량</th>
                                                <th scope="col">결제 금액 ${item.loginID}
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="orderDetailMain"></tbody>
                                    </table>
                                    <div class="paging_area" id="comnGrpCodPagination"> </div>

                                    <div style="text-align: right;">
                                        <input type="button" value="반품요청">
                                    </div>
                                </div>


                                <!-- end of div#content -->
                            </div>
                        </li>
                    </ul>
                </div>


                <!-- footer 영역 -->
                -- footer
                <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
                footer --
            </div>
            <script>
                $(document).ready(function() {
                    getOrderListTbody();
                    linkEvent();

                });

                function linkEvent() {
                    eventReturnBtn();

                }

                function eventReturnBtn() {
                    $('tbody#orderListMain').on('click', 'input.returnBtn', function(e) {
                        const pur_id = $(e.currentTarget).parents('tr').find('input#sales_id').val();
                        getOrderDetailTbody(pur_id);
                    });
                }


                function getOrderListTbody() {
                    $.ajax({
                        url: 'getOrderList',
                        method: 'POST',
                        success: function(result) {
                            getOrderDetailTbody();
                            $('tbody#orderListMain').append(result);
                            console.log('try1');
                            console.log(result);
                        }
                    });
                }

                function getOrderDetailTbody(pur_id) {
                    $('tbody#orderDetailMain').empty();
                    if (!pur_id) {
                        return;
                    } else {
                        $.ajax({
                            url: 'getOrderDetail',
                            method: 'POST',
                            data: {
                                pur_id: pur_id
                            },
                            success: function(result) {
                                $('tbody#orderDetailMain').append(result);
                                console.log('try2');
                                console.log(result);
                            }
                        });
                    }
                }
            </script>
        </body>

        </html>