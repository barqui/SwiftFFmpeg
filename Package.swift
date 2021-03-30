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
      type: .dynamic,
      targets: ["SwiftFFmpeg"]),
//    .library(
//      name: "CFFmpeg",
//      type: .dynamic,
//      targets: ["CFFmpeg"]),
    
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
//      path: "" ,
      exclude: [
        "xcframework",
        "Supporting Files/Info.plist",
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
      path: "./xcodeframework/avcodec.xcframework"
    ),
    .binaryTarget(
      name: "avdevice",
      path: "./xcodeframework/avdevice.xcframework"
    ),
    .binaryTarget(
      name: "avfilter",
      path: "./xcodeframework/avfilter.xcframework"
    ),
    .binaryTarget(
      name: "avformat",
      path: "./xcodeframework/avformat.xcframework"
    ),
    .binaryTarget(
      name: "avutil",
      path: "./xcodeframework/avutil.xcframework"
    ),
    .binaryTarget(
      name: "swresample",
      path: "./xcodeframework/swresample.xcframework"
    ),
    .binaryTarget(
      name: "swscale",
      path: "./xcodeframework/swscale.xcframework"
    ),
  ]
)
