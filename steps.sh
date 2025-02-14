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

run_and_log () {
	## From: https://gitlab.com/kalilinux/build-scripts/kali-live/-/blob/main/build.sh?ref_type=heads#L69-L81
	##if [ -n "${IS_VERBOSE}" ] || [ -n "${IS_DEBUG}" ]; then
	if [[ "${IS_VERBOSE}" == "true" ]] || [[ "${IS_DEBUG}" == "true" ]]; then
		printf "RUNNING:" >&2
		for _ in "$@"; do
			[[ $_ =~ [[:space:]] ]] && printf " '%s'" "$_" || printf " %s" "$_"
		done >&2
		printf "\n" >&2
		"$@" 2>&1 | tee -a "${REF_BUILD_LOG_FILE_PATH}"
	else
		"$@" >>"${REF_BUILD_LOG_FILE_PATH}" 2>&1
	fi
	return ${?}
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


	DEFAULT_IS_VERBOSE="true"
	IS_VERBOSE="${IS_VERBOSE:=$DEFAULT_IS_VERBOSE}"


	REF_BUILD_LOG_FILE_NAME="build.log"
	REF_BUILD_LOG_FILE_PATH="${REF_PLAN_DIR_PATH}/${REF_BUILD_LOG_FILE_NAME}"




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
	util_debug_echo "DEFAULT_IS_VERBOSE=${DEFAULT_IS_VERBOSE}"
	util_debug_echo "IS_VERBOSE=${IS_VERBOSE}"

	util_debug_echo
	util_debug_echo "REF_BUILD_LOG_FILE_NAME=${REF_BUILD_LOG_FILE_NAME}"
	util_debug_echo "REF_BUILD_LOG_FILE_PATH=${REF_BUILD_LOG_FILE_PATH}"




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
	## ## Target OS / Path
	##

	REF_TARGET_OS_ROOT_DIR_NAME="chroot"
	REF_TARGET_OS_ROOT_DIR_PATH="${REF_ISO_PROFILE_DIR_PATH}/${REF_TARGET_OS_ROOT_DIR_NAME}"


	REF_TARGET_OS_ARCHIVE_FILE_NAME="filesystem.squashfs"
	REF_TARGET_OS_ARCHIVE_FILE_PATH="${REF_ISO_PROFILE_DIR_PATH}/${REF_TARGET_OS_ARCHIVE_FILE_NAME}"


	##
	## ## Target OS / debootstrap args
	##

	#DEFAULT_BUILD_ARCH="amd64"
	#REF_BUILD_ARCH="${REF_BUILD_ARCH:=$DEFAULT_BUILD_ARCH}"

	DEFAULT_BUILD_SUITE="bookworm"
	REF_BUILD_SUITE="${REF_BUILD_SUITE:=$DEFAULT_BUILD_SUITE}"

	DEFAULT_PACKAGE_REPO_URL="http://deb.debian.org/debian"
	REF_PACKAGE_REPO_URL="${REF_PACKAGE_REPO_URL:=$DEFAULT_PACKAGE_REPO_URL}"

	DEFAULT_BUILD_INCLUDE="debian-ports-archive-keyring,debian-archive-keyring,live-task-recommended,live-task-standard,live-config-systemd,live-boot"
	REF_BUILD_INCLUDE="${REF_BUILD_INCLUDE:=$DEFAULT_BUILD_INCLUDE}"


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
	## ## ISO Template / Path
	##

	REF_ISO_TEMPLATE_SOURCE_DIR_NAME="iso-template"
	REF_ISO_TEMPLATE_SOURCE_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_ISO_TEMPLATE_SOURCE_DIR_NAME}"


	REF_ISO_TEMPLATE_TARGET_DIR_NAME="binary"
	REF_ISO_TEMPLATE_TARGET_DIR_PATH="${REF_ISO_PROFILE_DIR_PATH}/${REF_ISO_TEMPLATE_TARGET_DIR_NAME}"


	##
	## ## Build Live Config
	##

	REF_BUILD_LIVE_CONFIG_ROOT_DIR_NAME="master-config"
	REF_BUILD_LIVE_CONFIG_ROOT_DIR_PATH="${REF_ISO_PROFILE_DIR_PATH}/${REF_BUILD_LIVE_CONFIG_ROOT_DIR_NAME}"

	REF_BUILD_LIVE_CONFIG_DIR_NAME="common"
	REF_BUILD_LIVE_CONFIG_DIR_PATH="${REF_BUILD_LIVE_CONFIG_ROOT_DIR_PATH}/${REF_BUILD_LIVE_CONFIG_DIR_NAME}"

	##
	## ## Build Live Config / Factory Overlay
	##

	REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_NAME="overlay"
	REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_PATH="${REF_PLAN_FACTORY_DIR_PATH}/${REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_NAME}"

	REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_NAME="includes.chroot_before_packages"
	REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_PATH="${REF_BUILD_LIVE_CONFIG_DIR_PATH}/${REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_NAME}"



	##
	## ## Build Live Config / Overlay
	##

	REF_SOURCE_OVERLAY_MASTER_OS_DIR_NAME="overlay"
	REF_SOURCE_OVERLAY_MASTER_OS_DIR_PATH="${REF_PLAN_ASSET_DIR_PATH}/${REF_SOURCE_OVERLAY_MASTER_OS_DIR_NAME}"

	REF_TARGET_OVERLAY_MASTER_OS_DIR_NAME="includes.chroot_after_packages"
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
	## ## Target OS / Path
	##

	util_debug_echo
	util_debug_echo "REF_TARGET_OS_ROOT_DIR_NAME=${REF_TARGET_OS_ROOT_DIR_NAME}"
	util_debug_echo "REF_TARGET_OS_ROOT_DIR_PATH=${REF_TARGET_OS_ROOT_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_TARGET_OS_ARCHIVE_FILE_NAME=${REF_TARGET_OS_ARCHIVE_FILE_NAME}"
	util_debug_echo "REF_TARGET_OS_ARCHIVE_FILE_PATH=${REF_TARGET_OS_ARCHIVE_FILE_PATH}"


	##
	## ## Target OS / debootstrap args
	##

	util_debug_echo
	util_debug_echo "DEFAULT_BUILD_SUITE=${DEFAULT_BUILD_SUITE}"
	util_debug_echo "REF_BUILD_SUITE=${REF_BUILD_SUITE}"

	util_debug_echo
	util_debug_echo "DEFAULT_PACKAGE_REPO_URL=${DEFAULT_PACKAGE_REPO_URL}"
	util_debug_echo "REF_PACKAGE_REPO_URL=${REF_PACKAGE_REPO_URL}"

	util_debug_echo
	util_debug_echo "DEFAULT_BUILD_INCLUDE=${DEFAULT_BUILD_INCLUDE}"
	util_debug_echo "REF_BUILD_INCLUDE=${REF_BUILD_INCLUDE}"


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
	## ## ISO Template / Path
	##

	util_debug_echo
	util_debug_echo "REF_ISO_TEMPLATE_SOURCE_DIR_NAME=${REF_ISO_TEMPLATE_SOURCE_DIR_NAME}"
	util_debug_echo "REF_ISO_TEMPLATE_SOURCE_DIR_PATH=${REF_ISO_TEMPLATE_SOURCE_DIR_PATH}"

	util_debug_echo
	util_debug_echo "REF_ISO_TEMPLATE_TARGET_DIR_NAME=${REF_ISO_TEMPLATE_TARGET_DIR_NAME}"
	util_debug_echo "REF_ISO_TEMPLATE_TARGET_DIR_PATH=${REF_ISO_TEMPLATE_TARGET_DIR_PATH}"





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
## ## Target OS / Util
##

