// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	$('.action').click(function() {
		$(this).addClass('active').siblings().removeClass('active');
	});
	$('#analytics-action').click(function() {
		$('#homepage-container').hide();
		$('#domains-container').hide();
		$('#analytics-container').fadeIn();
	});
	$('#homepage-action').click(function() {
		$('#analytics-container').hide();
		$('#domains-container').hide();
		$('#homepage-container').fadeIn();
	});
	$('#domains-action').click(function() {
		$('#homepage-container').hide();
		$('#analytics-container').hide();
		$('#domains-container').fadeIn();
	});
});