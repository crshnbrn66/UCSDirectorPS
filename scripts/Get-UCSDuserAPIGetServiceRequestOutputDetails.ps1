# 
# NAME
#     Get-UCSDuserAPIGetServiceRequestOutputDetails
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetServiceRequestOutputDetails [[-workFlowID] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetServiceRequestOutputDetails -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetServiceRequestOutputDetails -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetServiceRequestOutputDetails -full".
# 
# 
# 
function Get-UCSDuserAPIGetServiceRequestOutputDetails 
{

    param( [int]$workFlowID)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "servicerequest:userAPIGetServiceRequestOutputDetails&opData={param0:$workFlowID}"
    if($results.serviceresult.workflowoutputdetails)
    {
        $results.serviceresult.workflowoutputdetails
    }
    elseif($results.serviceResult.psobject.Properties.name -eq 'workflowoutputdetails')
    {
        $Null
    }
    else
    {
        throw "$workflowID not found or incorrect syntax`n$results"
    }


}
