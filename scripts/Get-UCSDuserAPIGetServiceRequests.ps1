# 
# NAME
#     Get-UCSDuserAPIGetServiceRequests
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetServiceRequests [[-workflowID] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetServiceRequests -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetServiceRequests -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetServiceRequests -full".
# 
# 
# 
function Get-UCSDuserAPIGetServiceRequests 
{

    param([int]$workflowID)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPIGetServiceRequests"
    if($results.serviceresult)
    {
        $results.serviceresult.rows
    }
    else
    {
        throw "$workflowID not found or incorrect syntax`n$results"
    }


}
