/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function countdown( elementName, minutes, seconds )
{
    var element, endTime, hours, mins, msLeft, time;

    function twoDigits( n )
    {
        return (n <= 9 ? "0" + n : n);
    }

    function updateTimer()
    {
        msLeft = endTime - (+new Date);
        if ( msLeft < 1000 ) {
            document.getElementById("edit-form").submit();
        } else {
            time = new Date( msLeft );
            hours = time.getUTCHours();
            mins = time.getUTCMinutes();
            setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
        }
    }

    element = document.getElementById( elementName );
    endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
    updateTimer();
}

$(document).ready(function(){
    
   $('#edit-form').validate({
      errorClass: "my-error-class", 
      rules: {
          job_type: {
              remote:{
                  url: 'checkpositionname2', //EmailCheckerController
                   type: 'post',
                   data: {
                       'job_type': function() { return $('#job_type').val();}
                   }
              }
          }
      },
      messages: {
          job_type: {
              remote: "Job name already exists"
          }
      }
   }); 
   
   $("#register-submit").click(function(){
        if($("#edit-form").valid()){
            $("#mssgBox").modal({backdrop: 'static', keyboard: false});
            countdown( "countdown", 0, 3 );
        }
    });
});