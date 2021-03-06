# 
# NAME
#     get-UCSDuserAPIGetWorkflowSteps
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     get-UCSDuserAPIGetWorkflowSteps [[-workFlowID] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help get-UCSDuserAPIGetWorkflowSteps -examples".
#     For more information, type: "get-help get-UCSDuserAPIGetWorkflowSteps -detailed".
#     For technical information, type: "get-help get-UCSDuserAPIGetWorkflowSteps -full".
# 
# 
# 
function get-UCSDuserAPIGetWorkflowSteps 
{

     param( [int]$workFlowID)
    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "servicerequest:userAPIGetWorkflowSteps&opData={param0:{'requestId':$workFlowID}}"
    if($results.serviceresult)
    {
        $results.serviceresult
    }
    else
    {
        throw "$workflowID not found or incorrect syntax`n$results"
    }




}
