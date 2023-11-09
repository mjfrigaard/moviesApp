<h1 align="center"> <code>moviesApp</code> </h1>
<h3 align="center"> A Shiny App-Package </h3>
<h5 align="center"> Code examples for <a href="https://mjfrigaard.github.io/shinyap/"> Shiny App-Packages </a> </h5>

<hr>

# moviesApp

`moviesApp` provides the code examples in for the [Shiny App-Packages](https://mjfrigaard.github.io/shinyap/) book and the [Developing & Testing Your Shiny Application](https://mjfrigaard.github.io/dev-test-shiny/) workshop provided at R in Pharma (2023).

**Movie review data application**

The original code and data for the Shiny app comes from the [Building Web Applications with Shiny](https://rstudio-education.github.io/shiny-course/) course.

## Using code examples

The branches in this repo contain a Shiny application in the various stages of development. If you're following along in the <a href="https://mjfrigaard.github.io/dev-test-shiny/slides/wrkshp.html#/title-slide">workshop slides</a>, the branch name is in the slide footer:

<div>
<p align="center"> 
  <img src="https://mjfrigaard.github.io/dev-test-shiny/img/slide_03_proj-app.png" alt="Workshop slide" width="80%">
</p>
</div>

<p align="left">
  If you're following along in the <a href="https://mjfrigaard.github.io/shinyap/">Shiny App-Packages</a> book, look for the Git Branch icon in the margin:
  </p>

<div>

<p align="right"> 
  <img src="https://raw.githubusercontent.com/mjfrigaard/shinyap/main/images/new_branch_ico.png" alt="Git branch icon" width="33%">

</div>

<p align="left">
You can change the branch in the Posit Workbench IDE's <strong>Git</strong> pane.
</p>



<div>
<p align="center"> 
  <img src="https://mjfrigaard.github.io/dev-test-shiny/img/cloud_branches.gif" alt="Animated git branches" width="100%">
</p>

</div>

Or use the terminal

``` bash
git checkout <branch_name>
```

------------------------------------------------------------------------

# Branches

View the various versions of application in the [`moviesApp` branches](https://github.com/mjfrigaard/moviesApp/branches/all).

## Traceability matrix with `covtracer`

[`spec_topic-trace-matrix`](https://github.com/mjfrigaard/moviesApp/tree/spec_topic-trace-matrix) gives examples of creating a traceability matrix with [`covtracer`](https://genentech.github.io/covtracer/)

Output from tests:

```
==> devtools::test()

ℹ Testing moviesApp
Loading required package: shiny
✔ | F W  S  OK | Context
✔ |          2 | app-feature-01 [11.2s]
⠏ |          0 | ggp2_app-feature-01
INFO [2023-11-09 09:33:04] [ START ggp2movies-feat-01 = update x, y, z, missing]
⠋ |          1 | ggp2_app-feature-01
INFO [2023-11-09 09:33:19] [ END ggp2movies-feat-01 = update x, y, z, missing]
✔ |          1 | ggp2_app-feature-01 [15.2s]
⠏ |          0 | mod_scatter_display
INFO [2023-11-09 09:33:19] [ START display = selected_vars initial values]

INFO [2023-11-09 09:33:19] [ END display = selected_vars initial values]

INFO [2023-11-09 09:33:19] [ START display = scatterplot[['alt']] = 'Plot object']
⠙ |          2 | mod_scatter_display
INFO [2023-11-09 09:33:20] [ END display = scatterplot[['alt']] = 'Plot object']

INFO [2023-11-09 09:33:20] [ START display = inputs() creates ggplot2 object]

INFO [2023-11-09 09:33:20] [ END display = inputs() creates ggplot2 object]
✔ |          3 | mod_scatter_display
⠏ |          0 | mod_var_input
INFO [2023-11-09 09:33:20] [ START var_inputs = initial returned()]

INFO [2023-11-09 09:33:20] [ END var_inputs = initial returned()]

INFO [2023-11-09 09:33:20] [ START var_inputs = updated returned()]

INFO [2023-11-09 09:33:20] [ END var_inputs = updated returned()]
✔ |          2 | mod_var_input
⠏ |          0 | scatter_plot 
INFO [2023-11-09 09:33:20] [ START fixture = tidy_ggp2_movies.rds]

INFO [2023-11-09 09:33:20] [ START fixture = tidy_ggp2_movies.rds]

INFO [2023-11-09 09:33:20] [ START data = movies.rda]

INFO [2023-11-09 09:33:20] [ END data = movies.rda]
✔ |          2 | scatter_plot
✔ |          1 | shinytest2 [6.4s]

══ Results ═══════════════════
Duration: 33.7 s

[ FAIL 0 | WARN 0 | SKIP 0 | PASS 11 ]
```