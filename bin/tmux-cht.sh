#!/usr/bin/env bash

languages=$(echo "golang nodejs javascript typescript tmux zsh c lua rust python bash css html sql" | tr " " "\n")
core_utils1=$(echo "ps grep curl find awk tr mv kill lsof less head tail kubectl" | tr " " "\n")
core_utils2=$(echo "tar cp rm jq cat ssh cargo chown make xargs stow chmod" | tr " " "\n")
core_utils2=$(echo "git git-worktree git-status git-commit git-rebase docker docker-compose" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils1\n$core_utils2\n$core_utils3" | fzf)

if [[ -z $selected ]]; then
	exit 0
fi

echo "Selected: $selected"
read -p "Enter Query: " query

if echo "$languages" | grep -qs "$selected"; then
	query=$(echo $query | tr " " "+")
	tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
