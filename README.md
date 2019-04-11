# google.search.crawler

To install package:

```
devtools::install_github("samuelmacedo83/google.search.crawler")

# or forked repo in:
devtools::install_github("gomesfellipe/google.search.crawler")
```
 
Use functions:

```
google.search.crawler::get_urls("what is machine learning in R", 10)

google.search.crawler::scrap_links("machine learning", 10)
google.search.crawler::scrap_links("big data", 15)
google.search.crawler::scrap_links("data science", 5)
```

