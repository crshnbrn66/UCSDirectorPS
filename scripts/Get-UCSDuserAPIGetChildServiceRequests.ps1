# 
# NAME
#     Get-UCSDuserAPIGetChildServiceRequests
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetChildServiceRequests [[-workflowID] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetChildServiceRequests -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetChildServiceRequests -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetChildServiceRequests -full".
# 
# 
# 
function Get-UCSDuserAPIGetChildServiceRequests 
{

 param([int]$workflowID)
 $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "servicerequest:userAPIGetChildServiceRequests&opData={param0:{`"requestId`":$workflowID}}"   
 if($results.serviceresult)
 {
     $results.serviceresult
 }
 elseif([string]::IsNullOrEmpty($results))
 {
     $results = $null
 }
 else
 {
     throw "$workflowID not found or incorrect syntax`n$results"
 }
 $results


}