core_chroot_package_control () {

	core_chroot_run apt "$@"

}

core_chroot_run () {

	local rootfs="${REF_TARGET_OS_ROOT_DIR_PATH}"

	local i=1

	for i in {1..5}; do

		sudo env DEBIAN_FRONTEND=noninteractive chroot "${rootfs}" "${@}"

		if [[ $? == 0 ]]; then
			break
		fi

		sleep 1

	done

}

endeavouros_target_os_mount_for_chroot () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Mount For Chroot"
	util_error_echo "##"
	util_error_echo

	local rootfs="${REF_TARGET_OS_ROOT_DIR_PATH}"

	core_target_os_mount_for_chroot "${rootfs}"

}

core_target_os_mount_for_chroot () {

	local rootfs="${1}"

	mount --bind /dev "${rootfs}/dev"
	mount --bind /run  "${rootfs}/run"
	#mount --bind /media  "${rootfs}/media"
	mount -t devpts devpts "${rootfs}/dev/pts"
	mount -t sysfs sysfs "${rootfs}/sys"
	mount -t proc proc "${rootfs}/proc"
	mount -t tmpfs tmpfs  "${rootfs}/dev/shm"
	mount --bind /tmp "${rootfs}/tmp"

	return 0
}

endeavouros_target_os_unmount_for_chroot () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Unmount For Chroot"
	util_error_echo "##"
	util_error_echo

	local rootfs="${REF_TARGET_OS_ROOT_DIR_PATH}"

	core_target_os_unmount_for_chroot "${rootfs}"

}

