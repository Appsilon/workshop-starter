We can start the debugging the `renderPlot` as it's the end point that is affected.

We should inpect the `data()` value and notice any anomalies.

We trace back to a place where `data()` reactive is initialized - in `adjust_data_server` and find out why the data is empty.
