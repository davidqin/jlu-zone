jQuery ->
	$("a[rel=popover]").popover()
	$("li[rel=popover]").popover()
	$(".tooltip").tooltip()
	$("a[rel=tooltip]").tooltip()
	$("a[rel=userpopover]").popover({
		placement:'bottom'
		})
	$("img[rel=userpopover]").popover({
		placement:'bottom'
		})