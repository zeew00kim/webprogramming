<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>메인 페이지</title>
  <link href="layout1.css" rel="stylesheet" type="text/css">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      overflow-x: hidden;
      width: 100%;
      box-sizing: border-box;
    }

    * {
      box-sizing: inherit;
    }
    a {
      text-decoration: none;
      font-weight: bold; 
      color: black;
    }
    a:hover {
      text-decoration: underline;
      color: purple !important;
      transform: scale(1.05);
    }
    .welcome-message {
      color: black;
      font-weight: bold;
    }
    .button {
      padding: 10px 20px;
      background-color: #B8D0FA;
      border: none;
      cursor: pointer;
      color: black;
      font-weight: bold;
      border-radius: 5px;
    }
    .button:hover {
      background-color: Skyblue;
      color: purple;
      transform: scale(1.05);
    }
  </style>
</head>
<body>
  <div class="wrap">
    <header class="header">
      <div class="h1">
        <% 
          String userName = (String) session.getAttribute("userName");
          if (userName != null) {
        %> 
          <!-- 로그인한 경우 -->
          <p class="welcome-message"><%= userName %>님 반갑습니다 😊</p>
          <form action="cart.jsp" method="get" style="display: inline;">
            <button type="submit" class="button">장바구니</button>
          </form>
          <form action="index.jsp" method="post" style="display: inline;">
            <button type="submit" name="logout" class="button">로그아웃</button>
          </form>
        <% } else { %>
          <!-- 로그인하지 않은 경우 -->
          <a href="register.jsp" class="button">회원가입</a>
          <a href="login.jsp" class="button">로그인</a>
        <% } %>
      </div>
      <div class="h2">
        <a href="index.jsp">
          <img src="../webservice/image/스크린샷 2024-11-28 210005.png" width="289" height="103" alt="로고">
        </a>
      </div>
      <nav class="h3">
        <div class="h3_center">
          <a href="all_item.jsp">전체상품</a>&nbsp;
          <a href="lotion.jsp">로션/크림</a>&nbsp;
          <a href="cleansing.jsp">클렌징</a>&nbsp;
          <a href="ampoule.jsp">앰플/세럼</a>&nbsp;
        </div>
        <div class="h3_right">
          <img src="../webservice/image/free-icon-font-search-17767794.png" width="24" height="24" alt="검색">
          <img src="../webservice/image/free-icon-font-user-17766671.png" width="24" height="24" alt="사용자">
        </div>
      </nav>
    </header>

    <main class="main">
      <div class="main-image">
        <img src="../webservice/image/KakaoTalk_20241128_200009300_03.jpg" width="962" height="400" alt="메인 이미지">
      </div>

      <section class="best-items">
        <h2>Best Items</h2>
        <div class="items">
          <div id="icon1">
            <img src="../webservice/image/free-icon-font-angle-circle-left-7482884.png" width="24" height="24" alt="이전 아이콘">
          </div>
          <div class="item">
            <img src="../webservice/image/KakaoTalk_20241127_111509868_15.jpg" width="250" height="250" alt="UV 썬크림">
            <p>UV 썬크림<br>15,000원</p>
          </div>
          <div class="item">
            <img src="../webservice/image/KakaoTalk_20241127_111509868_01.jpg" width="250" height="250" alt="수분크림">
            <p>수분크림<br>30,000원</p>
          </div>
          <div class="item">
            <img src="../webservice/image/KakaoTalk_20241127_111509868_04.jpg" width="250" height="250" alt="클렌징폼">
            <p>클렌징폼<br>15,000원</p>
          </div>
          <div class="item">
            <img src="../webservice/image/KakaoTalk_20241127_111509868_23.jpg" width="250" height="250" alt="마일드 썬크림">
            <p>마일드 썬크림<br>20,000원</p>
          </div>
          <div id="icon2">
            <img src="../webservice/image/free-icon-font-angle-circle-right-7482887.png" width="24" height="24" alt="다음 아이콘">
          </div>
        </div>
      </section>

      <section class="best-review">
        <h2>Best Review</h2>
        <div class="reviewImg">
          <div class="item">
            <img src="../webservice/image/KakaoTalk_20241127_111509868_22.jpg" width="250" height="250" alt="보습 크림">
            <p>보습 크림 리뷰<br>벌써 n통째 구매중 입니다! 겨울에 쓰기 좋아요~</p>
          </div>
          <div class="item">
            <img src="../webservice/image/7cffd09ef5d100fe440dfdab11082b81.jpg" width="250" height="250" alt="촉촉 수분크림">
            <p>촉촉 수분크림 리뷰<br>여름에도 쓰기 부담없어서 좋아요!!</p>
          </div>
          <div class="item">
            <img src="../webservice/image/634f9d163ecaf278cefeb5058e2c0bd4.jpg" width="250" height="250" alt="마일드 썬크림">
            <p>마일드 썬크림 리뷰<br>톤업버전과 수분 버전 비교 발색샷 입니다~</p>
          </div>
          <div class="item">
            <img src="../webservice/image/Mid Day Blue UV Shield SPF50+ PA++++.jpg" width="250" height="250" alt="CICA 크림">
            <p>CICA 크림 리뷰<br>여드름이 많이 개선되었어요!</p>
          </div>
        </div>
      </section>
    </main>

    <footer class="footer">
      <span style="font-weight: bold">웹프로그래밍응용 Team_Project</span>
    </footer>
  </div>

  <% 
    // 로그아웃 처리
    if (request.getParameter("logout") != null) {
        session.invalidate();  // 세션 종료
        response.sendRedirect("index.jsp");  // 로그아웃 후 index.jsp로 리다이렉트
    }
  %>
</body>
</html>
