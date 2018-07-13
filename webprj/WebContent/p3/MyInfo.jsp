<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"
		import="p3_dbcom.Pdb,p3_db.Ccustom"
		%>
     <%String path=request.getContextPath(); request.setCharacterEncoding("UTF-8");%>
     
     <%
     String id=(String)session.getAttribute("id");
     String pass= request.getParameter("chkpass");
     
     
     Ccustom ct = new Ccustom(id,pass);
     Pdb db = new Pdb();
     if(db.info(id, pass)==null){%>
    	 <script>
    		alert("틀렸습니다. 다시입력해주세요");
    		location.href="MyPage.jsp";
    	 </script>
     <%
     }else{%>
     		<script>
     		alert("확인 완료");
     		<%session.setAttribute("info", db.info(ct));%>
     		</script>     
     <%}%>
  
     
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="<%=path %>/p3_css/index.css" type="text/css">
  <link rel="stylesheet" href="<%=path %>/p3_css/p3.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"> 	
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="<%=path %>/css/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
src="<%=path %>/css/jquery-3.3.1.min.js">

</script>
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
	margin-top:70px;
	margin-left:330px;
	width:500px;
	float:center;
}
#left2{
	float:left;
	margin-left :100px;
	width:200px;
}

.jumbotron{
	width:100%;
	padding:0px;
	margin:0px;
	padding-right:0px;
}
.table-striped{
	width:40%;
	padding:0px;	
	margin-left:650px;
}

</Style>
<script>
    //<![CDATA[
    $(document).ready(function(){
    //]]>
  
    	$('#look').on("click",function(){
			
    		$('#cop').html($(''))
	});
});
</script>
<body>

<div class="topbutton">
  <%if(session.getAttribute("id")==null){%>
  <a href='login.jsp'><input type='button' value='로그인' class='login'></a>
  <%}else{
    String Id = (String)session.getAttribute("id");%>
  <a href='logout.jsp'><input type='button' value='로그아웃' class='login'></a>
  <%}%>

  <a href="reg.jsp"><input type="button" value="회원가입" class="singin"></a>
  <a href="#"><input type="button" value="장바구니" class="basket"></a>
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
		<div id="left2" >
		<ul>
			<li class="d"><a href="#">장바구니</a></li>
			<!-- <li class="d"><a href="#">거래내역</a></li> -->
		</ul>
		</div>	
			
				<div class="jumbotron text-center">
				<form action=MyUpdate.jsp method="post">
						<h2>회원정보 수정</h2>
				<table class="table table-striped text-center">
					<tr><td>아이디</td><td>${info.c_id}</td></tr>
					<tr><td>비밀번호</td><td><input type="password" name="pass" value="${info.c_password }"></td></tr>
					<tr><td>이름</td><td>${info.c_name}</td></tr>
					<tr><td>전화번호</td><td><input type="text" name="phon" value="${info.c_phonenum}"></td></tr>
					<tr><td>메일</td><td><input type="text" name="mail" value="${info.c_mail}"></td></tr>
					<tr><td>생년월일</td><td>${info.c_birth}</td></tr>
					<tr><td colspan="2"> <input type="submit" value="변경"></td></tr>
				</table>	
				</form>		
				</div>
				
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