<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"
		import="p3_dbcom.Pdb,p3_db.Ccustom"
		%>
     <%String path=request.getContextPath(); request.setCharacterEncoding("UTF-8");%>
     
     <%

     	
     String pass2=request.getParameter("pass");
     String phone=request.getParameter("phon");
     String mail=request.getParameter("mail");
     
     Ccustom ct = new Ccustom(pass2,phone,mail);
    	   Pdb db = new Pdb();
     if(session.getAttribute("id")!=null){
    	 
     
     db.update(ct);%>
     <script> 
     alert("변경되었습니다.");
   	location.href="MyPage.jsp";
     </script>
	
	<% 
	}  
    %>
 
     
     
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
#look{
	width:150px;
		float:left;
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
  <a href="Slot.jsp"><input type="button" value="장바구니" class="basket"></a>
  <a href="Pages/Olist.jsp"><input type="button" value="주문내역" class="olist"></a>
  <a href="MyPage.jsp"><input type="button" value="마이페이지" class="mypage"></a>

  <a href="#"><input type="button" value="공지사항" class="anno"></a>
  <a href="#"><input type="button" value="상품문의" class="qgoods"></a>
  <a href="#"><input type="button" value="1:1문의" class="q1"></a>
  <a href="#"><input type="button" value="사용후기" class="after"></a>
</div>
</body>

</html>