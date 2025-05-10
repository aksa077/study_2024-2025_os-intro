#!/bin/bash

while getopts "i:o:p:Cn" opt; do
    case "$opt" in
        i) inputfile="$OPTARG" ;;
        o) outputfile="$OPTARG" ;;
        p) pattern="$OPTARG" ;;
        C) case_sensitive="-i" ;;
        n) line_numbers="-n" ;;
        *) echo "Usage: $0 -i inputfile -o outputfile -p pattern [-C] [-n]"; exit 1 ;;
    esac
done

grep $case_sensitive $line_numbers "$pattern" "$inputfile" > "$outputfile"
echo "Search results saved to $outputfile"
