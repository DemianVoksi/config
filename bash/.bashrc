# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi


force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
color_prompt=yes
else
color_prompt=yes
fi
fi

if [ "$color_prompt" = yes ]; then
if [ "$USER" = "root" ]; then
PS1='${debian_chroot:+($debian_chroot)}\[\033[92m\]\u\[\033[92m\]@\[\033[92m\]\h\[\033[92m\]:\[\033[96m\]\w\[\033[97m\]\$ '
else
PS1='${debian_chroot:+($debian_chroot)}\[\033[92m\]\u\[\033[92m\]@\[\033[92m\]\h\[\033[92m\]:\[\033[96m\]\w\[\033[97m\]\$ '
fi
else
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


unset rc
