<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>구매 페이지</title>
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

    .welcome-message {
      color: black;
      font-weight: bold;
    }

    .product-name {
      font-weight: bold;
      font-size: 1.5em;
    }

    .product-price, .shipping-fee {
      font-size: 1.2em;
      margin-top: 10px;
      display: block;
    }

	.button {
      padding: 10px 20px;
      background-color: #B8D0FA;
      cursor: pointer;
      color: black;
      border: none;
      font-weight: bold;
      border-radius: 5px;
    }
    .button:hover {
      background-color: Skyblue;
      color: purple;
      transform: scale(1.05);
    }

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

    .buttons .buy-button {
      background-color: #b8d0fa;
      border: solid silver 2px;
      color: black;
      font-weight: bold;
    }

    .buttons .buy-button:hover {
      background-color: Skyblue;
      transform: scale(1.05);
      color: purple;
    }

    .buttons a {
      color: inherit;
      text-decoration: none;
    }

    .m2 {
      display: flex;
      justify-content: center;
      padding-top: 20px;
      padding-bottom: 20px;
    }

    .m2_left img {
      width: 300px;
      height: 400px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .m2_right {
      font-family: Arial, sans-serif;
      margin-left: 50px;
      padding-left: 10px;
    }

    .overlay {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      z-index: 999;
    }

    .confirm-banner {
      display: none;
      position: fixed;
      top: 30%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: white;
      border: 2px solid #B8D0FA;
      border-radius: 10px;
      padding: 20px;
      width: 300px;
      text-align: center;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      z-index: 1000;
    }

    .confirm-banner button {
      margin: 10px;
      padding: 10px 20px;
      font-weight: bold;
      border: none;
      border-radius: 5px;
      cursor: pointer
      transition: transform 0.3s ease, background-color 0.3s ease;
    }

    .confirm-banner .confirm {
      background-color: #B8D0FA;
      color: black;
      transition: transform 0.3s ease, background-color 0.3s ease;
    }

    .confirm-banner .confirm:hover {
      background-color: Skyblue;
      transform: scale(1.05);
      color: purple;
      cursor: pointer;
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
          <p class="welcome-message"><%= userName %>님 반갑습니다 😊</p>
          <form action="buy.jsp" method="post">
            <button type="submit" name="logout" class="button">로그아웃</button>
          </form>
        <% } else { %>
          <a href="register.jsp" class="button">회원가입</a>
          <a href="login.jsp" class="button">로그인</a>
        <% } %>
      </div>
      <div class="h2">
        <a href="index.jsp">
          <img src="<%= request.getContextPath() %>/webservice/image/스크린샷 2024-11-28 210005.png" width="289" height="103" alt="로고">
        </a>
      </div>
      <nav class="h3">
        <div class="h3_center">
          <a href="all_item.jsp">전체상품</a>&nbsp;
          <a href="lotion.jsp">로션/크림</a>&nbsp;
          <a href="cleansing.jsp">클렌징</a>&nbsp;
          <a href="ampoule.jsp">앰플/세럼</a>&nbsp;
          <a href="board_list.jsp">Q&A 게시판</a>
        </div>
        <div class="h3_right">
          <img src="<%= request.getContextPath() %>/webservice/image/free-icon-font-search-17767794.png" width="24" height="24" alt="검색">
          <img src="<%= request.getContextPath() %>/webservice/image/free-icon-font-user-17766671.png" width="24" height="24" alt="사용자">
        </div>
      </nav>
    </header>

    <div class="main">
      <h1 class="m1">구매 페이지</h1>
      <div class="m2">
        <div class="m2_left">
          <img src="<%= request.getContextPath() %>/webservice/image/KakaoTalk_20241127_111509868_02.jpg" alt="제품 이미지" width="300" height="400">
        </div>
        <div class="m2_right">
          <span class="product-name">제품명</span>
          <span class="product-price">판매 가격 :&nbsp;&nbsp;15000원</span>
          <span class="shipping-fee">배송비 :&nbsp;&nbsp;2500원</span>
          <% 
            int productPrice = 15000;  
            int shippingFee = 2500;    
            int totalPrice = productPrice + shippingFee;  
          %>
          <span class="shipping-fee">결제하실 금액 :&nbsp;&nbsp;<%= totalPrice %>원</span>
          
          <div class="buttons">
            <button class="buy-button" onclick="showSuccessBanner()">구매하기</button>
          </div>
        </div>
      </div>
    </div>

    <footer class="footer">
      <span style="font-weight: bold">웹프로그래밍응용 Team_Project</span>
    </footer>
  </div>

  <div id="overlay" class="overlay"></div>
  <div id="successBanner" class="confirm-banner">
    <p>구매가 완료되었습니다.</p>
    <p>감사합니다 😊</p>
    <button class="confirm" onclick="redirectToHome()">확인</button>
  </div>

  <script>
    function showSuccessBanner() {
      document.getElementById('overlay').style.display = 'block';
      document.getElementById('successBanner').style.display = 'block';
    }

    function redirectToHome() {
      window.location.href = 'index.jsp';
    }
  </script>
  <% 
    // 로그아웃 처리
    if (request.getParameter("logout") != null) {
        session.invalidate();  // 세션 종료
        response.sendRedirect("cleansing.jsp");  // 로그아웃 후 cleansing.jsp로 리다이렉트
    }
  %>
</body>
</html>
      