$directory =$(Get-ChildItem '*')

	Foreach ($item in $directory) {
	Get-ACL $item
	}cd\
doc