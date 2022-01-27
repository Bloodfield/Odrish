#	Odrish	#

Odrish a group of easy to use Bash scripts for Odrive client.
The aim is to have the program running  from the command line, fast and easy to use.
There are many other repositories out there that give more functions, or more straight forward implementation.
However, this are the ones I use as base.

With this scripts you will be able to execute the next processes:

Administrative processes:
+ sart the agent 
+ shutdown the agent
+ view your status

Update
+ sync data (also recursively)
+ unsync a file or folder
+ refresh files (also recursively)

Surf trough the files
+ rm and sync files 
+ cd through files whith syncs
+ mv files

##	Requirements

+	curl	:	`sudo apt-get install curl` in case it isn't installed
+	DIR		:	An existing mounting directory, example: ~/Shared/odrive
+	Python3	:	Installed

##	Installation 

###	Download
`git clone https://github.com/Bloodfield/Odrish.git`

### Install
Go to the repository folder, the run:

```
./Install.sh I [ P | B ]
```

If you want to use the python client, use `P`

If you want to use the bash client, use `B`

You might need to add executable permission first

```
chmod +x Install.sh 
```

The mounting directory is optional, in case you want to mount it later

### You can use odr STANDALONE as well

Run:
```
${ODRPATH}/odr [ARGS]
```

You can also create an alias on your *./bashrc* file replacing `ODRPATH` whith the path of the odr file
```
alias odr='${ODRPATH}/odrive'
```

###	Uninstall

Go to the repository folder, the run:

```
./Install.sh U [ | A]
```
If you want to install odrive as well, use the option `A` 

##	Commands

###		help

Gives help menu
Does not use arguments

```
odr help
```


###		init

Initializes the client
Does not use arguments


```
$ odr init
```


###		shutdown

Closes the client
Does not use arguments
```
odr shutdown
```
###		refresh
Makes represh in the file or folder
-r
Recursive refreshinf in case of folders
File, folder or placeholder
```
$ odr refresh -[r | s] [file | folder | placeholder]
```
###		sync
sync placeholder
-r
Recursive sync in case of a folder
placeholder or folder
```
odr sync [-r] [placeholder | folder ]
```
###		status
Shows the general status
Does not use arguments
```
odr status
```
###		cd
syncs a folder an the folders that first folders it contains
folder
```
odr cd [folder]
```
###		rm
deletes a file or folder, both locally and in the cloud
file or folder
```
odr rm [file | folder]
```

#	References

+	[Odrive-cli](https://docs.odrive.com/docs/odrive-cli) documentation.
+	[General](https://docs.odrive.com/docs/odrive-sync-agent#sync-agent-and-cli-overview?utm_source=medium-cli-magic&utm_medium=blog&utm_campaign=general) documentation
+	[Sync CLIent Magic](https://medium.odrive.com/sync-client-magic-602d858731de) Blog post


##	TODO

+ change comments to english
+ cd to a .cloudf

