# 
# NAME
#     Invoke-PosttoUCSDirector
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Invoke-PosttoUCSDirector [[-ucsDirectorKey] <String>] [[-ucsDirectorSrvr] <String>] [[-payload] <String>] [[-timeOutSeconds] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Invoke-PosttoUCSDirector -examples".
#     For more information, type: "get-help Invoke-PosttoUCSDirector -detailed".
#     For technical information, type: "get-help Invoke-PosttoUCSDirector -full".
# 
# 
# 
function Invoke-PosttoUCSDirector 
{

    param([string]$ucsDirectorKey,[string]$ucsDirectorSrvr,[string]$payload,[int]$timeOutSeconds = 180)
    #it is expected that the payload will have the operation name and the other detail needed for the api request
    if( [System.Net.ServicePointManager]::SecurityProtocol -ne 'Ssl3, Tls, Tls12, Tls11' -and ($islinux -eq $false))
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
    if(! ($ucsDirectorKey -or $ucsDirectorSrvr))
    {
        Set-UCSDConnectionParams
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
    $body = "formatType=json&opName=$payload"
    try
    {
      if($isLinux)
      {
          $result = Invoke-RestMethod  -Headers $header -Method Post -Uri "https://$ucsDirectorSrvr/app/api/rest" -Body $body -UseBasicParsing-SkipCertificateCheck -TimeoutSec $timeOutSeconds
      }
      else
      { 
          #https://social.technet.microsoft.com/wiki/contents/articles/29863.powershell-rest-api-invoke-restmethod-gotcha.aspx
          $servicepoint = [System.Net.ServicePointManager]::FindServicePoint("https://$ucsDirectorSrvr/app/api/rest")
          $result = Invoke-RestMethod  -Headers $header -Method Post -Uri "https://$ucsDirectorSrvr/app/api/rest" -Body $body -UseBasicParsing -TimeoutSec $timeOutSeconds
          $ServicePoint.CloseConnectionGroup("")
      }
      $result
    }
    catch
    {
        $_.Exception
    }


}
