# libUIOHook binaries and headers

This is a part of [Node3D](https://github.com/node-3d) project.

[![NPM](https://badge.fury.io/js/@node-3d%2Fdeps-uiohook.svg)](https://badge.fury.io/js/@node-3d/deps-uiohook)
[![Lint](https://github.com/node-3d/deps-uiohook/actions/workflows/lint.yml/badge.svg)](https://github.com/node-3d/deps-uiohook/actions/workflows/lint.yml)
[![Test](https://github.com/node-3d/deps-uiohook/actions/workflows/test.yml/badge.svg)](https://github.com/node-3d/deps-uiohook/actions/workflows/test.yml)

```console
npm install @node-3d/deps-uiohook
```

## Binary Provenance

Release binary archives for this package are published by public GitHub Actions
workflows.
When a release asset includes a GitHub Artifact Attestation, you can verify that
the downloaded archive was published by the visible workflow in this repository:

```console
gh release download <tag> -R node-3d/deps-uiohook -p <platform>.gz
gh attestation verify <platform>.gz -R node-3d/deps-uiohook
```

The attestation links the archive to the repository, workflow, commit, and
release build identity. It does not replace review of the source code, workflow,
or third-party library contents.

This dependency package distributes **libUIOHook**
binaries and headers through **npm** for **Node.js** addons.

* Platforms: Windows x64, Linux x64, macOS x64.
* Library: libUIOHook.
* Linking: static lib-type.

See the [libUIOHook repository](https://github.com/kwhat/libuiohook).

See [@node-3d/iohook](https://github.com/node-3d/iohook/tree/master/src/cpp) for
how the libraries may be used in a Node.js addon.


## Legal Notice

This software uses [libUIOHook](https://github.com/kwhat/libuiohook) under LGPL3 license.
A copy of the libUIOHook license is [included](LIBUIOHOOK_LGPL.md),
and can also be found at the
[official repository](https://github.com/kwhat/libuiohook/blob/1.2/COPYING.LESSER.md).
