var loan = '';

$().ready(function(){
	$('.add_loan').click(function(){
		$(this).parents('tr').before(new_loan());
	});
	
	$('.delete_loan').click(function(){
	  var tr = $(this).parents('tr:first');
	  if(tr.hasClass('new_loan'))
	    tr.remove();
	  else
	    tr.hide().find('#thing_loans_attributes_0__delete').attr('value','true');
	});
});

new_loan = function(){
  var new_id = new Date().getTime();
  loan_clone = loan;
  return $(loan_clone.replace(/NEW_RECORD/g, new_id));
}