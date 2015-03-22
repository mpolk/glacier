# glacier
Yet another tool for manipulating with AWS Glacier.

It is a bash-script and it uses SQLite for maintaining the local DB keeping track of the archives 
uploaded to the Glacier.

Probably it is somewhat and somehow better then other four hundreed same-purpose tools living on the GitHub.
I even have a strong hope this this is true, but I am not sure. Everyone can try (this one and other 400) and decide.

Currently a single Glacier vault is supported, which seems to be enough for the average use. But all the fields necessary for the mutiple vaults support present in the DB and and such a support can be added relatively easy.

This software is under development now. It is fully working but it is not documented yet nor internationalized. While the lack of the documentation is not a big problem (since the script has built-in help and its usage is evident enough), the lack of the internalization seems to be more serious problem. Initially all messages and comments were written in Russian, so I don't think that anybody not being Russian-speaking would be able to use this software int its current state. But I hope I will the gettext support in the near future.
