// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftFFmpeg",
  platforms: [.iOS(.v9), .tvOS(.v10)],
  products: [
    .library(
      name: "SwiftFFmpeg",
      targets: ["SwiftFFmpeg"]
    )
  ],
  targets: [
    .target(
      name: "SwiftFFmpeg",
      dependencies: ["CFFmpeg"]
    ),
    .target(
      name: "CFFmpeg",
      dependencies: [
        "avcodec",
        "avdevice",
        "avfilter",
        "avformat",
        "avutil",
        "swresample",
        "swscale",
      ],
      linkerSettings: [
        .linkedLibrary("z"),
        .linkedLibrary("bz2"),
        .linkedLibrary("iconv"),
        .linkedLibrary("lzma"),
        .linkedFramework("Security"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreVideo"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("VideoToolbox"),
        .linkedFramework("CoreImage"),
      ]
    ),
    .binaryTarget(
      name: "avcodec",
      url: "https://github.com/barqui/SwiftFFmpeg/blob/master/xcframework/avcodec.zip?raw=true",
      checksum: "6a1af9fda24dbc5bd70a40751c3c14a735158e2fbc819e77c4be6365290e187f"
    ),
    .binaryTarget(
      name: "avdevice",
      url:
        "https://github.com/barqui/SwiftFFmpeg/blob/master/xcframework/avdevice.zip?raw=true",
      checksum: "bbe7b60598bc042cbbb4175e6b9094d38b45ff0112944f9382e2c195c8b45668"
    ),
    .binaryTarget(
      name: "avfilter",
      url:
        "https://github.com/barqui/SwiftFFmpeg/blob/master/xcframework/avfilter.zip?raw=true",
      checksum: "024ea1fd7bde742976ef622ca9929348a0995e675156b5bf55b02047c4a1c278"
    ),
    .binaryTarget(
      name: "avformat",
      url:
        "https://github.com/barqui/SwiftFFmpeg/blob/master/xcframework/avformat.zip?raw=true",
      checksum: "ce9e702af7d69edca0e75d981917ca8f12b5aeff8b309cb5261ecf295c528043"
    ),
    .binaryTarget(
      name: "avutil",
      url: "https://github.com/barqui/SwiftFFmpeg/blob/master/xcframework/avutil.zip?raw=true",
      checksum: "86802134cb419806728445da5c09688361c22269d89274832f01d62687ae1ca2"
    ),
    .binaryTarget(
      name: "swresample",
      url:
        "https://github.com/barqui/SwiftFFmpeg/blob/master/xcframework/swresample.zip?raw=true",
      checksum: "e69b84deab30aabf4c94122c03aef1e3281178922423129a0b1e21ee9d6804a0"
    ),
    .binaryTarget(
      name: "swscale",
      url: "https://github.com/barqui/SwiftFFmpeg/blob/master/xcframework/swscale.zip?raw=true",
      checksum: "87f1f7627c558201ee9879bb709d12c0bfe929d29de26e27d0b92acca688d125"
    ),
    .target(
      name: "SwiftFFmpegExamples",
      dependencies: ["SwiftFFmpeg"]
    ),
    .testTarget(
      name: "SwiftFFmpegTests",
      dependencies: ["SwiftFFmpeg"]
    ),
  ]
)
