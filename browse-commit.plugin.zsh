# Author: https://twitter.com/adolfoabegg
#
# Setup: cd into/your/project
#        git config --add browse-commit.url https://github.com/your-username/your-project/commit
#        You then must enable this pluging by adding browse-commit to your plugins list in your ~/.zshrc file
#
# Usage: brc           # opens the last commit in the default browser
#        brc bc7b10a   # opens a specific commit in the defaul browser
#        cpc           # copies the url of the last commit to the clipboard
#        cpc bc7b10a   # copies the url of a specific commit to the clipboard
#

all_good="yes"
repo_url=""
commit_url=""

browse_commit_init () {
    browse_commit_check_repo
    browse_commit_get_url
}

# checks whether the current dir is a git repository or not
browse_commit_check_repo () {
    local current_dir=$(pwd)
    local git_dir="$current_dir/.git"
    if [ ! -d $git_dir ];
    then
        all_good="no"
        echo "$current_dir is not a git repo."
    fi
}

# gets the URL of the last (or specific) commit
browse_commit_get_url () {
    if [ $all_good != "yes" ]; then 
        return 
    fi
    commit_url=$(git config --get browse-commit.url)
    if [[ "x$commit_url" != "x" ]]; then
    else
        echo "Please configure the base URL to browse your commits. Use this command: git config --add browse-commit.url http://github.com/your-username/your-project/commit"
        all_good="no"
        return
    fi

    local commit_hash="x"
    if [ -z "$1" ]; then
      commit_hash=$(git log --pretty=format:'%H' -n 1)
    else
      commit_hash=$1
    fi
    commit_url="$commit_url/$commit_hash"
}

# Opens the specified (or last commit) in the browser
browse_commit_open () {
    browse_commit_init
    if [ $all_good != "yes" ]; then 
        all_good="yes"
        return 
    fi
    echo "Opening $commit_url"
    `open $commit_url`
}

#copies the url of the specified commit into the clipboard
browse_commit_copy () {
    browse_commit_init
    if [ $all_good != "yes" ]; then 
        all_good="yes"
        return 
    fi
    `echo $commit_url | pbcopy`
    echo "$commit_url was copied to your clipboard"
}

alias brc='browse_commit_open'
alias cpc='browse_commit_copy'
