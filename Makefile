imports = \
	@testable import OvertureTests;

xcodeproj:
	PF_DEVELOP=1 swift run xcodegen

test-linux: 
	docker build --tag overture-testing . \
		&& docker run --rm overture-testing

linux-main:
	swift test --generate-linuxmain

test-macos:
	set -o pipefail && \
	xcodebuild test \
		-scheme Overture_macOS \
		-destination platform="macOS" \
		| xcpretty

test-ios:
	set -o pipefail && \
	xcodebuild test \
		-scheme Overture_iOS \
		-destination platform="iOS Simulator,name=iPhone XR,OS=12.2" \
		| xcpretty

test-swift: linux-main
	swift test -v

test-all: test-linux test-macos test-ios