core_target_os_unmount_for_chroot () {

	local rootfs="${1}"

	#umount "${rootfs}/sys/firmware/efi/efivars"
	umount "${rootfs}/sys"
	umount "${rootfs}/dev/pts"
	umount "${rootfs}/dev/shm"
	umount "${rootfs}/dev"

	umount "${rootfs}/run"
	#umount "${rootfs}/media"
	umount "${rootfs}/proc"
	umount "${rootfs}/tmp"

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
	util_error_echo pacman -S --needed --noconfirm archiso mkinitcpio-archiso git squashfs-tools
	util_error_echo
	pacman -S --needed --noconfirm archiso mkinitcpio-archiso git squashfs-tools

	util_error_echo



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

	msg_master_args

	endeavouros_build_iso_develop_test_prototype

}

endeavouros_build_iso_develop_test_prototype () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_build_iso_develop_test_prototype"
	util_error_echo "##"
	util_error_echo


	#endeavouros_build_iso_package_required


	#endeavouros_build_iso_create

	#endeavouros_build_iso_overlay




	return 0
}


endeavouros_build_iso_steps () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run / endeavouros_build_iso_steps"
	util_error_echo "##"
	util_error_echo


	msg_master_args


	endeavouros_build_iso_package_required


	endeavouros_build_iso_create


	return 0
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
	util_error_echo mkdir -p "${work_dir_path}"
	util_error_echo
	mkdir -p "${work_dir_path}"


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

		endeavouros_target_os_unmount_for_chroot

		util_error_echo
		util_error_echo rm -rf "${iso_profile_dir_path}"
		util_error_echo
		rm -rf "${iso_profile_dir_path}"



	fi


	util_error_echo
	util_error_echo git clone "${iso_profile_repo_git_url}" "${iso_profile_dir_path}"
	util_error_echo
	git clone "${iso_profile_repo_git_url}" "${iso_profile_dir_path}"


	return 0
}


##
## ## Endeavouros / Build ISO / Overlay
##

endeavouros_build_iso_overlay () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Build ISO / Overlay"
	util_error_echo "##"
	util_error_echo

	endeavouros_factory_master_os_file_overlay

	endeavouros_master_os_file_overlay

	endeavouros_master_os_package_overlay

	endeavouros_master_os_installer_overlay

	endeavouros_live_build_config_hook_overlay





	return 0
}


##
## ## Endeavouros / Master OS / Factory Overlay
##

endeavouros_factory_master_os_file_overlay () {


	local source_dir_path="${REF_SOURCE_FACTORY_OVERLAY_MASTER_OS_DIR_PATH}"
	local target_dir_path="${REF_TARGET_FACTORY_OVERLAY_MASTER_OS_DIR_PATH}"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Master OS / Factory Overlay"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo mkdir -p "${source_dir_path}"
	mkdir -p "${source_dir_path}"


	util_error_echo
	util_error_echo mkdir -p "${target_dir_path}"
	mkdir -p "${target_dir_path}"


	util_error_echo
	util_error_echo cp -rf "${source_dir_path}/." "${target_dir_path}"
	cp -rf "${source_dir_path}/." "${target_dir_path}"


	return 0
}


##
## ## Endeavouros / Master OS / Overlay
##

