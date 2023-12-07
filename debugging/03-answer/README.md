The issue was caused by the app trying to use the updated dataset, before dropdowns were updated with new choices.

The variables from previous dataset are not present in the new one.

![](2023-11-30-15-11-22.png)

This could be more easy to observe with network throttling, when time between update of dataset, variables and plots is longer.
