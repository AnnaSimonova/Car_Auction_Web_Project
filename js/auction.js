document.body.onload = function() {
	const database = setDB();
	setFilterRanges();
	generateMakes(database);
	setOtherFilters(database);
	setCarList(database);
	showTypeMakeModel(database);

	const field = document.getElementById('buy_now');
	field.onchange = function() {
		setCarList(database);
	};
	document.getElementById('lower').onchange = function() {
		setCarList(database);
	};
	document.getElementById('upper').onchange = function() {
		setCarList(database);
	}
};

// Get search parameters from uri
function getSearchParameter() {
	const parts = window.location.search.substr(1).split("&");
	let $_GET = {};
	for (let i = 0; i < parts.length; i++) {
		const temp = parts[i].split("=");
		$_GET[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
	}
	if ($_GET["search"] === "undefined") {
		return "";
	} else {
		return $_GET["search"];
	}
}

function getParameters() {
	const parts = window.location.search.substr(1).split("&");
	let $_GET = {};
	for (let i = 0; i < parts.length; i++) {
		const temp = parts[i].split("=");
		$_GET[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
	}
	return $_GET;
}

// Top "Makes" block
function generateMakes(database) {
	const makesBlock = document.getElementById('makes-block');
	const makes = database.map(function(value) {
		return value['make'];
	});

	const uniqueMakes = Array.from(new Set(makes));
	uniqueMakes.map(function(value) {
		let p  = document.createElement('p');
		let label = document.createElement('label');
		let span = document.createElement('span');
		let input = document.createElement('input');
		input.setAttribute('type', 'radio');
		input.setAttribute('class', 'radio_btn');
		input.setAttribute('oninput', "setCarList(setDB())");
		input.setAttribute('name', value);
		label.appendChild(input);
		span.innerHTML = value;
		label.appendChild(span);
		p.appendChild(label);
		makesBlock.appendChild(p);
	});
}

// Filter ranges (price)
function setFilterRanges() {
	const lowerSlider = document.querySelector('#lower');
	const upperSlider = document.querySelector('#upper');

	document.querySelector('#two').innerHTML = upperSlider.value;
	document.querySelector('#one').innerHTML = lowerSlider.value;

	let lowerVal = parseInt(lowerSlider.value);
	let upperVal = parseInt(upperSlider.value);

	upperSlider.oninput = function () {
		lowerVal = parseInt(lowerSlider.value);
		upperVal = parseInt(upperSlider.value);
		document.querySelector('#two').innerHTML=this.value;
		if (upperVal <= lowerVal) {
			document.querySelector('#one').innerHTML = this.value;
			document.querySelector('#two').innerHTML = lowerVal;
		}
};

	lowerSlider.oninput = function () {
		lowerVal = parseInt(lowerSlider.value);
		upperVal = parseInt(upperSlider.value);
		document.querySelector('#one').innerHTML=this.value;
		if (lowerVal >= upperVal) {
			document.querySelector('#one').innerHTML = upperVal;
			document.querySelector('#two').innerHTML = this.value;
		}
	};
}

function toggleFilters(event) {
	let elem = event.target.id;
	const link = document.getElementById(elem);
	const filterName = document.querySelector(`#${elem} + div`);
	link.classList.toggle('red-color');
	filterName.classList.toggle('visible');
}

function setOtherFilters(database) {
	const chbxFilters = document.getElementById('other-filters');
	const chbxFilterPoints = ['year', 'Fuel', 'odometer_miles', 'body_style'];

	chbxFilterPoints.forEach(function(filterPoint) {
		const wrapper = document.createElement('div');
		wrapper.setAttribute('class', 'filter');

		const fp = document.createElement('p');
		fp.setAttribute('id', filterPoint);
		fp.setAttribute('class', 'filter-name');
		fp.setAttribute('onclick', 'toggleFilters(event)');
		fp.innerHTML = formatStr(filterPoint);

		const inputsBlock = document.createElement('div');
		inputsBlock.setAttribute('class', 'inputs');

		let uniqueValues = [];
		const inputValues = database.map(function(value) {
			if (!uniqueValues.includes(value[filterPoint])) {
				const inputs = document.createElement('p');
				const label = document.createElement('label');
				const input = document.createElement('input');
				input.setAttribute('type', 'checkbox');
				input.setAttribute('class', filterPoint);
				input.setAttribute('id', filterPoint+'_'+value[filterPoint]);
				input.setAttribute('name', value[filterPoint]);
				input.setAttribute('onchange', "setCarList(setDB())");
				uniqueValues.push(value[filterPoint]);

				label.appendChild(input);
				label.innerHTML += value[filterPoint];
				inputs.appendChild(label);
				inputsBlock.appendChild(inputs);
			}
		});

		wrapper.appendChild(fp);
		wrapper.appendChild(inputsBlock);
		chbxFilters.appendChild(wrapper);
	});
}

function addFilters() {
	let filtersList = [];
	const makesFilters = document.getElementsByClassName('radio_btn');
	let radioChecked = [];
	for (let i = 0; i < makesFilters.length; i++) {
		if (makesFilters[i].checked) {
			radioChecked.push(makesFilters[i].name);
		}
	}
	if (radioChecked.length !== 0 ) {
		filtersList.push(['checkbox', 'make', radioChecked]);
	}

	if (document.getElementById('buy_now').checked) {
		filtersList.push(['buy_now', document.getElementById('buy_now').name]);
	}

	const selectfilters = ['vehicle_type', 'make', 'model'];
	selectfilters.map(function(item) {
		const field = document.getElementById(item);
		if (field.selectedIndex > 0) {
			filtersList.push(['select', item, field.options[field.selectedIndex].value]);
		}
	});

	const filters = document.getElementsByClassName('inputs');
	for (let i = 0; i < filters.length; i++) {
		let checkedPoints = [];
		let classN = '';
		let points = filters[i].querySelectorAll('p label input[type=checkbox]');
		for (let j = 0; j < points.length; j++) {
			if (points[j].checked) {
				checkedPoints.push(points[j].name);
				classN = points[j].className;
			}
		}
		if (checkedPoints.length !== 0 ) {
			filtersList.push(['checkbox', classN, checkedPoints]);
		}
	}

	// price range filter
	const firstPriceLevel = document.getElementById('lower').value;
	const secondPriceLevel = document.getElementById('upper').value;
	filtersList.push(['range', firstPriceLevel, secondPriceLevel]);

	// search filter
	const searchInput = getSearchParameter();
	if (searchInput) {
		filtersList.push(['search', searchInput]);
	}

	// from select form on home page
	const getParams = getParameters();
	for (prop in getParams) {
		if ((prop === 'vehicle_type' || prop === 'make' || prop === 'model') && getParams[prop] !== "undefined" && getParams[prop] !== "") {
			filtersList.push(['select', prop, getParams[prop]]);
		}
	}
	return filtersList;
}

function setCarList(database) {
	const list  = document.getElementById('cars-list');
	list.innerHTML = '<div class="paginator" onclick="pagination(event)"></div>';

	let pagCounter = 1;
	const filters = addFilters();

	database = database.filter(function(car) {
		let flag = true;
		filters.forEach(function(filterItem) {
			if (filterItem[0] === 'select' && car[filterItem[1]] !== filterItem[2]) flag = false;
			if (filterItem[0] === 'buy_now' && (car[filterItem[1]] == null || car[filterItem[1]] === '')) flag = false;
			if (filterItem[0] === 'checkbox') {
				let localFlag = false;
				filterItem[2].map(function(item) {
					if (car[filterItem[1]] === item) localFlag = true;
				});
				if (localFlag === false) flag = false;
			}
			if (filterItem[0] === 'range'
				&& !(((car['buy_now'] >= Math.min.apply(null, [filterItem[1], filterItem[2]]))
					&& (car['buy_now'] <= Math.max.apply(null, [filterItem[1], filterItem[2]])))
					|| ((car['ACV']*0.4 >= Math.min.apply(null, [filterItem[1], filterItem[2]]))
						&& (car['ACV']*0.4 <= Math.max.apply(null, [filterItem[1], filterItem[2]]))))) flag = false;
			if (filterItem[0] === 'search') {
				const search = filterItem[1].toUpperCase();
				if (car['make'].toUpperCase().match(search) == null && car['model'].toUpperCase().match(search) == null && car['VIN'].toUpperCase().match(search) == null) {
					flag = false;
				}
			}
		});
		return flag === true;
	});
	database.forEach(function(auto) {
		setCarBlock(auto, pagCounter);
		pagCounter++;
	});

	const vehiclesList = document.getElementsByClassName('car_block');
	if (vehiclesList.length === 0) {
		list.innerHTML += '<div id=\'emptyListReply\'><p>Unfortunately, no vehicles were found.</p><p>Please change your filter settings</p></div>';
	}
}

function setCarBlock(auto, pagCounter) {
	const listBlock = document.getElementById('cars-list');
	const carBlock = document.createElement('div');
	carBlock.setAttribute('class', 'car_block');
	carBlock.setAttribute('data-num', pagCounter);
	carBlock.setAttribute('id', auto['id']);

	const img = document.createElement('img');
	img.setAttribute('class', 'car-img');
	img.setAttribute('src', 'images/catalog/'+auto['id']+'/0.jpeg');

	const carDescr = document.createElement('div');
	carDescr.setAttribute('class', 'car-descr');

	const headerLine = document.createElement('div');
	headerLine.setAttribute('id', 'car-header-line');

	const carName = document.createElement('a');
	carName.setAttribute('href', 'car_profile.html?id=' + auto.id);
	carName.setAttribute('class', 'car-name');
	carName.innerHTML = auto['make'] + ' ' + auto['model'] + ' ' + auto['year'];

	const auctionInfoBlock = document.createElement('div');
	auctionInfoBlock.setAttribute('id', 'auction-info-block');

	const carDetails = document.createElement('div');
	carDetails.setAttribute('class', 'car-details');
	setPreBid(carDetails, auto);

	const headerProperties = ['id', 'make', 'model', 'year', 'Currency', 'vehicle_type', 'damage_loss', 'primary_damage', 'secondary_damage', 'Auction type', 'Document type', 'VIN', 'Location', 'start_code', 'ACV'];
	const auctionProperties = ['Auction date', 'buy_now', 'Current bid'];

	let counter = 0;
	for (let property in auto) {
		if (auto.hasOwnProperty(property) && !!auto[property]) {
			if (auctionProperties.includes(property)) {
				const param = document.createElement('p');
				param.setAttribute('class', 'auction-info-details');
				param.innerHTML = formatStr(property)+ ': <span>' +auto[property]+'</span>';
				if (property === 'Auction date') {
					param.setAttribute('id', 'auction-date');
				} else {
					param.innerHTML += auto['Currency']+'   ';
				}
				auctionInfoBlock.appendChild(param);
				counter++;
			} else if (!headerProperties.includes(property) && !auctionProperties.includes(property)) {
				if (property === 'ACV') {
					const param = document.createElement('p');
					param.innerHTML = formatStr(property)+ ': <span>' +auto[property]*0.4+'</span>';
					carDetails.appendChild(param);
				} else {
					const param = document.createElement('p');
					param.innerHTML = formatStr(property)+ ': <span>' +auto[property]+'</span>';
					carDetails.appendChild(param);
				}
			}
		}
	}
	if (counter === 0) {
		auctionInfoBlock.removeAttribute('id');
		carName.style.width = '100%';
	}

	const moreDetailsBtn = document.createElement('button');
	moreDetailsBtn.setAttribute('class', 'car-details-btn');
	moreDetailsBtn.setAttribute('onclick', 'window.location.href=\'car_profile.html?id=' + auto.id+'\'');
	moreDetailsBtn.innerHTML = 'More details';

	headerLine.appendChild(carName);
	headerLine.appendChild(auctionInfoBlock);
	carDescr.appendChild(headerLine);
	carDescr.appendChild(carDetails);
	carDetails.appendChild(moreDetailsBtn);

	if (auctionInfoBlock.hasAttribute('id')) {
		const prebidBtn = document.createElement('button');
		prebidBtn.setAttribute('class', 'car-details-btn');
		prebidBtn.setAttribute('id', 'prebid-btn');
		prebidBtn.setAttribute('onclick', "document.getElementById('prebid-modal-"+auto['id']+"').style.display='block'");
		prebidBtn.innerHTML = 'Pre-Bid';
		carDetails.appendChild(prebidBtn);
	}

	carBlock.appendChild(img);
	carBlock.appendChild(carDescr);
	listBlock.appendChild(carBlock);

// Showing list of pages (pagination)
	const count = document.querySelectorAll(".car_block").length;
	const cnt = 3;
	const cnt_page = Math.ceil(count / cnt);

	const paginator = document.querySelector(".paginator");
	count <= cnt ? paginator.classList.add('hidden') : paginator.classList.remove('hidden');

	let page = "<span data-page=\"0\" class=\"page1\"><<</span>";
	for (var i = 0; i < cnt_page; i++) {
		page += "<span data-page=" + i * cnt + "  class=\"page" + (i + 1) + "\">" + (i + 1) + "</span>";
	}
	page += "<span data-page=" + (i-1) * cnt + "  class=\"page" + i + "\">>></span>";
	paginator.innerHTML = page;

	const div_num = document.querySelectorAll(".car_block");
	for (let i = 0; i < div_num.length; i++) {
		if (i < cnt) {
			div_num[i].style.display = "block";
		}
	}

	const main_page = document.getElementsByClassName("page1");
	main_page[1].classList.add("paginator_active");
}

function pagination(event) {
	const count = document.querySelectorAll(".car_block").length;
	const cnt = 3;
	const cnt_page = Math.ceil(count / cnt);
	let main_page = document.querySelector(".paginator_active");

	const e = event || window.event;
	const target = e.target;
	const className = target.className;

	if (target.tagName.toLowerCase() !== "span") return;

	const num_ = className.substr(4);
	let data_page = +target.dataset.page;
	main_page.classList.remove("paginator_active");
	main_page = document.getElementsByClassName(className);
	if (main_page[0].classList.contains('page1')) {
		main_page[1].classList.add("paginator_active");
	} else {
		main_page[0].classList.add("paginator_active");
	}

	let j = 0;
	const div_num = document.querySelectorAll(".car_block");
	for (let i = 0; i < div_num.length; i++) {
		const data_num = div_num[i].dataset.num;
		if (data_num <= data_page || data_num >= data_page)
			div_num[i].style.display = "none";

	}
	for (let i = data_page; i < div_num.length; i++) {
		if (j >= cnt) break;
		div_num[i].style.display = "block";
		j++;
	}
}