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
            document.getElementById("add-job-form").submit();
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
   $('#add-job-form').validate({
      errorClass: "my-error-class", 
      rules: {
          job_type: {
              required: true,
              remote:{
                  url: 'checkpositionname', //EmailCheckerController
                   type: 'post',
                   data: {
                       'job_type': function() { return $('#job_type').val();}
                   }
              }
          },
          management_score: "required",
          sales_score: "required",
          inventory_score: "required"
      },
      messages: {
          job_type: {
              required: "Please enter the name of the job",
              remote: "Job name already exists"
          },
          management_score: "Please select yes or no",
          sales_score: "Please select yes or no",
          inventory_score: "Please select yes or no"
      }
   });
   
   $("#register-submit").click(function(){
        if($("#add-job-form").valid()){
            $("#mssgBox").modal({backdrop: 'static', keyboard: false});
            countdown( "countdown", 0, 3 );
        }
    });
   
});