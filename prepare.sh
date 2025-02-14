#!/usr/bin/env bash




##
## # Build Endeavouros ISO / Steps
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


	DEFAULT_BUILD_LOCALE="en_us"
	REF_BUILD_LOCALE="${REF_BUILD_LOCALE:=$DEFAULT_BUILD_LOCALE}"
	REF_BUILD_LOCALE_OPTION_LIST="en_us zh_tw zh_cn zh_hk ja_jp ko_kr"


	DEFAULT_BUILD_RESPIN="xfce"
	REF_BUILD_RESPIN="${REF_BUILD_RESPIN:=$DEFAULT_BUILD_RESPIN}"
	REF_BUILD_RESPIN_OPTION_LIST="xfce kde lxqt mate cinnamon gnome openbox bspwm i3 herbstluftwm e17 minimal"


	##
	## ## ISO Profile / Path
	##

	REF_ISO_PROFILE_DIR_NAME="iso-profile"
	REF_ISO_PROFILE_DIR_PATH="${REF_PLAN_WORK_DIR_PATH}/${REF_ISO_PROFILE_DIR_NAME}"

	REF_ISO_PROFILE_REPO_GIT_URL="https://github.com/endeavouros-team/EndeavourOS-ISO.git"


	##
	## ## Overlay / Path
	##

	REF_OVERLAY_DIR_NAME="overlay"
	REF_OVERLAY_DIR_PATH="${REF_PLAN_ASSET_DIR_PATH}/${REF_OVERLAY_DIR_NAME}"

	REF_FACTORY_OVERLAY_DIR_NAME="${REF_OVERLAY_DIR_NAME}"
	REF_FACTORY_OVERLAY_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_FACTORY_OVERLAY_DIR_NAME}"


	##
	## ## Package List / Path
	##

	REF_PACKAGE_LIST_DIR_NAME="package"
	REF_PACKAGE_LIST_DIR_PATH="${REF_PLAN_ASSET_DIR_PATH}/${REF_PACKAGE_LIST_DIR_NAME}"


	REF_PACKAGE_INSTALL_DIR_NAME="install"
	REF_PACKAGE_INSTALL_DIR_PATH="${REF_PACKAGE_LIST_DIR_PATH}/${REF_PACKAGE_INSTALL_DIR_NAME}"


	REF_PACKAGE_REMOVE_DIR_NAME="remove"
	REF_PACKAGE_REMOVE_DIR_PATH="${REF_PACKAGE_LIST_DIR_PATH}/${REF_PACKAGE_REMOVE_DIR_NAME}"


	##
	## ## Hook / Path
	##

	REF_HOOK_DIR_NAME="hook"
	REF_HOOK_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_HOOK_DIR_NAME}"



	##
	## ## Build Live Config
	##

	REF_BUILD_LIVE_CONFIG_DIR_NAME="${REF_ISO_PROFILE_DIR_NAME}"
	REF_BUILD_LIVE_CONFIG_DIR_PATH="${REF_ISO_PROFILE_DIR_PATH}"


	##
	## ## Build Live Config / Factory Build
	##

	REF_SOURCE_FACTORY_BUILD_DIR_NAME="build"
	REF_SOURCE_FACTORY_BUILD_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_SOURCE_FACTORY_BUILD_DIR_NAME}"

	REF_TARGET_FACTORY_BUILD_DIR_NAME="${REF_BUILD_LIVE_CONFIG_DIR_NAME}"
	REF_TARGET_FACTORY_BUILD_DIR_PATH="${REF_BUILD_LIVE_CONFIG_DIR_PATH}"



	##
	## ## Build Live Config / Factory Overlay
	##

	REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_NAME="overlay"
	REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_NAME}"

	REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_NAME="airootfs"
	REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_PATH="${REF_BUILD_LIVE_CONFIG_DIR_PATH}/${REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_NAME}"



	##
	## ## Build Live Config / Overlay
	##

	REF_SOURCE_OVERLAY_MASTER_OS_DIR_NAME="overlay"
	REF_SOURCE_OVERLAY_MASTER_OS_DIR_PATH="${REF_PLAN_ASSET_DIR_PATH}/${REF_SOURCE_OVERLAY_MASTER_OS_DIR_NAME}"

	REF_TARGET_OVERLAY_MASTER_OS_DIR_NAME="airootfs"
	REF_TARGET_OVERLAY_MASTER_OS_DIR_PATH="${REF_BUILD_LIVE_CONFIG_DIR_PATH}/${REF_TARGET_OVERLAY_MASTER_OS_DIR_NAME}"




	##
	## ## Build Live Config / Package
	##

	REF_SOURCE_OVERLAY_MASTER_PACKAGE_DIR_NAME="package"
	REF_SOURCE_OVERLAY_MASTER_PACKAGE_DIR_PATH="${REF_PLAN_ASSET_DIR_PATH}/${REF_SOURCE_OVERLAY_MASTER_PACKAGE_DIR_NAME}"


	REF_SOURCE_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_NAME="install"
	REF_SOURCE_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_PATH="${REF_SOURCE_OVERLAY_MASTER_PACKAGE_DIR_PATH}/${REF_SOURCE_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_NAME}"

	REF_TARGET_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_NAME="package-lists"
	REF_TARGET_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_PATH="${REF_BUILD_LIVE_CONFIG_DIR_PATH}/${REF_TARGET_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_NAME}"


	##
	## ## Build Live Config / Installer
	##

	REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_NAME="installer/calamares"
	REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_NAME}"

	REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_NAME="etc/calamares"
	REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_PATH="${REF_TARGET_OVERLAY_MASTER_OS_DIR_PATH}/${REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_NAME}"


	##
	## ## Build Live Config / Hook
	##

	REF_SOURCE_OVERLAY_MASTER_HOOK_DIR_NAME="hook"
	REF_SOURCE_OVERLAY_MASTER_HOOK_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_SOURCE_OVERLAY_MASTER_HOOK_DIR_NAME}"

	REF_TARGET_OVERLAY_MASTER_HOOK_DIR_NAME="hooks/normal"
	REF_TARGET_OVERLAY_MASTER_HOOK_DIR_PATH="${REF_BUILD_LIVE_CONFIG_DIR_PATH}/${REF_TARGET_OVERLAY_MASTER_HOOK_DIR_NAME}"



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
	util_debug_echo "DEFAULT_BUILD_LOCALE=${DEFAULT_BUILD_LOCALE}"
	util_debug_echo "REF_BUILD_LOCALE=${REF_BUILD_LOCALE}"
	util_debug_echo "REF_BUILD_LOCALE_OPTION_LIST=${REF_BUILD_LOCALE_OPTION_LIST}"


	util_debug_echo
	util_debug_echo "DEFAULT_BUILD_RESPIN=${DEFAULT_BUILD_RESPIN}"
	util_debug_echo "REF_BUILD_RESPIN=${REF_BUILD_RESPIN}"
	util_debug_echo "REF_BUILD_RESPIN_OPTION_LIST=${REF_BUILD_RESPIN_OPTION_LIST}"


	##
	## ## ISO Profile / Path
	##

	util_debug_echo
	util_debug_echo "REF_ISO_PROFILE_DIR_NAME=${REF_ISO_PROFILE_DIR_NAME}"
	util_debug_echo "REF_ISO_PROFILE_DIR_PATH=${REF_ISO_PROFILE_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_ISO_PROFILE_REPO_GIT_URL=${REF_ISO_PROFILE_REPO_GIT_URL}"


	##
	## ## Overlay / Path
	##

	util_debug_echo
	util_debug_echo "REF_OVERLAY_DIR_NAME=${REF_OVERLAY_DIR_NAME}"
	util_debug_echo "REF_OVERLAY_DIR_PATH=${REF_OVERLAY_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_FACTORY_OVERLAY_DIR_NAME=${REF_FACTORY_OVERLAY_DIR_NAME}"
	util_debug_echo "REF_FACTORY_OVERLAY_DIR_PATH=${REF_FACTORY_OVERLAY_DIR_PATH}"


	##
	## ## Package List / Path
	##

	util_debug_echo
	util_debug_echo "REF_PACKAGE_LIST_DIR_NAME=${REF_PACKAGE_LIST_DIR_NAME}"
	util_debug_echo "REF_PACKAGE_LIST_DIR_PATH=${REF_PACKAGE_LIST_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_PACKAGE_INSTALL_DIR_NAME=${REF_PACKAGE_INSTALL_DIR_NAME}"
	util_debug_echo "REF_PACKAGE_INSTALL_DIR_PATH=${REF_PACKAGE_INSTALL_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_PACKAGE_REMOVE_DIR_NAME=${REF_PACKAGE_REMOVE_DIR_NAME}"
	util_debug_echo "REF_PACKAGE_REMOVE_DIR_PATH=${REF_PACKAGE_REMOVE_DIR_PATH}"


	##
	## ## Hook / Path
	##

	util_debug_echo
	util_debug_echo "REF_HOOK_DIR_NAME=${REF_HOOK_DIR_NAME}"
	util_debug_echo "REF_HOOK_DIR_PATH=${REF_HOOK_DIR_PATH}"




	##
	## ## Build Live Config
	##

	util_debug_echo
	util_debug_echo "REF_BUILD_LIVE_CONFIG_DIR_NAME=${REF_BUILD_LIVE_CONFIG_DIR_NAME}"
	util_debug_echo "REF_BUILD_LIVE_CONFIG_DIR_PATH=${REF_BUILD_LIVE_CONFIG_DIR_PATH}"





	##
	## ## Build Live Config / Factory Build
	##

	util_debug_echo
	util_debug_echo "REF_SOURCE_FACTORY_BUILD_DIR_NAME=${REF_SOURCE_FACTORY_BUILD_DIR_NAME}"
	util_debug_echo "REF_SOURCE_FACTORY_BUILD_DIR_PATH=${REF_SOURCE_FACTORY_BUILD_DIR_PATH}"
	util_debug_echo "REF_TARGET_FACTORY_BUILD_DIR_NAME=${REF_TARGET_FACTORY_BUILD_DIR_NAME}"
	util_debug_echo "REF_TARGET_FACTORY_BUILD_DIR_PATH=${REF_TARGET_FACTORY_BUILD_DIR_PATH}"



	##
	## ## Build Live Config / Factory Overlay
	##

	util_debug_echo
	util_debug_echo "REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_NAME=${REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_NAME}"
	util_debug_echo "REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_PATH=${REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_PATH}"
	util_debug_echo "REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_NAME=${REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_NAME}"
	util_debug_echo "REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_PATH=${REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_PATH}"


	##
	## ## Build Live Config / Overlay
	##

	util_debug_echo
	util_debug_echo "REF_SOURCE_OVERLAY_MASTER_OS_DIR_NAME=${REF_SOURCE_OVERLAY_MASTER_OS_DIR_NAME}"
	util_debug_echo "REF_SOURCE_OVERLAY_MASTER_OS_DIR_PATH=${REF_SOURCE_OVERLAY_MASTER_OS_DIR_PATH}"
	util_debug_echo "REF_TARGET_OVERLAY_MASTER_OS_DIR_NAME=${REF_TARGET_OVERLAY_MASTER_OS_DIR_NAME}"
	util_debug_echo "REF_TARGET_OVERLAY_MASTER_OS_DIR_PATH=${REF_TARGET_OVERLAY_MASTER_OS_DIR_PATH}"





	##
	## ## Build Live Config / Installer
	##

	util_debug_echo
	util_debug_echo "REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_NAME=${REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_NAME}"
	util_debug_echo "REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_PATH=${REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_NAME=${REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_NAME}"
	util_debug_echo "REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_PATH=${REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_PATH}"




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
## ## Endeavouros / Build ISO / Overlay
##

