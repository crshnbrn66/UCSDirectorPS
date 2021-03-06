# 
# NAME
#     Get-UCSDuserAPIGetServiceRequestLogEntries
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetServiceRequestLogEntries [[-workflowID] <Int32>] [[-workFlowStatus] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetServiceRequestLogEntries -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetServiceRequestLogEntries -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetServiceRequestLogEntries -full".
# 
# 
# 
function Get-UCSDuserAPIGetServiceRequestLogEntries 
{

    param([int]$workflowID, [ValidateSet("0", "1", "2","3")][int]$workFlowStatus = 0)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPIGetServiceRequestLogEntries&opData={param0:$workFlowID,param1:$workFlowStatus}"
    if($results.serviceresult)
    {
        $results.serviceresult
    }
    else
    {
        throw "$workflowID not found or incorrect syntax`n$results"
    }
    


}