endeavouros_master_os_file_overlay () {


	local source_dir_path="${REF_SOURCE_OVERLAY_MASTER_OS_DIR_PATH}"
	local target_dir_path="${REF_TARGET_OVERLAY_MASTER_OS_DIR_PATH}"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Master OS / Overlay"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo mkdir -p "${source_dir_path}"
	mkdir -p "${source_dir_path}"


	util_error_echo
	util_error_echo mkdir -p "${target_dir_path}"
	mkdir -p "${target_dir_path}"


	util_error_echo
	util_error_echo cp -rf "${source_dir_path}/." "${target_dir_path}"
	cp -rf "${source_dir_path}/." "${target_dir_path}"


	return 0
}


##
## ## Endeavouros / Master OS / Package
##

endeavouros_master_os_package_overlay () {


	local source_dir_path="${REF_SOURCE_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_PATH}"
	local target_dir_path="${REF_TARGET_OVERLAY_MASTER_PACKAGE_INSTALL_DIR_PATH}"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Master OS / Package"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo mkdir -p "${source_dir_path}"
	mkdir -p "${source_dir_path}"


	util_error_echo
	util_error_echo mkdir -p "${target_dir_path}"
	mkdir -p "${target_dir_path}"


	util_error_echo
	util_error_echo cp -rf "${source_dir_path}/." "${target_dir_path}"
	cp -rf "${source_dir_path}/." "${target_dir_path}"


	return 0
}


##
## ## Endeavouros / Master OS / Installer
##

endeavouros_master_os_installer_overlay () {


	local source_dir_path="${REF_SOURCE_OVERLAY_MASTER_INSTALLER_DIR_PATH}"
	local target_dir_path="${REF_TARGET_OVERLAY_MASTER_INSTALLER_DIR_PATH}"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Master OS / Installer"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo mkdir -p "${source_dir_path}"
	mkdir -p "${source_dir_path}"


	util_error_echo
	util_error_echo mkdir -p "${target_dir_path}"
	mkdir -p "${target_dir_path}"


	util_error_echo
	util_error_echo cp -rf "${source_dir_path}/." "${target_dir_path}"
	cp -rf "${source_dir_path}/." "${target_dir_path}"


	return 0
}


##
## ## Endeavouros / Live Build Config / Hook
##

endeavouros_live_build_config_hook_overlay () {


	local source_dir_path="${REF_SOURCE_OVERLAY_MASTER_HOOK_DIR_PATH}"
	local target_dir_path="${REF_TARGET_OVERLAY_MASTER_HOOK_DIR_PATH}"

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Endeavouros / Master OS / Hook"
	util_error_echo "##"
	util_error_echo


	util_error_echo
	util_error_echo mkdir -p "${source_dir_path}"
	mkdir -p "${source_dir_path}"


	util_error_echo
	util_error_echo mkdir -p "${target_dir_path}"
	mkdir -p "${target_dir_path}"


	util_error_echo
	util_error_echo cp -rf "${source_dir_path}/." "${target_dir_path}"
	cp -rf "${source_dir_path}/." "${target_dir_path}"


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

	local build_arch="${REF_BUILD_ARCH}"
	local build_respin="${REF_BUILD_RESPIN}"
	local build_agent_args='-v .'
	local build_agent_file_name="mkarchiso"
	local build_agent="./${build_agent_file_name}"
	local build_agent_file_path="${iso_profile_dir_path}/${build_agent_file_name}"





	##
	## ## iso build head
	##
	util_error_echo
	util_error_echo cd "${iso_profile_dir_path}"
	cd "${iso_profile_dir_path}"


	##
	## ## iso build start
	##
	util_error_echo
	util_error_echo "${build_agent} ${build_agent_args}"
	util_error_echo
	#"${build_agent}" ${build_agent_args} 2>&1 | tee "eosiso_$(date -u +'%Y.%m.%d-%H:%M').log"
	#./mkarchiso -v "." 2>&1 | tee "eosiso_$(date -u +'%Y.%m.%d-%H:%M').log"
	#"${build_agent}" ${build_agent_args}
	run_and_log ${build_agent} ${build_agent_args}




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
	#endeavouros_build_iso_prepare


	##
	## ## overlay
	##
	#endeavouros_build_iso_overlay


	##
	## ## create iso
	##
	endeavouros_build_iso_archive


	return 0
}


##
## ## Endeavouros / Build ISO / Start
##

