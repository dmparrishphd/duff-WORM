digraphs.uuid <- function ( uuid ) {
	SPLIT <- strsplit ( uuid , "" ) [[ 1 ]]
	FUN <- function ( h ) ! ( h %in% "-" )
	HEX <- Filter ( FUN , SPLIT )
	DF.HEX <- as.data.frame ( matrix ( data = HEX , nrow = 2 ) )
	paste00 <- function ( x ) paste ( x , collapse = "" )
	vapply (
		X = DF.HEX ,
		FUN = paste00 ,
		FUN.VALUE = "" ,
		USE.NAMES = FALSE ) }
