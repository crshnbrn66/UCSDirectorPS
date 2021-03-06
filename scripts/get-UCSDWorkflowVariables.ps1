# 
# NAME
#     get-UCSDWorkflowVariables
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     get-UCSDWorkflowVariables [[-workflowName] <String>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help get-UCSDWorkflowVariables -examples".
#     For more information, type: "get-help get-UCSDWorkflowVariables -detailed".
#     For technical information, type: "get-help get-UCSDWorkflowVariables -full".
# 
# 
# 
function get-UCSDWorkflowVariables 
{

    param([string]$workflowName)
    $variables = Get-UCSDuserAPIGetWorkflowInputs -workFlowName $workflowName

    foreach($v in $variables)
    {
        [pscustomObject]@{'Name'=$v.label;
                          'Type' =$v.type;
                          'Value' = $Null
                          }
    }


}
