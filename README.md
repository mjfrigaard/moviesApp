# moviesApp

`moviesApp` provides the code examples for [Shiny App-Packages](https://mjfrigaard.github.io/shinyap/).

## Code for book

You can view the GitHub repository for the book [here](https://github.com/mjfrigaard/shinyap).

## `movies` app

The original code and data for this shiny app comes from the [Building Web Applications with Shiny](https://rstudio-education.github.io/shiny-course/) course.

## Tests 

### `12f_tests-mocks`

[`12f_tests-mocks`](https://github.com/mjfrigaard/moviesApp/tree/12f_tests-mocks) demonstrates simulating behaviors with test 'mocks.'

```
tests
├── testthat
│   ├── fixtures
│   │   ├── make-tidy_ggp2_movies.R
│   │   └── tidy_ggp2_movies.rds
│   ├── helper.R
│   └── test-check_installed.R
└── testthat.R

3 directories, 5 files
```

Read more about test mocking functions [here](https://testthat.r-lib.org/reference/index.html#mocking).