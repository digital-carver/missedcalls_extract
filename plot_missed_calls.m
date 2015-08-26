
infile = fopen('missed_calls.psv');

fields = textscan(infile, '%[^|]|| %s || %s %s %s %d:%d:%d');
[name, phone_no, dd, mon, yr, hr, min, sec] = fields{:};

datestrings = strcat(dd, '-', mon, '-', yr);
datenums = datenum(datestrings, 'dd-mmm-yyyy');


fclose(infile);
