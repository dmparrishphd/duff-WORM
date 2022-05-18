function (
        installationDirectory ,
        collate = "dcd4ec7b-8ac7-4099-abd2-b28b28bda9af" ) {

    `%//%` <- paste0

    COLLATE <- read.csv ( installationDirectory %//% "/" %//% collate %//% "/collate.csv" )

    Env <- list ()
    Env $ Endo <- new.env ( parent = baseenv() )
    Env $ Exo  <- new.env ( parent = Env $ Endo )

    Env $ Endo $ Exo <- Env $ Exo
    Env $ Endo $ INSTALLATION_DIRECTORY <- installationDirectory

    for ( i in seq_len ( nrow ( COLLATE ) ) ) {
        source (
            file = installationDirectory %//% "/" %//% COLLATE [ i , "SOURCE" ] ,
            local = Env [[ COLLATE [ i , "TARGET" ] ]] ) }

    for ( EName in names ( Env ) )
    for ( Name in names ( Env [[ EName ]] ) )
    if ( is.function ( Env [[ EName ]] [[ Name  ]] ) )
    environment ( Env [[ EName ]] [[ Name ]] ) <- Env [[ EName ]]

    Env $ Exo }