endeavouros_build_iso_start () {

	main_signal_bind

	limit_root_user_required


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
## ## Limit / Root User Required
##

limit_root_user_required () {

	if [[ "${EUID}" == 0 ]]; then

		return 0

	else

		util_error_echo
		util_error_echo "##"
		util_error_echo "## ## Root User Required"
		util_error_echo "##"

		util_error_echo
		util_error_echo "> Please Run As Root"
		util_error_echo
		util_error_echo "Example: sudo ./${REF_CMD_FILE_NAME}"
		util_error_echo

		#sleep 2
		exit 0
	fi

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
## ## Msg / Help / Respin
##

msg_help_build_respin_required () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Build Respin Required"
	util_error_echo "##"

	util_error_echo
	msg_usage_body_main
	util_error_echo

}

msg_help_build_respin_not_supported () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Build Respin Not Supported"
	util_error_echo "##"

	util_error_echo
	msg_usage_body_main
	util_error_echo

}


##
## ## Msg / Help / Arch
##

msg_help_build_arch_not_supported () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Build Arch Not Supported"
	util_error_echo "##"

	util_error_echo
	msg_usage_body_arch
	util_error_echo

}


##
## ## Msg / Help / Locale
##

msg_help_build_locale_not_supported () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Build Locale Not Supported"
	util_error_echo "##"

	util_error_echo
	msg_usage_body_locale
	util_error_echo

}


##
## ## Msg / Body
##

msg_usage_body_main () {


	util_error_echo "> Build Respin Options: ${REF_BUILD_RESPIN_OPTION_LIST}"
	util_error_echo
	util_error_echo "SYNOPSIS : sudo ./${REF_CMD_FILE_NAME} [build_respin]"
	util_error_echo
	util_error_echo "Example  : sudo ./${REF_CMD_FILE_NAME}"
	util_error_echo
	util_error_echo "Example  : sudo ./${REF_CMD_FILE_NAME} xfce"
	util_error_echo
	util_error_echo "Example  : sudo ./${REF_CMD_FILE_NAME} kde"
	util_error_echo
	util_error_echo "Example  : sudo ./${REF_CMD_FILE_NAME} gnome"


	return 0
}

msg_usage_body_locale () {


	util_error_echo "> Build Locale Options: ${REF_BUILD_LOCALE_OPTION_LIST}"
	util_error_echo
	util_error_echo "SYNOPSIS : sudo REF_BUILD_LOCALE=zh_tw ./${REF_CMD_FILE_NAME} [build_respin]"
	util_error_echo
	util_error_echo "Example  : sudo REF_BUILD_LOCALE=zh_tw ./${REF_CMD_FILE_NAME} xfce"
	util_error_echo
	util_error_echo "Example  : sudo REF_BUILD_LOCALE=zh_tw ./${REF_CMD_FILE_NAME}"
	util_error_echo
	util_error_echo "Example  : sudo REF_BUILD_LOCALE=ez_cn ./${REF_CMD_FILE_NAME}"


	return 0
}

msg_usage_body_arch () {


	util_error_echo "> Build Arch Options: ${REF_BUILD_ARCH_OPTION_LIST}"
	util_error_echo
	util_error_echo "SYNOPSIS : sudo REF_BUILD_ARCH=amd64 ./${REF_CMD_FILE_NAME} [build_respin]"
	util_error_echo
	util_error_echo "Example  : sudo REF_BUILD_ARCH=amd64 ./${REF_CMD_FILE_NAME} xfce"
	util_error_echo
	util_error_echo "Example  : sudo REF_BUILD_ARCH=amd64 ./${REF_CMD_FILE_NAME}"
	util_error_echo
	util_error_echo "Example  : sudo REF_BUILD_ARCH=arm64 ./${REF_CMD_FILE_NAME}"


	return 0
}


##
## ## Msg / Args
##

msg_master_args () {

	util_error_echo
	util_error_echo "Build: REF_BUILD_RESPIN=${REF_BUILD_RESPIN}"
	util_error_echo "Build: REF_BUILD_LOCALE=${REF_BUILD_LOCALE}"
	util_error_echo "Build: REF_BUILD_ARCH=${REF_BUILD_ARCH}"
	util_error_echo

	return 0
}


##
## ## Master / Args
##

