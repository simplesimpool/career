document.getElementById('search-input').addEventListener('focusin', async (e) => {
	await insertKwdBookNameList();
});

document.addEventListener('click', async (e) => {
	const clickedElement = e.target;
	let isSearchInputElement = false;
	let keywordElement = null;
	const kwSrchResContainer = document.getElementById('kw-search-result-container');
	
	for (let i = 0; i < document.getElementsByClassName('keyword-element').length; i++) {
		if (clickedElement === document.getElementsByClassName('keyword-element')[i]) {
			keywordElement = clickedElement;
			break;
		}
		if (clickedElement === document.getElementById('search-input')) {
			isSearchInputElement = true;
			break;
		}
	}
	
	if (keywordElement !== null) {
		location.href = '/search/books?keyword=' + keywordElement.innerText +'&page=1';
	} else {
		if(isSearchInputElement) {
			
		} else {
			kwSrchResContainer.innerHTML = '';
		}
	}
});

async function insertKwdBookNameList() {
	let response = null;
	
	const searchInput = document.getElementById('search-input');
	const kwSrchResContainer = document.getElementById('kw-search-result-container');
	const data = {
		keyword : searchInput.value,
	};
	
	try {
		if (data.keyword !== '') {
			response = await axios.post('/book/getKwdBookNameList', data);
			
			kwSrchResContainer.innerHTML = '';
			for (let i = 0; i < response.data.bookNameList.length; i++) {
				const keywordElement = document.createElement('div');
				
				keywordElement.innerText = response.data.bookNameList[i].bookName;
				keywordElement.style.cursor = 'pointer';
				keywordElement.style.border = '1px solid black';
				
				keywordElement.onmouseenter = function() {
					keywordElement.style.backgroundColor = 'gray';
				};
				keywordElement.onmouseleave = function() {
					keywordElement.style.backgroundColor = '';
				};
				
				keywordElement.classList.add('keyword-element');
				
				kwSrchResContainer.appendChild(keywordElement);
			}
		} else {
			kwSrchResContainer.innerHTML = '';
		}
	} catch (error) {
		console.log('검색 오류', error);
	}
}