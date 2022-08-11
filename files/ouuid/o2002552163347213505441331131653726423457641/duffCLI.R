`%//%` <- paste0

Argv <- commandArgs ( trailingOnly = TRUE )

PKG.NAME <- Argv [[ 1 ]]
Argv     <- Argv [ -1  ]

INSTALL.DIR <- readLines (
    "~/." %//% PKG.NAME %//% "/INSTALL" ) %//%
    "/" %//% PKG.NAME

# Argv: INFIX [ PATHNAMES ] [--verbose]
IVERBOSE <- which ( "--verbose" == Argv )
stopifnot ( length ( IVERBOSE ) < 2 )
VERBOSE <- ! ! length ( IVERBOSE )

if ( VERBOSE ) Argv <- Argv [ - IVERBOSE ]
stopifnot ( 1 <= length ( Argv ) )
# Argv: INFIX [ PATHNAMES ]

INFIX <- Argv [[ 1 ]]
Argv  <- Argv [ -1  ]
# Argv: [ PATHNAMES ]

PATHNAMES <- if ( length ( Argv ) ) Argv else
        readLines ( "~/." %//% PKG.NAME %//% "/PATHNAMES" )

`%|%` <- function ( x , f ) f ( x )

# INFER digits FROM INFIX
DIGITS <- ( function () {
    ALPHANUMERIC <- strsplit (
        "0123456789" %//% LETTERS %//% letters ,
        split = "" ) %|% unlist
    HH <- strsplit ( INFIX , split = "" ) %|%
            unlist %|% unique %|% sort
    alphanumeric <- function ( h ) h %in% ALPHANUMERIC
    paste ( Filter ( alphanumeric , HH ) , collapse = "" )
    } ) ()

if ( VERBOSE ) ( function () {
    ecat <- function ( ... ) cat ( ... , file = stdout() )
    ecat ( 'duff: INFIX: "', INFIX , '"\n' , sep = "" )
    ecat ( "duff: PATHNAMES:---\n" )
    ecat ( PATHNAMES , sep = "\n" )
    ecat ( "duff:--- PATHNAMES/\n" , sep = "\n" )
    ecat ( 'duff: DIGITS: "' , DIGITS , '"\n' , sep = "" )
} ) ()

FILE <- INSTALL.DIR %//% "/duff.R"

WHAT.FOUND <- source ( FILE ) [[ 1 ]] ( INSTALL.DIR ) $
        duff ( PATHNAMES , INFIX , digits = DIGITS , verbose = VERBOSE )

cat ( WHAT.FOUND , sep = "\n" )
