# THIS EXAMPLE ASSUMES THAT A COPY OF THE PACKAGE IS STORED IN
# THE USER'S HOME DIRECTORY.

`%//%` <- paste0

DUFF <- "~/duff/inst" 

# ONE-TIME USE:
source ( DUFF %//%
		"/5d54cd17-a7eb-4ce6-a7fd-5e213d1a7dc4" %//%
		"/build.R" ) [[ 1 ]] ( DUFF ) $ duff ( DUFF , "5d54cd17-a7eb-4ce6-a7fd-5e213d1a7dc4" )

# USE FROM ENVIRONMENT:
e <- source ( DUFF %//%
		"/5d54cd17-a7eb-4ce6-a7fd-5e213d1a7dc4" %//%
		"/build.R" ) [[ 1 ]] ( DUFF )
e $ duff ( DUFF , "5d54cd17-a7eb-4ce6-a7fd-5e213d1a7dc4" )


# PLACE THE PACKAGE ON THE search PATH
attach (
	name = "protoPkg:duff" ,
	what = source ( DUFF %//%
		"/5d54cd17-a7eb-4ce6-a7fd-5e213d1a7dc4" %//%
		"/build.R" ) [[ 1 ]] ( DUFF ) )

# EXAMINE PART OF THE PACKAGE STRUCTURE
ls ( "protoPkg:duff" )
ls ( parent.env ( environment ( duff ) ) )
ls ( parent.env ( environment ( duff ) ) $ Exo )



# FIND UUID SUBDIRECTORIES (OR NOT)

duff ( DUFF , "0a54da08-067b-4971-801a-70f2140cae30" )
duff ( DUFF , "7d73b1ff-db4c-4c9e-825d-26b9ae6ac7c2" )
duff ( DUFF , "SHOULD-NOT-EXIST" )

WANTED = c (
	"0a54da08-067b-4971-801a-70f2140cae30" ,
	"SHOULD-NOT-EXIST" ,
	"7d73b1ff-db4c-4c9e-825d-26b9ae6ac7c2" )

data.frame (
	WANTED = WANTED ,
	FOUND = matrix ( lapply (
		FUN = function ( uuid ) duff ( DUFF , uuid ) ,
		X = WANTED ) ) )



# FIND AND READ NEWS

YYYYMMDD <- "[0-9]{4}-[0-9]{2}-[0-9]{2}"

allTheNEWS <- function () list.files (
	path = DUFF ,
	pattern = "NEWS--" %//% YYYYMMDD ,
	recursive = TRUE )

# LIST ALL THE NEWS FILES
cat ( allTheNEWS () , sep = "\n" )

# DISPLAY THE LATEST NEWS
file.show ( DUFF %//% "/" %//% rev ( allTheNEWS () ) [[ 1 ]] )

