class vtools_install {

	if $kernel == "Linux" {
	   
	   include vtools_install::linux
	}

	elsif $kernel == windows {

	   include vtools_install::windows	
	}

	else {
	
	   notice("The Kernel is Not Supported!!!")
	}

}


