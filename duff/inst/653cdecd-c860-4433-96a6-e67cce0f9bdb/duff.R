duff <- function ( path , uuid )
        if ( missing ( path ) || missing ( uuid ) ) {
            `duff--help` ()
            character ()
        } else if ( ! is.uuid ( uuid ) ) {
            character ()
        } else {
            unlist ( lapply ( path , duff1 , uuid ) ) }
