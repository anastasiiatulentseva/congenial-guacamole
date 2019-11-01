'use strict'

$(document).on('turbolinks:load', () => {
  const table = $('.js-reports-table')

  $('th.js-th-sortable').each((idx, headerCell) => {
    const th = $(headerCell)
    const thIndex = th.index()
    let inverse = false
    th.on('click', () => {
      table.find('td')
        .filter((tdIdx, td) => $(td).index() === thIndex)
        .sortElements((a, b) => {
          a = string_or_number($.text([a]))
          b = string_or_number($.text([b]))
          if (a === b) return 0
          return a > b ?
            inverse ? -1 : 1
            : inverse ? 1 : -1
        })
      inverse = !inverse
    })
  })

  const string_or_number = (value) => {
    const parsed_value = parseFloat(value)
    return isNaN(parsed_value) ? value : parsed_value
  }

// rows filter

// filter select
  const filterTypeButton = $('.js-filter-selected')
  const filterBy = () => filterTypeButton.text().trim()

  $('.js-filter-option').click((e) => {
    // cancel the link behaviour
    e.preventDefault()
    filterTypeButton.text(e.target.text)
    $('.js-filter-input').trigger('input')
  })

// filtering
  $('.js-filter-input').on('input', (event) => {
    const inputValue = event.target.value.toLowerCase()
    const filterType = filterBy()
    table.find("td.js-filterable[data-filter-by='" + filterType + "']").each((idx, td) => {
      if ($(td).text().toLowerCase().includes(inputValue) || !inputValue) {
        $(td).parent().show()
      } else {
        $(td).parent().hide()
      }
    })
  })
})
