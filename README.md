
<h2>Dynachart</h2>

See asp.sh in <a href=https://github.com/jkstill/sar-tools>sar-tools</a> to generate CSV files from sar data.


<h3>dynachart.pl</h3>

<pre>
      --help brief help message
      --man  full documentation
      --spreadsheet-file output file name - defaults to asm-metrics.xlsx
      --worksheet-col name of column used to segragate data into worksheets
        defaults to a single worksheet if not supplied
      --chart-cols list of columns to chart

     dynachart.pl accepts input from STDIN

     This script will read CSV data created by asm-metrics-collector.pl or asm-metrics-aggregator.pl
</h3>

<h3>SYNOPSIS
    dynachart.pl [options] [file ...]</h3>
<pre>

     Options:
       --help brief help message
       --man  full documentation
       --spreadsheet-file output file name - defaults to asm-metrics.xlsx
       --worksheet-col name of column used to segragate data into worksheets
         defaults to a single worksheet if not supplied
      --chart-cols list of columns to chart
      --category-col specify the column for the X vector - a timestamp is typically used
        the name must exactly match that in the header
      --combined-chart create a single chart rather than a chart for each value specified in --chart-cols

     dynachart.pl accepts input from STDIN

     dynachart.pl --worksheet-col DISKGROUP_NAME < my_input_file.csv


     dynachart.pl --spreadsheet-file sar-disk-test.xlsx --combined-chart --worksheet-col DEV --category-col 'timestamp' --chart-cols 'rd_sec/s' --chart-cols 'wr_sec/s' < sar-disk-test.csv
</h3>

<h3>OPTIONS</h3>
<pre>
    -help   Print a brief help message and exits.

    -man    Prints the manual page and exits.

    --spreadsheet-file
             The name of the Excel file to create.
             The default name is asm-metrics.xlsx

    --worksheet-col
             By default a single worksheet is created.
             When this option is used the column supplied as an argument will be used to segragate data into separate worksheets.

    --chart-cols
             List of columns to chart
             This should be the last option on the command line if used.

             It may be necessary to tell Getopt to stop processing arguments with '--' in some cases.

             eg.

             dynachart.pl dynachart.pl --worksheet-col DISKGROUP_NAME --chart-cols READS WRITES -- logs/asm-oravm-20150512_01-agg-dg.csv

    --category-col
             Column to use as the category for the X line in the chart - default to the first column
             The name must exactly match a column from the CSV file
             Typically this line is a timestamp
</h3>

<h3>DESCRIPTION</h3>
    dynachart.pl creates an excel file with charts for selected columns>

<h3>EXAMPLES</h3>
<pre>
     dynachart.pl accepts data from STDIN

     dynachart.pl --worksheet-col DISKGROUP_NAME --spreadsheet-file mywork.xlsx

     dynachart.pl --spreadsheet-file sar-disk-test.xlsx --combined-chart --worksheet-col DEV --category-col 'timestamp' --chart-cols 'rd_sec/s' --chart-cols 'wr_sec/s' < sar-disk-test.csv

</h3>


