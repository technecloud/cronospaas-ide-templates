(function() {
  $(document).off('.datepicker.data-api');
  $('.input-group.date').datepicker({
    todayHighlight: true,
    format: 'dd/mm/yyyy'
  });
}());
