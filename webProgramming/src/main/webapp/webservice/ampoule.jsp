<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>앰플/세럼 페이지</title>
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
  </style>
</head>
<body>
  <div class="wrap">
    <header class="header">
      <div class="h1">
        <a href="register.jsp">회원가입</a>&nbsp;
        <a href="login.jsp">로그인</a>&nbsp;
        <a href="cart.jsp">장바구니</a>
      </div>
      <div class="h2">
        <a href="index.jsp">
          <img src="../webservice/image/스크린샷 2024-11-28 210005.png" width="289" height="103" alt="홈으로 이동">
        </a>
      </div>
      <nav class="h3">
        <div class="h3_center">
          <a href="all_item.jsp">전체상품</a>&nbsp;
          <a href="lotion.jsp">로션/크림</a>&nbsp;
          <a href="cleansing.jsp">클렌징</a>&nbsp;
          <a href="ampoule.jsp">앰플/세럼</a>&nbsp;
          <a href="events.jsp">진행중 이벤트</a>
        </div>
        <div class="h3_right">
          <img src="../webservice/image/free-icon-font-search-17767794.png" width="24" height="24" alt="검색">
          <img src="../webservice/image/free-icon-font-user-17766671.png" width="24" height="24" alt="사용자">
        </div>
      </nav>
    </header>

    <main class="main">
      <h1 class="m1">앰플/세럼</h1>
      <section class="m2">
        <div class="product_image">
          <div class="product">
            <img src="../webservice/image/KakaoTalk_20241128_194419059_10.jpg" alt="앰플 제품 1">
          </div>
          <div class="product">
            <img src="../webservice/image/KakaoTalk_20241128_194419059_06.jpg" width="300" height="300" alt="앰플 제품 2">
          </div>
          <div class="product">
            <img src="../webservice/image/KakaoTalk_20241128_194419059_12.jpg" width="300" height="300" alt="앰플 제품 3">
          </div>
          <div class="product">
            <img src="../webservice/image/콩에센스.jpg" width="300" height="300" alt="콩 에센스">
          </div>
          <div class="product">
            <img src="../webservice/image/KakaoTalk_20241128_194419059_10.jpg" width="300" height="300" alt="앰플 제품 4">
          </div>
          <div class="product">
            <img src="../webservice/image/KakaoTalk_20241128_194419059.jpg" width="300" height="300" alt="앰플 제품 5">
          </div>
        </div>
      </section>
    </main>

    <footer class="footer">
      <span style="font-weight: bold">웹프로그래밍응용 Team_Project</span>
    </footer>
  </div>
</body>
</html>
