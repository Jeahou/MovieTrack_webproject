<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "p3_db.Cpro,p3_db.Poption,p3_dbcom.P3_cpro"
    import = "java.util.*"%>
<% String path = request.getContextPath();
	request.setCharacterEncoding("utf-8");%>
	<!-- 요청값이 post일때 한글 처리  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="/webprj/p3_css/index.css" type="text/css">
  <link rel="stylesheet" href="/webprj/p3_css/p3.css" type="text/css">
<script type="text/javascript" src = "<%=path%>/css/jquery-3.3.1.min.js">
</script>
<script>
<%
Cpro sch = new Cpro();
P3_cpro cp = new P3_cpro();
ArrayList<Cpro> clist = (ArrayList<Cpro>)cp.excepClose(0, sch);
System.out.println("검색된 데이터 건수:"+clist.size());
Poption psch = new Poption(clist.get(0).getP_num());
ArrayList<Poption> oplist = (ArrayList<Poption>)cp.excepClose(2, psch);

session.setAttribute("pname", clist.get(0).getP_name());
session.setAttribute("pimage", clist.get(0).getP_image());
session.setAttribute("pri", clist.get(0).getP_price());
session.setAttribute("color1",oplist.get(0).getPo_color());
session.setAttribute("color2",oplist.get(1).getPo_color());
session.setAttribute("color3",oplist.get(2).getPo_color());
session.setAttribute("size1",oplist.get(0).getPo_size());
session.setAttribute("size2",oplist.get(1).getPo_size());
session.setAttribute("size3",oplist.get(2).getPo_size());

%>
  $(document).ready(function(){
	  
	  var p1 = 0;
	  var p2 = 0;
	  var p3 = 0;
	  $("#totalcnt").html(p1+p2+p3);
	  
	  $("#selectcolor").change(function(){
		  if($("#selectcolor option:selected").val() == 1){
			  $("#hidden1").css("display","");
			  $("input[name=cnt1]").attr("value", 1);
			  p1 = <%=clist.get(0).getP_price() %>;
			  $("#totalcnt").html(p1+p2+p3);
		  }else if($("#selectcolor option:selected").val() == 2){
			  $("#hidden2").css("display","");
			  $("input[name=cnt2]").attr("value", 1);
			  p2 = <%=clist.get(0).getP_price() %>;
			  $("#totalcnt").html(p1+p2+p3);
		  }else if($("#selectcolor option:selected").val() == 3){
			  $("#hidden3").css("display","");
			  $("input[name=cnt3]").attr("value", 1);
			  p3 = <%=clist.get(0).getP_price() %>;
			  $("#totalcnt").html(p1+p2+p3);
		  }
	  });
	  $("input[name=del1]").on('click',function(){
		  $("#hidden1").css("display","none");
		  p1 = 0;
		  $("#totalcnt").html(p1+p2+p3);
	  });
	  $("input[name=del2]").on('click',function(){
		  $("#hidden2").css("display","none");
		  p2 = 0;
		  $("#totalcnt").html(p1+p2+p3);
	  });
	  $("input[name=del3]").on('click',function(){
		  $("#hidden3").css("display","none");
		  p3 = 0;
		  $("#totalcnt").html(p1+p2+p3);
	  });
	  
	  $("input[name=cnt1]").change(function(){
		  var cnt = $("input[name=cnt1]").val();
		  var pri = <%=clist.get(0).getP_price() %>;
		  $("#pri1").html(cnt*pri+"원");
		  p1 = cnt*pri;
		  $("#totalcnt").html(p1+p2+p3);
	  });
	  
	  $("input[name=cnt2]").change(function(){
		  var cnt = $("input[name=cnt2]").val();
		  var pri = <%=clist.get(0).getP_price() %>;
		  $("#pri2").html(cnt*pri+"원");
		  p2 = cnt*pri;
		  $("#totalcnt").html(p1+p2+p3);
	  });
	  
	  $("input[name=cnt3]").change(function(){
		  var cnt = $("input[name=cnt3]").val();
		  var pri = <%=clist.get(0).getP_price() %>;
		  $("#pri3").html(cnt*pri+"원");
	  	  p3 = cnt*pri;
	  	$("#totalcnt").html(p1+p2+p3);
	  });
	  
	  $("#cart").on('click',function(){
		  $("#formid").attr("action", "Slot.jsp");
	  });
	  
	  $("#buy").on('click',function(){
		  $("#formid").attr("action", "buy.jsp");
	  });
	  
	  $("#formid").submit(function(){
		  if($("#hidden1").css("display") == "none" && $("#hidden2").css("display") == "none" && $("#hidden3").css("display") == "none"){
			  alert("옵션을 선택하세요");
			  $("#formid").attr("action", "#");
		  }
	  });
  });

