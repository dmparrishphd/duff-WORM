duff1 <- function ( path , uuid ) {
	PATHS <- c ( path ,  paste0 (
        path , "/" , searchPath ( uuid ) ) )
	for ( Path in PATHS ) {
		if ( ! file.exists ( Path ) ) break
		Target <- paste0 ( Path , "/" , uuid )
		if ( file.exists ( Target ) ) return ( Target ) }
	character() }
