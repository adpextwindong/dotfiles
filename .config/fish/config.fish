# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

function todos
	grep -r '^>' *.md .
end

function todosr
	grep -r '^?' *.md .
end

set PATH $HOME/.cargo/bin $PATH

