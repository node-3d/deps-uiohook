export MACOSX_DEPLOYMENT_TARGET=13.5

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
