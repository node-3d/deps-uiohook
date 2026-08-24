set -euo pipefail

(
	cd src/libuiohook/build

	toolset_args=()
	if [[ -n "${CMAKE_TOOLSET:-}" ]]; then
		toolset_args=(-T "$CMAKE_TOOLSET")
	fi

	MSYS_NO_PATHCONV=1 cmake -A "${BUILD_PLATFORM:-x64}" "${toolset_args[@]}" \
		-DCMAKE_POLICY_DEFAULT_CMP0091=NEW  \
		-DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded" \
		-DBUILD_SHARED_LIBS=OFF \
		-DBUILD_DEMO=OFF \
		-DCMAKE_INSTALL_PREFIX=../installed \
		-S ..
	
	cmake --build . --config Release
	
	# Use install to fetch INCLUDES
	cmake --install . --config Release
)

cp src/libuiohook/installed/lib/uiohook.lib src/build/uiohook.lib