endeavouros_build_iso_overlay () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Build ISO / Overlay"
	util_error_echo "##"
	util_error_echo


	endeavouros_factory_build_config_overlay

	#endeavouros_factory_master_os_file_overlay

	#endeavouros_master_os_file_overlay

	#endeavouros_master_os_package_overlay

	#endeavouros_master_os_installer_overlay

	#endeavouros_live_build_config_hook_overlay





	return 0
}

util_dir_file_overlay () {


	local source_dir_path="${1}"
	local target_dir_path="${2}"


	util_error_echo
	util_error_echo mkdir -p "${source_dir_path}"
	mkdir -p "${source_dir_path}"


	util_error_echo
	util_error_echo mkdir -p "${target_dir_path}"
	mkdir -p "${target_dir_path}"


	util_error_echo
	util_error_echo cp -rfT "${source_dir_path}" "${target_dir_path}"
	cp -rfT "${source_dir_path}" "${target_dir_path}"


	return 0
}



##
## ## Endeavouros / Build ISO / Overlay / Build Config
##

endeavouros_factory_build_config_overlay () {


	local source_dir_path="${REF_SOURCE_FACTORY_BUILD_DIR_PATH}"
	local target_dir_path="${REF_TARGET_FACTORY_BUILD_DIR_PATH}"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Build ISO / Overlay / Build Config"
	util_error_echo "##"
	util_error_echo


	util_dir_file_overlay "${source_dir_path}" "${target_dir_path}"


	return 0
}



