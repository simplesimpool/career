

document.getElementById('book_img').addEventListener('change', function(event) {
	const file = event.target.files[0];
	const preview = document.getElementById('imgPreview');
	if (file) {
		const reader = new FileReader();
		reader.onload = function(e) {
			preview.src = e.target.result;
			preview.style.display = 'block';
		};
		reader.readAsDataURL(file);
	} else {
		preview.style.display = 'none';
		preview.src = '';
	}
});


document.addEventListener("DOMContentLoaded", function() {
	const form = document.querySelector("form");
	const submitButton = form.querySelector("button[type='submit']");

	submitButton.addEventListener("click", function(e) {
		const confirmed = confirm("정말 도서 등록 신청을 하시겠습니까?");
		if (!confirmed) {
			e.preventDefault(); // 제출 중단
		}
	});
});
