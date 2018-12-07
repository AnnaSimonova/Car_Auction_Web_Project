function pagination(event) {
	var count = document.querySelectorAll(".car_block").length;
var cnt = 3;
var cnt_page = Math.ceil(count / cnt);
	var main_page = document.querySelector(".paginator_active");

  var e = event || window.event;
  var target = e.target;
  var id = target.id;

  if (target.tagName.toLowerCase() != "span") return;
  
  var num_ = id.substr(4);
  var data_page = +target.dataset.page;
  main_page.classList.remove("paginator_active");
  main_page = document.getElementById(id);
  main_page.classList.add("paginator_active");

  var j = 0;
  var div_num = document.querySelectorAll(".car_block");
  for (var i = 0; i < div_num.length; i++) {
    var data_num = div_num[i].dataset.num;
    if (data_num <= data_page || data_num >= data_page)
      div_num[i].style.display = "none";

  }
  for (var i = data_page; i < div_num.length; i++) {
    if (j >= cnt) break;
    div_num[i].style.display = "block";
    j++;
  }
}

function popUp(str, redirectLink='#') {
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
document.body.onload = function() {
	showVehicleTypes();
	showMakeModel();
	generateMakes();
	setPriceRange();
	setCarList();
}
window.onscroll = function() {
	scrollFunction();
	moveCar();
};


function scrollFunction() {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

function moveCar() {
	if (document.body.scrollTop > 650 || document.documentElement.scrollTop > 650) {
		let elem = document.querySelector('.animateme');
		elem.classList.add('scroll');
    }
}

function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
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

function openTab(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("vehicle-type-tab");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" clicked", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " clicked";
}

// slider

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var thumbs = document.getElementsByClassName("thumbnail");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < thumbs.length; i++) {
     thumbs[i].classList.remove('border-style');
  }
  x[slideIndex-1].style.display = "block";  
  thumbs[slideIndex-1].classList.add('border-style');
}

// select options
function showVehicleTypes() {
  var xhttp; 
  document.getElementById("select_vehicle_type").innerHTML = '<option>All types</option>';
  
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    document.getElementById("select_vehicle_type").innerHTML += this.responseText;
    }
  };
  xhttp.open("GET", "./backend/includes/selectType.php", true);
  xhttp.send();
}

function showMakeModel() {
  var xhttp; 
  var result;
  var makes = [];
  var selectMakeList = '<option class="option-make" value="">All makes</option>';
  var selectModelList = '<option class="option-model" value="">All models</option>';
  
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	result = JSON.parse(this.responseText);
    	makes = result.map(function(value) {
    		return value['make'];
    	})
    	// alert(makes);
    	const uniqueMakes = Array.from(new Set(makes));
    	uniqueMakes.map(function($value) {
    		selectMakeList += '<option class="option-make" value="' + $value+ '">' + $value + '</option>';
    	});
    	var makeList = document.getElementById("select_make");
    	makeList.innerHTML = selectMakeList;
    	var modelList = document.getElementById("select_model");
    	modelList.innerHTML = selectModelList;
    	makeList.onchange = function() {
    		var selectModelList = '<option class="option-model" value="">Select vehicle model</option>';
    		if (makeList.selectedIndex !== 0) {
    		result.map(function($item) {
    			if ($item['make'] === makeList.options[makeList.selectedIndex].value) {
    				selectModelList += '<option class="option-model" value="' + $item['model'] + '">' + $item['model'] + '</option>';
    			}
    		});
    	}
    	modelList.removeAttribute('disabled');
    	modelList.innerHTML = selectModelList;
    }
    }
  };
  xhttp.open("GET", "./backend/includes/selectMakeModel.php", true);
  xhttp.send();
}

function generateMakes() {
	xhttp = new XMLHttpRequest();
	var makesBlock = document.getElementById('makes-block');
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	result = JSON.parse(this.responseText);
    	makes = result.map(function(value) {
    		return value['make'];
    	})
    	// alert(makes);
    	const uniqueMakes = Array.from(new Set(makes));
    	uniqueMakes.map(function(value) {
    		let a = document.createElement('a');
    		a.setAttribute('href', '#');
    		a.innerHTML = value;
    		makesBlock.appendChild(a);
    	});
    }
    }
  xhttp.open("GET", "./backend/includes/selectMakeModel.php", true);
  xhttp.send();
}

