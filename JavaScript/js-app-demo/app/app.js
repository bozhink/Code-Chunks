import 'bower_components/jquery/dist/jquery.js';
import Handlebars from 'bower_components/handlebars/handlebars.js';

var templateString = '<li><strong>Item - {{this}}</strong></li>';
var template = Handlebars.compile(templateString);


function render(items) {
	var $list = $('<ul />');
	items
		.map(template)
		.forEach(function(item){
		$('<li />')
			.html(item)
			.appendTo($list);
	});

	// $(items).each(function(key, item){
	// 	$("<li>").html(item).appendTo($list);
	// });

	return $list;
}

export {
	render
};