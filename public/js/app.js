$(document).ready(function() {

	$('.slide img:gt(0)').hide();
    setInterval(function(){
      $('.slide :first-child').fadeOut(2000)
         .next('img').fadeIn()
         .end().appendTo('.slide');}, 
      4000);
	
});