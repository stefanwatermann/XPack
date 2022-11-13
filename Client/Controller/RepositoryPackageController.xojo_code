#tag Class
Protected Class RepositoryPackageController
	#tag Method, Flags = &h0
		Sub Constructor(packageSource as PackageSourceInterface)
		  self.PackageSource = packageSource
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreatePackage(raw as MemoryBlock) As RepositoryPackage
		  // add a new package to the repository based from raw XOJO clipboard data
		  
		  Var data As String = raw
		  
		  // ensure data is a XOJO code
		  If Not data.BeginsWith("RbBF") Then
		    Raise New RuntimeException("No valid XOJO Module", 9001)
		  End
		  
		  Var package As RepositoryPackage = zCreatePackage(raw)
		  
		  Return package
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Export(guid as string, f as FolderItem)
		  Var raw As MemoryBlock = self.PackageSource.ReadPackageCode(guid)
		  Var t As BinaryStream = BinaryStream.Create(f, True)
		  t.Write(raw)
		  t.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPackage(guid as string) As RepositoryPackage
		  // Part of the PackageSourceInterface interface.
		  
		  For Each package As RepositoryPackage In Self.Packages
		    If package.Guid = guid Then
		      Return package
		    End
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Import(f as FolderItem) As MemoryBlock
		  Var t As BinaryStream = BinaryStream.Open(f, False)
		  Var raw As MemoryBlock = t.Read(f.Length)
		  t.Close
		  
		  return raw
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadProjectPackages(projectFolder as Folderitem, projectPackages() as RepositoryPackage)
		  // get packages used by a given XOJO (text-file) project
		  
		  For Each item As FolderItem In projectFolder.Children
		    
		    If item.IsFolder Then
		      ReadProjectPackages(item, projectPackages)
		    End
		    
		    If item.Name.EndsWith(".xojo_code") Then
		      Var content As String = File.ReadAllText(item)
		      
		      If content.IndexOf("""@Guid"" = ") > 0 Then
		        Var projektPackage As RepositoryPackage = zCreatePackage(content)
		        
		        // found packages with a guid < 30 or > 36 might not be a valid package
		        If projektPackage.Guid.Length > 30 And projektPackage.Guid.Length < 37 Then
		          // package name was taken from (clipboard) module header and therefore here empty
		          projektPackage.Name = item.Name
		          projectPackages.Add(projektPackage)
		        End
		      End
		    End
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function zCreatePackage(raw as MemoryBlock) As RepositoryPackage
		  // create a new RepositoryPackage from XOJO data
		  
		  Var parser As New XojoModuleParser(raw)
		  
		  Var package As New RepositoryPackage
		  
		  package.Name = parser.ModuleName
		  package.Guid = parser.AttribGuid
		  package.CreatedBy = parser.AttribAuthor
		  package.CreatedAt = DateTime.Now
		  package.Copyright = parser.AttribCopyright
		  package.RawDependencies = parser.AttribDepends
		  package.Version = parser.AttribVersion
		  package.Description = parser.AttribDescription
		  package.Category = parser.AttribCategory
		  package.PackageUrl = parser.AttribPackageUrl
		  
		  Return package
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Packages() As RepositoryPackage
	#tag EndProperty

	#tag Property, Flags = &h0
		PackageSource As PackageSourceInterface
	#tag EndProperty


	#tag Constant, Name = ClipXojoClass, Type = String, Dynamic = False, Default = \"CbCl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ClipXojoModule, Type = String, Dynamic = False, Default = \"CbMt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPackageCodeFileExt, Type = String, Dynamic = False, Default = \".code", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRepositoryPath, Type = String, Dynamic = False, Default = \"/Users/stefan/Projekte/Repository", Scope = Private
	#tag EndConstant


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
