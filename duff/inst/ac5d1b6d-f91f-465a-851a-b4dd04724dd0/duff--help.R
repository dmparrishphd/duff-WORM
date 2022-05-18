`duff--help` <- function () {
    HELP <- Exo $ duff (
        INSTALLATION_DIRECTORY , 
        "61db5568-ab0a-4fe5-b532-79dd6f93b44f" )
    file.show (
        paste0 ( HELP , "/duff--help.txt" ) ,
        header = "duff--help.txt" ,
        title = "`duff--help`" ,
        encoding = "UTF-8" ) }
