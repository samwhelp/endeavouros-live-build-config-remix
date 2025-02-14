#!/usr/bin/env bash




##
## # Build Endeavouros ISO / Steps / eos-repo-add
##


##
## ## Main / Init
##

REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
REF_CMD_FILE_NAME="$(basename "$0")"


DEFAULT_IS_DEBUG="false"
IS_DEBUG="${IS_DEBUG:=$DEFAULT_IS_DEBUG}"


##
## ## Main / Util
##

util_error_echo () {
	echo "${@}" 1>&2
}

util_debug_echo () {

	if is_debug; then
		echo "${@}" 1>&2
	fi

}

is_debug () {

	if [[ "${IS_DEBUG}" == "true" ]]; then
		return 0
	fi

	return 1

}

is_not_debug () {

	! is_debug

}


##
## ## Main / Variable
##

main_var_init () {

	##
	## ## Plan / Path
	##

	REF_MAIN_SUBJECT_NAME="endeavouros"
	REF_PLAN_DIR_PATH="${REF_BASE_DIR_PATH}"



	REF_PLAN_ASSET_DIR_NAME="asset"
	REF_PLAN_ASSET_DIR_PATH="${REF_PLAN_DIR_PATH}/${REF_PLAN_ASSET_DIR_NAME}"


	REF_PLAN_FACTORY_DIR_NAME="factory"
	REF_PLAN_FACTORY_DIR_PATH="${REF_PLAN_DIR_PATH}/${REF_PLAN_FACTORY_DIR_NAME}"


	REF_PLAN_TMP_DIR_NAME="tmp"
	REF_PLAN_TMP_DIR_PATH="${REF_PLAN_DIR_PATH}/${REF_PLAN_TMP_DIR_NAME}"

	#REF_PLAN_TMP_DIR_PATH="${HOME}/${REF_PLAN_TMP_DIR_NAME}/${REF_MAIN_SUBJECT_NAME}"
	REF_PLAN_TMP_DIR_PATH="/opt/${REF_PLAN_TMP_DIR_NAME}/${REF_MAIN_SUBJECT_NAME}"


	REF_PLAN_WORK_DIR_NAME="work"
	REF_PLAN_WORK_DIR_PATH="${REF_PLAN_TMP_DIR_PATH}/${REF_PLAN_WORK_DIR_NAME}"

	REF_PLAN_OUT_DIR_NAME="out"
	REF_PLAN_OUT_DIR_PATH="${REF_PLAN_TMP_DIR_PATH}/${REF_PLAN_OUT_DIR_NAME}"


	return 0
}

main_var_dump () {

	is_not_debug && return 0


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Tips"
	util_debug_echo "##"
	util_debug_echo
	util_debug_echo "> Hide Dump Info"
	util_debug_echo
	util_debug_echo "\$ export IS_DEBUG=false"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Dump / main_var_dump"
	util_debug_echo "##"

	util_debug_echo
	util_debug_echo "REF_BASE_DIR_PATH=${REF_BASE_DIR_PATH}"
	util_debug_echo "REF_CMD_FILE_NAME=${REF_CMD_FILE_NAME}"

	util_debug_echo
	util_debug_echo "DEFAULT_IS_DEBUG=${DEFAULT_IS_DEBUG}"
	util_debug_echo "IS_DEBUG=${IS_DEBUG}"




	util_debug_echo
	util_debug_echo "REF_MAIN_SUBJECT_NAME=${REF_MAIN_SUBJECT_NAME}"
	util_debug_echo "REF_PLAN_DIR_PATH=${REF_PLAN_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_PLAN_ASSET_DIR_NAME=${REF_PLAN_ASSET_DIR_NAME}"
	util_debug_echo "REF_PLAN_ASSET_DIR_PATH=${REF_PLAN_ASSET_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_PLAN_FACTORY_DIR_NAME=${REF_PLAN_FACTORY_DIR_NAME}"
	util_debug_echo "REF_PLAN_FACTORY_DIR_PATH=${REF_PLAN_FACTORY_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_PLAN_TMP_DIR_NAME=${REF_PLAN_TMP_DIR_NAME}"
	util_debug_echo "REF_PLAN_TMP_DIR_PATH=${REF_PLAN_TMP_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_PLAN_WORK_DIR_NAME=${REF_PLAN_WORK_DIR_NAME}"
	util_debug_echo "REF_PLAN_WORK_DIR_PATH=${REF_PLAN_WORK_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_PLAN_OUT_DIR_NAME=${REF_PLAN_OUT_DIR_NAME}"
	util_debug_echo "REF_PLAN_OUT_DIR_PATH=${REF_PLAN_OUT_DIR_PATH}"




	return 0
}

