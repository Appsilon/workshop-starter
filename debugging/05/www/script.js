// https://developer.mozilla.org/en-US/docs/Web/API/Element/requestFullscreen
function toggleFullscreen(selector) {
  let elem = document.querySelector(selector);

  if (!document.fullscreenElement) {
    elem.requestFullscreen().catch((err) => {
      alert(
        `Error attempting to enable fullscreen mode: ${err.message} (${err.name})`,
      );
    });
  } else {
    document.exitFullscreen();
  }
}

function addSelectValidation(el, message) {
  $(el)
    .siblings('.selectize-control')
    .addClass('is-invalid')
    .parent()
    .append(`<div class=\"invalid-feedback\">${message}</div>`)
}

function removeSelectValidation(el) {
  $(el)
    .parent()
    .find('.invalid-feedback')
    .remove();
  $(el)
    .siblings('.selectize-control')
    .removeClass('is-invalid');
}

$(function() {
  document.querySelector('#fullscreen').addEventListener('click', function() {
    toggleFullscreen("#plots");
  });

  $(document).on('shiny:inputchanged', function(event) {
    const event_id = event.target.id;
    const select_x_id = 'adjust_data_ui-x-select'
    const select_y_id = 'adjust_data_ui-y-select'
    const select_x_el = $(`#${select_x_id}`);
    const select_y_el = $(`#${select_y_id}`);

    if (event_id === select_x_id || event_id === select_y_id) {
      const x = $(`#${select_x_id}`).val();
      const y = $(`#${select_y_id}`).val();
      if (x === y) {
        addSelectValidation(select_x_el, 'X and Y variables should be different!');
        addSelectValidation(select_y_el, 'X and Y variables should be different!');
      } else {
        removeSelectValidation(select_x_el);
        removeSelectValidation(select_y_el);
      }
    }
  });
});
