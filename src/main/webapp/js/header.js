/**
 * 
 */


const modal = document.querySelector('.modal'); 
const btnOpenPopup = document.querySelector('.btn-open-popup'); 
btnOpenPopup.addEventListener('click', () => { modal.style.display = 'block'; }); 

$('.delete-button img').on('click', function (e) {
	$('.modal').hide();
})

        