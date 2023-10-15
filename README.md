# moviesApp

`moviesApp` provides the code examples in the [Shiny App-Packages](https://mjfrigaard.github.io/shinyap/).

## Code for book

The GitHub repository for the book is [here](https://github.com/mjfrigaard/shinyap).

## `movies` app

The original code and data for this shiny app comes from the [Building Web Applications with Shiny](https://rstudio-education.github.io/shiny-course/) course.

I've converted it have [shiny modules](https://shiny.posit.co/r/articles/improve/modules/) and a [standalone app function](https://mastering-shiny.org/scaling-packaging.html#converting-an-existing-app) (which can be run from `app.R`).

# Branches

View the various versions of application in the [`moviesApp` branches](https://github.com/mjfrigaard/moviesApp/branches/all).

## `main`

The [`main`](https://github.com/mjfrigaard/moviesApp/tree/main) branch of `moviesApp` is identical to the files that are created with a new Shiny App from the Posit Workbench New Project Wizard.

## `02_movies-app`

The [`02_movies-app`](https://github.com/mjfrigaard/moviesApp/tree/02_movies-app) branch of `moviesApp` includes the code for the movie review data (from the [Building Web Applications with Shiny](https://rstudio-education.github.io/shiny-course/) course) in `app.R`.

## `03_proj-app`

The [`03_proj-app`](https://github.com/mjfrigaard/moviesApp/tree/03_proj-app) branch of `moviesApp` includes and `R/` folder and external resources have been included in `www`. 

```
R/
├── mod_scatter_display.R
├── mod_var_input.R
└── utils.R

1 directory, 3 files
```

```
www/
└── shiny.png

1 directory, 1 file
```


A `DESCRIPTION` file has also been added.

```
Type: shiny
Title: movies app
Author: John Smith
DisplayMode: Showcase
```


## `04_description`

The [`04_description`](https://github.com/mjfrigaard/moviesApp/tree/04_description) branch of `moviesApp` has an updated DESCRIPTION file:

```
Package: moviesApp
Title: movies app
Version: 0.0.0.9000
Author: John Smith [aut, cre]
Maintainer: John Smith <John.Smith@email.io>
Description: A movie-review shiny application.
License: GPL-3
```

## `05_rproj`

The `moviesApp.Rproj` file now contains the following fields: 

```
Version: 1.0

RestoreWorkspace: Default
SaveWorkspace: Default
AlwaysSaveHistory: Default

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 2
Encoding: UTF-8

RnwWeave: Sweave
LaTeX: XeLaTeX

BuildType: Package
PackageUseDevtools: Yes
PackageInstallArgs: --no-multiarch --with-keep.source
PackageRoxygenize: rd,collate,namespace
```

## Creating packages



### `06a_create-package`

After running `usethis::create_package()`, the `DESCRIPTION` file is updated with the following fields:

```
Package: moviesApp
Title: movies app
Version: 0.0.0.9000
Author: John Smith [aut, cre]
Maintainer: John Smith <John.Smith@email.io>
Description: A movie-review shiny application.
License: GPL-3
Encoding: UTF-8
Roxygen: list(markdown = TRUE)
RoxygenNote: 7.2.3
```

### `06b_devtools`

Manually converting the package with the `DESCRIPTION` doesn't include `Roxygen: list(markdown = TRUE)` (but it's covered in the following branch)

```
Package: moviesApp
Title: movies app
Version: 0.0.0.9000
Author: John Smith [aut, cre]
Maintainer: John Smith <John.Smith@email.io>
Description: A movie-review shiny application.
License: GPL-3
RoxygenNote: 7.2.3
Encoding: UTF-8
```

## `07_roxygen2`

The [`07_roxygen2`](https://github.com/mjfrigaard/moviesApp/tree/07_roxygen2) branch of `moviesApp` has documentation for all files in `R/`, and creates the help files in the `man/` folder:

```
man
├── mod_scatter_display_server.Rd
├── mod_scatter_display_ui.Rd
├── mod_var_input_server.Rd
├── mod_var_input_ui.Rd
├── movies_app.Rd
├── movies_server.Rd
├── movies_ui.Rd
└── scatter_plot.Rd

1 directory, 8 files
```

## Dependencies

### `08a_pkg-exports`

The [`08a_pkg-exports`](https://github.com/mjfrigaard/moviesApp/tree/08a_pkg-exports) branch of `moviesApp` covers how to export functions from our package for users in the `NAMESPACE`

```
# Generated by roxygen2: do not edit by hand

export(movies_app)
export(scatter_plot)
```

### `08b_pkg-imports`

The [`08b_pkg-imports`](https://github.com/mjfrigaard/moviesApp/tree/08b_pkg-imports) branch of `moviesApp` covers how to import functions from add-on packages so we can use them in our package.

Changes in the `DESCRIPTION` 

```
Package: moviesApp
Title: movies app
Version: 0.0.0.9000
Author: John Smith <John.Smith@email.io> [aut, cre]
Maintainer: John Smith <John.Smith@email.io>
Description: A movie-review shiny application.
License: GPL-3
Encoding: UTF-8
Roxygen: list(markdown = TRUE)
RoxygenNote: 7.2.3
Imports: 
    ggplot2,
    rlang,
    shiny,
    shinythemes,
    stringr
```

Changes in the `NAMESPACE`

```
# Generated by roxygen2: do not edit by hand

export(movies_app)
export(scatter_plot)
import(shiny)
importFrom(rlang,.data)
```

