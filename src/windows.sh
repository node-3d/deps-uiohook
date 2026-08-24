set -euo pipefail

(
	cd src/libuiohook/build

	# libUIOHook 1.2.2 treats the Advapi32 import library as an include path.
	# Link by name instead, so CMake can use the active Windows SDK for x64 and ARM64.
	sed -i 's/find_library(ADVAPI32 Advapi32)/set(ADVAPI32 Advapi32)/; /target_include_directories(uiohook PRIVATE "${ADVAPI32}")/d' ../CMakeLists.txt

	MSYS_NO_PATHCONV=1 cmake -A "${BUILD_PLATFORM:-x64}" \
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
