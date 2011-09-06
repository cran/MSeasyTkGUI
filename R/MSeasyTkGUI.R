# MSeasy Tcl/Tk GUI for some basic functions in the MSeasy package.
# Part of the code is based on the ade4TkGUI package by Jean Thioulouse <jthioulouse@biomserv.univ-lyon1.fr>, Stephane
#       Dray <dray@biomserv.univ-lyon1.fr>
#

MSeasyTkGUI <-
function()
{
	require(tcltk) || stop("tcltk support is absent")
	require(MSeasy) || stop("MSeasy support is absent")
	require(grDevices) || stop("grDevices support is absent")
	
#	cmdlist <<- "cmdlist"
	assign("cmdlist", "cmdlist", envir=.GlobalEnv)
#	winlist <<- 1
	assign("winlist", 1, envir=.GlobalEnv)
	
	if (exists("MSeasyTkGUIFlag")) rm("MSeasyTkGUIFlag", envir=.GlobalEnv)
	if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
#
# Main dialog window with title
#
	tt <- tktoplevel()
	tkwm.title(tt,"MSeasyTkGUI")
	
#
#Demo functions
#

demochoose<-function(){
assign("DemoFlag", 1, envir=.GlobalEnv)
choosepackage()
}

demodialog.MS.DataCreation.Agilent<-function(){
assign("DemoFlag", 1, envir=.GlobalEnv)
dialog.MS.DataCreation.Agilent()
}

demodialog.MS.DataCreation.ASCII<-function(){
assign("DemoFlag", 1, envir=.GlobalEnv)
dialog.MS.DataCreation.ASCII()
}

demodialog.MS.test.clust<-function(){
assign("DemoFlag", 1, envir=.GlobalEnv)
dialog.MS.test.clust()
}

demodialog.MS.clust<-function(){
assign("DemoFlag", 1, envir=.GlobalEnv)
dialog.MS.clust()
}

demobutton<-function(){
assign("DemoFlag", 1, envir=.GlobalEnv)
dialog.MS.demon()
}

#
#Usal functions
#

nodialog.MS.step1<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.step1()
}
nodialog.MS.step2<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.step2()
}

nodialog.MS.DataCreation.user<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.DataCreation.user()
}

nodialog.MS.DataCreation.Agilent<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.DataCreation.Agilent()
}

nodialog.MS.DataCreation.CDF<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.DataCreation.CDF()
}

nodialog.MS.DataCreation.ASCII<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.DataCreation.ASCII()
}

nodialog.MS.test.clust<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.test.clust()
}

nodialog.MS.clust<-function(){
if (exists("DemoFlag")) rm("DemoFlag", envir=.GlobalEnv)
dialog.MS.clust()
}



#
# Menu setup
#
	frame0 <- tkframe(tt, relief="groove", borderwidth=2, background="grey")

	topMenuMSeasy <- tkmenubutton(frame0, text="Menu", background="grey")
	MSeasyMenu <- tkmenu(topMenuMSeasy, tearoff=TRUE)
	tkconfigure(topMenuMSeasy, menu=MSeasyMenu)
	
	openRecentMenu <- tkmenu(topMenuMSeasy,tearoff=FALSE)
		tkadd(openRecentMenu,"command",label="Agilent Files(.D folders)",    command=function() nodialog.MS.DataCreation.Agilent())
		tkadd(openRecentMenu,"command",label="ASCII Files",	command=function() nodialog.MS.DataCreation.ASCII())
		tkadd(openRecentMenu,"command",label="User made Files (.txt .csv...)",	command=function() nodialog.MS.DataCreation.user())
		tkadd(openRecentMenu,"command",label="CDF or XML Files (xcms needed)",	command=function() nodialog.MS.DataCreation.CDF())
	
	openRecentMenu1 <- tkmenu(topMenuMSeasy,tearoff=FALSE)
		tkadd(openRecentMenu1,"command",label="MS.clust",    command=function() nodialog.MS.clust())
		tkadd(openRecentMenu1,"command",label="MS.test.clust",	command=function() nodialog.MS.test.clust())
	
	openRecentMenu2 <- tkmenu(topMenuMSeasy,tearoff=FALSE)
		tkadd(openRecentMenu2,"command",label="Load an MSeasy demo Dataset",    command=function() demochoose())
		tkadd(openRecentMenu2,"command",label="MS.DataCreation (Agilent)",    command=function() demodialog.MS.DataCreation.Agilent())
		tkadd(openRecentMenu2,"command",label="MS.DataCreation (ASCII)",	command=function() demodialog.MS.DataCreation.ASCII())
		tkadd(openRecentMenu2,"command",label="MS.test.clust",	command=function() demodialog.MS.test.clust())
		tkadd(openRecentMenu2,"command",label="MS.clust",	command=function() demodialog.MS.clust())
		
	tkadd(MSeasyMenu,"cascade",label="Step1-MS Data formatting...",menu=openRecentMenu)
	tkadd(MSeasyMenu,"separator")	
	tkadd(MSeasyMenu,"cascade",label="Step2-MS Data clustering...",menu=openRecentMenu1)
	tkadd(MSeasyMenu,"separator")	
	tkadd(MSeasyMenu,"cascade",label="Demonstration",menu=openRecentMenu2)
	tkadd(MSeasyMenu,"separator")
	tkadd(MSeasyMenu,"command",label="Quit R",command=function() q())
	
	topMenuHelp <- tkmenubutton(frame0, text="Help", background="grey")
	MSeasyMenu <- tkmenu(topMenuHelp, tearoff=TRUE)
	tkconfigure(topMenuHelp, menu=MSeasyMenu)
	tkadd(MSeasyMenu,"command",label="MSeasy(Help)",command=function()print(help("MSeasy")) )
	tkadd(MSeasyMenu,"command",label="trans.ASCII (Help)",command=function()print(help("trans.ASCII")) )
	tkadd(MSeasyMenu,"command",label="MS.DataCreation (Help)",command=function()print(help("MS.DataCreation")) )
	tkadd(MSeasyMenu,"command",label="MS.DataCreationCDF (Help)",command=function()print(help("MS.DataCreationCDF")) )
	tkadd(MSeasyMenu,"command",label="MS.test.clust (Help)",command=function()print(help("MS.test.clust")) )
	tkadd(MSeasyMenu,"command",label="MS.clust (Help)",command=function()print(help("MS.clust")) )
	
	
	tkpack(topMenuMSeasy,topMenuHelp,side="left")
	tkpack(frame0, expand="TRUE", fill="x")
