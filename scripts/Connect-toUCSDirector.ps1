# 
# NAME
#     Connect-toUCSDirector
#     
# SYNOPSIS
#     Connect through Api to UCS Director
#     
#     
# SYNTAX
#     Connect-toUCSDirector [[-ucsDirectorKey] <String>] [[-ucsDirectorSrvr] <String>] [[-payload] <String>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Connects to UCS director using a Api key and server name.
#     With a passed in payload it'll hit the api and perform a get operation against UCS Director
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Connect-toUCSDirector -examples".
#     For more information, type: "get-help Connect-toUCSDirector -detailed".
#     For technical information, type: "get-help Connect-toUCSDirector -full".
# 
# 
# 
function Connect-toUCSDirector 
{

    param([string]$ucsDirectorKey ,[string]$ucsDirectorSrvr ,[string]$payload)
    #it is expected that the payload will have the operation name and the other detail needed for the api request
    if( [System.Net.ServicePointManager]::SecurityProtocol -ne 'Ssl3, Tls, Tls12, Tls11' -and (! $isLinux ))
    { 

    add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    
    public class IDontCarePolicy : ICertificatePolicy {
        public IDontCarePolicy() {}
        public bool CheckValidationResult(
            ServicePoint sPoint, X509Certificate cert,
            WebRequest wRequest, int certProb) {
            return true;
        }
    }
"@
    [System.Net.ServicePointManager]::CertificatePolicy = new-object IDontCarePolicy 
    [System.Net.ServicePointManager]::SecurityProtocol = `
    [System.Net.SecurityProtocolType]::Tls11 -bor 
    [System.Net.SecurityProtocolType]::Tls12 -bor `   
    [System.Net.SecurityProtocolType]::Tls -bor `
    [System.Net.SecurityProtocolType]::Ssl3
    }
    if( $restKey -and $DirectorServer)
    {
        $ucsDirectorKey = $restKey
        $ucsDirectorSrvr = $DirectorServer   
    }
    elseif(! ($ucsDirectorKey -or $ucsDirectorSrvr))
    {
        Set-UCSDConnectionParams
        $ucsDirectorKey = $restKey
        $ucsDirectorSrvr = $DirectorServer
    }

    $header = @{'X-Cloupia-Request-Key'= $ucsDirectorKey}
    try
    {
      if($isLinux)
      {$result = Invoke-RestMethod  -Headers $header -Method get -Uri "https://$ucsDirectorSrvr/app/api/rest?formatType=json&opName=$payload" -SkipCertificateCheck}
       else{ $result = Invoke-RestMethod  -Headers $header -Method get -Uri "https://$ucsDirectorSrvr/app/api/rest?formatType=json&opName=$payload"}
      $result
    }
    catch
    {
        $_.Exception
    }


}
