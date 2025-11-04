class Xcsift < Formula
  desc "Swift tool to parse xcodebuild output for coding agents"
  homepage "https://github.com/ldomaradzki/xcsift"
  url "https://github.com/ldomaradzki/xcsift/archive/refs/tags/v1.0.11.tar.gz"
  sha256 "443fc6801faf93a9c2ada4ce7197f4ef4047d2f1270c41b879336d239bc1097d"
  license "MIT"
  head "https://github.com/ldomaradzki/xcsift.git", branch: "master"

  depends_on xcode: ["12.0", :build]
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
