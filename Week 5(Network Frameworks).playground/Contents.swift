Last login: Mon Apr 10 23:25:30 on console

Timothys-MacBook-Pro:~ TimE$ cd Development/InClass/

Timothys-MacBook-Pro:InClass TimE$ cd Leaderboard

Timothys-MacBook-Pro:Leaderboard TimE$ vi package.swift

// swift-tools-version:3.1

import PackageDescription

let package = Package(
name: "Leaderboard",
dependencies: [
.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2),
.Package(url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git", majorVersion: 1)
]
)
~
~
~
~
~
~
~
~
~
~
~
~
(shift colon) :wq

cat Package.swift
swift package generate-xcodeproj
open Leaderboard.xcodeproj/
