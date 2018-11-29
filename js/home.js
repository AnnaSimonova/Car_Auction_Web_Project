document.body.onload = function() {
  showTypeMakeModel(setDB());
}

window.onscroll = function() {
	moveCar();
	scrollFunction();
};

// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function moveCar() {
	if (document.body.scrollTop > 650 || document.documentElement.scrollTop > 650) {
		let elem = document.querySelector('.animateme');
		elem.classList.add('scroll');
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