<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="${path}/resource/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="${path}/resource/popper.min.js"></script>
    <script type="text/javascript" src="${path}/resource/bootstrap.min.js"></script>
<style>
li{
float : left ;
display : inline;
}
</style>

<script type="text/javascript">
    $(document).ready(function(){
    	var mem = "${mem.id}";
        if(mem != ""){
    		  $("input[name=logType]").attr("value","sign out").attr("onclick","location.href='Logout.do'");
    	  }
    });

</script>
<style>
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style = "background-color :#ABABAB;">
    <div class="container">
      <a href="${path}/MovieMain.jsp" class="navbar-brand">Movie Track</a>
    	<div class="d-flex ml-auto">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#globalNavbar" aria-controls="globalNavbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        </div>
        <div class="collapse navbar-collapse" id="globalNavbar">
        	<form class="form-inline form-navbar my-2 my-lg-0 order-2" action="SearchCtrl.do">
               <input class="form-control mr-sm-3" name="s" type="text" placeholder="Search"/>
               <button class="btn my-2 my-sm-2" type="submit">Search</button>
            </form>
                            <ul class="navbar-nav mr-auto order-1">
                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categories</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <div class="navbar-collapse navbar-top-collapse">
	                                        <ul id="menu-top-menu" class="nav navbar-nav">
												<li><a title="" href="CateCtrl.do?type=1">로맨스 & 멜로 </a></li>
												<li><a title="" href="CateCtrl.do?type=2">액션 & 범죄</a></li>
												<li><a title="" href="CateCtrl.do?type=3">SF & 판타지</a></li>
												<li><a title="" href="CateCtrl.do?type=4">공포 & 스릴러</a></li>
												<li><a title="" href="CateCtrl.do?type=5">코미디 & 휴먼</a></li>
												<li><a title="" href="CateCtrl.do?type=6">스포츠 & 음악</a></li>
												<li><a title="" href="CateCtrl.do?type=7">고전 & 기타</a></li>
											</ul>
										</div>
                                    </div>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="#">our Ranking</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">the latest</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">custom sell</a></li>
                                </ul>
                                                            
	                             <ul class="navbar-nav d-none d-lg-flex ml-2 order-3">
	                                    <li class="nav-item"><a class="nav-link">${mem.nikname}</a></li>
	                                    <li class="nav-item">
	                                     <input type = "button" name = "logType" class = "btn my-2 my-sm-2" value = "sign in"
	                                     onclick="location.href='Movielogin.jsp'">
	                                    </li>
	                                    <p>&nbsp</p>
	                                    <li class="nav-item">
	                                    <input type = "button" class = "btn my-2 my-sm-2" value = "sign up">
	                                    </li>
	        
	                             </ul>
                                <ul class="navbar-nav d-lg-none">
                                    <li class="nav-item-divider"></li>
                                    <li class="nav-item"><a class="nav-link" href="#">Sign in</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#">Sign up</a></li>
                                </ul>
                         </div>
                    </div>
                </nav><br>
    <div class = "container">
 <form name="fr" method = "post">
<input type="hidden" name="proc" value="ine"/>
<caption> <h1> 회원가입 </h1> </caption>
<table class="table"  align="center" >
<tr>
<th>아이디 </th>
	<td>

	<!-- <ul>
	<li><input type="text" name="inputID" class = "form-control" style = "width : 500px;"/></li>
	<li><p>&nbsp&nbsp&nbsp</p></li>
	<li><input type = "button" value = "중복확인" id = "idck" onclick = "chid()"/></li>
	</ul> -->
	<div>
	<div style = "display : inline;">
	<input type="text" name="inputID" class = "form-control" style = "width : 500px;"/>
	</div>
	<div style = "display : inline;">
	<input type = "button" value = "중복확인" id = "idck" onclick = "chid()"/>
	</div>
	</div>	
		</td>
</tr>
<tr>
<th>비밀번호 </th> 
		<td colspan="2"><input type="password" name="inputPass" class = "form-control"/></td></tr>
<tr>
<th>이름 </th><td colspan="2"><input type="text" name="inputName" class = "form-control"/></td>
</tr>
<tr>
<th>전화번호 </th>
	<td colspan="2"><input type="text" name="inputTel" class = "form-control"></td>
</tr>
<tr>
	<th>성별 </th>
		<td colspan="2">
		 <input type = "radio" id = "r1" name = "rr" value = "M">
  			<label for = "r1"><span></span>남</label>&nbsp&nbsp&nbsp
  		 <input type = "radio" id = "r2" name = "rr" value = "F"> 
  			<label for = "r2"><span></span>여</label>
		</td>
</tr>
<tr>
<th>생년월일 </th>

			<td colspan="2"><div>
				<select name="years">
				
				<% for(int y=1900; y<=2018; y++){ %>
					<option  selected><%=y %></option>
				
				<%} %>	
				
				</select>
					</select>
					<select name="Months">
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
						<select name="days">
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
<tr><td colspan = "2"><input type="button" id="but" value="회원가입"  onclick="insert();"/>
<span><input type="button" value="취소" onclick="history.back()"></span></td></tr>
</table>
</form>
</div>
</body>
</html>