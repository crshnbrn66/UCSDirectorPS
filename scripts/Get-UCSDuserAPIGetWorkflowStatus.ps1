# 
# NAME
#     Get-UCSDuserAPIGetWorkflowStatus
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetWorkflowStatus [[-workFlowID] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetWorkflowStatus -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetWorkflowStatus -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetWorkflowStatus -full".
# 
# 
# 
function Get-UCSDuserAPIGetWorkflowStatus 
{

    param( [int]$workFlowID)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPIGetWorkflowStatus&opData={param0:$workflowID}"
    $results


}
