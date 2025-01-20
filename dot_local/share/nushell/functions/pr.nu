$env.AZDO_ORG = 'https://dev.azure.com/cur8'
$env.AZDO_PROJECT = 'TheRigg'
$env.AZDO_USER = 'jens.fredskov@nekohealth.com'

def "pr c" [] {
    __pr_create false
}

def "pr d" [] {
    __pr_create true
}

def "pr l" [] {
    let repo = ''
    let pull_requests = az repos pr list --status active --org $env.AZDO_ORG --project $env.AZDO_PROJECT | from json;
    let id = __pr_select_id $pull_requests;

    if ($id | is-not-empty) {
        az repos pr show --open --id $id | ignore
    }
}

def "pr a" [] {
    let pull_requests = __pr_list_own_active;
    let id = __pr_select_id $pull_requests;

    if ($id | is-not-empty) {
        az repos pr show --organization $env.AZDO_ORG --open --id $id | ignore
    }
}

def "pr o" [] {
    let ref = git symbolic-ref HEAD;
    let pull_request = az repos pr list --status active | from json | where sourceRefName == $ref | first;

    if ($pull_request.pullRequestId | is-not-empty) {
        ^$env.BROWSER $"($env.AZDO_ORG)/($env.AZDO_PROJECT)/_git/($pull_request.repository.name)/pullrequest/$($pull_request.pullRequestId)"
    }
}

def __pr_select_id [pull_requests] {
    $pull_requests
    | each {|pr| $pr | insert draftText (if $pr.isDraft {"[Draft]"} else {""}) }
    | select pullRequestId createdBy.displayName draftText title repository.name
    | to csv -n
    | xsv table
    | fzf
    | parse '{id} {rest}'
    | get id
}

def __pr_create [draft: bool] {
    let pull_request = az repos pr create --draft ($draft | into string) | from json;

    if ($pull_request.pullRequestId | is-not-empty) {
        ^$env.BROWSER $"($env.AZDO_ORG)/($env.AZDO_PROJECT)/_git/($pull_request.repository.name)/pullrequest/$($pull_request.pullRequestId)"
    }
}

def __pr_list_own_active [] {
    az repos pr list --status active --organization $env.AZDO_ORG -p $env.AZDO_PROJECT --creator $env.AZDO_USER | from json
}
