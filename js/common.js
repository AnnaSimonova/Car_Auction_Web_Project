var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var database = JSON.parse(this.responseText);
    }
  }
  xhttp.open("GET", "./backend/includes/selectVehicles.php", true);
  xhttp.send();


document.body.onload = function() {
	showTypeMakeModel(setDB());
}

window.onscroll = function() {
	scrollFunction();
};

function setDB() {
  return JSON.parse(xhttp.responseText);
}

function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

function popUp(str, redirectLink='#') {
  alert('!!!');
	const popupBg = document.createElement('div');
	popupBg.setAttribute('class', 'popup-bg');

	const popupContent = document.createElement('div');
	popupContent.setAttribute('class', 'popup-content');
	popupContent.innerHTML = str;

	const close = document.createElement('a');
	close.setAttribute('href', redirectLink);
	close.setAttribute('id', 'close-btn');
	close.innerHTML = 'OK';
	popupContent.appendChild(close);
	popupBg.appendChild(popupContent);

	const main = document.querySelector('main');
	main.appendChild(popupBg);

	if (redirectLink === '#') {
		close.onclick = function(e) {
        e.preventDefault();
        popupBg.classList.add("hide");
      }
	}
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
	for (let i = 0; i < menu.length; i++) {		
		menu.item(i).classList.toggle('dropdown-menu');
    }
}

window.onclick = function(event) {
	const menu = document.getElementsByClassName('nav-point');
	if (menu.item(0).classList.contains('dropdown-menu')) {
		if (!event.target.matches('.nav-point a') && !event.target.matches('input')) {
			for (let i = 0; i < menu.length; i++) {
  			menu.item(i).classList.remove('dropdown-menu');
  		}
  		const menu_button = document.querySelector('#menuToggle input');
  		menu_button.checked = false;
  	}
  }
}

function showTypeMakeModel(database) {
  var selectTypeList = '<option class="option-type" value="">All types</option>';
  var selectMakeList = '<option class="option-make" value="">All makes</option>';
  var selectModelList = '<option class="option-model" value="">All models</option>';

  var uniqueTypes = [];
  var types = database.map(function(value) {
    if (!uniqueTypes.includes(value['vehicle_type'])) {
      selectTypeList += '<option class="option-type" value="' + value['vehicle_type']+ '">' + value['vehicle_type'] + '</option>';
      uniqueTypes.push(value['vehicle_type']);
    }
  });
  var vehicleType = document.getElementById("vehicle_type");
  vehicleType.innerHTML = selectTypeList;

  var uniqueMakes = [];
  var makes = database.map(function(value) {
    if (!uniqueMakes.includes(value['make'])) {
      selectMakeList += '<option class="option-make" value="' + value['make']+ '">' + value['make'] + '</option>';
      uniqueMakes.push(value['make']);
    }
  });

  var makeList = document.getElementById("make");
  makeList.innerHTML = selectMakeList;
  var modelList = document.getElementById("model");
  modelList.innerHTML = selectModelList;

  vehicleType.onchange = function() {
    var selectMakeList = '<option class="option-make" value="">All makes</option>';
    if (vehicleType.selectedIndex > 0) {
      var temp = [];
        database.map(function(item) {
          if (item['vehicle_type'] === vehicleType.options[vehicleType.selectedIndex].value) {
            if (!temp.includes(item['make'])) {
              selectMakeList += '<option class="option-make" value="' + item['make'] + '">' + item['make'] + '</option>';
              temp.push(item['make']);
            }
          }
        });
      } else {
        var temp = [];
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
      setCarList(database);
    };

  makeList.onchange = function() {
    var selectModelList = '<option class="option-model" value="">Select vehicle model</option>';
    	if (makeList.selectedIndex > 0) {
        var temp = [];
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
    setCarList(database);
  }

  modelList.onchange = function() {
    setCarList(database);
  }
}

function formatStr(str) {
  var newStr = str.replace("_", " ");
  return newStr.charAt(0).toUpperCase() + newStr.slice(1);
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

  // const runUpTime = document.createElement('p');
  // runUpTime.innerHTML = 'Pre-bid Closes: ' + vehicle['Auction date'].getDate-Date().getDate();
  // imgContainer.appendChild(runUpTime);

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

  // const loginLink = document.createElement('span');
  // loginLink.setAttribute('class', 'loginLink');
  // loginLink.addEventListener("click", function(e){displayOtherModal(e, vehicle['id'], 'id02');}, false);
  // loginLink.innerHTML = 'login';

  // const registerLink = document.createElement('span');
  // registerLink.setAttribute('class', 'loginLink');
  // registerLink.addEventListener("click", function(e){displayOtherModal(e, vehicle['id'], 'id01');}, false);
  // registerLink.innerHTML = 'register';

  const loginRequest = document.createElement('p');
  loginRequest.setAttribute('id', 'login-req');
  loginRequest.innerHTML = 'Can\'t place a Pre-Bid? Please login or register';
  // loginRequest.appendChild(loginLink);
  // loginRequest.innerHTML += ' or ';
  // loginRequest.appendChild(registerLink);
  imgContainer.appendChild(loginRequest);

  modal.appendChild(container);
  elem.appendChild(modal);
}

// function displayOtherModal(e, id, elem) {
//   e.preventDefault();
//   document.getElementById('prebid-modal-'+id).style.display='none';
  // document.getElementById(elem).style.display='block';
// }
// 
 function sendData(data) {
  var XHR = new XMLHttpRequest();
  var name;

  // Turn the data object into an array of URL-encoded key/value pairs.
  for(name in data) {
    alert(name);
  }
  // Set up our request
  XHR.open('POST', '../backend/includes/signup.php');

  // Add the required HTTP header for form data POST requests
  XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  // Finally, send our data.
  XHR.send(data);
}



