We fixed the issue with variables not being present in the data for the initial flush of the app.

The same issue comes up once again when we change the dataset.

What do we need to do to prevent it from happening?

Analyze the position of the error relative to the logs, use it to guide the fix.

Put `browser()` directly after the log line preceding the error to inspect the state of the app.
