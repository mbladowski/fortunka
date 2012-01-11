// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function update(){
     $.get('/random.json', function(data) {
        if(data.body.length> 55){
            $("#r-body").html(data.body.substring(0,46) + "... <a style='color:white;' href='/fortunes/"+data.id+"'>more</a>");
        }
         else{
            $("#r-body").html(data.body);
        }
        $("#r-source").html("— "+data.source);

    });
}

$(document).ready( function(){
         update();
         setInterval( "update()", 15000 );
    });

