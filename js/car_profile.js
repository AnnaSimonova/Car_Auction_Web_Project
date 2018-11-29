var xhttpVehicleTypes = new XMLHttpRequest();
  xhttpVehicleTypes.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var typeData = JSON.parse(this.responseText);
    }
  }
  xhttpVehicleTypes.open("GET", "./backend/includes/selectType.php", true);
  xhttpVehicleTypes.send();

var xhttpLocations = new XMLHttpRequest();
  xhttpLocations.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var locationData = JSON.parse(this.responseText);
    }
  }
  xhttpLocations.open("GET", "./backend/includes/selectLocations.php", true);
  xhttpLocations.send();

document.body.onload = function() {
  const vehicle = getVehicle(getId())[0];
  fillCarProfilePage(vehicle);
  var slideIndex = 0;
  showDivs(slideIndex);
}

// get vehicle id from uri
function getId() {
    var parts = window.location.search.substr(1).split("&");
    var $_GET = {};
    for (var i = 0; i < parts.length; i++) {
        var temp = parts[i].split("=");
        $_GET[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
    }
    return parseInt($_GET['id']);
}

function getVehicle(id) {
  return setDB().filter(function(item) {
    return item.id == id;
  });
}

const serviceFee = 600;

function fillCarProfilePage(vehicle) {
  const carProfile = document.getElementById('car-profile');
  const photoSlider = document.createElement('div');
  photoSlider.setAttribute('id', 'photo-slider');

  const carTitle = document.createElement('div');
  carTitle.setAttribute('id', 'car_title');

  const modelName = document.createElement('div');
  modelName.setAttribute('id', 'model_name');

  const nameSeries = document.createElement('h3');
  nameSeries.innerHTML = vehicle['year'] + ' ' +  vehicle['make'] + ' ' +  vehicle['model'];

  const buyNow = document.createElement('div');
  modelName.setAttribute('id', 'buy_now');

  const buyNowPrice = document.createElement('span');
  buyNowPrice.appendChild(document.createTextNode(vehicle['buy_now']));

  const buyNowLine = document.createElement('p');
  if (vehicle['buy_now'] != null && vehicle['buy_now'] != '') {
    buyNowLine.appendChild(document.createTextNode('Buy now: ')); 
    buyNowLine.appendChild(buyNowPrice);
    buyNowLine.appendChild(document.createTextNode(vehicle['Currency']));
  }

  const preBidLine = document.createElement('p');
  vehicle['Current bid'] == null || vehicle['Current bid'] == '' ? preBidLine.innerHTML = 'No bids yet' : preBidLine.innerHTML = 'Current bid: ' + vehicle['Current bid'] + vehicle['Currency'];

  const photoCarousel = document.createElement('div');
  photoCarousel.setAttribute('id', 'photo-carousel');

  for (let i = 0; i < 10; i++) {
    let sliderImage = document.createElement('img');
    sliderImage.setAttribute('class', 'mySlides');
    sliderImage.setAttribute('src', 'images/catalog/'+vehicle['id']+'/'+i+'.JPEG');
    photoCarousel.appendChild(sliderImage);
  }

  const navPrev = document.createElement('div');
  navPrev.setAttribute('id', 'nav-prev');
  navPrev.setAttribute('onclick', "plusDivs("+-1+")");
  navPrev.innerHTML = "&#10094;";

  const navNext = document.createElement('div');
  navNext.setAttribute('id', 'nav-next');
  navNext.setAttribute('onclick', "plusDivs("+1+")");
  navNext.innerHTML = "&#10095;";

  const thumbCarousel = document.createElement('div');
  thumbCarousel.setAttribute('id', 'thumb-carousel');
   for (let i = 0; i < 10; i++) {
    let thumb = document.createElement('img');
    thumb.setAttribute('class', 'thumbnail');
    thumb.setAttribute('src', 'images/catalog/'+vehicle['id']+'/'+i+'.JPEG');
    thumb.setAttribute('onclick', "currentDiv("+i+")");
    thumbCarousel.appendChild(thumb);
  }

  const lotStatus = document.createElement('div');
  lotStatus.setAttribute('id', 'lot-status');

  const lotStatusHeader = document.createElement('h3');
  lotStatusHeader.innerHTML = 'Lot status';

  const lotStatusInfo = document.createElement('p');
  lotStatusInfo.innerHTML = 'Information about lot value';

  const tableStyleInfo = document.createElement('div');
  tableStyleInfo.setAttribute('class', 'table-style-info');

  const fieldName = document.createElement('div');
  fieldName.setAttribute('class', 'field-name');
  const fieldValue = document.createElement('div');
  fieldValue.setAttribute('class', 'field-value');
  var lotStatusData = ['Auction type', 'Auction date', 'Current bid', 'buy_now', 'ACV'];
  lotStatusData.forEach(function(item) {
    if ( vehicle[item] != null && vehicle[item] != '') {
      const fieldNamePoint = document.createElement('p');
      fieldNamePoint.innerHTML = formatStr(item);
      fieldName.appendChild(fieldNamePoint);

        const fieldValuePoint = document.createElement('p');
        fieldValuePoint.innerHTML = vehicle[item];
        if (item === 'Current bid' || item === 'buy_now' || item === 'ACV') {
          fieldValuePoint.innerHTML += vehicle['Currency'];
        }
        fieldValue.appendChild(fieldValuePoint);
    }
  });

  const preBidBtn = document.createElement('button');
    preBidBtn.setAttribute('class', 'submit-btn');
    preBidBtn.setAttribute('id', 'pre-bid');
    // preBidBtn.setAttribute('onclick', 'window.location.href=\'car_profile.html?id=' + auto.id+'\'');
    preBidBtn.innerHTML = 'Pre-Bid';

  const techPassport = document.createElement('div');
  techPassport.setAttribute('id', 'tech-passport');

  const techPassportHeader = document.createElement('h3');
  techPassportHeader.innerHTML = 'Technical characteristics';

  const vinDetails = document.createElement('p');
  vinDetails.innerHTML = 'VIN Details';

  const tableStyleInfo2 = document.createElement('div');
  tableStyleInfo2.setAttribute('class', 'table-style-info');

  const fieldName2 = document.createElement('div');
  fieldName2.setAttribute('class', 'field-name');
  const fieldValue2 = document.createElement('div');
  fieldValue2.setAttribute('class', 'field-value');
  var techPassportData = ['Document type', 'VIN', 'year', 'loss', 'primary_damage', 'secondary_damage', 'start_code', 'odometer_miles', 'Location'];
  techPassportData.forEach(function(item) {
    if ( vehicle[item] != null && vehicle[item] != '') {
      let fieldNamePoint = document.createElement('p');
      fieldNamePoint.innerHTML = formatStr(item);
      fieldName2.appendChild(fieldNamePoint);

      let fieldValuePoint = document.createElement('p');
      fieldValuePoint.innerHTML = vehicle[item];
      if (item === 'Current bid' || item === 'buy_now' || item === 'ACV') {
        fieldValuePoint.innerHTML += vehicle['Currency'];
      }
      fieldValue2.appendChild(fieldValuePoint);
    }
  });

  const buyReportBtn = document.createElement('button');
    buyReportBtn.setAttribute('class', 'submit-btn');
    buyReportBtn.setAttribute('id', 'buy_report');
    // preBidBtn.setAttribute('onclick', 'window.location.href=\'car_profile.html?id=' + auto.id+'\'');
    buyReportBtn.innerHTML = 'Buy full report';


  tableStyleInfo.appendChild(fieldName);
  tableStyleInfo.appendChild(fieldValue);
  lotStatus.appendChild(lotStatusHeader);
  lotStatus.appendChild(lotStatusInfo);
  lotStatus.appendChild(tableStyleInfo);
  lotStatus.appendChild(preBidBtn);
  tableStyleInfo2.appendChild(fieldName2);
  tableStyleInfo2.appendChild(fieldValue2);
  techPassport.appendChild(techPassportHeader);
  techPassport.appendChild(vinDetails);
  techPassport.appendChild(tableStyleInfo2);
  techPassport.appendChild(buyReportBtn);
  buyNow.appendChild(buyNowLine);
  buyNow.appendChild(preBidLine);
  modelName.appendChild(nameSeries);
  carTitle.appendChild(modelName);
  carTitle.appendChild(buyNow);
  photoSlider.appendChild(carTitle);
  photoCarousel.appendChild(navPrev);
  photoCarousel.appendChild(navNext);
  photoSlider.appendChild(photoCarousel);
  photoSlider.appendChild(thumbCarousel);
  carProfile.appendChild(photoSlider);
  carProfile.appendChild(lotStatus);
  carProfile.appendChild(techPassport);
  setCalculator(carProfile);
}

function setCalculator(location_elem) {
  const finalValueCalc = document.createElement('div');
  finalValueCalc.setAttribute('id', 'final-value-calc');

  const finalValueCalcHeader = document.createElement('h3');
  finalValueCalcHeader.innerHTML = 'Calculate full price of vehicle';

  const finalValueCalcInfo = document.createElement('p');
  finalValueCalcInfo.innerHTML = 'Full cost of car including auction fee, documentation and transaction';

  const tableStyleInfo3 = document.createElement('div');
  tableStyleInfo3.setAttribute('class', 'table-style-info');

  const fieldName3 = document.createElement('div');
  fieldName3.setAttribute('class', 'field-name');
  const fieldValue3 = document.createElement('div');
  fieldValue3.setAttribute('class', 'field-value');
  var fieldNamesLocation = ['Final bid', 'Auction fee', 'Documentation services', 'Total price'];
  fieldNamesLocation.forEach(function(item) {
    let fieldNamePoint = document.createElement('p');
    fieldNamePoint.innerHTML = item;
    fieldName3.appendChild(fieldNamePoint);
  }); 

    const inputFinalBidLine = document.createElement('p');
    const inputFinalBid = document.createElement('input');
    inputFinalBid.setAttribute('type', 'number');
    inputFinalBid.setAttribute('id', 'final-bid');
    inputFinalBid.setAttribute('class', 'input-calc');
    inputFinalBid.setAttribute('value', '1000');
    inputFinalBid.setAttribute('min', '0');
    inputFinalBid.setAttribute('max', '100000');
    inputFinalBidLine.appendChild(inputFinalBid);
    fieldValue3.appendChild(inputFinalBidLine);
  
    const auctionFeeLine = document.createElement('p');
    auctionFeeLine.setAttribute('id', 'auction-fee');
    // inputFinalBid.setAttribute('class', 'total-val-calc');
    auctionFeeLine.innerHTML = 100;
    fieldValue3.appendChild(auctionFeeLine);

    const documFeeLine = document.createElement('p');
    // inputFinalBid.setAttribute('class', 'total-val-calc');
    documFeeLine.innerHTML = serviceFee;
    fieldValue3.appendChild(documFeeLine);

    const totalCostsLine = document.createElement('p');
    // inputFinalBid.setAttribute('class', 'total-val-calc');
    totalCostsLine.setAttribute('id', 'total-costs');
    totalCostsLine.innerHTML = 1700;
    fieldValue3.appendChild(totalCostsLine);

    inputFinalBid.oninput = function() {
      calculateAuctionFee(this.value);
      calculateFullPrice(this.value, document.getElementById('auction-fee').innerHTML);
      showTotalValue();
    }

    const deliveryCalc = document.createElement('div');
    deliveryCalc.setAttribute('id', 'delivery-calc');

    const deliveryCalcHeader = document.createElement('h3');
    deliveryCalcHeader.innerHTML = 'Calculate cost of delivery';

    const selectVehicleType = document.createElement('p');
    const selectVehicleTypeLabel = document.createElement('label');
    selectVehicleTypeLabel.innerHTML = 'Select type of vehicle: ';
    const selectLine = document.createElement('select');
    selectLine.setAttribute('id', 'vehicle_type');
    selectLine.setAttribute('class', 'select_form');
    selectVehicleType.appendChild(selectVehicleTypeLabel);
    selectVehicleType.appendChild(selectLine);
    deliveryCalc.appendChild(deliveryCalcHeader);
    deliveryCalc.appendChild(selectVehicleType);

    const selectLocation = document.createElement('p');
    const selectLocationLabel = document.createElement('label');
    selectLocationLabel.innerHTML = 'Location of loading: ';
    const selectLineLocation = document.createElement('select');
    selectLineLocation.setAttribute('id', 'location');
    selectLineLocation.setAttribute('class', 'select_form');
    selectLocation.appendChild(selectLocationLabel);
    selectLocation.appendChild(selectLineLocation);
    deliveryCalc.appendChild(selectLocation);

    const selectDeliveryPort = document.createElement('p');
    const selectDeliveryPortLabel = document.createElement('label');
    selectDeliveryPortLabel.innerHTML = 'Port of delivery: ';
    const selectLineDeliveryPort = document.createElement('select');
    selectLineDeliveryPort.setAttribute('id', 'delivery-port');
    selectLineDeliveryPort.setAttribute('class', 'select_form');
    selectDeliveryPort.appendChild(selectDeliveryPortLabel);
    selectDeliveryPort.appendChild(selectLineDeliveryPort);
    deliveryCalc.appendChild(selectDeliveryPort);
    
    const tableStyleInfo4 = document.createElement('div');
  tableStyleInfo4.setAttribute('class', 'table-style-info');
  tableStyleInfo4.setAttribute('id', 'table-style-info-id');

  const fieldName4 = document.createElement('div');
  fieldName4.setAttribute('class', 'field-name');
  var fieldNamesDeliveryPort = ['To port of loading (ashore)', 'To port of delivery (afloat)', 'Total delivery cost'];
  fieldNamesDeliveryPort.forEach(function(item) {
    let fieldNamePoint = document.createElement('p');
    fieldNamePoint.innerHTML = item;
    fieldName4.appendChild(fieldNamePoint);
  }); 
  tableStyleInfo4.appendChild(fieldName4);

  const fieldValue4 = document.createElement('div');
  fieldValue4.setAttribute('class', 'field-value');
  for (let i = 0; i < 3; i++) {
    let p = document.createElement('p');
    p.setAttribute('class', 'del-field-val');
    fieldValue4.appendChild(p);
  }
  tableStyleInfo4.appendChild(fieldValue4);
  deliveryCalc.appendChild(tableStyleInfo4);
  location_elem.appendChild(deliveryCalc);
  showVehicleTypes();
    showLocations();
    showDeliveryPorts();
    calculateDeliveryCosts();
    const delSelectLines = [selectLine, selectLineLocation, selectLineDeliveryPort];
    delSelectLines.forEach(function(item) {
      item.onchange = function() {
        calculateDeliveryCosts();
        showTotalValue();
      }
  }); 

  const totalValue = document.createElement('div');
  totalValue.setAttribute('id', 'total-value');

  const totalValuePref = document.createElement('p');
  totalValuePref.innerHTML = 'Total price with delivery';
  totalValue.appendChild(totalValuePref);

  const totalValueSum = document.createElement('p');
  totalValue.appendChild(totalValueSum);

  finalValueCalc.appendChild(finalValueCalcHeader);
  finalValueCalc.appendChild(finalValueCalcInfo);
  finalValueCalc.appendChild(tableStyleInfo3);
  tableStyleInfo3.appendChild(fieldName3);
  tableStyleInfo3.appendChild(fieldValue3);
  location_elem.appendChild(finalValueCalc);
  location_elem.appendChild(totalValue);
  showTotalValue();
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

var slideIndex = 0;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  console.log('n: '+n);
  var i;
  var x = document.getElementsByClassName("mySlides");
  var thumbs = document.getElementsByClassName("thumbnail");
  if (n > x.length) {slideIndex = 0}    
  if (n < 0) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < thumbs.length; i++) {
     thumbs[i].classList.remove('border-style');
  }
  console.log(x[slideIndex]);
  x[slideIndex].style.display = "block";  
  thumbs[slideIndex].classList.add('border-style');
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

function calculateAuctionFee(finalPrice) {
  var auctionFee;
  if (finalPrice < 1000) {
    auctionFee = 100;
  } else {
     auctionFee = parseInt(finalPrice)*0.1;
  }
  document.getElementById('auction-fee').innerHTML = parseInt(auctionFee);
}

function calculateFullPrice(finalPrice, auctionFee) {
  if (finalPrice == '') { finalPrice = 0; }
  var totalCosts = parseInt(finalPrice) + parseInt(auctionFee) + parseInt(serviceFee);
  document.getElementById('total-costs').innerHTML = totalCosts;
}

function showVehicleTypes() {
  var data = JSON.parse(xhttpVehicleTypes.responseText);
  var selectTypeList;

  data.map(function(value) {
    selectTypeList += '<option class="option-type" value="' + value['name']+ '">' + value['name'] + '</option>';
  });
  var vehicleType = document.getElementById("vehicle_type");
  vehicleType.innerHTML = selectTypeList;
}

function showLocations() {
  var data = JSON.parse(xhttpLocations.responseText);
  var selectLocationsList;

  data.map(function(value) {
    selectLocationsList += '<option class="option-type" value="' + value['name']+ '">' + value['name'] + '</option>';
  });
  var location = document.getElementById("location");
  location.innerHTML = selectLocationsList;
}

function showDeliveryPorts() {
  var data = ['Odessa'];
  var selectDeliveryPortList;
  data.map(function(value) {
    selectDeliveryPortList += '<option class="option-type" value="' + value+ '">' + value + '</option>';
  });
  var deliveryPort = document.getElementById("delivery-port");
  deliveryPort.innerHTML = selectDeliveryPortList;
}

function calculateDeliveryCosts() {
  var vehicleType = document.getElementById('vehicle_type');
  var location = document.getElementById('location');
  var deliveryPort = document.getElementById('delivery-port');

  var ashoreDelivery;
  var afloatDelivery = 1000;

  JSON.parse(xhttpLocations.responseText).filter(function(item) {
    if (location.options[location.selectedIndex].value == item['name']) {
      if (item['id'] % 2 === 0) {
        ashoreDelivery = 200;
      } else {
        ashoreDelivery = 300;
      }
    }
  });
  var midVehicles = [2, 8];
  var largeVehicles = [1, 4, 6, 7, 9, 10];
  if (midVehicles.includes(vehicleType.selectedIndex)) {
    ashoreDelivery = ashoreDelivery*1.1;
    afloatDelivery = afloatDelivery*1.3;
  }
  if (largeVehicles.includes(vehicleType.selectedIndex)) {

    ashoreDelivery = ashoreDelivery*1.2;
    afloatDelivery = afloatDelivery*1.5;
  }
  var totalDelivery = ashoreDelivery + afloatDelivery;

  const valuesColumn = document.getElementsByClassName("del-field-val");
  valuesColumn.item(0).innerHTML = ashoreDelivery;
  valuesColumn.item(1).innerHTML = afloatDelivery;
  valuesColumn.item(2).innerHTML = totalDelivery;

  return totalDelivery;
}

function showTotalValue() {
  var totalValue = parseInt(document.getElementById('total-costs').innerHTML) + parseInt(document.querySelector('.del-field-val:last-child').innerHTML);
  const elementToAdd = document.querySelector('#total-value p:last-child');
  elementToAdd.innerHTML = totalValue + '$';
}