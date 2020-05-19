    #Download Report Viewer executable.
    $url1 = "http://download.microsoft.com/download/E/A/1/EA1BF9E8-D164-4354-8959-F96843DD8F46/ReportViewer.exe" 
    $path1 = "C:\temp\ReportViewer.exe" 
        
    if(!(Split-Path -parent $path1) -or !(Test-Path -pathType Container (Split-Path -parent $path1))) { 
      $path1 = Join-Path $pwd1 (Split-Path -leaf $path1) 
    } 
    "Downloading [$url1]`nSaving at [$path1]" 
    $client = new-object System.Net.WebClient 
    $client.DownloadFile($url1, $path1)   
    $path1

    
    #Download SQLSysClrTypes msi.
    $url2 = "https://download.microsoft.com/download/1/3/0/13089488-91FC-4E22-AD68-5BE58BD5C014/ENU/x64/SQLSysClrTypes.msi" 
    $path2 = "C:\temp\SQLSysClrTypes.msi" 
        
    if(!(Split-Path -parent $path2) -or !(Test-Path -pathType Container (Split-Path -parent $path2))) { 
      $path2 = Join-Path $pwd2 (Split-Path -leaf $path2) 
    } 
    "Downloading [$url2]`nSaving at [$path2]" 
    $client = new-object System.Net.WebClient 
    $client.DownloadFile($url2, $path2)   
    $path2