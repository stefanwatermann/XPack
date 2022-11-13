#tag Interface
Protected Interface PackageSourceInterface
	#tag Method, Flags = &h0
		Function ReadPackage(guid as string) As RepositoryPackage
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackageCode(guid as string) As MemoryBlock
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackages() As RepositoryPackage()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePackage(guid as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SavePackage(package as RepositoryPackage, raw as MemoryBlock = nil)
		  
		End Sub
	#tag EndMethod


End Interface
#tag EndInterface
