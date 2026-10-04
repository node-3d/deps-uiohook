export MACOSX_DEPLOYMENT_TARGET=13.5

# libuiohook 1.2.2 overrides CMAKE_OSX_DEPLOYMENT_TARGET with 10.5.
grep -Fq 'set(CMAKE_OSX_DEPLOYMENT_TARGET "10.5")' src/libuiohook/CMakeLists.txt || exit 1
sed -i '' 's/set(CMAKE_OSX_DEPLOYMENT_TARGET "10.5")/set(CMAKE_OSX_DEPLOYMENT_TARGET "13.5")/' src/libuiohook/CMakeLists.txt || exit 1
grep -Fq 'set(CMAKE_OSX_DEPLOYMENT_TARGET "13.5")' src/libuiohook/CMakeLists.txt || exit 1

(
	cd src/libuiohook/build
	
	cmake \
		-DBUILD_SHARED_LIBS=OFF \
		-DBUILD_DEMO=OFF \
		-DCMAKE_OSX_DEPLOYMENT_TARGET=13.5 \
		-DCMAKE_INSTALL_PREFIX=../installed \
		-S ..
	
	cmake --build . --config Release
	
	# Use install to fetch INCLUDES
	cmake --install . --config Release
)

cp src/libuiohook/installed/lib/libuiohook.a src/build/libuiohook.a