##
## ## Endeavouros / Build ISO / Package Required For Build
##

endeavouros_build_iso_package_required () {

	#return 0

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Check Package Required"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo pacman -S --needed --noconfirm archiso mkinitcpio-archiso base-devel
	util_error_echo
	pacman -S --needed --noconfirm archiso mkinitcpio-archiso base-devel

	util_error_echo



}




##
## ## Endeavouros / Build ISO / Prepare
##

endeavouros_build_iso_prepare () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Build ISO / Prepare"
	util_error_echo "##"
	util_error_echo


	endeavouros_build_iso_prepare_work_dir

	endeavouros_build_iso_prepare_iso_profile


	return 0
}


##
## ## Endeavouros / Build ISO / Prepare / Work Dir
##

endeavouros_build_iso_prepare_work_dir () {

	local work_dir_path="${REF_PLAN_WORK_DIR_PATH}"


	if [[ -d "${work_dir_path}" ]]; then

		return 0

	fi


	util_error_echo
	util_error_echo sudo mkdir -p "${work_dir_path}"
	util_error_echo
	sudo mkdir -p "${work_dir_path}"


	util_error_echo
	util_error_echo sudo chmod 777 "${work_dir_path}"
	util_error_echo
	sudo chmod 777 "${work_dir_path}"


	return 0
}




