$(document).ready(function() {
	$(".fancybox-thumb").fancybox({
		prevEffect	: 'none',
		nextEffect	: 'none',
		helpers	: {
			title	: {
				type: 'outside'
			},
			thumbs	: {
				width	: 50,
				height	: 50
			}
		}
	});

  $('.fancybox-media').fancybox({
		openEffect  : 'none',
		closeEffect : 'none',
		helpers : {
			media : {}
		}
	});
  
  $(".various").fancybox({
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});

  $('#example').barrating({
    theme: 'fontawesome-stars-o'
  });

  $('.feedback-rating-dropdown').barrating({
    theme: 'fontawesome-stars-o',
    readonly: true
  });
  
  $('.feedback-avg-rating-dropdown').each(function(){
    var initialRating = $(this).data("current-rating");

    $(this).barrating({
      theme: 'fontawesome-stars-o',
      readonly: true,
      initialRating: initialRating
    });
  })
});

      
