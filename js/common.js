"use strict";

const xhttp = new XMLHttpRequest();
xhttp.open("GET", "./backend/includes/selectVehicles.php", true);
xhttp.send();

window.onscroll = scrollFunction;
window.onclick = hideDropdown;
document.body.onload = function() {
	showTypeMakeModel(setDB());
};

function setDB() {
	return JSON.parse(xhttp.responseText);
}

function hideDropdown(event) {
	const menu = document.getElementsByClassName('nav-point');
	// if (menu.item(0).classList.contains('dropdown-menu') || menu.item(3).classList.contains('dropdown-content')) {
	if (!event.target.matches('input') && !event.target.matches('#nav-other a')) {
		for (let i = 0; i < menu.length; i++) {
			menu.item(i).classList.remove('dropdown-menu');
			let moreDropdown = menu.item(i).getElementsByClassName('dropdown-content')[0];
			if (typeof(moreDropdown) !== 'undefined') {
				moreDropdown.classList.add('hide');
				if (moreDropdown.classList.contains('disp-bl')) {
					moreDropdown.classList.remove('disp-bl');
				}
			}
		}
		const menu_button = document.querySelector('#menuToggle input');
		menu_button.checked = false;
	}
	// }
}

function showDropdown() {
	let elem = document.querySelector('#nav-other');
	elem.addEventListener('click', function () {
		let moreDropdown = elem.getElementsByClassName('dropdown-content')[0];
		moreDropdown.classList.add('disp-bl');
		if (moreDropdown.classList.contains('hide')) {
			moreDropdown.classList.remove('hide');
		}
	});
}

function topFunction() {
    document.documentElement.scrollTop = 0;
}