</script>
<style>
a:link{
	text-decoration : none;
}
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
	text-align : right;
}
#totalcntTable{
	width : 390px; 
	height : 40px;
	border-top: 1px solid #000;
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
  <a href="Slot.jsp"><input type="button" value="장바구니" class="basket"></a>
  <a href="Pages/Olist.jsp"><input type="button" value="주문내역" class="olist"></a>
  <a href="Pages/MyPage.jsp"><input type="button" value="마이페이지" class="mypage"></a>

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
  <div id="cloimg">
  <table width = "390px" height = "490px">
  <tr><td><img src= "<%=clist.get(0).getP_image() %>" width = "390px" height = "490px"></td></tr> 
  </table>
  <br>
  <table border width = "390px" height = "80px">
  </table>
  </div>
  <div id = "point"></div>
  <div id="cate">
  <table border width = "390px" height = "300px">
  <tr><th colspan = "2" class ="mono_table" ><%=clist.get(0).getP_name()%></th></tr>
  <tr><th>판매가</th><td><%=clist.get(0).getP_price()%>원</td></tr>
  <tr><th>색상 - 사이즈</th>
  <td><form>
  	<select name = "color" id = "selectcolor" style=" width: 118px; ">
  	<option value="0" selected>필수 선택</option>
    <option value="1"><%=oplist.get(0).getPo_color() %>-<%=oplist.get(0).getPo_size() %></option>
    <option value="2"><%=oplist.get(1).getPo_color() %>-<%=oplist.get(1).getPo_size() %></option>
    <option value="3"><%=oplist.get(2).getPo_color() %>-<%=oplist.get(2).getPo_size() %></option>
  </select>
  </form></td></tr>
  </table>
  <br>
  <form action = "Slot.jsp" id = "formid">
  <table id = "totalcntTable">
  <tbody id = "serviceTbody" align = "right">
  <tr id ="hidden1" style = "display:none"><td><%=oplist.get(0).getPo_color() %>-<%=oplist.get(0).getPo_size() %> &nbsp &nbsp
				<input type='number'  name='cnt1' value='0' style = 'width : 40px;'>
				</td><td id = "pri1"><%=clist.get(0).getP_price() %>원</td>
				<td><input type = 'button' value = 'x' name = 'del1'></td></tr>
  <tr id ="hidden2" style = "display:none"><td><%=oplist.get(1).getPo_color() %>-<%=oplist.get(1).getPo_size() %> &nbsp &nbsp
				<input type='number'  name='cnt2' value='0' style = 'width : 40px;'>
				</td><td id = "pri2"><%=clist.get(0).getP_price() %>원</td>
				<td><input type = 'button' value = 'x' name = 'del2'></td></tr>
  <tr id ="hidden3" style = "display:none"><td><%=oplist.get(2).getPo_color() %>-<%=oplist.get(2).getPo_size() %> &nbsp &nbsp
				<input type='number'  name='cnt3' value='0' style = 'width : 40px;'>
				</td><td id = "pri3"><%=clist.get(0).getP_price() %>원</td>
				<td><input type = 'button' value = 'x' name = 'del3'></td></tr>
				
  </tbody>
  <tr><td>총 구매액 :</td><td id = "totalcnt">0원</td></tr>
  <tr><td><input type = 'submit' id = 'buy' style = "background-color : red; width : 180px; height : 70px;" value = "구매"></td>
  <td></td>
  <td ><input type = 'submit' id = 'cart' style = "background-color : white; width : 120px; height : 70px;" value = "장바구니"></td></tr>
  </table>
  </form>
  </div>
  </div>
  <div id="column2" style="background-color:#ccc;">Column</div>
 </div>
</div>
<div class="footer">
  <p>Footer</p>
</div>
</body>
</html>