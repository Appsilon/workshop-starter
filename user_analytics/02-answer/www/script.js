$(function() {
  $(document).on('shiny:inputchanged', function(event) {
    // This function will run each time a Shiny input changes
    // `event` contains information about the event, ID of the input and it's value
    const id = event.target.id;
    const value = event.target.value;
    if (!!id && !!value) {
      Shiny.setInputValue('log', { id, value }, { priority: 'event' })
    }
  });
});
