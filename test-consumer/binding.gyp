{
	'variables': {
		'dep_bin': '<!(node -p "require(\'@node-3d/deps-uiohook\').bin")',
		'dep_include': '<!(node -p "require(\'@node-3d/deps-uiohook\').include")',
		'bin': '<!(node -p "require(\'@node-3d/addon-tools\').getBin()")',
	},
	'targets': [{
		'target_name': 'consumer',
		'sources': ['consumer.cpp'],
		'include_dirs': ['<(dep_include)'],
		'library_dirs': ['<(dep_bin)'],
		'conditions': [
			['OS=="linux"', {
				'defines': ['__linux__', 'USE_XKBCOMMON'],
				'libraries': ["-Wl,-rpath,'$$ORIGIN/../../node_modules/@node-3d/deps-uiohook/<(bin)'", '-luiohook', '-lX11', '-lXt', '-lxcb', '-lX11-xcb', '-lxkbcommon', '-lxkbcommon-x11', '-lXtst'],
			}],
			['OS=="mac"', {
				'defines': ['__APPLE__', 'USE_IOKIT=1', 'USE_OBJC=1'],
				'libraries': ['-Wl,-rpath,@loader_path/../../node_modules/@node-3d/deps-uiohook/<(bin)', '-luiohook', '-lobjc', '-framework IOKit', '-framework Carbon', '-framework ApplicationServices'],
			}],
			['OS=="win"', {
				'defines': ['WIN32_LEAN_AND_MEAN', 'VC_EXTRALEAN', '_WIN32', '_HAS_EXCEPTIONS=0'],
				'libraries': ['-luiohook'],
				'msvs_settings': { 'VCCLCompilerTool': { 'RuntimeLibrary': 2, 'AdditionalOptions!': ['/MT'], 'AdditionalOptions': ['/MD'] } },
			}],
		],
	}],
}
