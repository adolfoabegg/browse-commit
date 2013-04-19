browse-commit
---

_browse-commit_ is an [oh-my-zsh] plugin that lets you open any commit in your browser from the command line.

**Setup**

 - clone browse-commit in ~/.oh-my-zsh/custom/plugins
 - enable this pluging by adding _browse-commit_ to the plugins list in your ~/.zshrc file
 - cd into/your/project
 - git config --add browse-commit.url <code>https://github.com/[your-username-here]/[your-project-here]/commit</code>

**Example**
<pre>
$> git clone git://github.com/adolfoabegg/browse-commit.git ~/.oh-my-zsh/custom/plugins/browse-commit
$> vim ~/.zshrc
   // add browse-commit to the list of enabled plugins
   plugins=(git osx browse-commit)
$> cd ~/code/browse-commit
$> git config --add browse-commit.url https://github.com/adolfoabegg/browse-commit/commit/
$> brc 9893058ccd2c5384748a10e491181a0d9955b80d

That will open 
https://github.com/adolfoabegg/browse-commit/commit/9893058ccd2c5384748a10e491181a0d9955b80d 
in my default browser.
</pre>

**Usage**

 - **brc** opens the last commit in the default browser
 - **brc _bc7b10a_** opens a specific commit in the defaul browser
 - **cpc** copies the url of the last commit to the clipboard
 - **cpc _bc7b10a_** copies the url of a specific commit to the clipboard

**Author**

[Adolfo Abegg]


  [oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
  [Adolfo Abegg]: https://twitter.com/adolfoabegg
