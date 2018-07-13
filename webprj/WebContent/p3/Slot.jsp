<%@page import="p3_db.Ccustom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "p3_db.Cpro,p3_db.Poption,p3_dbcom.P3_cpro,p3_db.Cart"
    import = "java.util.*"
%>
  <%String path=request.getContextPath();request.setCharacterEncoding("utf-8");%>
  
  <%
  	String img = (String)session.getAttribute("pimage");
  	String name = (String)session.getAttribute("pname");
  	int pri = (int)session.getAttribute("pri");
    String color1 = (String)session.getAttribute("color1");
    String color2 = (String)session.getAttribute("color2");
    String color3 = (String)session.getAttribute("color3");
    String size1 = (String)session.getAttribute("size1");
    String size2 = (String)session.getAttribute("size2");
    String size3 = (String)session.getAttribute("size3");
    session.setAttribute("cnt1", new Integer(request.getParameter("cnt1")));
  	int cnt1 = (Integer)session.getAttribute("cnt1");
  	session.setAttribute("cnt2", new Integer(request.getParameter("cnt2")));
  	int cnt2 = (Integer)session.getAttribute("cnt2");
  	session.setAttribute("cnt3", new Integer(request.getParameter("cnt3")));
  	int cnt3 = (Integer)session.getAttribute("cnt3");
    int tot1 = pri * cnt1;
    int tot2 = pri * cnt2;
	int tot3 = pri * cnt3;
    ArrayList<Cart> clist = new ArrayList<Cart>();
    if(session.getAttribute("list")!=null){
    	clist=(ArrayList<Cart>)session.getAttribute("list");
    }
    
    if(cnt1 != 0){
    	clist.add(new Cart(img,name,color1,size1,cnt1,pri,tot1));
    }else{
    	session.removeAttribute("color1");
    	session.removeAttribute("size1");
    }
    if(cnt2 != 0){
    	clist.add(new Cart(img,name,color2,size2,cnt2,pri,tot2));
    }else{
    	session.removeAttribute("color2");
    	session.removeAttribute("size2");
    }
    if(cnt3 != 0){
    	clist.add(new Cart(img,name,color3,size3,cnt3,pri,tot3));
    }else{
    	session.removeAttribute("color3");
    	session.removeAttribute("size3");
    }
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css"> 	
<link rel="stylesheet" href="/webprj/p3_css/index.css" type="text/css">
<link rel="stylesheet" href="/webprj/p3_css/p3.css" type="text/css">
<script type="text/javascript" src = "<%=path%>/css/jquery-3.3.1.min.js">
</script>
<script type="text/javascript" src="<%=path%>/css/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$(document).on("click","input[name = del]",function(){
		  var trHtml = $(this).parent().parent();
		  trHtml.remove();
	});
});
</script>
<style>
#cloimg{
	float : left;
	width : 400px;
	height : 600px;
	margin : 10px 50px 0 25%;
}
#cate{
	float : left;
	width : 400px;
	height : 500px;
	margin : 10px 50px 0 50px;
}
td{
	text-align : center;
}
#totalcnt{
	text-align : left;
}
#totalcntTable{
	width : 390px; 
	height : 40px;
	border-top: 1px solid #000;
}
.bordertable th{
  background-color: #f7f8fa;        
  text-align: center;
}

.bordertable td{
  padding-left:20px !important;
}  

.bordertable th, .bordertable td{
  font-family: '나눔고딕',NanumGothic,'맑은고딕',MalgunGothic,'돋움',Dotum,Helvetica,sans-serif;
  font-size: 18px;      
  border:1px solid #ededed !important;
  font-weight: normal;          
  line-height: 19px;
  color:#20232;
  padding-top: 9px !important;
  padding-bottom: 7px !important;
}

</style>
</head>
<body>
<div class="topbutton">
  <%if(session.getAttribute("id")==null){%>
  <a href='login.jsp'><input type='button' value='로그인' class='login'></a>
  <%}else{
    String id = (String)session.getAttribute("id");%>
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
<!-- <input type= "button" value="주문하기"/><br>
  <input type= "button" value="관심상품"/><br>
  <input type= "button" value="삭제하기"/> -->
 <div class="columnA">
  <div id="column1" style="background-color:#bbb;">
  <div align = "center"><h1>장바구니</h1></div><br>
     <table width="100%"  class="table table-bordered bordertable">
  <tr><th width="15%">상품정보</th><th width="45%">상품명</th><th>판매가</th><th>수량</th>
  <th>총합</th><th>선택</th></tr>
  	<tbody>
  	<%for(Cart c : clist) {%>
  	<tr><td><img src='<%=c.getImg() %>' width = "140px" height = "140px"/></td>
  						<td><br><br><%=c.getName() %><br>
  						<%=c.getColor()%>-<%=c.getSize() %></td>
  						<td><br><br><%=c.getPri() %></td>
  						<td><br><br><%=c.getCnt() %></td>
  						<td><br><br><%=c.getTot() %></td>
  			<td width="209px">
  			<br>
	<input type= "button" value="주문하기"/><br>
	<input type= "button" value="삭제하기" name = "del"/>
			</td>
  		</tr>
  		<%} %>
  	</tbody>
  </table>

  <div id = "point"></div>
  <div id="cate">
  </div>
  </div>
  <div id="column2" style="background-color:#DCDCDC">Column</div>
 </div>
</div>
<div class="footer">
  <p>Footer</p>
</div>

</body>
</html>