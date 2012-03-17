mySettings = {
	previewParserPath:	'',
	onShiftEnter:		{keepDefault:false, openWith:'\n\n'},
	markupSet: [
		{name:'Heading 1', key:'1', openWith:'# '     , placeHolder:'' },
		{name:'Heading 2', key:'2', openWith:'## '    , placeHolder:'' },
		{name:'Heading 3', key:'3', openWith:'### '   , placeHolder:'' },
		{name:'Heading 4', key:'4', openWith:'#### '  , placeHolder:'' },
		{name:'Heading 5', key:'5', openWith:'##### ' , placeHolder:'' },
		{name:'Heading 6', key:'6', openWith:'###### ', placeHolder:'' },
		{name:'Bold', key:'B', openWith:'**', closeWith:'**'},
		{name:'Bulleted List', openWith:'- ' },
		{name:'separator', openWith:'\n\n----------\n\n ' },
		{name:'Picture', key:'P', openWith:'![A image](http://', closeWith:')', placeHolder:'Your image link~' },
		{name:'Link',    key:'L', openWith:'[', closeWith:'](http://)', placeHolder:'Your text to link here~' },
		{name:'Code Block / Code', openWith:'```\n', closeWith:'\n```'}
	]
}

miu = {
    markminTitle: function(markItUp, char) {
	heading = '';
	n = $.trim(markItUp.selection||markItUp.placeHolder).length;
	for(i = 0; i < n; i++) {
	    heading += char;
	  }
	return '\n'+heading;
  }
}

$(document).ready(function() {  
    $('textarea').markItUp(mySettings);  
}); 