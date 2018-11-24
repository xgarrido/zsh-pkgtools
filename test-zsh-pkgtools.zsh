#!/bin/zsh -i
pkgtools::default_values

msg="test string formating"
pkgtools::msg_color_normal && echo ${msg}
pkgtools::msg_color_red && echo ${msg}
pkgtools::msg_color_green && echo ${msg}
pkgtools::msg_color_brown && echo ${msg}
pkgtools::msg_color_blue && echo ${msg}
pkgtools::msg_color_violet && echo ${msg}
pkgtools::msg_color_grey && echo ${msg}
pkgtools::msg_color_white && echo ${msg}
pkgtools::msg_color_black && echo ${msg}
pkgtools::msg_color_normal
pkgtools::msg_color_reverse && echo ${msg}
pkgtools::msg_color_normal
pkgtools::msg_color_bold && echo ${msg}

msg="Test logging"
pkgtools::msg_error ${msg}
pkgtools::msg_warning ${msg}
pkgtools::msg_info ${msg}
pkgtools::msg_notice ${msg}
pkgtools::msg_using_debug && pkgtools::msg_debug ${msg}
pkgtools::msg_using_devel && pkgtools::msg_devel ${msg}
pkgtools::msg_using_date
pkgtools::msg_notice "${msg} with date"
pkgtools::msg_not_using_date

function generate_success() {
    return 0
}
function generate_error() {
    return 1
}

generate_success
if $(pkgtools::last_command_succeeds); then
    pkgtools::msg_notice "Last command succeeds"
fi

generate_error
if $(pkgtools::last_command_fails); then
    pkgtools::msg_notice "Last command fails"
fi

(
    pkgtools::error_in_subshell
)
if $(pkgtools::last_command_fails); then
    pkgtools::msg_notice "Last command from within subshell fails"
fi
generate_success
if $(pkgtools::last_command_succeeds); then
    pkgtools::msg_notice "Last command succeeds"
fi
