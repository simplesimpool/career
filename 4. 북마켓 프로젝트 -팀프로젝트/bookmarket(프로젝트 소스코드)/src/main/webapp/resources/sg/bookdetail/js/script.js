const bookReqCntRegex = /^(?:[1-9]|[1-9][0-9]|[1-9][0-9]{2})$/;
const currencyFormatter = new Intl.NumberFormat('ko-KR', {
	style: 'currency',
	currency: 'KRW',
});

let curBookReqCntInputValue = 1;

function refreshBookTotalPrice(unitPrice) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	const bookTotalPriceInput = document.getElementById('book-total-price');
	
	if (bookReqCntRegex.test(bookReqCntInput.value)) {
		curBookReqCntInputValue = bookReqCntInput.value;
		bookTotalPriceInput.value = currencyFormatter.format(unitPrice * bookReqCntInput.value).replace('₩', '').trim();
	} else {
		bookReqCntInput.value = curBookReqCntInputValue;
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}
}

function decBookReqCnt(unitPrice) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	const bookTotalPriceInput = document.getElementById('book-total-price');
	
	if (bookReqCntRegex.test(bookReqCntInput.value)) {
		if (bookReqCntInput.value !== bookReqCntInput.min) {
			bookReqCntInput.value = parseInt(bookReqCntInput.value) - 1;
			curBookReqCntInputValue = bookReqCntInput.value;
			bookTotalPriceInput.value = currencyFormatter.format(unitPrice * bookReqCntInput.value).replace('₩', '').trim();
		}
	} else {
		bookReqCntInput.value = curBookReqCntInputValue;
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}
}

function incBookReqCnt(unitPrice) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	const bookTotalPriceInput = document.getElementById('book-total-price');
		
	if (bookReqCntRegex.test(bookReqCntInput.value)) {
		if (bookReqCntInput.value !== bookReqCntInput.max) {
			bookReqCntInput.value = parseInt(bookReqCntInput.value) + 1;
			curBookReqCntInputValue = bookReqCntInput.value;
			bookTotalPriceInput.value = currencyFormatter.format(unitPrice * bookReqCntInput.value).replace('₩', '').trim();
		}
	} else {
		bookReqCntInput.value = curBookReqCntInputValue;
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}
}

async function isUser() {
	let response = null;
	try {
		response = await axios.get('/user/chkIsUser');
		
		return response.data;
	} catch (error) {
		return false;
	}
}

async function addBook(id) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	let response = null;
	let isUserResult = await isUser();
	const data = {
		bookId : id,
		bookCnt : bookReqCntInput.value
	};
	
	if (isUserResult === false) {
		alert("먼저 로그인 해주세요");
		return;
	}
			
	if (!bookReqCntRegex.test(bookReqCntInput.value)) {
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}
	
	try {
		response = await axios.post('/cart/addBook', data);
		if (response.data === 1) {
			alert('장바구니 담기 성공');
			return;
		} else if (response.data === 0) {
			alert('이미 장바구니에 있습니다');
			return;
		} else if (response.data === -1) {
			alert('장바구니에 넣을 수 있는 책의 최대 갯수를 초과했습니다 (최대 : 15개)')
		}
		else if (response.data === -2) {
			alert('관리자는 장바구니 이용불가')
		} else {
			alert('장바구니 오류');
		}
	} catch(error) {
		alert('장바구니 오류');
		return;
	}
}

async function isBookRcdExist(id) {
	let response = null;
	const data = {
		bookId : id
	};
	
	try {
		response = await axios.post('/bookRcd/chkIsRcdExist', data);
		
		return response.data;
	} catch (error) {
		return false;
	}
}

async function insertBookRcd(id) {
	let response = null
	const data = {
		bookId : id
	};
	
	try {
		response = await axios.post('/bookRcd/insert', data);
		
		return response.data;
	} catch(error) {
		return false;
	} 
}

async function doRefreshBookRcdCnt(cnt) {
	const bookRcdContainer = document.getElementById('book-rcd-container');
	bookRcdContainer.textContent = '추천수 : ' + cnt; 
}

async function rcdBook(id) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	let isBookRcdExistResult = null;
	let insertBookRcdResult = null;
	let response = null;
	const data = {
		bookId : id
	};
	let isUserResult = await isUser();
	
	if (isUserResult === false) {
		alert("먼저 로그인 해주세요");
		return;
	}
	
	isBookRcdExistResult = await isBookRcdExist(id);
	if (isBookRcdExistResult === true) {
		alert('추천은 1일 1회만 가능합니다');
		return;
	}
	
	insertBookRcdResult = await insertBookRcd(id);
	if (insertBookRcdResult === 1) {
		alert('추천 성공');
	} else if (insertBookRcdResult === -1) {
		alert('관리자는 추천할 수 없습니다');
		return;
	} else {
		alert('추천오류');
		console.log()
		return;
	}
	
	try {
		response = await axios.post('/book/incBookRcdCnt', data);
		if (response.data.isSuccess) {
			await doRefreshBookRcdCnt(response.data.bookRcdCnt);
		} else {
			alert('추천하기 실패');
		}
	} catch (error) {
		alert('추천 증가 오류');
		return;
	}
}