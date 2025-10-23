function chkUserPw() {
	const userPw = document.querySelector("#user-pw");
	const userPw2 = document.querySelector("#user-pw2");

	if (userPw.value !== userPw2.value) {
		alert("비밀번호와 비밀번호 확인이 다릅니다");
		return false;
	} else {
		return true;
	}
}

function chkDel(userId) {
	let cf = confirm("정말로 탈퇴하시겠습니까?");

	if (cf) {
		location.href = "/update/userDelete?userId=" + userId;
	} else {
		alert("탈퇴취소")
	}
}

window.previewImage = function(input) {
	const preview = document.getElementById("preview");
	if (input && input.files && input.files[0]) {
		const reader = new FileReader();
		reader.onload = function (e) {
			preview.src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}
};

const deleteImg = () => {
	if (!confirm("정말 삭제할까요?")) 
		return;

	const preview = document.getElementById("preview");
	const fileInput = document.getElementById("user-img");

	if (preview) 
		preview.src = "/resources/sw/userimage/default_profile.JPG";
	if (fileInput) 
		fileInput.value = "";
};

 function userEmailDupChk() {
//	const userEmailInput = document.querySelector("#user-email");
	const userEmailDupMsg = document.querySelector("#user-email-dup-msg");

	
	if (!frm.userEmail.value) {
		frm.userEmail.focus();
		userEmailDupMsg.textContent = "이메일을입력해주세요";
		userEmailDupMsg.style.color = "red";
		userEmailDupMsg.style.display = "block";
		return false;
	}
	$.post('/userEmailDupChk', "userEmail="+frm.userEmail.value, function(data) {
		$('#user-email-dup-msg').html(data)
	})
}


