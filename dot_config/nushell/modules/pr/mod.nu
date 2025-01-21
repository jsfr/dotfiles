const azdo_org = 'https://dev.azure.com/cur8'
const azdo_project = 'TheRigg'
const azdo_user = 'jens.fredskov@nekohealth.com'

export def main [] {

}

export def c [] {
    create_pr false
}

export def d [] {
    create_pr true
}

export def l [] {
    let repo = ''
    let pull_requests = az repos pr list --status active --org $azdo_org --project $azdo_project | from json;
    let id = fzf_pr $pull_requests;

    if ($id | is-not-empty) {
        az repos pr show --open --id $id | ignore
    }
}

export def a [] {
    let pull_requests = az repos pr list --status active --organization $azdo_org -p $azdo_project --creator $azdo_user | from json;
    let id = fzf_pr $pull_requests;

    if ($id | is-not-empty) {
        az repos pr show --organization $azdo_org --open --id $id | ignore
    }
}

export def o [] {
    let ref = git symbolic-ref HEAD;
    let pull_request = az repos pr list --status active | from json | where sourceRefName == $ref | first;

    if ($pull_request.pullRequestId | is-not-empty) {
        ^$env.BROWSER $"($azdo_org)/($azdo_project)/_git/($pull_request.repository.name)/pullrequest/($pull_request.pullRequestId)"
    }
}

## Private functions ##

def fzf_pr [pull_requests] {
    $pull_requests
    | each {|pr| $pr | insert draftText (if $pr.isDraft {"[Draft]"} else {""}) }
    | select pullRequestId createdBy.displayName draftText title repository.name
    | to csv -n
    | xsv table
    | fzf
    | awk '{print $1}'
}

def create_pr [draft: bool] {
    let pull_request = az repos pr create --draft ($draft | into string) | from json;

    if ($pull_request.pullRequestId | is-not-empty) {
        ^$env.BROWSER $"($azdo_org)/($azdo_project)/_git/($pull_request.repository.name)/pullrequest/($pull_request.pullRequestId)"
    }
}
