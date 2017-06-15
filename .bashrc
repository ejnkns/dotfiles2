#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# make xterm transparent
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

#PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(($(sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo)/1024))"\033[38;5;22m/"$(($(sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo)/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m" \n'

## default prompt below
#PS1='[\u@\h \W]\$ '

#PS1='>: '
#PS1='\[\e[1;33m\][\W]> \[\e[0m\]'
PS1=' \[\e[m\]\[\e[1;34m\]\W \[\e[m\]\[\e[1;33m\]> \[\e[m\]'

## change input colour
#trap 'echo -ne "\e[0"' DEBUG

## to make xterm transparent
#[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

complete -cf sudo

###############
### Aliases ###
###############

### Launching programs ###
alias reddit='rtv'
alias yt='youtube-viewer -C -4'
alias music='ncmpcpp'
alias server='ssh ejnkns@10.0.0.86'
alias rserver='ssh ejnkns@XXX.XXX.XXX.XXX'
alias feh='feh -B black -. --scale-down --auto-zoom'
alias oomox='(~/Programs/oomox/gui.sh &)'
alias r='ranger'

### Terminal/System ###
function cs () {
	cd "$@" && ls
	}
alias ..='cs ..'
#alias wifi='nmtui'
#alias wifi='sudo wifi-menu'
#alias pacinstall='sudo pacman -S'
function pacinstall {
	read package
	sudo pacman -S $package;
	updatedb
}
alias pacuninstall='sudo pacman -Rs'
alias logoff='sudo pkill -KILL -u ejnkns'
alias ping8='ping -c 3 8.8.8.8'
alias pingg='ping -c 3 google.com'
alias flk='xinput float 9' #float laptop keyboard
alias rlk='xinput reattach 9 3' #reatach laptop keyboard
alias uniwifi='sudo wpa_supplicant -B -D nl80211,wext -i wlp16s0 -c /home/ejnkns/.wifi/uniwireless.conf && sudo dhcpcd wlp16s0'
alias homewifi="sudo wpa_supplicant -B -D nl80211,wext -i wlp16s0 -c /home/ejnkns/.wifi/home.conf && sudo dhcpcd wlp16s0"
function univpn {
	a=$(iw dev wlp16s0 link | grep SSID)
	if [[ "$a" = *"SSID: UniWireless" ]]; then
		$(ssh elliotj@nutmeg.eng.unimelb.edu.au)
	else	
		echo starting openconnect...
		$(sudo openconnect -b -q --user=elliotj remote.unimelb.edu.au/student)
		$(ssh elliotj@nutmeg.eng.unimelb.edu.au)
	fi
	}
alias wifi='sudo ~/.scripts/wifi.sh'
#function wifi {
#	sudo ip link set wlp16s0 up
#	sudo pkill wpa_supplicant
#	sudo pkill dhcpcd
#	a=$(sudo iw dev wlp16s0 scan | grep SSID)
#	echo "networks are:"
#	echo $a
#	if [[ "$a" == *"SSID: UniWireless"* ]]; then
#		echo "found UniWireless"
#		uniwifi
#	elif [[ "$a" == *"SSID: Sam's wifi"* ]]; then	
#		echo "found Sam's wifi"
#		homewifi
#	fi
#	}
alias xbl='xbacklight'
alias bat='acpi'
alias scrot='scrot ~/Pictures/screenshots/%Y-%m-%d-%T-screenshots.png'
alias mopidy='(mopidy -q &)'
alias pip='sudo pip3'
alias cu='cd uni/comp20007/ass2/mycode'
alias firefox='~/.scripts/firefox.sh'
