The app has been enhanced with a validation on selection of X and Y variables.

It uses JavaScript events to modify the HTML of the app: <https://shiny.posit.co/r/articles/build/js-events/>

The expected bahvior is as follows:

- If X or Y variable changes and they're equal, a warning messages on both dropdowns are displayed.
- If X or Y variable changes and they're not equal, both messages disappear.

On startup of the app the messages are duplicated, but after a selection of a variable the warning message is displayed only once.

Find out why this happens and fix it.
