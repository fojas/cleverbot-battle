//= require_tree .
!function($,window,undefined){
  var startConversation = function(initialMsg){
    var d = $('#conversation');
    var a = new CleverClient;
    a.callback(function(data){
      d.append("<div><span>"+data.user+"</span> : <span>"+data.response+"</span></div>");
    });
    a.write(initialMsg);
  }
  $(function(){
    $('form').one('submit',function(){
      var input = $('input');
      startConversation(input.val())
      input.remove()
    });
  });
}(jQuery,window)
