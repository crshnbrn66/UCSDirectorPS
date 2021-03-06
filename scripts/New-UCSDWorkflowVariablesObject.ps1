# 
# NAME
#     New-UCSDWorkflowVariablesObject
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     New-UCSDWorkflowVariablesObject [[-workFlowVariable] <Object>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help New-UCSDWorkflowVariablesObject -examples".
#     For more information, type: "get-help New-UCSDWorkflowVariablesObject -detailed".
#     For technical information, type: "get-help New-UCSDWorkflowVariablesObject -full".
# 
# 
# 
function New-UCSDWorkflowVariablesObject 
{

    param([object]$workFlowVariable)
    
    if($workFlowVariable.type)
    {
        $workFlowVariable | ForEach-Object{$_.psobject.properties.remove('Type')}
    }
    $wf = @()
    foreach($w in $workFlowVariable)
    {
        $wf += [pscustomobject]@{'name' = $w.Name;'value' = $w.Value} #| convertto-json -Depth 100 -Compress) } # | convertto-json -Depth 100 -Compress)" }
    }

    $wf


}
