# XPack

A package manager software for XOJO modules. 

<hr/>

This project aims to create a software solution which allows to establish a software package repository for XOJO based components (mainly XOJO modules).

PLEASE NOTE: THIS PROJECT IS IN EARLY DEVELOPMENT STAGE AND SHALL NOT BE USED IN A PRODUCTION LIKE ENVIRONMENT!

## Concept

This solution can be used to store/restore XOJO components (modules) into/from a centraliazed repository. Components can be "imported" into existing XOJO projects from the central repository by **Copy&Paste**. By using this approach the XOJO IDE will integrate the component correctly and the project or IDE does not need to be reloaded or restarted. The package manager stores the XOJO module code in form of the binary clipboard format used by the XOJO IDE itself. Since this format is not official documented, this approach may be changed on a later release.  

A XPack repository component is typically a regular XOJO module. To make it visible to the package manager client (XPack) at least three attributes have to be set on the module. 

![grafik](https://user-images.githubusercontent.com/73022584/199735219-fc5d4a2c-23a1-4ca1-bf44-a60149d2deb4.png)

Attribute names have to start with an at-sign (@), all attribute values have to be strings (enclosed by double quotes).

| Attribute Name | Mandatory | Usage |
| --- | --- | --- |
| @Version | yes | Used to detect newer versions of the component by comparing repository with current project. |
| @Guid | yes | Global unique identifier for this component. New GUIDs can be created by the package manager client. |
| @Copyright | yes | Copyright of the author/owner of this component. |
| @Description | no | Describes the purpose of the component. |
| @Author | no | Developer name. |
| @Category | no | Can be used to categorize components. |
| @Depends | no | A comma-separated list of component GUIDs related to this component in some way.|


Please note that attribute values can be set (or changed) within the XOJO IDE only and not by the package manager client later on.

## Conditions and Limitation

The package manager client is implemented as a standanlone desktop software and is not integrated into the XOJO IDE in any way. 

Because of the XOJO IDE it is not possible to automatically import components to a project. Therefor the Copy&Paste approach have to be used and the XPack client cannot automatically update existing components on a project.

A component have to be a XOJO module. Other project items (Folder, Class, Window, etc.) can be included into the module but shall not be used as a component directly.

The component repository has to be a folder on a (shared) drive to which the computer has access to. A public server component is not available so far.

## Current State

### Client

The client app allows to use a **locally hosted file-based repository** or a **remote repository hosted on a server** running the XPackApi server web-app. The app can be used to scan an exsiting local XOJO project folder for modules that are avaialble at the repository and checks the version of the project module against the repository version. It then allows to update modules to a newer version by using the Copy&Paste approach.

![grafik](https://user-images.githubusercontent.com/73022584/199739505-b2a17389-eac0-47ab-b40a-d94571fdd998.png)


### Server
A server app is currently in early development stage. It is intended to be hosted on a private local network and **NOT public on the internet**. There is curently NO security (logon, api-key, etc.) implemented. 

![image](https://user-images.githubusercontent.com/73022584/201532859-6f7cd897-b721-437b-851d-d3c82ecc2ad8.png)

