$(function() {
  // https://shiny.posit.co/r/articles/build/js-events/
  $(document).on('shiny:inputchanged', function(event) {
    // This function will run each time a Shiny input changes
    // `event` contains information about the event, ID of the input and it's value
    const id = event.target.id;
    const value = event.target.value;

    // Send `id` and `value` to the server
  });
});
