(function() {
  $(document).off('.datepicker.data-api');
  var input = $('.input-group.date');
  if(input && input.datepicker){
      input.datepicker({
        todayHighlight: true,
        format: 'dd/mm/yyyy'
      });
  }
}());
