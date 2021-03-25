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
      path: "./xcframework/libavcodec.framework"
    ),
    .binaryTarget(
      name: "avdevice",
      path: "./xcframework/libavdevice.framework"
    ),
    .binaryTarget(
      name: "avfilter",
      path: "./xcframework/libavfilter.framework"
    ),
    .binaryTarget(
      name: "avformat",
      path: "./xcframework/libavformat.framework"
    ),
    .binaryTarget(
      name: "avutil",
      path: "./xcframework/libavutil.framework"
    ),
    .binaryTarget(
      name: "swresample",
      path: "./xcframework/libswresample.framework"
    ),
    .binaryTarget(
      name: "swscale",
      path: "./xcframework/libswscale.framework"
    ),
  ]
)
