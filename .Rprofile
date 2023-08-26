Q <- list()
class(Q) <- "quitter"
qq <- function(save="no") { q(save=save)}
print.quitter <- function(x, ...) qq()

options(usethis.full_name = "Jan Gleixner")
options("ggrastr.default.dpi"= 600)

if (interactive()) {
  invisible(
    reg.finalizer(
      .GlobalEnv,
      eval(bquote(function(e) try(savehistory(file.path(.(getwd()), ".Rhistory"))))),
      onexit = TRUE))
}

local({r <- getOption("repos")
       r["CRAN"] <- "https://cloud.r-project.org" 
       options(repos=r)
})

.Last <- function() {
  if (!any(commandArgs()=='--no-readline') && interactive()){
    try(utils::savehistory(Sys.getenv("R_HISTFILE")))
  }
}

if (interactive() && requireNamespace("progressr", quietly = TRUE)) {
  ## progressr reporting without need for with_progress()
  progressr::handlers(global = TRUE)
  
  ## Use 'cli', if installed ...
  if (requireNamespace("cli", quietly = TRUE)) {
    progressr::handlers("cli")
    ## Hand over all 'cli' progress reporting to 'progressr'
    options(cli.progress_handlers = "progressr")
  } else {
    ## ... otherwise use the one that comes with R
    progressr::handlers("txtprogressbar")
  }
  

  ## Reporting via RStudio, if running in the RStudio Console,
  ## but not the terminal
  if ((Sys.getenv("RSTUDIO") == "1") && 
      !nzchar(Sys.getenv("RSTUDIO_TERM"))) {
    progressr::handlers("rstudio", append = TRUE)
  }
}
#cat("<.Rprofile sourced>")

options(rstudio.python.installationPath = "/path/to/python")

if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
  # Set preferred themes if not handled elsewhere..
  rsthemes::set_theme_light("Elm light {rsthemes}")  # light theme
  rsthemes::set_theme_dark("Elm dark {rsthemes}") # dark theme
  rsthemes::set_theme_favorite(c(
    "GitHub {rsthemes}", "Elm light {rsthemes}", "Elm dark {rsthemes}"
  ))
  
  
  # Whenever the R session restarts inside RStudio...
  setHook("rstudio.sessionInit", function(isNewSession) {
    # Or alternatively use {ipapi} to determine your location automatically
    rsthemes::use_theme_auto()
  }, action = "append")
}
