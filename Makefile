imports = \
	@testable import OvertureTests;

xcodeproj:
	PF_DEVELOP=1 swift run xcodegen

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
		-scheme Overture_macOS \
		-destination platform="macOS" \
		| xcpretty

test-ios:
	set -o pipefail && \
	xcodebuild test \
		-scheme Overture_iOS \
		-destination platform="iOS Simulator,name=iPhone XR,OS=12.2" \
		| xcpretty

test-swift:
	swift test

test-all: test-linux test-macos test-ios
