<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"
		import="java.util.*" import="p3_dbcom.Pdb,p3_db.Ccustom"
		%>
     <%String path=request.getContextPath(); request.setCharacterEncoding("UTF-8");%>
     <%!public String nullCk(String s){return s==null?"":s;} %>  
<%    
    String proc=nullCk(request.getParameter("proc"));
    if(proc.equals("ine")){
    	String id=request.getParameter("inputID");
    	String pass=request.getParameter("inputPass");
    	String name=request.getParameter("inputName");
    	String phon=request.getParameter("inputTel");
    	String email=request.getParameter("inputEmail");
  		String year=request.getParameter("years");
  		String month=request.getParameter("Months");
  		String day=request.getParameter("days");
  		String date1=(year+month+day);	
  		Ccustom ins = new Ccustom();
  		ins.setC_id(id);
  		ins.setC_password(pass);
  		ins.setC_name(name);
  		ins.setC_phonenum(phon);
  		ins.setC_mail(email);
  		ins.setC_birth(date1);
  		Pdb db = new Pdb();
  		if((boolean)db.exeExcept(2, ins) == false){
  		db.exeExcept(1, ins);%>
  		<script>location.href='login.jsp';</script>
  		<%}
    } 
    %>
     
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
.table{
	width:50%;
	margin-left:400px;
}
.jumbotron{
		margin-top:100px;
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
    $(document).ready(function(){
});
    
    function insert(){
    	//아이디 정규식
    	var idReg=/^[a-z]+[a-z0-9]{3,15}$/g;
    	//비밀번호 정규식
    	var psReg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,16}$/;
    	//이름 정규식
    	var naReg=/^[가-힣]{2,4}$/;
    	//전화번호 정규식
    	var pnReg=/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
    	//이메일 정규식
    	var emReg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	
    	var id=document.querySelector("input[name=inputID]");
    	if(id.value==""){
    		alert("아이디를 입력하세요!");
    		id.focus();
    		return;
    	}else if(!idReg.test($("input[name=inputID]").val())){
    			alert("아이디는 영소문자로 시작하는 3~15자  \n 영문자 또는 숫자이어야 합니다.");
    			id.focus();
    			return;
    		}
    	var pass=document.querySelector("input[name=inputPass]");
    	if(pass.value==""){
    		alert("비밀번호를 입력하세요!");
    		pass.focus();
    		return;
    	}else if(!psReg.test($("input[name=inputPass]").val())){
    		alert("비밀번호는 숫자 ,영 대소문자의 조합이되어야합니다.\n 비밀번호는 6~16자");
    		pass.focus();
    		return;
    	}
    	var name=document.querySelector("input[name=inputName]");
    	if(name.value==""){
    		alert("이름을 입력하세요!");
    		name.focus();
    		return;
    	}else if(!naReg.test($("input[name=inputName]").val())){
    		alert("한글로 2~4자 입력하세요.");
    		name.focus();
    		return;
    	}
    	var phon=document.querySelector("input[name=inputTel]");
    	if(phon.value==""){
    		alert("전화번호를 입력하세요!");
    		phon.focus();
    		return;
    	}else if(!pnReg.test($("input[name=inputTel]").val())){
    		alert("000-0000-0000식으로 입력하세요");
    		phon.focus();
    		return;
    	}
    	var mail=document.querySelector("input[name=inputEmail]");
    	if(mail.value==""){
    		alert("이메일을 입력하세요!");
    		mail.focus();
    		return;
    	}else if(!emReg.test($("input[name=inputEmail]").val())){
    		alert("123@aaa.bbb 같은 방식으로 입력하세요");
    		mail.focus();
    		return;
    	}
    	var form = document.querySelector("form");
    	if(confirm("등록하시겠습니까?"));form.submit();
    		
    }



    function chid(){
    	var id = document.querySelector("input[name=inputID]");	
    	if(id.value == ""){
    		alert("id를 입력하시오");
    		id.focus();
    	}else{
    	   url = "checkId.jsp?id="+id.value;
    	   window.open(url,"id check","toolbar=no, width=350, height=150, top=150, left=150");
    	}
    }
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
        <li><a href="http://192.168.0.68:7080/webprj/p3/Main3.jsp">블라우스</a></li>
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
  	<div class="jumbotron text-center">
  				 <h1> 회원가입 </h1>
<form name="fr" method = "post">
<input type="hidden" name="proc" value="ine"/>
<table class="table table-striped">
<tr>
<th>아이디 </th>
	<td>
	<div>
	<input type="text" name="inputID" style="width: 450px; "/> 
	<input type = "button" value = "중복확인" id = "idck" onclick = "chid()"/>
		</div>
		</td>
</tr>
<tr>
<th>비밀번호 </th> 
		<td colspan="2"><input type="password" name="inputPass" style="width: 465px; "/></td></tr>
<tr>
<th>이름 </th><td colspan="2"><input type="text" name="inputName" style="width: 465px; "/></td>
</tr>
<tr>
<th>전화번호 </th>
	<td colspan="2"><input type="text" name="inputTel" style="width: 465px; "></td>
</tr>
<tr>
	<th>이메일 </th>
		<td colspan="2"><input type="text" name="inputEmail" style="width: 465px; "></td>
</tr>
<tr>
<th>생년월일 </th>

			<td colspan="2"><div>
				<select name="years" style="width: 70px; ">
				
				<% for(int y=1900; y<=2018; y++){ %>
					<option  selected><%=y %></option>
				
				<%} %>	
				
				</select>
					<select name="Months" style="width: 100px; ">
							<option value="01" selected>1</option>
							<option value="02" selected>2</option>
							<option value="03" selected>3</option>
							<option value="04" selected>4</option>
							<option value="05" selected>5</option>
							<option value="06" selected>6</option>
							<option value="07" selected>7</option>
							<option value="08" selected>8</option>
							<option value="09" selected>9</option>
							<option value="10" selected>10</option>
							<option value="11" selected>11</option>
							<option value="12" selected>12</option>
			   		</select>
						<select name="days" style="width: 150px; ">
							<option value="01"selected>1</option>
							<option value="02"selected>2</option>
							<option value="03"selected>3</option>
							<option value="04"selected>4</option>
							<option value="05"selected>5</option>
							<option value="06"selected>6</option>
							<option value="07"selected>7</option>
							<option value="08"selected>8</option>
							<option value="09"selected>9</option>
							<option value="10"selected>10</option>
							<option value="11"selected>11</option>
							<option value="12"selected>12</option>
							<option value="13"selected>13</option>
							<option value="14"selected>14</option>
							<option value="15"selected>15</option>
							<option value="16"selected>16</option>
							<option value="17"selected>17</option>
							<option value="18"selected>18</option>
							<option value="19"selected>19</option>
							<option value="20"selected>20</option>
							<option value="21"selected>21</option>
							<option value="22"selected>22</option>
							<option value="23"selected>23</option>
							<option value="24"selected>24</option>
							<option value="25"selected>25</option>
							<option value="26"selected>26</option>
							<option value="27"selected>27</option>
							<option value="28"selected>28</option>
							<option value="29"selected>29</option>
							<option value="30"selected>30</option>
							<option value="31"selected>31</option>					
						</select>
					</div>
		</td>		
</tr>
<tr><td colspan = "2" align="right"><input type="button"  value="회원가입"  onclick="insert();" style="width: 100px; "/>
<span><input type="button" value="취소" onclick="history.back()"></span></td></tr>
			<!--  취소버튼[ 전페이지로 이동 ]-->
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