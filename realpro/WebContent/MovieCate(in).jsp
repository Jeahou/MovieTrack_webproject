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
.star_rating {font-size:0; letter-spacing:-4px;}

.star_rating a {

    font-size:22px;

    letter-spacing:0;

    display:inline-block;

    margin-left:5px;

    color:#ccc;

    text-decoration:none;

}

.star_rating a:first-child {margin-left:0;}

.star_rating a.on {color:#777;}

#ulcss{
	display : flex;
	align-content : flex-start;
	flex-direction : column;
	flex-wrap : wrap;
	overflow : auto;
}

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
         if(mem == ""){
        	 $("#rf").attr("action","#");
         }else{
        	 $("#rf").attr("action","ReviewCtrl.do");
         } 
         
         $("input[name=sub]").click(function(){
        	 if(mem == ""){
        		 alert("로그인 후 이용 가능 하십니다.")
        	 }	
         });
         
        $( ".star_rating a" ).click(function() {
		    $(this).parent().children("a").removeClass("on");
		    $(this).addClass("on").prevAll("a").addClass("on");
		    return false;
		});
	  $( ".star_rating a" ).click(function() {
		  if($("#s5").hasClass('on')){
			  $("#star").attr("value", "5");
		  }else if($("#s4").hasClass('on')){
			  $("#star").attr("value", "4");
		  }else if($("#s3").hasClass('on')){
			  $("#star").attr("value", "3");
		  }else if($("#s2").hasClass('on')){
			  $("#star").attr("value", "2");
		  }else if($("#s1").hasClass('on')){
			  $("#star").attr("value", "1");
		  }
	  });
	  
	  $("input[name=toggle]").click(function(){
		  $(".reviewToggle").toggle();
	  });
      
	  $("button[name=buy]").click(function(){
		 location.href = "DownloadCtrl.do?downfile=${MovieI.avi}&userPoint=${mem.point}&point=${MovieI.pri}"; 
	  });
	  
	  var nopoint = "${noPoint}";
	  if(nopoint != ""){
		  alert(nopoint);
	  }
	  /* var a = "${MovieI.avi}";
	  alert(a); */
	  /* var b = "${mem.point}";
	  alert(b); */
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
	<h1>${MovieI.name}</h1>
		<div class="row">
		<div class="col-md-6 col-xs-6 text-center" style="margin-top:7%">
			<ul class="list-group bg-dark" style="width:270px">
			<li class="list-group-item bg-dark"><a class="btn btn-priamry" data-toggle="modal" data-target="#myModal" data-backdrop="static">
			<img src="${MovieI.pop}" style="float:left; padding:0px; margin:0px; width:100%;height:70%">
			</a></li>
			</ul>
			</div>
	<!-- 개요 부분 -->				
	<div class="col-md-6 col-xs-6" style="margin-top:-27%; margin-left:30%; padding:0%;">
		<dl class="border border-right-0 border-left-0 border-primary" style="width:70%">
			<dd>
			<p>
			<span><dt>개요</dt>
			${MovieI.type}  &nbsp | &nbsp  ${MovieI.date} 개봉 &nbsp  | &nbsp  ${MovieI.rt}
			</span></p>
			<dt>감독</dt><p>
			${MovieI.dir}
			</p>
			<p>
			<span><dt>주연 배우</dt>
			${MovieI.act1} ,
			${MovieI.act2} ,
			${MovieI.act3}
			</span></p>
			<dt>등급</dt><p>
			${MovieI.grd}
			</p>	
			<dd>	
			<dt>가격</dt><p>
			${MovieI.pri}
			</p>
		</dl>
	</div>
	
		<div class="btn" style="margin-left:29%;">
				<button class="btn btn-lg" name = "buy">구매하기</button>
		</div>
	<!--  하단 리뷰  부분 -->
	<div class = "container">
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab"
					data-toggle="tab" href="#nav-home" role="tab"
					aria-controls="nav-home" aria-selected="true">스틸컷</a> 
					<a class="nav-item nav-link" id="nav-profile-tab"
					data-toggle="tab" href="#nav-profile" role="tab"
					aria-controls="nav-profile" aria-selected="false">리뷰</a> 
			</div>
		</nav>
	<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab">
				
					<img src="${MovieImg.img1}" class="imageslide" style = "width : 200px; height : 200px;" />
					<img src="${MovieImg.img2}" class="imageslide" style = "width : 200px; height : 200px;" />
					<img src="${MovieImg.img3}" class="imageslide" style = "width : 200px; height : 200px;" />
					<img src="${MovieImg.img4}" class="imageslide" style = "width : 200px; height : 200px;" />
					<img src="${MovieImg.img5}" class="imageslide" style = "width : 200px; height : 200px;" />
					
			</div>
			<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			
				<input type = "button" class = "btn my-2 my-sm-2" value = "리뷰 입력" name = "toggle">

						<div class = "reviewToggle" style = "display : none;">
							<hr>
							<form id = "rf" method="post" action = "ReviewCtrl.do">
								<div>별점 :</div>
								<p class="star_rating">
									<a id="s1" href="#">★</a> 
									<a id="s2" href="#">★</a> 
									<a id="s3" href="#">★</a> 
									<a id="s4" href="#">★</a> 
									<a id="s5" href="#">★</a>
								</p>

								<input name="id" type="hidden" value="${mem.nikname}"  /> 
								<input id="star" type="hidden" name = "star">
								<input type = "hidden" name = "movie_num" value = "${MovieI.num}">
								<div>Title :</div>
								<div>
									<input name="boardTitle" id="boardTitle" type="text" />
								</div>
								<div>Content :</div>
								<div>
									<textarea name="boardContent" id="boardContent" rows="5"
										cols="50"></textarea>
								</div>
								<div>
									<input type="submit" value="글입력" name = "sub" /> <input type="reset"
										value="초기화" />
								</div>
							</form>
						<hr>	
						</div>
					<div class = "reviewToggle">
					<hr>
						<ul id ="ulcss">
						<c:forEach items = "${MovieReview}" var = "list">
							
							<li>
							<strong>${list.title}</strong> 
							<span>작성자 : ${list.name}
									<em>| ${list.date} </em> | 별점 -
									
									<c:forEach begin = "1" end = "${list.star}">
									★ 
									</c:forEach>
									
									</span>
								<p>${list.content}</p>
							</li>

						
						</c:forEach>
						</ul>
					<hr>	
					</div>	
			</div>
		</div>
	</div>
</div>

<!-- modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" id="myModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="width:100%">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" aria-hidden="true">
			<div class="modal-header bg-dark" style="width:100%" >
				<h2 style="color:white">영화제목 : 공식 트레일러<h2>
							<button type="button" class="close bg-white" data-dismiss="modal">X</button>
			</div>
			<div class="modal-body bg-dark">
				<iframe width="100%" height="720px" src="https://www.youtube.com/embed/Nv9sOIKgx5s?autoplay=1&loop=1" frameborder="0" encrypted-media="" allowfullscreen="" rel="0"></iframe>
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>