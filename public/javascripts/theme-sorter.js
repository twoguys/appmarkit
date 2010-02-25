(function($) {
	$.fn.sorted = function(customOptions) {
		var options = {
			reversed: false,
			by: function(a) {
				return a.text();
			}
		};
		$.extend(options, customOptions);
	
		$data = $(this);
		arr = $data.get();
		arr.sort(function(a, b) {
			
		   	var valA = options.by($(a));
		   	var valB = options.by($(b));
			if (options.reversed) {
				return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;				
			} else {		
				return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;	
			}
		});
		return $(arr);
	};

})(jQuery);

$(document).ready(function() {
  var $themes = $('#themes');
  var $data = $themes.clone();
  
  var $preferences = {
    duration: 800,
    easing: 'easeInOutQuad',
    adjustHeight: false
  };

  var $controls = $('ul.sorter');

  $controls.each(function(i) {
    var $control = $(this);
    var $buttons = $control.find('a');
  
    $buttons.click(function(e) {
      var $button = $(this);
      $button.parent().siblings().removeClass('selected');
      $button.parent().addClass('selected');

      var sorting_kind = $button.attr('data-value');
      
      if (sorting_kind == 'all') {
        var $filtered_data = $data.find('li');
      } else {
        var $filtered_data = $data.find('li.' + sorting_kind);
      }
      
      // sorting by name
      // var $sorted_data = $filtered_data.sorted({
      //         by: function(v) {
      //           return $(v).find('.name').text().toLowerCase();
      //         }
      //       });
      
      $themes.quicksand($filtered_data, $preferences);
      
      return false;
    });
  });
});