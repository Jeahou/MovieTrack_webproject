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
.row img{
 width: 100%; padding: 7px 0;

}
.pagination a.active{
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
	background-color:#1212ee;
}
.pagination a.hover:not(.active){background-color:#ddd;}
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
        	<form class="form-inline form-navbar my-2 my-lg-0 order-2" action="#">
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
              
			<div class="container" style="margin-top:3%">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card ">
						<a href="CateInCtrl.do?mov=1&movN=${MovieS.get(0).num}"><img class="card-middle"src="${MovieS.get(0).pop}"></a>
							<div class="card-body">
							 <p class="card-text text-center">${MovieS.get(0).name}</p>
							</div>		 
						</div>
					</div>
						<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card ">
						<a href="MovieCate(in).jsp"><img class="card-middle"src="m_1.jpg"></a>
							<div class="card-body">
							 <p class="card-text text-center">asdad</p>
							</div>		 
						</div>
					</div>
						<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card ">
						<a href="MovieCate(in).jsp"><img class="card-middle"src="m_1.jpg"></a>
							<div class="card-body">
							 <p class="card-text text-center">asdad</p>
							</div>		 
						</div>
					</div>
						<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card ">
						<a href="MovieCate(in).jsp"><img class="card-middle"src="m_1.jpg"></a>
							<div class="card-body">
							 <p class="card-text text-center">asdad</p>
							</div>		 
						</div>
					</div>
<!-- 끝 -->
<!-- 둘째줄 시작 -->
				<div class="container" style="margin-top:3%">
					<div class="row">
					<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card">
						<a href="MovieCate(in).jsp"><img class="card-middle"src="m_1.jpg"></a>
							<div class="card-body">
							 <p class="card-text text-center">asdad</p>
							</div>		 
						</div>
					</div>
						<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card">
						<a href="MovieCate(in).jsp"><img class="card-middle"src="m_1.jpg"></a>
							<div class="card-body">
							 <p class="card-text text-center">asdad</p>
							</div>		 
						</div>
					</div>
						<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card ">
						<a href="MovieCate(in).jsp"><img class="card-middle"src="m_1.jpg"></a>
							<div class="card-body">
							 <p class="card-text text-center">asdad</p>
							</div>		 
						</div>
					</div>
						<div class="col-lg-3 col-md-4 col-xs-6">
					<div class="card">
						<a href="MovieCate(in).jsp"><img class="card-middle"src="m_1.jpg"></a>
							<div class="card-body">
							 <p class="card-text text-center">asdad</p>
							</div>
						</div>
					</div>
				</div>
			</div>	
			<!-- 둘째줄 끝 -->
	</div>
</div>
<!-- 영화 포스터위치 끝 -->
<div class="container">
	<div style="margin-left:40%; margin-top:10%">
		<nav>
			<ul class="pagination">
			    <li class="page-item"><a class="page-link" href="#">이전</a></li>
  				<li class="page-item"><a class="page-link active" href="NewFile5.jsp">1</a></li>
   				<li class="page-item"><a class="page-link" href="#">2</a></li>
   				<li class="page-item"><a class="page-link" href="#">3</a></li>
    			<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</nav>
	</div>
</div>
</body>
</html>