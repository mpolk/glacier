# glacier
Yet another tool for manipulating with AWS Glacier.

It is a bash-script and it uses SQLite for maintaining the local DB keeping track of the archives 
uploaded to the Glacier.

Probably it is somewhat and somehow better then other four hundreed same-purpose tools living on the GitHub.
I even have a strong hope this this is true, but I am not sure. Everyone can try (this one and other 400) and decide.

Currently a single Glacier vault is supported, which seems to be enough for the average use. But all the fields necessary for the mutiple vaults support present in the DB and and such a support can be added relatively easy.

This software is under development now. It is fully working but it is not documented yet. Until I write more serious docimentation, one may use script's built-in help. Also its usage is evident enough.
