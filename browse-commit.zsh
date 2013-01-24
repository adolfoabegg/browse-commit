# To use: configure the base URL of your [github|bitbucket] repo
#         Github: https://github.com/adolfoabegg/commit-url/commit
#         Bitbucket: https://bitbucket.org/adol/commit-url/commit
#
# Setup: cd to/your/project
#        git config --add browse.url http://repor.url/commits
#
# Usage: bc           # opens the last commit in the default browser
#        bc bc7b10a   # Opens the specific commit in the defaul browser
#
browse_commit () {
  commit_url=$(git config --get commit.url);
  if [[ "x$commit_url" != "x" ]]; then
    if [ -z "$1" ]; then
      echo "Browsing last commit"
      commit_hash=$(git log --pretty=format:'%H' -n 1)
      `open $commit_url/$commit_hash`
    else
      echo "Browsing $1"
      `open $commit_url/$1`
    fi
  else:
    echo "Please configure the base commits url: git config --add browse.url http://yourrepo.url/commits"
  fi

}

browse_commit_copy () {

}

alias brc='browse_commit'
alias cpc='browse_commit_copy'
