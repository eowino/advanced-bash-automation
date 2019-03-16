# shell parameter expansions
# Useful for outputting text without any space between them

echo ${USER}_$(date '+%Y')

# also useful for passing default values
count_files() {
    # set dir to user args otherwise default to PWD
    dir=${1:-$PWD}
    # find files in dir, pipe output to the wc (word count) command and count lines
    find "$dir" -type f -maxdepth 1 | wc -l
}