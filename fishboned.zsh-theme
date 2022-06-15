# 本主题修改自https://github.com/EYH0602/Fishbonepp.git
# 侵权删
local username="%n"
local path_prefix="%{$fg[blue]%}["
local path_string="%{$fg[yellow]%}%~"
local path_postfix="%{$fg[blue]%}]"
local prompt_string="❯❯ "
local local_time="%T"
local newline=$'\n'
local line_mode=$'\n'
local showuser=true
# customize user settings
FISHBONEPP_PROMPT="❯ "
FISHBONEPP_NEWLINE=false
FISHBONEPP_LINE_MODE="singleline"
FISHBONEPP_SHOWUSER=false

# prompt symbol
if [[ $FISHBONEPP_SHOWUSER = false ]] then
	showuser=false
fi
if [ ! -z "$FISHBONEPP_PROMPT" ]; then
	prompt_string="$FISHBONEPP_PROMPT"
fi
# username
if [ ! -z "$FISHBONEPP_USER" ]; then
	username="$FISHBONEPP_USER"
fi
# time mode
if [ "$FISHBONEPP_TIME" = "12HR" ]; then
	local_time="%t"
elif [ "$FISHBONEPP_TIME" = "FULL" ]; then
	local_time="%*"
else
	local_time="%T"
fi
# new line on start
if [ "$FISHBONEPP_NEWLINE" = false ]; then
	newline=''
fi
# line mode
if [ "$FISHBONEPP_LINE_MODE" = "singleline" ]; then
	line_mode=''
fi
# ## get conda prompt
# function prompt_virtualenv {
#   # Get the name of the virtual environment if one is active
#   ## 可能需要运行一下 conda config --set changeps1 false 
#   if [[ -n $VIRTUAL_ENV ]]; then
#     local env_label=" $(basename $VIRTUAL_ENV) "
#   fi
# 
#   # Get the name of the Anaconda environment if one is active
#   if [[ -n $CONDA_PREFIX ]]; then
#     if [[ -n $env_label ]]; then
#       env_label+="+ $(basename $CONDA_DEFAULT_ENV) "
#     else
#       local env_label=" $(basename $CONDA_DEFAULT_ENV) "
#     fi
#   fi
#   # Draw prompt segment if a virtual/conda environment is active
#   if [[ -n $env_label ]]; then
# 	  echo "%{$fg[blue]%}(%{$reset_color%}%{$fg[yellow]%}$env_label%{$fg[blue]%})%{$reset_color%}"
# 	  # echo "$env_label"
#   else
# 	echo ""
#   fi
# 
# }
# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_ADDED="➕"
ZSH_THEME_GIT_PROMPT_MODIFIED="✒️ "
ZSH_THEME_GIT_PROMPT_DELETED="➖"
ZSH_THEME_GIT_PROMPT_RENAMED="⁉️ "
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED=""
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue](%{$reset_color%}%{$fg[yellow]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%{$fg[blue])%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%} $(git_prompt_status) "
zsh_theme_git_prompt_dirty="⚡"
zsh_theme_git_prompt_clean="C"

local host_name="%{$fg[blue]%}${username}"
local time_string="%{$fg[blue]%}${local_time}"
# Make prompt_string red if the previous command failed.
local return_status="%(?.%{$fg[green]%}$prompt_string.%{$fg[red]%}$prompt_string%"


if [ ${showuser} = true ]; then 
PROMPT='${newline}\
${host_name}${hosr}%{$reset_color%} ${line_mode}\
${path_prefix}${path_string}${path_postfix}%{$reset_color%} \
${return_status}'
else
PROMPT=' ${newline}\
${line_mode}\
${path_prefix}${path_string}${path_postfix}%{$reset_color%} \
${return_status}'
fi

RPROMPT='%{$fg[blue]%}%B%m%b $(git_prompt_info)${time_string}%{$reset_color%}'
# RPROMPT='$(git_prompt_info) $(git_prompt_status) ${time_string}'
export PROMPT=$PROMPT
export RPROMPT=$RPROMPT



