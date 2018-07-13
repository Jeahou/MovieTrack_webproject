<%--
  Created by IntelliJ IDEA.
  User: KimChan
  Date: 2018. 6. 19.
  Time: 오후 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Main Page</title>
  <link rel="stylesheet" href="/webprj/p3_css/index.css" type="text/css">
  <link rel="stylesheet" href="/webprj/p3_css/p3.css" type="text/css">
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
    //<![CDATA[
    $(document).ready(function(){
        $('.StreamImage').bxSlider({
            auto: true,
            mode: 'horizontal',
            useCSS: true,
            control: true,
            speed: 500,
            pause: 2000,
            infiniteLoop: true,
            slideWidth: 800,
            slideMargin: 0
        });
    });

   /*  $( document ).ready( function() {
        var jbOffset = $( '.topMenu' ).offset();
        $( window ).scroll( function() {
            if ( $( document ).scrollTop() > jbOffset.top ) {
                $( '.topMenu' ).addClass( 'jbFixed' );
            }
            else {
                $( '.topMenu' ).removeClass( 'jbFixed' );
            }
        });
    } ); */
    //]]>


</script>
<style>
a:link{
	text-decoration : none;
	text-color :  black;
}

</style>
<body>

<div class="topbutton">
  <%if(session.getAttribute("id")==null){%>
  <a href='login.jsp'><input type='button' value='로그인' class='login'></a>
  <%}else{
    String id = (String)session.getAttribute("id");%>
  <a href='logout.jsp'><input type='button' value='로그아웃' class='login'></a>
  <%}%>

  <a href="reg.jsp"><input type="button" value="회원가입" class="singin"></a>
  <a href="Slot2.jsp"><input type="button" value="장바구니" class="basket"></a>
  <a href="Olist.jsp"><input type="button" value="주문내역" class="olist"></a>
  <a href="MyPage.jsp"><input type="button" value="마이페이지" class="mypage"></a>

  <a href="#"><input type="button" value="공지사항" class="anno"></a>
  <a href="#"><input type="button" value="상품문의" class="qgoods"></a>
  <a href="#"><input type="button" value="1:1문의" class="q1"></a>
  <a href="#"><input type="button" value="사용후기" class="after"></a>
</div>
<span id="brr"></span>
<br><br><br><br>
<div align = "center"><a href = "index.jsp"><h1>어머 이건 사야되~</h1></a>
</div><br><br><br>
<hr class="justline">
<div class="topMenu">
  <ul>
    <li><a href="#" id="current01">MADE</a>
      <!--<ul>
        <li><a href="#">스키니</a></li>
        <li><a href="#">청바지</a></li>
        <li><a href="#">일자바지</a></li>
        <li><a href="#">배기바지</a></li>
      </ul>-->
    </li>

    <li><a href="#" id="current02">TOP</a>
      <ul>
        <li><a href="#">라운드넥</a></li>
        <li><a href="#">브이넥</a></li>
        <li><a href="#">나시티</a></li>
        <li><a href="#">니트</a></li>
      </ul>
    </li>

    <li><a href="#" id="current03">PANTS</a>
      <ul>
        <li><a href="#">스키니</a></li>
        <li><a href="#">청바지</a></li>
        <li><a href="#">일자바지</a></li>
        <li><a href="#">배기바지</a></li>
      </ul>
    </li>

    <li><a href="#" id="current04">OUTER</a>
      <ul>
        <li><a href="#">자켓</a></li>
        <li><a href="#">점퍼</a></li>
        <li><a href="#">베스트</a></li>
        <li><a href="#">가디건</a></li>
        <li><a href="#">코</a></li>
      </ul>
    </li>

    <li><a href="#" id="current05">KINT</a>
      <ul>
        <li><a href="#">니트</a></li>
        <li><a href="#">가디건</a></li>
        <li><a href="#">니트/조끼</a></li>
        <li><a href="#">원피스/스커트</a></li>
      </ul>
    </li>

    <li><a href="#" id="current06">BLOUSE</a>
      <ul>
        <li><a href="Main3.jsp">블라우스</a></li>
        <li><a href="#">셔츠/남방</a></li>
      </ul>
    </li>

    <li><a href="#" id="current07">OPS & SKIRT</a>
      <ul>
        <li><a href="#">원피스</a></li>
        <li><a href="#">스커트</a></li>
        <li><a href="#">점프수트</a></li>
      </ul>
    </li>

    <li><a href="#" id="current08">BAG & SHOES</a>
      <ul>
        <li><a href="#">가방</a></li>
        <li><a href="#">플랫/단화</a></li>
        <li><a href="#">힐</a></li>
        <li><a href="#">운동화/스니커즈</a></li>
      </ul>
    </li>
  </ul>
</div>
<br>

<div class="columnA">
  <div id="column1" style="background-color:#bbb;">

    <form action="Pages/Search.jsp">
      <input type="text" name="search" placeholder="검색어를 입력해주세요" style="float: right">
    </form>
    <br>
    <div class="StreamImage00">
      <div class="StreamImage">
        <a href="#"><img src="/IMG/11.PNG" class="imageslide"/></a>
        <a href="#"><img src="/IMG/Spring.jpg" class="imageslide"/></a>
        <a href="#"><img src="/IMG/Summer.jpg" class="imageslide"/></a>
        <a href="#"><img src="/IMG/Fall.jpg" class="imageslide"/></a>
      </div>
    </div>

    <ul class = "ul1">
      <li class = "li1"><a href = "cloth.jsp" target = "frame1">Best</a></li>
      <li class = "li1"><a href = "cloth2.jsp" target = "frame1">New</a></li>
    </ul>

    <iframe class = "i1" name = "frame1" src = "cloth.jsp" style = "margin : 30px 0 0 35px;"></iframe>
  </div>
  <div id="column2" style="background-color:#ccc;">Column</div>
</div>

<div class="footer">
  <p>Footer</p>
</div>

</div>
</body>
