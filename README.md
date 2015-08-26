###`missedcalls_extractor.pl`

Parses call log XML as returned by [Call Logs Backup & Restore](https://play.google.com/store/apps/details?id=com.riteshsahu.CallLogBackupRestore) app, 
and extracts out the info about missed calls alone to a separate file. 

Human readable output comes out in STDOUT, machine-readable output (the same 
fields separated by `||` really) is given via STDERR. 

###`plot_missed_calls.m`

Reads the above machine-readable output, and plots the data with dates on x-axis
and time on y-axis. 

