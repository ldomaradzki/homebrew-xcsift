class Xcsift < Formula
  desc "Swift tool to parse xcodebuild output for coding agents"
  homepage "https://github.com/ldomaradzki/xcsift"
  url "https://github.com/ldomaradzki/xcsift/archive/refs/tags/v1.0.18.tar.gz"
  sha256 "264be82c1b22e570a48b373898825fcbd4762b63f6cbac7895a6a26198c96537"
  license "MIT"
  head "https://github.com/ldomaradzki/xcsift.git", branch: "master"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    # Replace version placeholder with actual version from formula
    inreplace "Sources/main.swift", "VERSION_PLACEHOLDER", version.to_s
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xcsift"
  end

  test do
    # Test version flag (version is hardcoded in source, not from git tag)
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/xcsift --version"))

    # Test help flag
    assert_match "A Swift tool to parse xcodebuild output", shell_output("#{bin}/xcsift --help")

    # Test with sample input
    sample_input = "Build succeeded"
    output = pipe_output("#{bin}/xcsift", sample_input)
    assert_match "status", output
    assert_match "summary", output
  end
end
