# o2615574722363437501075354070230130144766223/duff.R
function ( pathname ) {

    En <- new.env ( parent = baseenv () )
    Ex <- new.env ( parent = En )

    En $ .PATHNAME <- pathname

    En $ digraphs <- function ( string ) {
        stopifnot (
            is.character ( string ) ,
            length ( string ) == 1 )
        N <- nchar ( string ) %/% 2L
        EVEN <- 1 : N * 2
        substr ( rep ( string , N ) , EVEN - 1 , EVEN ) }

    En $ searchPath <- function ( digits ) {
        DIGRAPHS <- digraphs ( digits )
        X <- seq_along ( DIGRAPHS )
        FUN <- function ( k ) paste (
            DIGRAPHS [ 1 : k ] ,
            collapse = "/" )
        FUN.VALUE = ""
        vapply ( X , FUN , FUN.VALUE ) }

    En $ ecat <- function ( ... ) cat (
        "duff: " , ... , "\n" , file = stdout () , sep = "" )

    En $ search1 <- function (
            pathname , pattern , verbose = FALSE ) {
        if ( verbose ) ecat (
            'Searching for file with infix "' , pattern ,
            '" in directory "' , pathname , '".' )
        Files <- list.files (
            path = pathname ,
            all.files = TRUE ,
            include.dirs = TRUE )
        i <- grep ( pattern = pattern , x = Files , fixed = TRUE )
        Files [ i ] } 

    En $ duff3 <- function (
            path , digits , pattern , verbose = FALSE ) {
        `%//%` <- paste0
        PATHS <- c ( path , path %//% "/" %//% searchPath ( digits ) )
        for ( Path in PATHS ) {
            if ( ! file.exists ( Path ) ) {
                if ( verbose ) ecat (
                    'Search ending---candidate directory "' ,
                    Path ,
                    '" does not exist.' )
                return ( character () ) }
            Found <- search1 ( Path , pattern , verbose = verbose )
            if ( length ( Found ) ) {
                if ( verbose ) ecat (
                    'Search ending---found match in directory "' ,
                    Path ,
                    '".' )
                return ( Path %//% "/" %//% Found ) }
        }
        if ( verbose ) ecat (
            "Search ending: no matches found among candidate directories." )
        character() }

    En $ characters <- function ( x )
            strsplit ( x = x , split = "" ) |> unlist()

    En $ digitsOnly <- function (
            pattern , digits = "01234567890abcdef" ) {
        CPATTERN <- pattern |> characters ()
        CDIGITS  <- digits |> characters ()
        isdigit <- function ( x ) x %in% CDIGITS
        paste ( Filter ( isdigit , CPATTERN ) , collapse = "" ) }

    En $ help <- function () {
        file.show (
            paste0 ( .PATHNAME , "/HELP" ) ,
            header = "file.show: help for package duff:---" ,
            encoding = "UTF-8" ) }

    Ex $ duff <- function ( pathnames , infix , verbose = FALSE ,
                digits = "01234567890abcdef" ) {
        if ( missing ( pathnames ) || missing ( infix ) ) {
            help ()
        } else {
            stopifnot (
                is.character ( pathnames ) ,
                is.character ( infix ) ,
                1 == length ( infix ) ,
                is.logical ( verbose ) ,
                ! is.na ( verbose ) ,
                is.character ( digits ) ,
                1 == length ( digits ) )
            lapply (
                pathnames ,
                function ( pathname ) duff3 (
                    pathname ,
                    digitsOnly ( infix , digits ) ,
                    infix ,
                    verbose = verbose ) ) |> unlist() } }

    for ( Name in names ( En ) )
            if ( is.function ( En [[ Name ]] ) )
                    environment ( En [[ Name ]] ) <- En
    for ( Name in names ( Ex ) )
            if ( is.function ( Ex [[ Name ]] ) )
                    environment ( Ex [[ Name ]] ) <- Ex

    Ex }
