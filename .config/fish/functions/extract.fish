function extract --description "extract the archive files"
	if test "$argv" -lt 1
		echo "No arguman provided"
	end
    for file in $argv
	  if test -e $file
	    switch $file
	      case "*.cbt" "*.tar.bz2" "*.tar.gz" "*.tar.xz" "*.tbz2" "*.tgz" "*.txz" "*.tar" 
		    tar xvf $file
		  case "*.lzma"
		    unlzma $file
		  case "*.bz2"
		    bunzip2 $file
		  case "*.cbr" "*.rar"
		    unrar x -ad $file
		  case "*.gz"
		    gunzip  $file
          case  "*.cbz" "*.epub" "*.zip"
		    unzip  $file
          case  "*.z"
		    uncompress $file
		  case "*.7z" "*.arj" "*.cab" "*.cb7" "*.chm" "*.deb" "*.dmg" "*.iso" "*.lzh" "*.msi" "*.pkg" "*.rpm" "*.udf" "*.wim" "*.xar"
            7z x $file
		  case "*.xz"
		    unxz $file
		  case "*.exe"
		    cabextract $file
		end
      end
   end
end
