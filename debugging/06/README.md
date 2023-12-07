Let's record a test that confirms that if we select a 2 factor variables the plots appear! (we fixed it in excercise 1)

To record a test with {shinytest2} run the following:

```r
shinytest2::record_test("05")
```

It will open up a browser window. All actions we do in this app will be recorded and replayed automatically later when we run tests.

After we save the test, we can run it with:

```r
testthat::test_dir("05/tests/testthat")
```

(or evaluate the `run_tests.R` script)
