# 
# NAME
#     Get-UCSDuserAPIGetWorkflowOutputDefinition
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDuserAPIGetWorkflowOutputDefinition [[-workflowName] <String>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDuserAPIGetWorkflowOutputDefinition -examples".
#     For more information, type: "get-help Get-UCSDuserAPIGetWorkflowOutputDefinition -detailed".
#     For technical information, type: "get-help Get-UCSDuserAPIGetWorkflowOutputDefinition -full".
# 
# 
# 
function Get-UCSDuserAPIGetWorkflowOutputDefinition 
{

    param([string]$workflowName)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "workflow:userAPIGetWorkflowOutputDefinition&opData={param0:$workflowName}"
    $results


}
