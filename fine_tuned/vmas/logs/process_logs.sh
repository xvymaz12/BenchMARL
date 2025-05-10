#!/bin/bash
mkdir -p filtered

for logfile in *.log; do
    if [ -f "$logfile" ]; then
        output_file="filtered/${logfile}"
        python filter_lines.py "$logfile" "$output_file"
        echo "Processed $logfile → $output_file"
    fi
done

echo "All .log files processed and saved in filtered/"