master_arg_build_arch () {

	util_debug_echo

	if [[ -z "${REF_BUILD_ARCH}" ]]; then
		REF_BUILD_ARCH="${DEFAULT_BUILD_ARCH}"
	fi


	local not_allowed="true"
	local allow_build_arch=""

	for allow_build_arch in ${REF_BUILD_ARCH_OPTION_LIST}; do

		if [[ "${allow_build_arch}" == "${REF_BUILD_ARCH}" ]]; then

			util_debug_echo "allow_build_arch=${allow_build_arch}"
			not_allowed="false"
			break;

		fi

	done


	if [[ "${not_allowed}" == "true" ]]; then
		util_debug_echo "Var: REF_BUILD_ARCH=${REF_BUILD_ARCH}"

		msg_help_build_arch_not_supported

		util_error_echo "Arg: 1=${1}"
		util_error_echo "Var: REF_BUILD_ARCH=${REF_BUILD_ARCH}"
		exit;
	fi


	util_debug_echo "Var: REF_BUILD_ARCH=${REF_BUILD_ARCH}"

	return 0
}


##
## ## Master / Opts
##

master_arg_build_locale () {

	util_debug_echo


	if [[ -z "${REF_BUILD_LOCALE}" ]]; then
		REF_BUILD_LOCALE="${DEFAULT_BUILD_LOCALE}"
	fi


	local not_allowed="true"
	local allow_build_locale=""

	for allow_build_locale in ${REF_BUILD_LOCALE_OPTION_LIST}; do

		if [[ "${allow_build_locale}" == "${REF_BUILD_LOCALE}" ]]; then

			util_debug_echo "allow_build_locale=${allow_build_locale}"
			not_allowed="false"
			break;

		fi

	done


	if [[ "${not_allowed}" == "true" ]]; then

		util_debug_echo "Var: REF_BUILD_LOCALE=${REF_BUILD_LOCALE}"

		msg_help_build_locale_not_supported

		util_error_echo "Var: REF_BUILD_LOCALE=${REF_BUILD_LOCALE}"
		exit;

	fi


	util_debug_echo "Var: REF_BUILD_LOCALE=${REF_BUILD_LOCALE}"

	return 0
}

master_arg_build_respin () {


	util_debug_echo
	util_debug_echo "Arg: 1=${1}"

	REF_BUILD_RESPIN="${1}"


	if [[ -z "${REF_BUILD_RESPIN}" ]]; then
		REF_BUILD_RESPIN="${DEFAULT_BUILD_RESPIN}"
	fi


	local not_allowed="true"
	local allow_build_respin=""

	for allow_build_respin in ${REF_BUILD_RESPIN_OPTION_LIST}; do

		if [[ "${allow_build_respin}" == "${REF_BUILD_RESPIN}" ]]; then

			util_debug_echo "allow_build_respin=${allow_build_respin}"
			not_allowed="false"
			break;

		fi

	done


	if [[ "${not_allowed}" == "true" ]]; then

		util_debug_echo "Var: REF_BUILD_RESPIN=${REF_BUILD_RESPIN}"

		msg_help_build_respin_not_supported

		util_error_echo "Var: REF_BUILD_RESPIN=${REF_BUILD_RESPIN}"
		exit;

	fi


	util_debug_echo "Var: REF_BUILD_RESPIN=${REF_BUILD_RESPIN}"

	return 0
}










##
## ## Main / Args
##

_main_check_args_size_ () {

	local args_size="${1}"

	if [[ ${1} -le 0 ]]; then

		msg_help_build_respin_required

		exit 1

	fi

}

_main_init_args_ () {

	##
	## Example: `sudo ./steps.sh amd64`
	##

	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Args / Init"
	util_debug_echo "##"


	##
	## ## Args / Init
	##

	master_arg_build_arch "${@}"

	master_arg_build_locale "${@}"

	master_arg_build_respin "${@}"






	##
	## ## Args / Variable / Dump Again
	##

	#util_debug_echo
	#util_debug_echo "##"
	#util_debug_echo "## ## Args / Dump After Init"
	#util_debug_echo "##"

	#args_var_dump


	##
	## ## Model / Variable / Init
	##

	#model_var_init
	#model_var_dump


	##
	## ## Master / Variable / Init
	##

	#master_var_init
	#master_var_dump





	util_debug_echo

	return 0
}




##
## ## Main / Start
##

__main__ () {

	model_start "${@}"

}

#_main_check_args_size_ "${#}"

_main_init_args_ "${@}"

__main__ "${@}"
