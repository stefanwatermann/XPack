#tag DesktopWindow
Begin DesktopWindow WindowMain
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   550
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1399736319
   MenuBarVisible  =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   Resizeable      =   True
   Title           =   "XOJO Package Manager (v%1)"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin Timer ClipboardObserver
      Index           =   -2147483648
      LockedInPosition=   True
      Period          =   1000
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin DesktopTabPanel TabPanel1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   512
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Project\rRepository"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin DesktopButton btnCreateGuid
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Guid"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   "Create new Guid to be used by Attribute 'packGuid'."
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin DesktopButton btnEditPackage
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Show"
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   445
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   "Show selected package from repository"
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin DesktopButton btnDeletePackage
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Remove"
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   520
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   "Remove selected package from repository"
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin DesktopLabel lbPackages
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Packages"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin DesktopButton btnPutModuleOnClip
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Copy to Clip"
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   135
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   "Put selected package on clipboard to be pasted into a XOJO project."
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin DesktopButton btnReadModuleFromClip
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "New from Clip ..."
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   240
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   "Clipboard contains a XOJO Module that can be read as a new package."
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin DesktopListBox listRepoPackages
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   False
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   5
         ColumnWidths    =   "0, *, 80, 160, 150"
         DefaultRowHeight=   -1
         DropIndicatorVisible=   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLineStyle   =   2
         HasBorder       =   False
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   337
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Guid	Name	Version	Owner	CreateAt"
         Italic          =   False
         Left            =   10
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   True
         RowSelectionType=   0
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   80
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   580
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin DesktopTextArea tbPackageDescription
         AllowAutoDeactivate=   True
         AllowFocusRing  =   False
         AllowSpellChecking=   True
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   False
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   85
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   10
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   2
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   "Package Description"
         Top             =   427
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   1
         ValidationMask  =   ""
         Visible         =   True
         Width           =   478
      End
      Begin DesktopListBox listProjectPackages
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   False
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   6
         ColumnWidths    =   "0, *, 70, 130, 140, 55"
         DefaultRowHeight=   -1
         DropIndicatorVisible=   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLineStyle   =   2
         HasBorder       =   False
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   337
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Guid	Name	Version	Owner	CreateAt	Update"
         Italic          =   False
         Left            =   10
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   True
         RowSelectionType=   0
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   80
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   580
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin DesktopLabel Label1
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   10
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Project Root"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   49
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin DesktopTextField tbProjectRoot
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   100
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   True
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   49
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   375
      End
      Begin DesktopButton btnScanProjectRoot
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Scan"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   520
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   "Find packages on referenced XOJO project."
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin DesktopButton btnSelectProjectRoot
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "..."
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   480
         LockBottom      =   False
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   "Select root path of a XOJO project."
         Top             =   48
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   30
      End
      Begin DesktopTextArea tbPackageDescriptionProject
         AllowAutoDeactivate=   True
         AllowFocusRing  =   False
         AllowSpellChecking=   True
         AllowStyledText =   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   False
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   85
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   10
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   2
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   "Package Description"
         Top             =   427
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   1
         ValidationMask  =   ""
         Visible         =   True
         Width           =   478
      End
      Begin ControlsLib.ImageBox ImageBox1
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   False
         AllowTabs       =   False
         Backdrop        =   0
         BorderColor     =   &c80808000
         BorderRadius    =   5
         BorderWidth     =   0
         Enabled         =   True
         Height          =   85
         Image           =   787865599
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   500
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   429
         Visible         =   True
         Width           =   85
      End
      Begin ControlsLib.ImageBox ImageBox2
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   False
         AllowTabs       =   False
         Backdrop        =   0
         BorderColor     =   &c80808000
         BorderRadius    =   5
         BorderWidth     =   0
         Enabled         =   True
         Height          =   85
         Image           =   787865599
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   500
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   429
         Visible         =   True
         Width           =   85
      End
   End
   Begin DesktopLabel lbStatusText
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   25
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Welcome to the XOJO Package Manager"
      TextAlignment   =   1
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   522
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin DesktopSeparator Separator1
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   False
      Enabled         =   True
      Height          =   2
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Visible         =   True
      Width           =   600
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Self.ClipboardObserver.Enabled = True
		  
		  Self.Title = Self.Title.Replace("%1", App.VersionString)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileAbout() As Boolean Handles FileAbout.Action
			ShowAboutDialog()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOptions() As Boolean Handles FileOptions.Action
			Self.ShowOptionsWindow
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpXojoPackontheInternet() As Boolean Handles HelpXojoPackontheInternet.Action
			System.GoToUrl(kXojoPackGithubUrl)
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.PackageController = New RepositoryPackageController(app.Config.RepositoryRootFolder)
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EditPackage(package as RepositoryPackage, isNew as Boolean)
		  Var dlg As New WindowPackage(package, isNew)
		  dlg.ShowModal
		  
		  If dlg.OkClicked Then
		    Self.PackageController.Save(package)
		    Self.ReadPackages
		    SetStatusText("Package saved.")
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PutModuleOnClip(guid as string)
		  Var a As MemoryBlock = Self.PackageController.GetPackageCode(guid)
		  
		  Var c As New Clipboard
		  c.RawData(RepositoryPackageController.ClipXojoModule) = a
		  c.Close
		  
		  SetStatusText("Code copied to clipboard, please paste into XOJO now.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PutNewGuidOnClip()
		  Var guid As String = StringUtils.NewGuid
		  
		  Var c As New Clipboard
		  c.Text = guid
		  c.Close
		  
		  SetStatusText("New Guid '" + guid + "' sent to clipboard.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadPackages()
		  Self.listRepoPackages.RemoveAllRows
		  
		  Self.PackageController.ReadPackages
		  
		  For Each package As RepositoryPackage In Self.PackageController.Packages
		    
		    Var cells() As String
		    cells.Add(package.Guid)
		    cells.Add(package.Name)
		    cells.Add(Str(package.Version))
		    cells.Add(package.CreatedBy)
		    If package.CreatedAt <> Nil Then cells.Add(package.CreatedAt.SQLDateTime) Else cells.Add("")
		    
		    Self.listRepoPackages.AddRow(cells)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStatusText(t as string)
		  self.lbStatusText.Text = t
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowAboutDialog()
		  MessageBox( _
		  "*** XOJOPack ***" + EndOfLine + _
		  "A Package-Manager for XOJO Modules." + EndOfLine + _
		  "(c) 2022 by Stefan Watermann, Germany")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowOptionsWindow()
		  Var dlg As New WindowOption
		  dlg.ShowModal
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private PackageController As RepositoryPackageController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectedPackageRepo As RepositoryPackage
	#tag EndProperty


	#tag Constant, Name = kListCellPackageUpdateColor, Type = Color, Dynamic = False, Default = \"&cB8DCB400", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kListRowAlternateColor, Type = Color, Dynamic = False, Default = \"&cF2F2F400", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kXojoPackGithubUrl, Type = String, Dynamic = False, Default = \"https://github.com/stefanwatermann/XojoPack", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events ClipboardObserver
	#tag Event
		Sub Action()
		  Var c As New Clipboard
		  
		  btnReadModuleFromClip.Enabled = c.RawDataAvailable(RepositoryPackageController.ClipXojoModule) Or _
		  c.RawDataAvailable(RepositoryPackageController.ClipXojoClass)
		  
		  c.Close
		  
		  If btnReadModuleFromClip.Enabled Then
		    SetStatusText("XOJO code available to be added as package.")
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCreateGuid
	#tag Event
		Sub Pressed()
		  PutNewGuidOnClip()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEditPackage
	#tag Event
		Sub Pressed()
		  EditPackage(Self.SelectedPackageRepo, true)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeletePackage
	#tag Event
		Sub Pressed()
		  Var d As New MessageDialog
		  d.Icon = MessageDialog.GraphicCaution
		  d.ActionButton.Caption = "Remove"
		  d.CancelButton.Visible = True
		  d.Message = "Remove selected package from repository permanently?"
		  d.Explanation = "Please note package files will be renamed as '*_removed'."
		  
		  Var b As MessageDialogButton = d.ShowModal
		  
		  If b = d.ActionButton Then
		    Self.PackageController.RemovePackage(SelectedPackageRepo.Guid)
		    Self.ReadPackages
		    SetStatusText("Package removed.")
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPutModuleOnClip
	#tag Event
		Sub Pressed()
		  PutModuleOnClip(SelectedPackageRepo.Guid)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnReadModuleFromClip
	#tag Event
		Sub Pressed()
		  Var c As New Clipboard
		  
		  Var raw As MemoryBlock
		  
		  If c.RawDataAvailable(RepositoryPackageController.ClipXojoModule) Then
		    raw = c.RawData(RepositoryPackageController.ClipXojoModule)
		  ElseIf c.RawDataAvailable(RepositoryPackageController.ClipXojoClass) Then
		    raw = c.RawData(RepositoryPackageController.ClipXojoClass)
		  End
		  
		  If raw = Nil Then
		    MessageBox("Data on clipboard is not supported.")
		    Return
		  End
		  
		  Var package As RepositoryPackage = Self.PackageController.CreatePackage(raw)
		  
		  Var dlg As New WindowPackage(package, True)
		  dlg.ShowModal
		  
		  If dlg.OkClicked Then
		    Self.PackageController.Save(package, raw)
		    Self.ReadPackages
		    SetStatusText("Package created.")
		  End
		  
		  c.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events listRepoPackages
	#tag Event
		Sub Opening()
		  me.DefaultRowHeight = 22
		  ReadPackages()
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  Var hasSelection As Boolean = Me.SelectedRowIndex >= 0
		  
		  If hasSelection Then
		    Self.SelectedPackageRepo = Self.PackageController.GetPackage(Me.SelectedRowValue)
		    tbPackageDescription.Text = Self.SelectedPackageRepo.Description
		    SetStatusText("Guid of selected package: " + Self.SelectedPackageRepo.Guid)
		  End
		  
		  btnDeletePackage.Enabled = hasSelection
		  btnEditPackage.Enabled = hasSelection
		  btnPutModuleOnClip.Enabled = hasSelection
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  If Me.SelectedRowIndex >= 0 Then
		    
		    Var mnuCopy As New DesktopMenuItem
		    mnuCopy.Text = "Copy package to clipboard"
		    mnuCopy.Name = "mnuCopy"
		    base.AddMenu(mnuCopy)
		    
		    base.AddMenu(New DesktopMenuItem(DesktopMenuItem.TextSeparator))
		    
		    Var mnuExport As New DesktopMenuItem
		    mnuExport.Text = "Export Package..."
		    mnuExport.Name = "mnuExport"
		    base.AddMenu(mnuExport)
		    
		    Var mnuImport As New DesktopMenuItem
		    mnuImport.Text = "Import Package..."
		    mnuImport.Name = "mnuImport"
		    base.AddMenu(mnuImport)
		    
		    base.AddMenu(New DesktopMenuItem(DesktopMenuItem.TextSeparator))
		    
		    Var mnuShow As New DesktopMenuItem
		    mnuShow.Text = "Show attributes..."
		    mnuShow.Name = "mnuShow"
		    base.AddMenu(mnuShow)
		    
		  End
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Select Case selectedItem.Name
		    
		  Case "mnuCopy"
		    PutModuleOnClip(SelectedPackageRepo.Guid)
		    Return True
		    
		  Case "mnuShow"
		    EditPackage(Self.SelectedPackageRepo, false)
		    Return True
		    
		  Case "mnuExport"
		    Return True
		    
		  Case "mnuImport"
		    Return True
		    
		  End
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row Mod 2 = 0 Then
		    g.DrawingColor = kListRowAlternateColor
		    g.FillRectangle(0, 0, g.Width, g.Height)
		  End
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events listProjectPackages
	#tag Event
		Sub Opening()
		  me.DefaultRowHeight = 22
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  Var hasSelection As Boolean = Me.SelectedRowIndex >= 0
		  
		  If hasSelection Then
		    Var package As RepositoryPackage = Me.RowTagAt(Me.SelectedRowIndex)
		    tbPackageDescriptionProject.Text = package.Description
		    SetStatusText("Guid of selected package: " + package.Guid)
		  End
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  If Me.SelectedRowIndex >= 0 Then
		    Var mnuCopy As New DesktopMenuItem
		    mnuCopy.Text = "Copy updated Repository Package to clipboard"
		    mnuCopy.Name = "mnuCopy"
		    mnuCopy.Enabled = me.CellTextAt(me.SelectedRowIndex, 5) = "yes"
		    base.AddMenu(mnuCopy)
		    
		    Var mnuShow As New DesktopMenuItem
		    mnuShow.Text = "Show attributes..."
		    mnuShow.Name = "mnuShow"
		    base.AddMenu(mnuShow)
		  end
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Var hasSelection As Boolean = Me.SelectedRowIndex >= 0
		  
		  If hasSelection Then
		    Var package As RepositoryPackage = Me.RowTagAt(Me.SelectedRowIndex)
		    
		    Select Case selectedItem.Name
		      
		    Case "mnuCopy"
		      PutModuleOnClip(package.Guid)
		      Return True
		      
		    Case "mnuShow"
		      EditPackage(package, false)
		      Return True
		      
		    End
		    
		  End
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row Mod 2 = 0 Then
		    g.DrawingColor = kListRowAlternateColor
		    g.FillRectangle(0, 0, g.Width, g.Height)
		  End
		  
		  If column = 5 Then
		    If Me.RowCount > row Then
		      If Me.CellTextAt(row, 5) = "yes" Then
		        g.DrawingColor = kListCellPackageUpdateColor
		        g.FillRectangle(0, 0, g.Width, g.Height)
		      End
		    End
		  End
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tbProjectRoot
	#tag Event
		Sub Opening()
		  me.Text = app.Config.LastXojoProject
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnScanProjectRoot
	#tag Event
		Sub Pressed()
		  Var f As New FolderItem(tbProjectRoot.Text)
		  
		  Var projectPackages() As RepositoryPackage
		  
		  Self.PackageController.ReadProjectPackages(f, projectPackages)
		  
		  Self.listProjectPackages.RemoveAllRows
		  
		  For Each projectPackage As RepositoryPackage In projectPackages
		    
		    // try get correspondign repo-package
		    Var repoPackage As RepositoryPackage = Self.PackageController.GetPackage(projectPackage.Guid)
		    
		    Var cells() As String
		    cells.Add(projectPackage.Guid)
		    cells.Add(projectPackage.Name.Replace(".xojo_code", ""))
		    cells.Add(Str(projectPackage.Version))
		    cells.Add(projectPackage.CreatedBy)
		    If projectPackage.CreatedAt <> Nil Then cells.Add(projectPackage.CreatedAt.SQLDateTime) Else cells.Add("")
		    
		    If repoPackage <> Nil And repoPackage.Version <> projectPackage.Version Then
		      cells.Add("yes")
		    Else
		      cells.Add("no")
		    End
		    
		    Self.listProjectPackages.AddRow(cells)
		    Self.listProjectPackages.RowTagAt(Self.listProjectPackages.LastAddedRowIndex) = projectPackage
		    
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSelectProjectRoot
	#tag Event
		Sub Pressed()
		  Var t As New FolderItem(tbProjectRoot.Text)
		  
		  Var dlg As New SelectFolderDialog
		  dlg.ActionButtonCaption = "Select"
		  dlg.Title = "Select Project Rootfolder"
		  dlg.PromptText = "Select Project Rootfolder"
		  
		  If t <> Nil And t.Parent.Exists Then
		    dlg.InitialFolder = t
		  Else
		    dlg.InitialFolder = SpecialFolder.Documents
		  End
		  
		  Var f As FolderItem
		  f = dlg.ShowModal
		  If f <> Nil Then
		    tbProjectRoot.Text = f.NativePath
		    app.Config.LastXojoProject = tbProjectRoot.Text
		    app.Config.Save
		  Else
		    // User cancelled
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Windows Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
