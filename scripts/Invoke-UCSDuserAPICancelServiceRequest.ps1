# 
# NAME
#     Invoke-UCSDuserAPICancelServiceRequest
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Invoke-UCSDuserAPICancelServiceRequest [[-workflowID] <Int32>] [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Invoke-UCSDuserAPICancelServiceRequest -examples".
#     For more information, type: "get-help Invoke-UCSDuserAPICancelServiceRequest -detailed".
#     For technical information, type: "get-help Invoke-UCSDuserAPICancelServiceRequest -full".
# 
# 
# 
function Invoke-UCSDuserAPICancelServiceRequest 
{

    param([int]$workflowID)

    while($WFDoneStatusMessages -notcontains (Get-UCSDuserAPIGetServiceRequestDetails -workFlowID $workflowID).status ) #go into loop to ensure that workflow is cancelled
    {
        try {
            $results = invoke-PosttoUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload "userAPICancelServiceRequest&opData={param0:$workflowID}"   -timeOutSeconds 20
        }
        catch {
            $results = (Get-UCSDuserAPIGetServiceRequestDetails -workFlowID $workflowID).status
            if($WFDoneStatusMessages -contains $results)
            {
                $results = 'True'
            }
        }
        Start-Sleep 10
    }
   
    if($results.serviceresult)
    {
        $results.serviceresult
    }
    elseif($results -eq 'True')
    {
        $results
    }
    elseif([string]::IsNullOrEmpty($results))
    {
        $results = $null
    }
    else
    {
        throw "$workflowID not found or incorrect syntax`n$results"
    }
    


}