##
## ## Endeavouros / Build ISO / Prepare / ISO Profile
##

endeavouros_build_iso_prepare_iso_profile () {

	local iso_profile_repo_git_url="${REF_ISO_PROFILE_REPO_GIT_URL}"
	local iso_profile_dir_path="${REF_ISO_PROFILE_DIR_PATH}"


	if [[ -d "${iso_profile_dir_path}" ]]; then

		#return 0 ## for codeing


		util_error_echo
		util_error_echo rm -rf "${iso_profile_dir_path}"
		util_error_echo
		#rm -rf "${iso_profile_dir_path}"



	fi


	util_error_echo
	util_error_echo git clone "${iso_profile_repo_git_url}" "${iso_profile_dir_path}"
	util_error_echo
	git clone "${iso_profile_repo_git_url}" "${iso_profile_dir_path}"


	return 0
}



##
## ## Endeavouros / Build ISO / Archive
##

endeavouros_build_iso_archive () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Build ISO / Archive / Start"
	util_error_echo "##"
	util_error_echo


	local iso_profile_dir_path="${REF_ISO_PROFILE_DIR_PATH}"



	##
	## ## iso build head
	##
	util_error_echo
	util_error_echo cd "${iso_profile_dir_path}"
	cd "${iso_profile_dir_path}"


	##
	## ## iso build prepare
	##
	util_error_echo
	util_error_echo ./prepare.sh
	util_error_echo
	./prepare.sh



	##
	## ## iso build tail
	##
	util_error_echo
	util_error_echo "cd ${OLDPWD}"
	cd "${OLDPWD}"




	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Build ISO / Archive / Done"
	util_error_echo "##"
	util_error_echo


	return 0
}




##
## ## Endeavouros / Build ISO / Create
##

endeavouros_build_iso_create () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Build ISO / Create"
	util_error_echo "##"
	util_error_echo


	##
	## ## prepare
	##
	endeavouros_build_iso_prepare


	##
	## ## overlay
	##
	endeavouros_build_iso_overlay


	##
	## ## create iso
	##
	endeavouros_build_iso_archive


	return 0
}




##
## ## Endeavouros / Build ISO / Steps
##

endeavouros_build_iso_develop_test () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_build_iso_develop_test"
	util_error_echo "##"
	util_error_echo



	endeavouros_build_iso_develop_test_prototype

}

endeavouros_build_iso_develop_test_prototype () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_build_iso_develop_test_prototype"
	util_error_echo "##"
	util_error_echo

	endeavouros_build_iso_overlay

	#endeavouros_build_iso_package_required


	#endeavouros_build_iso_create






	return 0
}


endeavouros_build_iso_steps () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_build_iso_steps"
	util_error_echo "##"
	util_error_echo



	endeavouros_build_iso_package_required


	endeavouros_build_iso_create


	return 0
}




##
## ## Endeavouros / Build ISO / Start
##

endeavouros_build_iso_start () {

	main_signal_bind



	local main_run="${REF_MAIN_RUN}"

	if [[ "${main_run}" == "test" ]]; then
		endeavouros_build_iso_develop_test
	else
		endeavouros_build_iso_steps
	fi


	return 0
}


##
## ## Model / Start
##

model_start () {

	endeavouros_build_iso_start "${@}"

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
