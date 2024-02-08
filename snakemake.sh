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
read -r -p "please provide the input text file:" inputtextfile
read -r -p "please provide the output text file:" outputtextfile
if [[ ! -f "${inputtextfile}" && ! -f "${outputtextfile}" ]]
then
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
fi
if [[ -f "${inputtextfile}" && -f "${outputtextfile}" ]]
then
declare -a inputtext=()
for i in $(cat "${inputtextfile}" | cut -f 1 -d " ")
do
    inputtext+=("${inputdirectory}"\"${i}\"\,)
done
    echo "the number of the files added to the input snakemake: {#inputtext[@]}"
    echo "the files added to the input array are: ${inputtext[*]}"
declare -r outputtext=()
for i in $(cat "${outputtextfile}" | cut -f 1 -d " ")
do 
    outputtext+=("${outputdirectory}"\"${i}\"\,)
done
    echo "the number of the files added to the output snakemake: {#outputtext[@]}"
    echo "the files added to the input array are: ${outputtext[*]}"
    echo "rule ${rule}:"
    echo "  ""input: ${inputtext[*]}"
    echo "  ""output:${outputtext[*]}"
    echo "  ""shell: ${command} ${inputtext[*]} ${outputtext[*]}"
fi
