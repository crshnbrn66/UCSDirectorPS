<# 
.NAME
    Set-UCSDConnectionParams
     
.SYNOPSIS
    Short description
     
     
.SYNTAX
    Set-UCSDConnectionParams -restkey 'myrestkeyishereiknowitis' -directorServer 'mydirectorserver.mycompany.com'
    This will set the parameters for the restkey and the director server you are connecting to.
     
.DESCRIPTION
    If you pass no variables then the function will ask you for your keys and set the global params for them.
     
 
.RELATED LINKS
 
.REMARKS
    To see the examples, type: "get-help Set-UCSDConnectionParams -examples".
    For more information, type: "get-help Set-UCSDConnectionParams -detailed".
    For technical information, type: "get-help Set-UCSDConnectionParams -full".
 
 
#> 
function Set-UCSDConnectionParams 
{
param($restkey, $directorServer)

    if($restkey -and $directorServer)
    {
        $global:restKey = $restkey
        $global:DirectorServer = $directorServer
    }
    else
    {
        $global:restKey =Read-Host 'Enter UCS Director API  Key'   
        $global:DirectorServer = REad-host 'Enter UCS Director Server(yourServer.yourCompany.com)'
    }
    $restkey
    $directorServer


}
