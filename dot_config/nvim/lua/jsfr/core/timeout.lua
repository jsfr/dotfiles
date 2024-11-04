local augroup = require("jsfr.utils.augroup")

augroup("TimeoutGroup", function(autocmd)
    autocmd("InsertEnter", {
        pattern = "*",
        command = "set timeout ttimeout",
    })
    autocmd("InsertLeave", {
        pattern = "*",
        command = "set notimeout nottimeout",
    })
end)
