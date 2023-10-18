# load packages --------------------
library(tidyr)
library(dplyr)
library(waldo)

make_var_inputs <- function() {
  glue::glue_collapse("list(y = 'audience_score',
     x = 'imdb_rating',
     z = 'mpaa_rating',
     alpha = 0.5,
     size = 2,
     plot_title = 'Enter plot title'
    )")
}

make_ggp2_inputs <- function() {
  glue::glue_collapse("list(x = 'avg_rating',
     y = 'length',
     z = 'mpaa',
     alpha = 0.75,
     size = 3,
     plot_title = 'Enter plot title'
     )")
}

tidy_ggp2_movies <- function(movies_data) {
  # restructure
  long_data <- movies_data |>
    dplyr::rowwise() |>
    dplyr::mutate(genre_count = sum(c(
      Action, Animation, Comedy,
      Drama, Documentary,
      Romance, Short
    ))) |>
    tidyr::pivot_longer(
      cols = c(Action:Short),
      names_to = "genre_name",
      values_to = "genre_indicator"
    )
  # aggregate data
  aggregated_data <- long_data |>
    dplyr::filter(genre_indicator > 0) |>
    dplyr::group_by(title, year) |>
    dplyr:::summarise(
      genres = paste0(genre_name, collapse = ", "),
      .groups = "drop"
    )
  # join data
  joined_data <- dplyr::left_join(
    x = long_data,
    y = aggregated_data,
    by = intersect(
      x = names(long_data),
      y = names(aggregated_data)
    )
  ) |>
    dplyr::select(
      title, year, length,
      budget, rating, votes, mpaa,
      genre_count, genres
    ) |>
    dplyr::distinct()

  dplyr::mutate(joined_data,
    genre = dplyr::case_when(
      genre_count > 1 ~ "Multiple genres",
      genre_count == 1 ~ genres,
      TRUE ~ genres
    ),
    genre = factor(genre),
    mpaa = dplyr::na_if(x = mpaa, y = ""),
    mpaa = factor(mpaa,
      levels = c("G", "PG", "PG-13", "R", "NC-17"),
      labels = c("G", "PG", "PG-13", "R", "NC-17")
    )
  )
}

base_tidy_ggp2_movies <- function(movies_data) {
  # specify genre columns
  genre_cols <- c(
    "Action", "Animation",
    "Comedy", "Drama",
    "Documentary", "Romance",
    "Short"
  )
  # calculate row sum for genres
  movies_data$genre_count <- rowSums(movies_data[, genre_cols])
  # create aggregate 'genres' for multiple categories
  movies_data$genres <- apply(
    X = movies_data[, genre_cols],
    MARGIN = 1,
    FUN = function(row) {
      genres <- names(row[row == 1])
      if (length(genres) > 0) {
        return(paste(genres, collapse = ", "))
      } else {
        return(NA)
      }
    }
  )
  # format variables
  movies_data$genre_count <- as.integer(movies_data$genre_count)
  movies_data$genre <- ifelse(test = movies_data$genre_count > 1,
    yes = "Multiple genres",
    no = movies_data$genres
  )
  movies_data$genre <- as.factor(movies_data$genre)
  movies_data$mpaa <- factor(movies_data$mpaa,
    levels = c("G", "PG", "PG-13", "R", "NC-17"),
    labels = c("G", "PG", "PG-13", "R", "NC-17")
  )

  # reduce columns to only those in graph
  movies_data[, c(
    "title", "year", "length", "budget",
    "rating", "votes", "mpaa", "genre_count",
    "genres", "genre"
  )]
}

tdat <- base_tidy_ggp2_movies(ggplot2movies::movies)
bdat <- tidy_ggp2_movies(ggplot2movies::movies)


tdat_genres <- dplyr::filter(tdat, genre_count > 2) |>
  dplyr::select(title, genre_count, genre, genres)
bdat_genres <- dplyr::filter(bdat, genre_count > 2) |>
  dplyr::select(title, genre_count, genre, genres)

waldo::compare(bdat_genres, tdat_genres)
