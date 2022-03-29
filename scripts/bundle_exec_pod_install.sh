#!/bin/bash
set -eo pipefail

# used: ./bundle_exec_pod_install.sh [-uv/-v/-u]

clear 

echo -e "当前 CocoaPods 版本： $(pod --version)"

PROJECT_DIR="$(dirname "$PWD")"
echo -e "项目资源目录: \n${PROJECT_DIR}"

pushd "$PROJECT_DIR"


if [[ $# > 1 ]]; then
	echo -e "只接受一个参数，你却传了： $# 个！"
	popd
	exit 1
fi

if [[ $# -eq 0 ]]; then
	bundle exec pod install --no-repo-update
	popd
	exit 0
fi

while [ -n "$1" ]  
do  
	case "$1" in   
		-uv)
			echo "发现 -uv 参数"  
			bundle exec pod install --repo-update --verbose
		;;
		-v)  
			echo "发现 -v 参数"  
			bundle exec pod install --no-repo-update --verbose
		;;
		-u)
			echo "发现 -u 参数"
			bundle exec pod install --repo-update
		;;
		*)
			echo "参数错误： $1 "
			bundle exec pod install --no-repo-update
		;;  
	esac  
	shift  
done

popd