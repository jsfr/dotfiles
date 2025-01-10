function pr -a subcommand
    switch $subcommand
    case c
        __pr_create false
    case d
        __pr_create true
    case l
        __pr_list_in_repo
    case a
        __pr_list_own_active
    case o
        __pr_open_current
    case '*'
        echo "unknown subcommand"
    end
end

function __pr_create -a draft
    az repos pr create --draft $draft
end

function __pr_list_in_repo
    az repos pr list --status active \
    | __pr_select_id \
    | xargs -I{} az repos pr show --open --id {} > /dev/null
end

function __pr_list_own_active
    set -l org 'https://dev.azure.com/cur8/'
    set -l project 'TheRigg'
    set -l creator 'jens.fredskov@nekohealth.com' 
    
    az repos pr list --status active --organization $org -p $project --creator $creator \
    | __pr_select_id \
    | xargs -I{} az repos pr show --organization $org --open --id {} > /dev/null
end 

function __pr_select_id
    tee \
    | jq -r '.[] | [.pullRequestId,.createdBy.displayName,if .isDraft then "[Draft]" else "" end,.title,.repository.name] | @csv'  \
    | xsv table \
    | fzf \
    | awk '{print $1}' 
end

function __pr_open_current
    set -l current_ref (git symbolic-ref HEAD)

    az repos pr list --status active \
    | jq -r ".[] | select(.sourceRefName == \"$current_ref\") | .pullRequestId" \
    | xargs -I{} az repos pr show --open --id {} > /dev/null
end
