imports = \
	@testable import OvertureTests;

xcodeproj:
	swift package generate-xcodeproj --xcconfig-overrides=Development.xcconfig

linux-main:
	sourcery \
		--sources ./Tests/ \
		--templates ./.sourcery-templates/ \
		--output ./Tests/ \
		--args testimports='$(imports)' \
		&& mv ./Tests/LinuxMain.generated.swift ./Tests/LinuxMain.swift

test-linux: linux-main
	docker build --tag overture-testing . \
		&& docker run --rm overture-testing

test-macos:
	set -o pipefail && \
	xcodebuild test \
		-scheme Overture-Package \
		-destination platform="macOS" \
		| xcpretty

test-ios:
	set -o pipefail && \
	xcodebuild test \
		-scheme Overture-Package \
		-destination platform="iOS Simulator,name=iPhone 8,OS=11.3" \
		| xcpretty

test-swift:
	swift test

test-all: test-linux test-macos test-ios
