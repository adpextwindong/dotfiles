function todos
	grep -r '^>' *.md .
end

function todosr
	grep -r '^?' *.md .
end

set PATH C:/Users/Takumi/.cargo/.cargo/bin $PATH

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

if status --is-interactive;and test -n "$ConEmuWorkDir"
    cd (cygpath "$ConEmuWorkDir")
    echo 'Switched dirs.'
end
