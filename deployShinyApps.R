#!/usr/bin/env Rscript


# Deploy this app to shinyapps.io.

message("Deploying to shinyapps.")
cat("Account name:", Sys.getenv("SHINYAPPS_ACCOUNT"), "\n")
cat("Token present:", nchar(Sys.getenv("SHINYAPPS_TOKEN")) > 0, "\n")
cat("Secret present:", nchar(Sys.getenv("SHINYAPPS_SECRET")) > 0, "\n")
rsconnect::setAccountInfo(name=Sys.getenv("SHINYAPPS_ACCOUNT"), token=Sys.getenv("SHINYAPPS_TOKEN"), secret=Sys.getenv("SHINYAPPS_SECRET"))
rsconnect::deployApp(config::get("PROJECT_ROOT"),
                     appName="ui-data-explorer",
                     appFileManifest=file.path(config::get("PROJECT_ROOT"), 'filemanifest.txt'), 
                     launch.browser = FALSE)
