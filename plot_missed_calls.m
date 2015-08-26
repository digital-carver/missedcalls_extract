close all;

infile = fopen('missed_calls.psv');

fields = textscan(infile, '%[^|]|| %s || %s %s %s %f:%f:%f');
[names, phone_nos, dd, mon, yr, hr, min, sec] = fields{:};

datestrings = strcat(dd, '-', mon, '-', yr);
x = datenum(datestrings, 'dd-mmm-yyyy');

y = hr*3600 + min*60 + sec;

unknown_calls = strcmp(names, '(Unknown) ');


p = plot(x, y, '-xk');

set(p, 'LineWidth', 0.01);
set(gca, 'LineWidth', 2);

monthnums    = month(x);
monthchanges = logical(cumdiff(monthnums));
set(gca, 'XTick', x(monthchanges), 'XTickLabel', mon(monthchanges));

twohour_pts_in_sec = (0:2:24)*3600;
twohour_pts_labels = {'00 AM', '2 AM', '4 AM', '6 AM', '8 AM', '10 AM', '12 NN', '2 PM', '4 PM', '6 PM', '8 PM', '10 PM'};
set(gca, 'YTick', twohour_pts_in_sec, 'YTickLabel', twohour_pts_labels);



fclose(infile);