main_var_init

main_var_dump


##
## ## Master / Variable
##

master_var_init () {


	##
	## ## Master / Args
	##

	DEFAULT_BUILD_ARCH="amd64"
	REF_BUILD_ARCH="${REF_BUILD_ARCH:=$DEFAULT_BUILD_ARCH}"
	REF_BUILD_ARCH_OPTION_LIST="amd64 arm64"


	##
	## ## Master / Opts
	##

	DEFAULT_MAIN_RUN="steps"
	REF_MAIN_RUN="${REF_MAIN_RUN:=$DEFAULT_MAIN_RUN}"


	return 0
}

master_var_dump () {

	is_not_debug && return 0


	util_debug_echo

	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Dump / master_var_dump"
	util_debug_echo "##"




	##
	## ## Master / Args
	##

	util_debug_echo
	util_debug_echo "DEFAULT_BUILD_ARCH=${DEFAULT_BUILD_ARCH}"
	util_debug_echo "REF_BUILD_ARCH=${REF_BUILD_ARCH}"
	util_debug_echo "REF_BUILD_ARCH_OPTION_LIST=${REF_BUILD_ARCH_OPTION_LIST}"


	##
	## ## Master / Opts
	##

	util_debug_echo
	util_debug_echo "DEFAULT_MAIN_RUN=${DEFAULT_MAIN_RUN}"
	util_debug_echo "REF_MAIN_RUN=${REF_MAIN_RUN}"



	util_debug_echo
	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Tips"
	util_debug_echo "##"
	util_debug_echo
	util_debug_echo "> Hide Dump Info"
	util_debug_echo
	util_debug_echo "\$ export IS_DEBUG=false"
	util_debug_echo




	return 0
}

master_var_init

master_var_dump




##
## ## Endeavouros / Repository Add / Package Required
##

endeavouros_repository_add_package_required () {

	#return 0

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Check Package Required"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo sudo pacman -Sy --needed --noconfirm archlinux-keyring curl wget
	util_error_echo
	sudo pacman -Sy --needed --noconfirm archlinux-keyring curl wget



	util_error_echo


	return 0
}




##
## ## Endeavouros / Repository Add / Main
##

endeavouros_repository_add_main () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Repository Add / Main"
	util_error_echo "##"
	util_error_echo


	##
	## ## Refer
	##
	## * https://wiki.archlinux.org/title/Pacman/Package_signing
	## * https://github.com/endeavouros-team/iso-autobuild/blob/main/add-EndeavourOS
	##


	##
	## ## config pacman mirrorlist
	##

	endeavouros_repository_add_config_pacman_mirrorlist


	##
	## ## config /etc/pacman.conf
	##

	endeavouros_repository_add_config_pacman_conf



	##
	## ## repository data refresh
	##

	endeavouros_repository_add_reflash



	##
	## ## install endeavouros-keyring by package
	##

	endeavouros_repository_add_install_endeavouros_keyring


	##
	## ## install endeavouros-mirrorlist by package
	##

	#endeavouros_repository_add_install_endeavouros_mirrorlist



	return 0
}


endeavouros_repository_add_config_pacman_mirrorlist () {

	endeavouros_repository_add_config_pacman_mirrorlist_by_custom

	#endeavouros_repository_add_config_pacman_mirrorlist_by_download

	return 0

}

