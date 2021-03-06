# 
# NAME
#     Get-UCSDuserAPIGetWorkflowInputs
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetWorkflowInputs [[-workFlowName] <String>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetWorkflowInputs -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetWorkflowInputs -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetWorkflowInputs -full".
# 
# 
# 
function Get-UCSDuserAPIGetWorkflowInputs 
{

    param([string]$workFlowName)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPIGetWorkflowInputs&opData={param0:`"$workFlowName`"}"
    if($results.serviceResult.details)
    {
        $results.serviceResult.details
    }
    else
    {
        throw "$workflowName not found or incorrect syntax`n$results"
    }


}
