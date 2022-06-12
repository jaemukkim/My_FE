<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="../css/style.css"/>  
      <link rel="stylesheet" href="../css/login.css"/>  
<script src="../js/jquery-1.12.3.js"></script>    
<script src="../js/script.js" defer type="text/javascript"></script>
<script src="login.js"></script> 
<script src="modify.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        
            <div class="loginbox1">  
            <a href="main0.jsp"class="login" data-text="로그인">로그인</a>                                       
            </div>
            <div class="loginbox2">
            <a href="join.jsp" class="join"data-text="회원가입">회원가입</a>
            </div>
        
<%
String id ="";
try{
	id = (String)session.getAttribute("id");
%>

<%if(id == null || id.equals("")){ //인증되지 않은 사용자 영역%>
	
	   
    <%}else{//인증된 사용자 영역%>
  <div id="status" class="loginOn">
     <ul>
        <li><b><%=id %></b>님 환영합니다
        <li class="label2"><button id="logout">로그아웃</button>
           <button id="update">회원 정보</button>         
     </ul>
  </div>
<%}}catch(Exception e){e.printStackTrace();}%>



        
        </header>
        <div class="searchbox">
            <div class="search">
                <a href="#">
                    <img src="../images/search.jpg" alt="검색창">
                </a>
            </div>
        </div>
        <div class="bodywrap">
            <div class="imgslide">
                <a href="#">
                    <img src="../images/winetour9.jpg" alt="와이너리 투어">
                </a>           
                <a href="#">
                    <img src="../images/offlinewine.jpg" alt="와이너리 투어">
                </a>
                <a href="#">
                    <img src="../images/farmtour.jpg" alt="와이너리 투어">
                </a>                
            </div>
        </div>        
        <div class="productbox">
            <div class="head">
                <h1>Best Seller</h1>
            <div class="head2">   
                <!-- <h3>지난 해 가장 많이 찾은 와인</h3> -->
            </div>
            <div class="head3">
            <img src="" alt="">
            </div>
        </div>
        </div>
        <div class="bestseller">
            <div class="wine1">
                <a href="product.html">
                    <img src="../images/redwine.jpg" alt="레드와인">
                </a>
            </div>
            <div class="wine2">
                <a href="#">
                    <img src="../images/redwine2.jpg" alt="레드와인">
                </a>
            </div>
            <div class="wine3">
                <a href="#">
                    <img src="../images/redwine3.jpg" alt="레드와인">
                </a>
            </div>
            <div class="wine4">
                <a href="#">
                    <img src="../images/Cwine.jpg" alt="샴페인">
                </a>
            </div>
            <div class="wine5">
                <a href="#">
                    <img src="../images/redwine4.jpg" alt="레드와인">
                </a>
            </div>  
        </div>
        <div class="winenews">
            <h1>Wine News</h1>
        </div>
        <div class="newsbox">
            <div class="news">
                <a href="#">
                    <img src="../images/그림1.jpg" alt="와인가게">
                </a>
                <a href="#">
                <p> <strong>어서와인 종로점 확장 오픈</strong>
                    <br>이번에 종로점 확장 오픈한 기념으<br>로 원하는 와인 시음할 기회를 준..</p>
                </a>
                <a href="#">
                    <img src="../images/winefarm.jpg" alt="와인농장">
                    <p><strong>JYP가 직접 운영한다는 포도밭</strong>
                    <br>대형 엔터테인먼트 소속사 대표인 <br>JYP가 몇년째 운영하고 있다고 하...</p> 
                </a>
            </div>
            <div class="news2">
                <a href="#">
                    <img src="../images/GDwine.jpg" alt="GD">
                    <p><strong>연예인 GD가 좋아한다는 와인 화제</strong>
                    <br>GD가 가끔씩 즐겨마신다는 와인이 <br> 있다고 하는데 그 와인은 바로 이...</p>
                </a>
                <a href="#">
                    <img src="../images/howwine.jpg" alt="와인먹는법">
                    <p><strong>고든램지가 말하는 와인의 효능</strong>
                        <br>레드와인은 심장에 좋고 체지방을<br>감소 시켜주고 황산화 성분인 '페...</p>                    
                </a>
                <div class="news3">
                    <a href="#">
                        <img src="../images/wherewine.jpg" alt="와인보관법">
                        <p><strong>와인 보관은 어떻게 해야할까?</strong>
                            <br>먼저 개봉하지 않은 와인은 어두운 곳에 신문지에 감싸 눕혀서...</p>
                    </a>
                    <a href="#">
                        <img src="../images/wine.food.jpg" alt="와인과음식">
                        <p><strong>음식에 잘 어울리는 와인은?</strong><br>
                        음식보다 산도가 높은 와인을 선택하세요. 음식보다 산도가 낮은...</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="floatbox">
            <div class="float">
                <a href="#">
                    <img src="../images/high.png" alt="상단">
                </a>
                <a href="#">
                    <img src="../images/home.png" alt="홈">
                </a>
                <a href="#">
                    <img src="../images/shopping.png" alt="장바구니">
                </a>
                <a href="#">
                    <img src="../images/search.png" alt="검색">
                </a>
                <a href="#">
                    <img src="../images/under.png" alt="하단">
                </a>
            </div>
        </div>
    <footer>
        <div class="snsbox">
            <div class="sns"></div>
            <table>
                <tr>
                    <td>
            <a href="#">
                <img src="../images/facebook.png" alt="페이스북">
            </a>
                </td>
                <td>
            <a href="#">
                <img src="../images/insta.png" alt="인스타">
            </a>
            </td>
            <td>
            <a href="#">
                <img src="../images/twitter.png" alt="트위터">
            </a>
            </td><td>
            <a href="#">
                <img src="../images/google.png" alt="구글">
            </a></td>
            </table>
            </tr>
            <div class="service">
                <span><a href="#">이용약관</a></span>
                <span><a href="#">서비스맵</a></span>
                <span><a href="#">입점신청</a></span>
                <span><a href="#">광고안내</a></span>
            <div class="service2">
                <p><strong>(주)어서와인</strong></p>
                <p>서울특별시 영등포구 당산로123<br>
                사업자등록번호 : 12345-6789 <br>
                통신판매업신고 : 1234-서울영등포구-56</p>                
            </div>
            <div class="service3">
                <p><strong>고객센터</strong><br><br>080-123-4567<br>관련 문의 09:00 ~ 18:00 <br>주말 및 공휴일 휴무</p>
            </div>
                

            </div>            
        </div>
    </footer>

</body>
</html>