function scrollFunction() {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

function toggleDropdownMenu() {
	const menu = document.getElementsByClassName('nav-point');
	const menu_array = Array.prototype.slice.call(menu);
	menu_array.forEach(function(item) {
		item.classList.toggle('dropdown-menu');
	});
}

// Load available types/makes/models in select lists
function showTypeMakeModel(database) {
	let selectTypeList = '<option class="option-type" value="">All types</option>';
	let selectMakeList = '<option class="option-make" value="">All makes</option>';
	let selectModelList = '<option class="option-model" value="">All models</option>';

	let uniqueTypes = [];
	let types = database.map(function(value) {
		if (!uniqueTypes.includes(value['vehicle_type'])) {
			selectTypeList += '<option class="option-type" value="' + value['vehicle_type']+ '">' + value['vehicle_type'] + '</option>';
			uniqueTypes.push(value['vehicle_type']);
		}
	});
	const vehicleType = document.getElementById("vehicle_type");
	vehicleType.innerHTML = selectTypeList;

	let uniqueMakes = [];
	let makes = database.map(function(value) {
		if (!uniqueMakes.includes(value['make'])) {
			selectMakeList += '<option class="option-make" value="' + value['make']+ '">' + value['make'] + '</option>';
			uniqueMakes.push(value['make']);
		}
	});

	const makeList = document.getElementById("make");
	makeList.innerHTML = selectMakeList;
	const modelList = document.getElementById("model");
	modelList.innerHTML = selectModelList;

	vehicleType.onchange = function() {
		let selectMakeList = '<option class="option-make" value="">All makes</option>';
		if (vehicleType.selectedIndex > 0) {
			let temp = [];
			database.map(function(item) {
				if (item['vehicle_type'] === vehicleType.options[vehicleType.selectedIndex].value) {
					if (!temp.includes(item['make'])) {
						selectMakeList += '<option class="option-make" value="' + item['make'] + '">' + item['make'] + '</option>';
						temp.push(item['make']);
					}
				}
			});
		} else {
			let temp = [];
			database.map(function(item) {
				if (!temp.includes(item['make'])) {
					selectMakeList += '<option class="option-make" value="' + item['make'] + '">' + item['make'] + '</option>';
					temp.push(item['make']);
				}
			});
		}
		makeList.innerHTML = selectMakeList;
		makeList.selectedIndex = 0;
		modelList.selectedIndex = 0;
		modelList.setAttribute('disabled', 'disabled');
	};

	makeList.onchange = function() {
		let selectModelList = '<option class="option-model" value="">Select vehicle model</option>';
		if (makeList.selectedIndex > 0) {
			let temp = [];
			database.map(function(item) {
				if (item['make'] === makeList.options[makeList.selectedIndex].value) {
					if (!temp.includes(item['model'])) {
						selectModelList += '<option class="option-model" value="' + item['model'] + '">' + item['model'] + '</option>';
						temp.push(item['model']);
					}
				}
			});
			modelList.removeAttribute('disabled');
			modelList.innerHTML = selectModelList;
		} else {
			modelList.setAttribute('disabled', 'disabled');
			modelList.selectedIndex = 0;
		}
	};

	modelList.onchange = function() {
	}
}

function setPreBid(elem, vehicle) {
	const modal = document.createElement('div');
	modal.setAttribute('id', 'prebid-modal-'+vehicle['id']);
	modal.setAttribute('class', 'modal');

	const form = document.createElement('form');
	form.setAttribute('class', 'modal-content animate');

	const imgContainer = document.createElement('div');
	imgContainer.setAttribute('class', 'imgcontainer');

	const span = document.createElement('span');
	span.setAttribute('onclick', "document.getElementById('prebid-modal-"+vehicle['id']+"').style.display='none'");
	span.setAttribute('class', 'close');
	span.innerHTML = '&times;';

	imgContainer.appendChild(span);
	form.appendChild(imgContainer);
	modal.appendChild(form);

	const container = document.createElement('div');
	container.setAttribute('class', 'container');
	const h3 = document.createElement('h3');
	const h2 = document.createElement('h2');
	h2.innerHTML = 'Place a Pre-Bid';
	h3.innerHTML = vehicle['make'] + ' ' + vehicle['model'] + ' ' + vehicle['year'];
	imgContainer.appendChild(h2);
	imgContainer.appendChild(h3);

	const vin = document.createElement('p');
	vin.setAttribute('class', 'inline-p');
	vin.innerHTML = 'VIN:&emsp; ' + vehicle['VIN'] + '&emsp;&emsp;&emsp;';
	imgContainer.appendChild(vin);

	const auction = document.createElement('p');
	auction.setAttribute('class', 'inline-p');
	auction.innerHTML = vehicle['Auction type'] + ':&emsp; ' + vehicle['Auction date'];
	imgContainer.appendChild(auction);

	if (vehicle['Current bid'] != null) {
		const curBid = document.createElement('p');
		curBid.setAttribute('class', 'block-p');
		curBid.innerHTML = 'Current bid:&emsp; <span>' + vehicle['Current bid'] + vehicle['Currency'] + '</span>';
		imgContainer.appendChild(curBid);
	}

	const input_p = document.createElement('p');
	input_p.setAttribute('class', 'block-p');
	const input = document.createElement('input');
	input_p.innerHTML = 'My Max Bid:&emsp;';
	input_p.appendChild(input);
	input.setAttribute('type', 'number');
	input.setAttribute('value', parseInt(vehicle['Current bid'])+1);
	input.setAttribute('min', parseInt(vehicle['Current bid'])+1);
	input.setAttribute('max', parseInt(vehicle['ACV']));
	input.setAttribute('required', 'required');
	input.setAttribute('disabled', 'disabled');
	input_p.innerHTML += vehicle['Currency'];
	imgContainer.appendChild(input_p);

	const loginRequest = document.createElement('p');
	loginRequest.setAttribute('id', 'login-req');
	loginRequest.innerHTML = 'Can\'t place a Pre-Bid? Please login or register';
	imgContainer.appendChild(loginRequest);

	modal.appendChild(container);
	elem.appendChild(modal);
}

function sendData(data) {
	const XHR = new XMLHttpRequest();
	XHR.open('POST', '../backend/includes/signup.php');
	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	XHR.send(data);
}

function formatStr(str) {
	let newStr = str.replace("_", " ");
	return newStr.charAt(0).toUpperCase() + newStr.slice(1);
}



