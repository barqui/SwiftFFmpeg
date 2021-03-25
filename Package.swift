// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FFmpegLibrary",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "SwiftFFmpeg",
      targets: ["SwiftFFmpeg"]),
    .library(
      name: "CFFmpeg",
      targets: ["CFFmpeg"]),
  ],
  dependencies: [
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
      path: "./Binary/avcodec.xcframework"
    ),
    .binaryTarget(
      name: "avdevice",
      path: "./Binary/avdevice.xcframework"
    ),
    .binaryTarget(
      name: "avfilter",
      path: "./Binary/avfilter.xcframework"
    ),
    .binaryTarget(
      name: "avformat",
      path: "./Binary/avformat.xcframework"
    ),
    .binaryTarget(
      name: "avutil",
      path: "./Binary/avutil.xcframework"
    ),
    .binaryTarget(
      name: "swresample",
      path: "./Binary/swresample.xcframework"
    ),
    .binaryTarget(
      name: "swscale",
      path: "./Binary/swscale.xcframework"
    ),
  ]
)
