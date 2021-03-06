# 
# NAME
#     Invoke-UCSDuserAPISubmitWorkflowServiceRequest
#     
# SYNOPSIS
#     Submit a workflow request for a workflow.
#     
#     
# SYNTAX
#     Invoke-UCSDuserAPISubmitWorkflowServiceRequest [[-workFlowName] <String>] [[-paramList] <Object>] [[-ChildWFId] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Submit's a workflow.
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Invoke-UCSDuserAPISubmitWorkflowServiceRequest -examples".
#     For more information, type: "get-help Invoke-UCSDuserAPISubmitWorkflowServiceRequest -detailed".
#     For technical information, type: "get-help Invoke-UCSDuserAPISubmitWorkflowServiceRequest -full".
# 
# 
# 
function Invoke-UCSDuserAPISubmitWorkflowServiceRequest 
{

    param([string]$workFlowName, [object]$paramList,[int]$ChildWFId = -1)

    $p = ($paramList | convertto-json -Depth 100 -Compress).tochararray().count
    $wf = New-UCSDWorkflowVariablesObject -workFlowVariable $paramList
    $submitObject = [pscustomobject]@{"param0"=$workflowname;"param1"=[pscustomObject]@{'list'= [array]($wf) };"param2" = $ChildWFId} 
    if(($p /2) -gt 2kb)
    {
        $s = $submitObject | convertto-json -Depth 100 -Compress
        $results = Invoke-PosttoUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPISubmitWorkflowServiceRequest&opData=$s"
    }
    else
    {
        $s = $submitObject | convertto-json -Depth 100 -Compress
        $results =  Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPISubmitWorkflowServiceRequest&opData=$s"
    }
    $results


}
