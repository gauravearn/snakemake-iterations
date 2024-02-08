# snakemake_iterations
write as many snakemake files and with much faster iterations and completely from the single files or from the list of the files with the path appended. This will make your writing the snakemake easier. The complete code inside, a look at how to write faster snakemake files for the clusters.

```
#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Universität Potsdam, Germany
# Author: Gaurav Sablok
# date: 2024-2-8
# a indexed based and brace expansion based way of writing
# the snakemake files for computing the below version is
# for if you have some files.
read -r -p "please provide the rule name:" rule
read -r -p "please provide the shell command:" command
read -r -p "please provide the input file directory:" inputdirectory
read -r -p "please provide the output file directory:" outputdirectory
declare -a snakeinput=()
while true; do
    read -r -p "please provide me the input name:" inputname
    if [[ "${inputname}" == "" ]]; then
        break
    fi
    snakeinput+=("${inputdirectory}"\"${inputname}\"\,)
done
declare -a snakeoutput=()
while true; do
    read -r -p "please provide me the output name:" outputname
    if [[ "${outputname}" == "" ]]; then
        break
    fi
    snakeoutput+=("${outputdirectory}"\"${outputname}\"\,)
done
for i in "${snakeinput[*]}"; do
    echo "rule ${rule}:"
    echo "  ""input: ${i}"
    echo "  ""output:${snakeoutput[*]}"
    echo "  ""shell: ${command} ${snakeinput[*]} ${snakeoutput[*]}"
done
```

Gaurav Sablok,\
Academic Staff Member,\
Bioinformatics,\
Institute for Biochemistry and Biology,\
University of Potsdam,\
Potsdam,Germany