endeavouros_repository_add_config_pacman_mirrorlist_by_custom () {


cat << __EOF__ | sudo tee '/etc/pacman.d/endeavouros-mirrorlist'

## Taiwan
Server = https://mirror.archlinux.tw/EndeavourOS/repo/\$repo/\$arch

## United States
Server = https://mirrors.gigenet.com/endeavouros/repo/\$repo/\$arch

__EOF__


	return 0
}

endeavouros_repository_add_config_pacman_mirrorlist_by_download () {


	util_error_echo
	util_error_echo sudo curl -fLo '/etc/pacman.d/endeavouros-mirrorlist' --create-dirs 'https://raw.githubusercontent.com/endeavouros-team/PKGBUILDS/master/endeavouros-mirrorlist/endeavouros-mirrorlist'
	util_error_echo
	sudo curl -fLo '/etc/pacman.d/endeavouros-mirrorlist' --create-dirs 'https://raw.githubusercontent.com/endeavouros-team/PKGBUILDS/master/endeavouros-mirrorlist/endeavouros-mirrorlist'


	return 0
}

endeavouros_repository_add_config_pacman_conf () {

	##
	## ## Check Exist
	##

	if grep '## ## EndeavourOS Repository Mirrorlist' '/etc/pacman.conf' > /dev/null; then

		return 0

	fi


	##
	## ## Config
	##

cat << __EOF__ | sudo tee -a '/etc/pacman.conf'

##
## ## EndeavourOS Repository Mirrorlist
##

[endeavouros]
SigLevel = PackageRequired
Include = /etc/pacman.d/endeavouros-mirrorlist

__EOF__


	return 0
}

endeavouros_repository_add_reflash () {

	util_error_echo
	util_error_echo sudo pacman -Sy --noconfirm
	util_error_echo
	sudo pacman -Sy --noconfirm


	return 0
}

endeavouros_repository_add_install_endeavouros_keyring () {

	util_error_echo
	util_error_echo sudo pacman -S --noconfirm endeavouros-keyring
	util_error_echo
	sudo pacman -S --noconfirm endeavouros-keyring


	return 0
}

endeavouros_repository_add_install_endeavouros_mirrorlist () {

	util_error_echo
	util_error_echo sudo pacman -S --noconfirm endeavouros-mirrorlist
	util_error_echo
	sudo pacman -S --noconfirm endeavouros-mirrorlist


	return 0
}


##
## ## Endeavouros / Repository Add / Steps
##

endeavouros_repository_add_develop_test () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_repository_add_develop_test"
	util_error_echo "##"
	util_error_echo



	endeavouros_repository_add_develop_test_prototype

}

endeavouros_repository_add_develop_test_prototype () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_repository_add_develop_test_prototype"
	util_error_echo "##"
	util_error_echo


	#endeavouros_repository_add_package_required


	#endeavouros_repository_add_main






	return 0
}


endeavouros_repository_add_steps () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_repository_add_steps"
	util_error_echo "##"
	util_error_echo



	endeavouros_repository_add_package_required


	endeavouros_repository_add_main


	return 0
}




##
## ## Endeavouros / Repository Add / Start
##

endeavouros_repository_add_start () {

	main_signal_bind

	local main_run="${REF_MAIN_RUN}"

	if [[ "${main_run}" == "test" ]]; then
		endeavouros_repository_add_develop_test
	else
		endeavouros_repository_add_steps
	fi


	return 0
}


##
## ## Model / Start
##

model_start () {

	endeavouros_repository_add_start "${@}"

	return 0
}




##
## ## Main / Signal
##

exit_on_signal_interrupted () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## **Script Interrupted**"
	util_error_echo "##"
	util_error_echo

	## TODO:

	sleep 2


	exit 0

}

exit_on_signal_terminated () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## **Script Terminated**"
	util_error_echo "##"
	util_error_echo

	## TODO:

	sleep 2


	exit 0

}

main_signal_bind () {

	trap exit_on_signal_interrupted SIGINT
	trap exit_on_signal_terminated SIGTERM

}




##
## ## Main / Start
##

__main__ () {

	model_start "${@}"

}

__main__ "${@}"
