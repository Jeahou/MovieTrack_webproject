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
        $('.StreamImage').bxSlider({
            auto: true,
            mode: 'horizontal',
            minSlides:4,
            maxSlides:4,
            useCSS: true,
            control: true,
            speed: 500,
            pause: 2000,
            infiniteLoop: true,
            slideWidth: 1200,
            slideMargin: 0
        });
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
              
	<div class=container>
		<form action="login.do" method="post">
			<div class="LoginSet">
				<div class="Login">
					<input type="hidden" name="loginid"> <input type="hidden" name="loginpass">
					<div class="container">
						<br>
						<h2 style="text-align: center">로그인</h2>
							<table class="table table-hover"
								style="width: 50%; margin-left: 25%">
								<tr>
									<td>ID</td>
									<td><input type="email" name="id" class="form-control"
										placeholder="E-mail을 입력해주세요" required autofocus/></td>
								</tr>
								<tr>
									<td>Password</td>
									<td><input type="password" name="pass"
										class="form-control" placeholder="비밀번호를 입력해주세요" required></td>
								</tr>
								<tr>
									<td><input type="submit" value="로그인"
										class="btn btn-primary"></td>
									<td><input type="button" value="회원가입"
										class="btn btn-primary"
										onclick="location='http://192.168.0.68:7080/webprj/p3/p3_reg.jsp'"></td>
								</tr>
							</table>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>