#
# title and icons
#
	frame1 <- tkframe(tt, relief="groove", borderwidth=2, background="white")

		labh <- tklabel(frame1, bitmap="questhead", background="white")
	tkbind(labh, "<Button-1>", function() print(help("MSeasyTkGUI")))
	titre <- tklabel(frame1,text="MSeasy even more easy", font="Times 14", foreground="red", background="white")
	
	helplab <- tklabel(frame1,text="- Right click buttons for help - Double click in lists to select -", font="Times 11", foreground="dark green", background="white")


	tkgrid(titre, labh, padx=10, sticky = "w")
	tkgrid(helplab, columnspan=4)
	tkpack(frame1, expand="TRUE", fill="x")
#
# MSeasy step 1 button
#
	frame1b <- tkframe(tt,  borderwidth=2, background="white")
	tkpack(tklabel(frame1b,text="- MSeasy -", font="Times 12", foreground="blue", background="white"))	
	step1.but <- tkbutton(frame1b, text="Step1- MS Data formatting", command=function() nodialog.MS.step1())
	
	tkpack(step1.but,ipadx=25, side="bottom", expand="TRUE")
	tkpack(frame1b, expand="TRUE", fill="x")

	tkbind(step1.but, "<Button-3>", function() print(help("MS.DataCreation")))
	

#
# MSeasy Step 2 button
#
	frame2 <- tkframe(tt,  borderwidth=2, background="white")
	step2.but <- tkbutton(frame2, text="Step2- MS Data clustering  ", command=function() nodialog.MS.step2())
	
	tkpack(step2.but,ipadx=25, side="top", expand="TRUE")
	tkpack(frame2, expand="TRUE", fill="x")
	
	tkbind(step2.but, "<Button-3>", function() print(help("MS.clust")))
	
#
# MSeasy Demo button
#
	frame3 <- tkframe(tt, relief="groove", borderwidth=2, background="white")
	tkpack(tklabel(frame3,text="- Demonstration -", font="Times 12", foreground="blue", background="white"))
	demon.but <- tkbutton(frame3, text="Demonstration", command=function() demobutton())
	
	tkpack(demon.but,ipadx=25, side="top", expand="TRUE")
	tkpack(frame3, expand="TRUE", fill="x")
	
	tkbind(demon.but, "<Button-3>", function() print(help("MSeasyTkGUI")))	
	
#
# Quit
#
	frame5 <- tkframe(tt, relief="groove", borderwidth=2, background="white")
	cancel.but <- tkbutton(frame5, text="Cancel", command=function() tkdestroy(tt), font="Times 14")
	quity.but <- tkbutton(frame5, text="Quit R (save)", command=function() q("yes"), font="Times 14")
	quitn.but <- tkbutton(frame5, text="Quit R (don't save)", command=function() q("no"),  font="Times 14")
	tkpack(quity.but, cancel.but, quitn.but, side="left", expand="TRUE", fill="x")
	tkpack(frame5, expand="TRUE", fill="x")
	tkfocus(tt)
	return(invisible())
}

