#' Retrieve urls on google search
#'
#' This function provides a simple crawler to to retreive urls from
#' google search
#'
#' @param search A search string
#'
#' @param how_many How many urls do you want to retrive
#' @importFrom magrittr %>%
#' @examples
#' get_urls("machine learning", 10)
#'
#' @export
get_urls <- function(search, how_many = 10){

  search <- stringr::str_replace_all(search, " ", "+")

  chrome_url <- paste0("https://www.google.com/search?q=", search,
                       "&num=", how_many)

  xml2::read_html(chrome_url) %>%
    rvest::html_nodes("cite") %>%
    rvest::html_text()
}




