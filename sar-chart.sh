#!/bin/bash


usage() {

	cat <<-EOF

	usage: $0 destination-directory

	example script that charts CSV data that has been generated from sar
	Excel XLXS files with charts are produced

	applicable to any CSV data

	
	example: sar-chart.sh data-dir


	EOF

}


while getopts h arg
do
	case $arg in
		h) usage;exit 0;;
		*) usage;exit 1;;
	esac
done

destDir=$1

[ -d "$destDir" -a -w "$destDir" ] || {
	echo
	echo cannot read and/or write directory destDir: $destDir
	echo
	usage
	echo
	exit 1
}

# default of 1 chart per metric
echo working on sar-disk-default.xlsx
./dynachart.pl --spreadsheet-file ${destDir}/sar-disk-default.xlsx --worksheet-col DEV --category-col 'timestamp' --chart-cols 'rd_sec/s' --chart-cols 'wr_sec/s' < sar-disk-test.csv

# combine metrics into one chart
echo working on sar-disk-combined.xlsx
./dynachart.pl --spreadsheet-file ${destDir}/sar-disk-combined.xlsx --combined-chart --worksheet-col DEV --category-col 'timestamp' --chart-cols 'rd_sec/s' --chart-cols 'wr_sec/s' < sar-disk-test.csv

# network stats - default charts
# There may be different levels of reporting in sar network data, so filtered with this command

echo working on sar-network.xlsx
./dynachart.pl --spreadsheet-file ${destDir}/sar-network.xlsx --worksheet-col IFACE --category-col 'timestamp' --chart-cols 'rxkB/s' --chart-cols 'txkB/s' < sar-network.csv


