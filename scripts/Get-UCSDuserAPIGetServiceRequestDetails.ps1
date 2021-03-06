# 
# NAME
#     Get-UCSDuserAPIGetServiceRequestDetails
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetServiceRequestDetails [[-workFlowID] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetServiceRequestDetails -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetServiceRequestDetails -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetServiceRequestDetails -full".
# 
# 
# 
function Get-UCSDuserAPIGetServiceRequestDetails 
{

    param( [int]$workFlowID)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPIGetServiceRequestDetails&opData={param0:$workFlowID}"
    if($results.serviceresult)
    {
        $results.serviceresult
    }
    else
    {
        throw "$workflowID not found or incorrect syntax`n$results"
    }


}
