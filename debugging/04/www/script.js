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


$(function() {
  document.querySelector('#fullscren').addEventListener('click', function() {
    toggleFullscreen("#plots");
  });
});
