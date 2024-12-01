<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>제품 상세 페이지</title>
  <link href="layout1.css" rel="stylesheet" type="text/css">
  <style>
    /* 링크 스타일 */
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

    /* 제품 정보 스타일 */
    .product-name {
      font-weight: bold;
      font-size: 1.5em;
    }
    .product-price, .shipping-fee {
      font-size: 1.2em;
      margin-top: 10px;
      display: block;
    }

    /* 버튼 스타일 */
    .buttons {
      margin-top: 20px;
      display: flex;
      gap: 10px;
    }
    .buttons button {
      padding: 10px 20px;
      font-size: 1em;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: transform 0.3s ease, background-color 0.3s ease;
    }
    .buttons .cart-button {
      background-color: #b8d0fa;
      border: 2px solid silver;
    }
    .buttons .cart-button:hover {
      background-color: skyblue;
      transform: scale(1.05);
    }
    .buttons .buy-button {
      background-color: #b8d0fa;
      border: 2px solid silver;
    }
    .buttons .buy-button:hover {
      background-color: Skyblue;
      transform: scale(1.05);
    }
    .buttons a {
      color: inherit;
      text-decoration: none;
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
          <img src="../webservice/image/스크린샷 2024-11-28 210005.png" width="289" height="103" alt="로고">
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
      <section class="m2">
        <div class="m2_left">
          <img src="../webservice/image/KakaoTalk_20241127_111509868_02.jpg" alt="제품 이미지" width="300" height="400">
        </div>
        <div class="m2_right">
          <span class="product-name">제품명</span>
          <span class="product-price">판매 가격&nbsp;&nbsp;15,000원</span>
          <span class="shipping-fee">배송비&nbsp;&nbsp;2,500원</span><br>
          <div class="buttons">
            <button class="cart-button">
              <a href="cart.jsp">장바구니</a>
            </button>
            <button class="buy-button">
              <a href="buy.jsp">구매하기</a>
            </button>
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
