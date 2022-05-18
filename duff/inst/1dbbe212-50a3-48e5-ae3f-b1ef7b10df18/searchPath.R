searchPath <- function ( uuid ) {
	DIGRAPHS <- digraphs.uuid ( uuid )
	SEQ <- seq_along ( DIGRAPHS )
	FUN <- function ( k ) paste (
        DIGRAPHS [ 1 : k ] ,
        collapse = "/" )
	vapply (
		X = SEQ ,
		FUN = FUN ,
		FUN.VALUE = "" ,
		USE.NAMES = FALSE ) }
