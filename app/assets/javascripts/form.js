$(document).on('turbolinks:load', function () {
  $('form').on('click', '.remove_nested_fields', function (event) {
    if ($(this).closest('form').find('.nested_field_element:visible').length > 1) {
      $(this.parentNode).find("#_destroy").val('1');
      $(this.parentNode).hide();
      $(this.parentNode).find(':input:not([type=hidden])').prop('disabled', true);
    }
    return event.preventDefault();
  });

  $('form').on('click', '.add_nested_fields', function (event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.nested_fields').append($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
})
