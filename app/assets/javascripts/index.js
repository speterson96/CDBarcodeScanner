$(function() {
  var slideIndex = 0;
  carousel();
  
  function carousel() {
      var i;
      var mySlides = $('.mySlides');
      for (i = 0; i < mySlides.length; i++) {
        mySlides[i].style.display = "none"; 
      }
      slideIndex++;
      if (slideIndex > mySlides.length) {slideIndex = 1} 
      mySlides[slideIndex-1].style.display = "block"; 
      setTimeout(carousel, 3000); 
  }
});