# 
# NAME
#     Get-UCSDWorkFlows
#     
# SYNOPSIS
#     Short description
#     
#     
# SYNTAX
#     Get-UCSDWorkFlows [<CommonParameters>]
#     
#     
# DESCRIPTION
#     Long description
#     
# 
# RELATED LINKS
# 
# REMARKS
#     To see the examples, type: "get-help Get-UCSDWorkFlows -examples".
#     For more information, type: "get-help Get-UCSDWorkFlows -detailed".
#     For technical information, type: "get-help Get-UCSDWorkFlows -full".
# 
# 
# 
function Get-UCSDWorkFlows 
{

    $results = Connect-toUCSDirector -ucsDirectorKey $restKey -ucsDirectorSrvr $DirectorServer -payload 'userAPIGetTabularReport&opData=%7B%22param0%22%3A10%2C%22param1%22%3Anull%2C%22param2%22%3A%22WORKFLOWS-T46%22%7D'
    $results.serviceResult.rows


}
