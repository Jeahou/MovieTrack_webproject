<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"
		%>
     <%String path=request.getContextPath();request.setCharacterEncoding("UTF-8");%>
     
     <%if(session.getAttribute("id")==null){%>
     <script>
     alert("로그인을 해야합니다.");
     location.href="login.jsp";
    </script>
     <%}else{%>
     	
	<%} %>
	
	
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="<%=path%>/p3_css/index.css" type="text/css">
  <link rel="stylesheet" href="<%=path%>/p3_css/p3.css" type="text/css">
  <link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="<%=path %>/css/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
src="<%=path%>/css/jquery-3.3.1.min.js">
</script>
<script src="<%=path %>/css/bootstrap.min.js"></script>

<title>Insert title here</title>
<Style>
tr,td,th{
	text-align:center
	
	}
li.d{
	list-style-type:none;
	text-size:20px;
	background-color:#2222cc;
	border:1px solid #FEFEFE;
	padding:15px;
	margin:30px;
	
}
#cop{
	width:800px;
	height:800px;
	border:1px solid;
	margin-left:390px;
	margin-top:100px;	
}
hr{
	border-color:black;
}	
</Style>
<script>
    //<![CDATA[
    $(document).ready(function(){

    } );

  
</script>
<body>

<div class="topbutton">
  <%if(session.getAttribute("id")==null){%>
  <a href='login.jsp'><input type='button' value='로그인' class='login'></a>
  <%}else{
    String id = (String)session.getAttribute("id");%>
  <a href='logout.jsp'><input type='button' value='로그아웃' class='login'></a>
  <%}%>

  <a href="reg.jsp"><input type="button" value="회원가입" class="singin"></a>
  <a href="Slot.jsp"><input type="button" value="장바구니" class="basket"></a>
  <a href="Pages/Olist.jsp"><input type="button" value="주문내역" class="olist"></a>
  <a href="MyPage.jsp"><input type="button" value="마이페이지" class="mypage"></a>

  <a href="#"><input type="button" value="공지사항" class="anno"></a>
  <a href="#"><input type="button" value="상품문의" class="qgoods"></a>
  <a href="#"><input type="button" value="1:1문의" class="q1"></a>
  <a href="#"><input type="button" value="사용후기" class="after"></a>
</div>
<span id="brr"></span>
<br><br><br><br><br><br><br><br><br><br>
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
  
	<table class="table table-striped" style="width:70%; margin-left:10%;
	margin-top:150px;">
	<tr><td width="15%">
		<div id="look">
		<ul>
			<!-- <li class="d"><a href="left.jsp">회원정보 수정</a></li> -->
			<li class="d"><a href="#">장바구니</a></li>
			<!-- <li class="d"><a href="#">거래내역</a></li> -->
			<!-- <li class="d"><a href="#">회원 탈퇴</a></li> -->
		</ul>
		</div>
	</td>
				<td>
				 <form method="post" action="MyInfo.jsp">
				<div class="form-group" border-style="">
						 <h2>my페이지 접속</h2>
			
						 <br><br>
					<h4>패스워드 입력</h4><br><input type="password" name="chkpass" width="200px"/><br>
						<input type="submit" value="확인"/>
						<input type="button" value="취소"/>		
				</div>
				</form>
				</td></tr>
	</table>
    
	
	</div>
  </div>
 
  <div id="column2" style="background-color:#ccc;"><form action="Pages/Search.jsp">
  
      <input type="text" name="search" placeholder="검색어를 입력해주세요" style="float: right">
    </form>
  </div>

<div class="footer">
  <p>Footer</p>
</div>

</body>

</html>