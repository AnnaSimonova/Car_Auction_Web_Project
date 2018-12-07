window.onscroll = function() {
	moveCar();
	scrollFunction();
};

function moveCar() {
	if (document.body.scrollTop > 650 || document.documentElement.scrollTop > 650) {
		let elem = document.querySelector('.animateme');
		elem.classList.add('scroll');
    }
}