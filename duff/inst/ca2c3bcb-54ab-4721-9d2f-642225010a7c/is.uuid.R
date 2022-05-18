is.uuid <- function ( string )
        is.character ( string ) &&
        length ( string ) &&
        grepl ( REGEX.UUID , string )
