#tag Module
 Attributes ( Version = 1.0, Copyright = "watermann-it.de" ) Protected Module File
	#tag Method, Flags = &h0
		Sub AppendText(f as FolderItem, data as string)
		  WriteAllText(f, data, Encodings.UTF8, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendText(f as FolderItem, data as string, enc as TextEncoding)
		  WriteAllText(f, data, enc, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendText(filePath as string, data as string)
		  Var f As FolderItem = New FolderItem(filePath, Folderitem.PathModes.Native)
		  WriteAllText(f, data, Encodings.UTF8, True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete(filePath as string)
		  Var f As FolderItem = New FolderItem(filePath, Folderitem.PathModes.Native)
		  f.Remove
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526561647320616C6C207465787420646174612066726F6D2061205554463820656E636F6465642066696C65
		Function ReadAllText(f as FolderItem) As string
		  Return ReadAllText(f, Encodings.UTF8)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadAllText(f as FolderItem, enc as TextEncoding) As string
		  If enc = Nil Then
		    enc = encodings.UTF8
		  End
		  
		  Var data As String
		  
		  Var t As TextInputStream = TextInputStream.Open(f)
		  t.Encoding = enc
		  data = t.ReadAll
		  t.Close
		  
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadAllText(filePath as string) As string
		  Var f As FolderItem = New FolderItem(filePath, Folderitem.PathModes.Native)
		  Return ReadAllText(f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 777269746520616C6C207465787420746F2066696C65207573696E67205554463820656E636F64696E67
		Sub WriteAllText(f as folderitem, data as string)
		  WriteAllText(f, data, Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteAllText(f as folderitem, data as string, enc as TextEncoding, append as Boolean = false)
		  If enc = Nil Then
		    enc = encodings.UTF8
		  End
		  
		  Var t As TextOutputStream 
		  
		  If append Then
		    t = TextOutputStream.Open(f)
		  Else
		    t = TextOutputStream.Create(f)
		  End
		  
		  t.Encoding = enc
		  t.Write(data)
		  t.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteAllText(filePath as string, data as string)
		  Var f As FolderItem = New FolderItem(filePath, Folderitem.PathModes.Native)
		  WriteAllText(f, data)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteTemp(data as string) As FolderItem
		  Var f As FolderItem = FolderItem.TemporaryFile
		  WriteAllText(f, data)
		  return f
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
