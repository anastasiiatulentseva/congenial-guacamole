$(document).on('turbolinks:load', function () {
  var table = $('.js-reports-table');

  // table sorting
  $('th.js-th-sortable').each(function () {
    var th = $(this);
    var thIndex = th.index();
    var inverse = false;
    th.click(function () {
      table.find('td').filter(function () {
        return $(this).index() === thIndex;
      }).sortElements(function (a, b) {
        a = string_of_number($.text([a]));
        b = string_of_number($.text([b]));
        if (a === b) return 0;
        return a > b ?
          inverse ? -1 : 1
          : inverse ? 1 : -1;
      }, function () {
        // parentNode is the element we want to move
        return this.parentNode;
      });
      inverse = !inverse;
    });
  });

  var string_of_number = function (value) {
    var parsed_value = parseFloat(value)
    return isNaN(parsed_value) ? value : parsed_value
  }

  // rows filter

  // filter select
  var filterTypeButton = $('.js-filter-selected');
  var filterBy = function () {
    return filterTypeButton.text().trim();
  };

  $('.js-filter-option').click(function (e) {
    // cancel the link behaviour
    e.preventDefault();
    filterTypeButton.text($(this).text());
    $('.js-filter-input').trigger('input');
  });

  // filtering
  $('.js-filter-input').on('input', function () {
    var inputValue = this.value.toLowerCase();
    var filterType = filterBy();
    table.find("td.js-filterable[data-filter-by='" + filterType + "']").each(
      function () {
        if ($(this).text().toLowerCase().includes(inputValue) || !inputValue) {
          $(this).parent().show();
        } else {
          $(this).parent().hide();
        }
      });
  });
});
