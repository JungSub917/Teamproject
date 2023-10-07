$(document).ready(function(){
	
                $('.slider1').bxSlider({
                	 speed: 400,       
                     pager: false,      
                     moveSlides: 1,     
                     slideWidth: 366.666,   
                     minSlides: 1,
                     maxSlides: 3,
                     infiniteLoop: false,
                     hideControlOnEnd: true,
					 touchEnabled : true
            });

				$('.slider2').bxSlider({
                	 speed: 300,        
                     pager: false,      
                     moveSlides: 1,     
                     slideWidth: 275,   
                     minSlides: 1,
                     maxSlides: 4,
                     infiniteLoop: false,
                     hideControlOnEnd: true,
			     	 touchEnabled : true
            });

				$('.slider3').bxSlider({
                	 speed: 300,        
                     pager: false,      
                     moveSlides: 1,     
                     slideWidth: 275,   
                     minSlides: 1,
                     maxSlides: 4,
                     infiniteLoop: false,
                     hideControlOnEnd: true,
			     	 touchEnabled : true
            });

});
