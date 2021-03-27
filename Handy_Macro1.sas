/* Basics */

/* Creating a Print statement based on inserted lib,tablename and obs*/
%macro mPrint(lib,tName,obs);
	proc print data=&lib..&tname(obs=&obs);
	run;
%mend;

/*Sample Data*/
%mPrint(sashelp,cars,15)


/* Creating a means procedure  */
%macro mMeans(lib,tName,stat /*insert list of stat values*/, var, maxdec ,class);
	%if &class= %then %do;
		%symdel &class;
		proc means data=&lib..&tName &stat maxdec=&maxdec;
			var &var;
		run;
	%end;
	%else %do;
			proc means data=&lib..&tName &stat maxdec=&maxdec;
			var &var;
			class &class;
		run;
	%end;
%mend;

/*Sample Data*/
%mMeans(sashelp,cars,min max mean,msrp,2,Type);