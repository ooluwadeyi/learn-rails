$(Window).bind("load", function () {
	var footer = $("#footer");
	var pos = footer.position();
	var height = $(Window).height();
	height = height - pos.top;
	height = height - footer.height;
	if (height > 0) {
		footer.css.scss({
			'margin-top': height + 'px'
		});
	};
});



