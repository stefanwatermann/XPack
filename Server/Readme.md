# XPack Server 

This component can be used to host a XPack Repository on a server as an alternative to host the repository on a local (shared) folder.

## Windows
To run the XPack server on a windows machine just register the component as a service in windows.

Hint: please adjust the binpath= according to your system (spaces after '=' have to stay!)

`sc create XPackApi type= own start= auto binpath= E:\\Software\\xpackapi\xpackapi.exe`

## Config file

Use the 'xpackapi.config' file to configure the path to the repository folder on your server.

```json
{
	"RepositoryFolderPath": "/Volumes/Software/XojoPackRepository"
}
```

## Point XPack client to a server repository

To use the server repository instead of a local (shared) folder simply enter the base url of teh server repository into the preferences dialog of the XPack client.

