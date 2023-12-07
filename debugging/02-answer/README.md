The issue is with select variables being empty strings on first flush of the app.

We can guard against that by placing

```r
req(data(), x(), y())
```

before running the `select` query on `data()`.
