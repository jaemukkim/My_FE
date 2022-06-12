<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
 <link rel="stylesheet" href="../css/style.css"/>  
 <link rel="stylesheet" href="../css/login.css"/>  

 <script src="../js/jquery-1.11.0.min.js"></script>
<script src="../js/jquery-1.12.3.js"></script>    
<script src="../js/script.js" defer type="text/javascript"></script>
<script src="login.js"></script> 
<script src="modify.js"></script> 



    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어서와인 로그인</title>
</head>
<body>
    <header>
        <div class="top">
            <div class="logo">
                <a href="mainM.jsp"><img src="../images/aswine.jpg" alt="로고"></a>
            </div>
            <nav class="menu">
                <ul class="navi">
                    <li><a href="#">Wine</a>
                        <ul class="submenu">
                            <li><a href="#">Red Wine</a></li>
                            <li><a href="#">White Wine</a></li>
                            <li><a href="#">Sparkling Wine</a></li>
                            <li><a href="#">Rose Wine</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Whisky</a>
                        <ul class="submenu">
                            <li><a href="#">Malt Whisky</a></li>
                            <li><a href="#">Grain Whisky</a></li>
                            <li><a href="#">Blended Whisky</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Country</a>
                        <ul class="submenu">
                            <li><a href="#">뉴질랜드</a></li>
                            <li><a href="#">프랑스</a></li>
                            <li><a href="#">스페인</a></li>
                            <li><a href="#">독일</a></li>
                            <li><a href="#">호주</a></li>
                            <li><a href="#">미국</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Event</a>
                        <ul class="submenu">
                            <li><a href="#">원데이클래스</a></li>
                            <li><a href="#">오프라인 시음</a></li>
                            <li><a href="#">판매행사</a></li>
                            <li><a href="#">봄맞이행사</a></li>
                        </ul>
                    </li>
                    <li><a href="#">About</a>
                        <ul class="submenu">
                            <li><a href="#">회사 소개</a></li>
                            <li><a href="#">브랜드 소개</a></li>
                            <li><a href="#">온라인 예약</a></li>
                            <li><a href="#">매장안내</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="logotop"></div>  
         
    <header>
        <h2>로그인</h2>
    </header>
<%
String id ="";
try{
	id = (String)session.getAttribute("id");
%>

<%if(id == null || id.equals("")){ //인증되지 않은 사용자 영역%>
    
        <div id="status" class="input-box" >
            <input id="id" type="email" name="id" placeholder="아이디">
            <label for="id">아이디</label>
        </div>
        <div id="status" class="input-box" >
            <input id="password" name="password" type="password">
            <label for="password">비밀번호</label>
        </div>
        <div class="login-box" >
        <button id="login">로그인</button>
        <input type="button" onclick="location.href='join.jsp'" value="회원가입">
        </div>
    </div>    
    <%}else{//인증된 사용자 영역%>
  <div id="status" class="loginOn">
     <ul>
        <li><b><%=id %></b>님이 로그인 하셨습니다.
        <li class="label2">
        <button id="logout">로그아웃</button>
           <button id="update">회원 정보</button>
     </ul>
  </div>
<%}}catch(Exception e){e.printStackTrace();}%>


</body>
</html>