
#!/bin/bash
# ANSI colors


# \[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]

_color() {
	echo -n "\033[$1m"
}

CLR_BLACK="$(_color '0;30')"
CLR_RED="$(_color '0;31')"
CLR_GREEN="$(_color '0;32')"
CLR_BROWN="$(_color '0;33')"
CLR_BLUE="$(_color '0;34')"
CLR_CYAN="$(_color '0;35')"
CLR_PURPLE="$(_color '0;36')"
CLR_LIGHT_GRAY="$(_color '0;37')"
CLR_DARK_GRAY="$(_color '1;30')"
CLR_LIGHT_RED="$(_color '1;31')"
CLR_LIGHT_GREEN="$(_color '1;32')"
CLR_YELLOW="$(_color '1;33')"
CLR_LIGHT_BLUE="$(_color '1;34')"
CLR_LIGHT_CYAN="$(_color '1;35')"
CLR_LIGHT_PURPLE="$(_color '1;36')"
CLR_WHITE="$(_color '1;36')"
CLR_RESET="$(_color '0')"

_color_print_all() {
    echo -e "${CLR_BLACK}black"
    echo -e "${CLR_RED}red"
    echo -e "${CLR_GREEN}green"
    echo -e "${CLR_BROWN}brown"
    echo -e "${CLR_BLUE}blue"
    echo -e "${CLR_PURPLE}purple"
    echo -e "${CLR_CYAN}cyan"
    echo -e "${CLR_LIGHT_GRAY}light gray"
    echo -e "${CLR_DARK_GRAY}dark gray"
    echo -e "${CLR_LIGHT_RED}light red"
    echo -e "${CLR_LIGHT_GREEN}light green"
    echo -e "${CLR_YELLOW}yellow"
    echo -e "${CLR_LIGHT_BLUE}light blue"
    echo -e "${CLR_LIGHT_PURPLE}light purple"
    echo -e "${CLR_LIGHT_CYAN}light cyan"
    echo -e "${CLR_WHITE}white"
    echo -e "${CLR_RESET}reset"
}
