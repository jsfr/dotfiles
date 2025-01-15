# Set editor
$env.config.buffer_editor = "hx"

# Disable banner
$env.config.show_banner = false

# Enable starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
