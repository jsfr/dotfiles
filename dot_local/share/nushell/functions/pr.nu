$env.AZDO_ORG = 'https://dev.azure.com/cur8/'
$env.AZDO_PROJECT = 'TheRigg'

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
    __pr_open_current
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

def __pr_open_current [] {
    let ref = git symbolic-ref HEAD;
    let id = az repos pr list --status active | from json | where sourceRefName == $ref | first | get pullRequestId;

    if ($id | is-not-empty) {
        az repos pr show --open --id $id | ignore
    }
}

def __pr_create [draft: bool] {
    az repos pr create --draft $draft; __pr_open_current | ignore
}

def __pr_list_own_active [] {
    const org = 'https://dev.azure.com/cur8/';
    const project = 'TheRigg';
    const creator = 'jens.fredskov@nekohealth.com';

    az repos pr list --status active --organization $org -p $project --creator $creator | from json
}
