// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function show_contact(elem) {
	$('#contact_detail .editarea').load($(elem).attr('path'));
	$('#contact_list ul li').removeClass("selected");
	$(elem).html('Loading...').addClass('selected');
}

$(document).ready(function() {
	$(window).keydown(function(e){
		if(!(e.target.nodeName == 'INPUT' || e.target.nodeName == 'TEXTAREA')){
			if(e.keyCode == 74){
				$('#contact_list ul li.selected').next().click();
			} else if(e.keyCode == 75){
				$('#contact_list ul li.selected').prev().click();
			}	else if(e.keyCode == 67){
				$('#new-link').click();
			} else if(e.shiftKey && e.keyCode == 68){
				$('#delete-link a').click();
			}	else if(e.keyCode == 69){
				$('#edit-link a').click();
			}
		}
	});
	$('#contact_list ul li').click(function(){
		show_contact(this);
	});
	$('#contact_list ul li:first').click().focus();
});

$('#contact_list h2').corner("top 5px");
$('#container').corner("10px");
$('#contact_detail').corner("5px");
$('#flash').hide();


function save_contact(path) {
	$('form.edit_contact input').each(function(){
     hide_default_value(this); 
  });
	jQuery.post(path, $('form.edit_contact').serialize(), function(data){
		$('#contact_detail .editarea').html(data); 
	});
}

function remove_contact(elem, token) {
  remove_contact_line(elem, token);
}

function remove_contact_line(elem, token) {
  jQuery.post(elem.href,{_method: "delete", authenticity_token: token}, function(data){
   	$('body').append(data); 
  });
  return false;
}

function check_list_name(contact_id) {
	elem_id = 'contact_' + contact_id +'_name';
	if (!document.getElementById(elem_id)) {
		$('#contact_list ul').prepend("<li id=\"" + elem_id +"\" path=\"/contacts/" + contact_id + "\">No Name</li>");
		$('#contact_list ul li:first').addClass("selected").click(function(){
			show_contact(this);
		});
		$('#contact_list ul li').removeClass("selected");
	}
}

function show_default_value(tbox) {
	o = $(tbox);
	if(!tbox.value){
		o.addClass('hint');
		o.attr('value', o.attr('default'));
	}
}

function hide_default_value(tbox) {
	if(tbox.value == $(tbox).attr('default'))
		$(tbox).removeClass('hint').attr('value', '');
}

$('#new-link').click(function() {
    $('#contact_detail .editarea').load(this.href);
		return false;
});

$('input#q').each(function(){
   show_default_value(this); 
}).focus(function(){
   hide_default_value(this); 
}).blur(function(){
   show_default_value(this); 
});