// price range
function setPriceRange() {
	var lowerSlider = document.querySelector('#lower');
    var  upperSlider = document.querySelector('#upper');

    document.querySelector('#two').innerHTML=upperSlider.value;
    document.querySelector('#one').innerHTML=lowerSlider.value;

    var  lowerVal = parseInt(lowerSlider.value);
    var upperVal = parseInt(upperSlider.value);

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

function setCarBlock(auto, pagCounter) {
	const listBlock = document.getElementById('cars-list');
	const carBlock = document.createElement('div');
	carBlock.setAttribute('class', 'car_block');
	carBlock.setAttribute('data-num', pagCounter);

	const img = document.createElement('img');
	img.setAttribute('class', 'car-img');
	img.setAttribute('src', 'images/catalog/'+auto['id']+'/1.jpeg');

	const carDescr = document.createElement('div');
	carDescr.setAttribute('class', 'car-descr');

	const headerLine = document.createElement('div');
	headerLine.setAttribute('id', 'car-header-line');

	const carName = document.createElement('h2');
	carName.setAttribute('class', 'car-name');
	carName.innerHTML = auto['make'] + ' ' + auto['model'] + ' ' + auto['year'];

	const auctionInfoBlock = document.createElement('div');
	auctionInfoBlock.setAttribute('id', 'auction-info-block');

	const carDetails = document.createElement('div');
	carDetails.setAttribute('class', 'car-details');

	var headerProperties = ['id', 'make', 'model', 'year', 'Currency'];
	var auctionProperties = ['Auction date', 'Buy now', 'Current bid'];

	var counter = 0;
	for (var property in auto) {
		if (auto.hasOwnProperty(property) && !!auto[property]) {
			if (auctionProperties.includes(property)) {
				const param = document.createElement('p');
				param.setAttribute('class', 'auction-info-details');
				param.innerHTML = property+ ': <span>' +auto[property]+'</span>';
				if (property === 'Auction date') {
					param.setAttribute('id', 'auction-date');
				} else {
					param.innerHTML += auto['Currency']+'   ';
				}
				auctionInfoBlock.appendChild(param);
				counter++;
			} else if (!headerProperties.includes(property) && !auctionProperties.includes(property)) {
				const param = document.createElement('p');
				param.innerHTML = property+ ': <span>' +auto[property]+'</span>';
				carDetails.appendChild(param);
			}
        }
    }
    if (counter === 0) {
    	auctionInfoBlock.removeAttribute('id');
    }

    const moreDetailsBtn = document.createElement('button');
    moreDetailsBtn.setAttribute('class', 'car-details-btn');
    moreDetailsBtn.setAttribute('action', '#');
    moreDetailsBtn.innerHTML = 'More details';

	headerLine.appendChild(carName);
	headerLine.appendChild(auctionInfoBlock);
	carDescr.appendChild(headerLine);
	carDescr.appendChild(carDetails);
	carDetails.appendChild(moreDetailsBtn);

	if (auctionInfoBlock.hasAttribute('id')) {
		const prebidBtn = moreDetailsBtn.cloneNode(true);
        prebidBtn.setAttribute('id', 'prebid-btn');
        prebidBtn.innerHTML = 'Pre-Bid';
	    carDetails.appendChild(prebidBtn);
	}

	carBlock.appendChild(img);
	carBlock.appendChild(carDescr);
	listBlock.appendChild(carBlock);

//выводим список страниц
var count = document.querySelectorAll(".car_block").length;
var cnt = 3;
var cnt_page = Math.ceil(count / cnt);

var paginator = document.querySelector(".paginator");
var page = "";
// var page = "<span data-page=\"0\" id=\"page1\"><<</span>";
for (var i = 0; i < cnt_page; i++) {
  page += "<span data-page=" + i * cnt + "  id=\"page" + (i + 1) + "\">" + (i + 1) + "</span>";
}
page += "<span data-page=" + (i-1) * cnt + "  id=\"page" + i + "\">>></span>";
paginator.innerHTML = page;

var div_num = document.querySelectorAll(".car_block");
// console.log(div_num.length);
for (var i = 0; i < div_num.length; i++) {
  if (i < cnt) {
    div_num[i].style.display = "block";
  }
}

var main_page = document.getElementById("page1");
main_page.classList.add("paginator_active");
}

function setCarList() {
	var result;
	xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	result = JSON.parse(this.responseText);
    }
    var pagCounter = 1;
    result.map(function(auto) {
    	setCarBlock(auto, pagCounter);
    	pagCounter++;
    });
    }
  xhttp.open("GET", "./backend/includes/selectVehicles.php", true);
  xhttp.send();
}


















// Search
var input,search,pr,result,result_arr, locale_HTML, result_store;

function func() {
 	locale_HTML = document.body.innerHTML;   // сохраняем в переменную весь body (Первоначальный)
}
setTimeout(func, 1000);  //ждем подгрузки Jsona и выполняем

function FindOnPage(name, status) {

	input = document.getElementById(name).value; //получаем значение из поля в html
	
	if(input.length<3&&status==true)
	{
		alert('Для поиска вы должны ввести три или более символов');
		function FindOnPageBack() { document.body.innerHTML = locale_HTML; }
	}
	
	if(input.length>=3)
	{
		function FindOnPageGo() {

			var search = '/'+input+'/g';  //делаем из строки регуярное выражение
			pr = document.body.innerHTML;   // сохраняем в переменную весь body
			result = pr.match(/>(.*?)</g);  //отсекаем все теги и получаем только текст
			result_arr = [];   //в этом массиве будем хранить результат работы (подсветку)

			var warning = true;
			for(var i=0;i<result.length;i++) {
				if(result[i].match(eval(search))!=null) {
					warning = false;
				}
			}
			if(warning == true) {
				alert('Не найдено ни одного совпадения');
			}

			for(var i=0; i<result.length;i++) {
				result_arr[i] = result[i].replace(eval(search), '<span style="background-color:yellow;">'+input+'</span>'); //находим нужные элементы, задаем стиль и сохраняем в новый массив
			}
			for(var i=0; i<result.length;i++) {
				pr=pr.replace(result[i],result_arr[i])  //заменяем в переменной с html текст на новый из новогом ассива
			}
			document.body.innerHTML = pr;  //заменяем html код
		}
	}
	function FindOnPageBack() { document.body.innerHTML = locale_HTML; }
	if(status) { FindOnPageBack(); FindOnPageGo(); } //чистим прошлое и Выделяем найденное
	if(!status) { FindOnPageBack(); } //Снимаем выделение
}


var setSkrollr = function($el, data) {
    for (var i = 0, l = data.length; i < l; i++) { // loop all data entries (scroll positions + css property & value)
        var d = data[i], // the current data entry
            px = d[0]; // the scroll position (in pixels)
            css = d[1]; // the css property + value to set
        $el.attr('data-' + px, css);
    }
}