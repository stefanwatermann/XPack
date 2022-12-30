# XPack Server 

This component can be used to host a XPack Repository on a server as an alternative to host the repository on a local (shared) folder.

The service runs on tcp port 9902 (if not changed).

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

To use the server repository instead of a local (shared) folder simply enter the base url of the server repository into the preferences dialog of the XPack client.

<img width="595" alt="image" src="https://user-images.githubusercontent.com/73022584/201533119-8148fe6d-8920-464d-af2d-8935431f8c6f.png">
