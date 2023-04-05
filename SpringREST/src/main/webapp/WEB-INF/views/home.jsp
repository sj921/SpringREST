<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rest Home</title>
</head>
<body>

	<h3>Rest 요청 보내보기</h3>
	
	<ul>
		<li><a href="/springrest/restful/test1">Hello</a></li>
		<li><a href="/springrest/restful/pizza1">pizza1 (JSON, 수동)</a></li>
		<li><a href="/springrest/restful/pizza2">pizza2 (JSON, 자동)</a></li>	
		<li><a href="/springrest/restful/pizza3">pizza3 (XML)</a></li>	
	</ul>


	<h3># ResponseEntity로 응답 직접 생성하기</h3>
	
	<ul>
		<li><a href="/springrest/restful/ok1">ok1</a></li>
		<li><a href="/springrest/restful/ok2">ok2</a></li>
		<li><a href="/springrest/restful/ok3">ok3 (JSON)</a></li>
		<li><a href="/springrest/restful/status1">status1 (502 Bad Gateway)</a></li>
		<li><a href="/springrest/restful/status2">status2 (404 Not found)</a></li>
	</ul>
	
	
	
	<h3># AJAX 요청 보내기 (GET)</h3>
	<c:url value="/resources/js/home.js" var="home_js" />
	
	<div id="ajax-out"></div>
	
	<button id="ajax-btn1">AJAX1(Get Plain Text)</button>
	<button id="ajax-btn2">AJAX2(Get JSON Text)</button>
	<button id="ajax-btn3">AJAX3(Get XML Text)</button>
	
	
	<h3># AJAX 요청 보내기 (POST)</h3>
	
	<button id="ajax-post-btn1">AJAX1(Post, Form)</button>
	<button id="ajax-post-btn2">AJAX2(Post, Json)</button>
	
	<h3># AJAX 요청 보내기 (PUT)</h3>
	
	<button id="ajax-put-btn1">AJAX1(Put, Json)</button>
	
	
	
	

	
	<h3># Form로 요청 보내기</h3>
	<c:url value="/restful/employee" var="emp" />
	
	<h5>* Post (form)</h5>
	<form action="${emp}" method="POST">
		<input type="hidden" name="first_name" value="Mike" />
		<input type="hidden" name="last_name" value="Park" />
		<input type="hidden" name="salary" value="5500" />
		<input type="submit" value="보내기(POST)" />
	</form>
	
	<h5>* Put (form?)</h5>
	<form action="${emp}" method="PUT">
	<p><i>form으로는 GET방식과 POST방식 요청만 보낼 수 있다</i></p>
		<input type="hidden" name="first_name" value="Smith" />
		<input type="hidden" name="last_name" value="King" />
		<input type="hidden" name="salary" value="11000" />
		<input type="submit" value="보내기(PUT)" />
	</form>
	

	

	<script src="${home_js }"></script>
	
	<hr>
	
	
	<c:url value="/resources/js/naverLogin.js" var="naver_js" />
	<script src="${naver_js }"></script>
	<ul>
		<li>
	      <!-- 아래와같이 아이디를 꼭 써준다. -->
	      <a id="naverIdLogin_loginButton" href="javascript:void(0)">
	          <span>네이버 로그인</span>
	      </a>
		</li>
		<li onclick="naverLogout(); return false;">
	      <a href="javascript:void(0)">
	          <span>네이버 로그아웃</span>
	      </a>
		</li>
	</ul>

	<!-- 네이버 스크립트 -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<script>
	
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "rzWHinTgq1ajOQcx4Zv2", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost:8888/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: false,
				callbackHandle: true
			}
		);	
	
	naverLogin.init();
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
	    		
				console.log(naverLogin.user); 
	    		
	            if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	
	
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}
	
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
		
		
	}
	</script>

</body>
</html>