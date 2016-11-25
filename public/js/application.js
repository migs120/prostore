 //   jquery-button-animate
$(document).ready(function(){
    		$("*#button").on({mouseenter: function(){
            		$(this).css("background-color", "#000000");
       		 },  
        		mouseleave: function(){$(this).css("background-color", "#5F5F5F");
       		 }, 
        		click: function(){$(this).css("background-color", "grey");
        		}  });  }); 