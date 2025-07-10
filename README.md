# Homebrew Tap for xcsift

A Homebrew tap for [xcsift](https://github.com/ldomaradzki/xcsift) - a Swift command-line tool to parse and format xcodebuild output for coding agents.

## Installation

### Option 1: Direct install
```bash
brew install ldomaradzki/xcsift/xcsift
```

### Option 2: Tap then install
```bash
brew tap ldomaradzki/xcsift
brew install xcsift
```

### Option 3: Brewfile
Add to your `Brewfile`:
```ruby
tap "ldomaradzki/xcsift"
brew "xcsift"
```

## Usage

After installation, you can use xcsift to parse xcodebuild output:

```bash
xcodebuild build | xcsift
xcodebuild test | xcsift
swift build | xcsift
```

## About xcsift

xcsift transforms verbose Xcode build output into concise, structured JSON format optimized for coding agents. Unlike `xcbeautify` and `xcpretty` which focus on human-readable output, xcsift prioritizes information density and machine readability.

## Documentation

- [xcsift GitHub Repository](https://github.com/ldomaradzki/xcsift)
- [Homebrew Documentation](https://docs.brew.sh)
