// facebook recommend button                                                    
$(function() {
  likebutton =  '<fb:like href="" send="" width="100" show_faces="" font="" layout="button_count" action="recommend"></fb:like>';
  $.getScript(
    'http://connect.facebook.net/en_US/all.js', function() {
      FB.init({appId: 141936272547391, status: true, cookie: true, xfbml: true});
      $('#facebook').replaceWith(likebutton);
  });
});