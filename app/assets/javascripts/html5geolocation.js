        $(window).load(function() {
            initiate_geolocation();
        });
        window.setInterval(function(){
          initiate_geolocation();
        }, 10000);
         function initiate_geolocation() {
        navigator.geolocation.getCurrentPosition(handle_geolocation_query,handle_errors);
        }
        function handle_errors(error){
              switch(error.code)
              {
                  case error.PERMISSION_DENIED: alert("GPS not active, check that you have enabled GPS for Smell");
                  break;
   
                  case error.POSITION_UNAVAILABLE: alert("GPS not active or not available. Contact us via About page");
                  break;
   
                  case error.TIMEOUT: alert("TIMEOUT, reload page");
                  break;
   
                  default: alert("error");
                  break;
              }
        }
 
        function handle_geolocation_query(position){

        var longitudediv = jQuery('.longitude');
        var lattitudediv = jQuery('.lattitude');
        latitude = position.coords.latitude;
        longitude = position.coords.longitude;
   
        // change the location using the variables returned from the API
        document.cookie = "latitudine="+latitude;
        document.cookie = "longitudine="+longitude;

    }

