# AnchorView

**AnchorView** makes ease of creating views that are anchored to the top, bottom, leading, or trailing sides of another view.

<p align="center">
<img src="../assets/screenshot.png?raw=true" alt="Screenshot" width="300" />
</p>

<p align="center">
    <a href="#requirements">Requirements</a> • <a href="#usage">Usage</a> • <a href="#installation">Installation</a> • <a href="#author">Author</a> • <a href="#license-mit">License</a>
</p>

## Requirements

- iOS 13.0+ / Mac OS X 11.0+ / tvOS 13.0+ / watchOS 6.0+
- Xcode 10.2+
- Swift 5.0+

## Usage

```swift

Text(name)
    .font(.title)
    .padding()
    .anchorView(AnchorViewSample(orientation: .horizontal, anchor: .top))
    .anchorView(AnchorViewSample(orientation: .vertical, anchor: .trailing))
    .anchorView(AnchorViewSample(orientation: .horizontal, anchor: .bottom))
    .anchorView(AnchorViewSample(orientation: .vertical, anchor: .leading))
    
struct AnchorViewSample: AnchorViewProtocol {
    
    enum Orientation {
        case horizontal
        case vertical
    }
    
    var orientation: Orientation
    var anchor: Anchor
    
    var body: some View {
        
        switch orientation {
        case .horizontal:
            ZStack {
                color
                HStack(spacing: 0) {
                    content
                }
            }
            .frame(height: 64)
            .edgesIgnoringSafeArea(.all)
        case .vertical:
            ZStack {
                color
                VStack(spacing: 0) {
                    content
                }
            }
            .frame(width: 64)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    var color: some View {
        let color: Color = {
            switch anchor {
            case .top: return .pink
            case .bottom: return .orange
            case .leading: return .yellow
            case .trailing: return .green
            }
        }()
        
        return
            color.edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        
        Group {
            image
            Spacer(minLength: 0)
            image
        }
    }
    
    var image: some View {
        Image(systemName: "star")
            .padding()
    }
}
    
```

## Installation

#### Swift Package Manager
You can use [The Swift Package Manager](https://swift.org/package-manager) to install `AnchorView` by adding the proper description to your `Package.swift` file:
```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/shawnynicole/AnchorView.git", from: "1.0.0")
    ]
)
```
For more information on [Swift Package Manager](https://swift.org/package-manager), checkout its [GitHub Page](https://github.com/apple/swift-package-manager).

#### Manually

[Download](https://github.com/shawnynicole/AnchorView/archive/master.zip) the project and copy the `AnchorView` folder into your project to use it in.

## Author

shawnynicole

## License (MIT)

**AnchorView** is available under the MIT license. See the LICENSE file for more info.
