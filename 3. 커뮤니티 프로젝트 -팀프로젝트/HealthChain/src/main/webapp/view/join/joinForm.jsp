<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("./view/join/join.css");
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    // 페이지 로드 시 초기화: 의사코드번호 창 숨기기
    $('#doctorCodeField').hide();

    // 라디오 버튼에 따라 입력창 표시
    $('input[name="job"]').on('change', function () {
        if ($(this).val() === 'doctor') {
            $('#doctorCodeField').show();
        } else {
            $('#doctorCodeField').hide();
            $('#drLicCode').val(''); // 의사코드 초기화
        }
    });
});


 let chk = () => {
	 if (frm.userPw.value != frm.userPw2.value) {
		 alert("암호와 암호확인이 다릅니다");
	     frm.userpw.focus();
	     frm.userPw.value ="";
	     frm.userPw2.value ="";
 } else {
	  alert("확인되었습니다");
	  return;
     } 
 }
 
 let dubCHK = () => {
	 if (!frm.userId.value) {
		 alert("id를 입력하세요")
		 frm.userId.focus();
		 return false;
	 }
	 
	   $.post('user_id_confirm.sw' , 'userId=' + frm.userId.value, function(data) {
		   $('#err').html(data); 
	  });
 } 
 
 let chkcode = () => {
		if (!frm.drLicCode.value) {
			alert("코드를 입력하세요");
		    frm.drLicCode.focus();
		    return false;
		} else if (frm.drLicCode.value.length != 6)  {
			alert("6자리의 코드를 입력하세요")
			return false;
		}
		
	

	$.post('dr_lic_code_confirm.sw' , 'drLicCode=' + frm.drLicCode.value, function(data) {
		   $('#err2').html(data); 
	});

 }
 
 let nicknameCHK = () => {
		if (!frm.userNickname.value) {
			alert("닉네임을 입력하세요");
		    frm.userNickname.focus();
		    return false;
		} 
		
	$.post('user_nickname_confirm.sw' , 'userNickname=' + frm.userNickname.value, function(data) {
		   $('#err3').html(data); 
	});

}

</script>
</head>
<body>
	<main>
		<div class="joinform">
			<form action="join.sw" method="post" name="frm" id="frm">
				<div class="logo">
					<a>회원가입</a>
				</div>
				<div class="line">
				<div>아이디<input
						type="button" value="아이디중복확인" onclick="dubCHK()" class="chkbtn"></div>
					<input type="text" name="userId" required="required" autofocus="autofocus" class="textfield"> 
					<div id="err" class="err"></div>
				</div>

				<div class="line">
					<div>비밀번호</div>
					<input type="password" name="userPw" required="required" class="textfield">
				</div>

				<div class="line">
					<div>비밀번호 확인<input
						type="button" value="확인" onclick="chk()" class="chkbtn"></div> 
					<input type="password" name="userPw2" required="required" class="textfield"> 
				</div>

				<div class="line">
					<div>이름</div>
					<input type="text" name="userName" required="required" class="textfield">
				</div>

				<div class="line">
					<div>닉네임<input
						type="button" value="닉네임중복확인" onclick="nicknameCHK()"
						class="chkbtn"></div>
					<input type="text" name="userNickname" required="required" class="textfield"> 
					<div id="err3" class="err"></div>
				</div>
				<div class="line">
					<div>전화 번호</div>
					<input type="tel" name="userTel" required="required" class="textfield"
						placeholder="010-1111-1234" pattern="010-\d{3,4}-\d{4}"
						title="전화형식은 010-1111-1234입니다">
				</div>
				<div class="line">
					<div>주소</div>
					<input type="text" name="userAddr" required="required" size="60" class="textfield"
					style="width: auto;">
				</div>

				<div class="line">
					<div>회원</div>
					<input type="radio" name="job" value="general" size="60" checked>
					일반회원 <input type="radio" name="job" value="doctor" size="60">
					의사회원

				</div>

				<div id="doctorCodeField" class="line">
					<div>의사코드번호<input type="button" value="인증확인" class="chkbtn"
						onclick="chkcode()"></div>
					<input type="text" name="drLicCode" id="drLicCode" required="required" class="textfield"
						placeholder="의사 코드 입력"> 
					<div id="err2" class="err"></div>
				</div>

				<br>
				<div class="button">
			<input type="submit" value="회원가입" class="submit-btn" class="chkbtn">
					<button type="submit" value="로그인" class="submit-btn" onclick="location.href='loginForm.sw'">로그인</button>
					<button class="submit-btn" style="width: auto;" onclick="location.href='main.jb'">↩</button>
				</div>
			</form>
			
		</div>


	</main>
</body>
</html>