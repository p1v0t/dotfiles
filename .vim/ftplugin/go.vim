
fun! GoFmt()
	call system('go fmt %')
endf
command GoFmt call GoFmt()


fun! GoRun()
	call system('go run %')
endf
command GoRun call GoRun()

fun! GoBuild()
	call system('go build')
endf
command GoBuild call GoBuild()
