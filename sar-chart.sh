#!/bin/bash

destDir='/mnt/zips/moriarty/tmp/dynachart/'
destDir='./'

# default of 1 chart per metric
./dynachart.pl --spreadsheet-file ${destDir}/sar-disk-default.xlsx --worksheet-col DEV --category-col 'timestamp' --chart-cols 'rd_sec/s' --chart-cols 'wr_sec/s' < sar-disk-test.csv

# combine metrics into one chart
./dynachart.pl --spreadsheet-file ${destDir}/sar-disk-combined.xlsx --combined-chart --worksheet-col DEV --category-col 'timestamp' --chart-cols 'rd_sec/s' --chart-cols 'wr_sec/s' < sar-disk-test.csv

# network stats - default charts
# There are different levels of reporting in sar network data, so filtered with this command
# awk -F, '{ if (NF==11) {print $0} }'  < sar-network.csv > sar-network-filtered.csv

./dynachart.pl --spreadsheet-file ${destDir}/sar-network.xlsx --worksheet-col IFACE --category-col 'timestamp' --chart-cols 'rxkB/s' --chart-cols 'txkB/s' < sar-network-filtered.csv


