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
        
        var reg ="${regout}";
    	  if(reg != ""){
    		  alert(reg);
    	  }
    	var chk = "${checkok}";
    		if(chk != ""){
    			alert(chk);
    		}
    $("#regok").click(function(){
    	if(chk == ""){
        	alert("중복확인 하십시오");
        	$("#regform").attr("action","#");
    	}else{
    		$("#regform").attr("action","RegCtrl.do");
    	}
    });
    	
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
                                <li class="nav-item"><a class="nav-link" href="CateCtrl.do?type=ranking">our Ranking</a></li>
                                <li class="nav-item"><a class="nav-link" href="CateCtrl.do?type=latest">the latest</a></li>
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
	                                    <input type = "button" class = "btn my-2 my-sm-2" value = "sign up"
	                                    onclick = "location.href='Moviereg2.jsp'">
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
 
        <div class="container">
          <h1>회원가입 <small>basic form</small></h1>
        </div>
        <div class="container">
          <form action = "RegCtrl.do" id ="regform">
          <input type ="hidden" name = "RegType" value = "checkId">
            <div class="form-group">
              <label for="InputEmail">이메일 주소</label>
              <div class="input-group">
              <input type="email" class="form-control" id="InputEmail" name ="id" placeholder="이메일 주소" required autofocus>
              <span class="input-group-btn">
                  <button type = "submit" class="btn btn-success" id = "checkid">아이디 중복 확인<i class="fa fa-mail-forward spaceLeft"></i></button>
                </span>
            </div>
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" name ="pass" placeholder="비밀번호" >
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="username" name ="name" placeholder="이름을 입력해 주세요" >
            </div>
            <div class="form-group">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" id="nickname" name ="nickname" placeholder="닉네임을 입력해 주세요" >
            </div>
            <div class="form-group">
              <label>성별</label><br>
                 <input type = "radio" id = "r1" name = "rr" value = "M" >
		  			<label for = "r1"><span></span>남</label>&nbsp&nbsp&nbsp
		  		 <input type = "radio" id = "r2" name = "rr" value = "F" > 
		  			<label for = "r2"><span></span>여</label>
              </div>
            <div class="form-group">
              <label for="birth">생년월일</label>
                <input type="date" class="form-control" id="birth" name ="birth">
            </div>
              
            <div class="form-group">
              <label for="phonenum">휴대폰 번호</label>
                <input type="tel" class="form-control" id="phonenum"  name ="phone" placeholder="- 포함해주세요" >
            </div>
           
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info" id = "regok">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
 
</body>
</html>