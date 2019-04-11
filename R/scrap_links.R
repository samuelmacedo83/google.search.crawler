#' Retrieve urls and descriptions in google search
#'
#' This function provides a simple crawler to to retreive urls
#' and descriptions from google search in a tibble object
#'
#' @param search A search string
#'
#' @param how_many How many urls do you want to retrive
#' @importFrom magrittr %>%
#' @examples
#' scrap_links("machine learning", 10)
#' scrap_links("big data", 15)
#' scrap_links("data science", 5)
#'
#' @export

scrap_links <- function(search, how_many = 10) {
  search <- stringr::str_replace_all(search, " ", "+")
  
  url <- paste0(
    "https://www.google.com/search?q=", search,
    "&num=", how_many
  )
  
  webpage <- xml2::read_html(url)
  
  # Extract the URLs
  url <- webpage %>%
    rvest::html_nodes("h3") %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")
  
  # Extract the link text
  link <- webpage %>%
    rvest::html_nodes("h3") %>%
    rvest::html_nodes("a") %>%
    rvest::html_text()
  
  dplyr::tibble(link, url) %>%
    dplyr::mutate(url = dplyr::if_else(stringr::str_detect(url, "^\\/url\\?q\\="),
                         paste0("www.google.com", url), url
    ))
}