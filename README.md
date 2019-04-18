#	Odrish	#

Odrish a group of easy to use Bash scripts for Odrive client.
The aim is to have the program running 

Whit this scripts you will be able to execute the next processes:

+ sync data (also recursively)
+ refresh files (also recursively)
+ sart the agent 
+ shutdown the agent
+ remove files locally and in the cloud at the same time
+ view your status
+ surf accross folders while refreshing

##	Requirements

+	Odrive installed
+	A working mounted folder

All is explained in the [Odrive-cli](https://docs.odrive.com/docs/odrive-cli) documentation.

Once you have the folder, you can use the `odr` as standalone, or you can send it to a bin folder in order to use it as a inline command.

### Standalone
```Bash
$ ./$DIR/odr [command] [args] [file]
```

### inline command
```Bash
$ odr [command] [args] [file]
```

### Extra option
You can also create en alias on your *./bashrc* file replacing `DIR` whith the path of the odr file
```
$ echo 'alias odr="[DIR]/odr"' >> ~/bashrc
```
After that, you can use it as inline command

##	Commands

`ord` allows you to manage your local data in the Odrive-Cli files
```
	Developer: Bloodfield
	In each of the following Commands, it is explained the operation, arguments and use of them:
		help
			Gives help menu
			Does not use arguments
			$ odr help 
		init
			Initializes the client
			Does not use arguments
			$ odr init
		shutdown
			Closes the client
			Does not use arguments
			$ odr shutdown
		refresh
			Makes represh in the file or folder
			-r
				Recursive refreshinf in case of folders
			File, folder or placeholder
			$ odr refresh [-r] [file | folder | placeholder]
		sync
			sync placeholder
			-r
				Recursive sync in case of a folder
			placeholder or folder
			$ odr sync [-r] [placeholder | folder ]
		status
			Shows the general status
			Does not use arguments
			$ odr status
		cd
			syncs a folder an the folders that first folders it contains
			folder
			$ odr cd [folder]
		rm
			deletes a file or folder, both locally and in the cloud
			file or folder
			$ odr rm [file | folder]
	
```
