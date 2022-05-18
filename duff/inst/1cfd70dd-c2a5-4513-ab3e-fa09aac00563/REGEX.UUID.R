REGEX.UUID <- paste0 (
    REGEX.HEX.UUID ,
    paste (
        "{8}-" , "{4}-" , "{4}-" , "{4}-" , "{12}" ,
        sep = REGEX.HEX.UUID ) )
