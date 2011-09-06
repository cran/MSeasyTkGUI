\name{MSeasyTkGUI}

\alias{MSeasyTkGUI}

\title{Tcl/Tk GUI for the MSeasy package}

\description{
A Tcl/Tk GUI for some basic functions in the \code{MSeasy} package.
It was created on the basis of the ade4TkGUI package by Jean Thioulouse <jthioulouse@biomserv.univ-lyon1.fr>, 
Stephane Dray <dray@biomserv.univ-lyon1.fr>
}

\usage{
MSeasyTkGUI()
}

\details{
Right-click on MSeasy function buttons to get help on these functions.
You can also click on the questionhead icon in the dialog windows.
This displays the R help for the corresponding function.\cr

In all dialog windows, entries can either be filled with a "\code{set}" button, or typed
directly in the entry field. The "\code{set}" button displays a listbox with a list
of available objects in the global environment. 
}

\section{Buttons}{

The first row of buttons (\code{- MSeasy -}) is used to format MS data (\code{Step 1- ...}) prior to the clustering (\code{Step 2- ...}),
either from a tab-delimited text file exported from Excel (\code{User made file}), 
or from raw MS data files (\code{Agilent or ASCII files};  
right-click on the button to get help and for details on MS data format).\cr

The second block of buttons (\code{- Demonstration -}) gives access to \code{MSeasy} test datasets (\code{DataTest or DataClust}) by \code{Load an MSeasy dataset} or to predifined exemples of the MSeasy functions
(like \code{MS.DataCreation, MS.clust...}). 
}

\section{Menu bar}{

The menu bar at the top of the window can be used to launch all the MSeasy functions.
All theses menus are tear-off.

The \code{Menu} can be used to compile or cluster MS data as the buttons described above,
and to quit R :

- \code{Help} allows to read MSeasy help files.


- \code{Quit R} opens a dialog window to ask if the environment should be saved before
quitting R.


}

\author{
Yann Guitton \email{yann.guitton@gmail.com} 
}

\examples{
\dontrun{
## Start the GUI
MSeasyTkGUI()
}
}
\keyword{MSeasy}
