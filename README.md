# RefreshableSwiftUI

[![CI Status](https://img.shields.io/travis/kevinkate2025/RefreshableSwiftUI.svg?style=flat)](https://travis-ci.org/kevinkate2025/RefreshableSwiftUI)
[![Version](https://img.shields.io/cocoapods/v/RefreshableSwiftUI.svg?style=flat)](https://cocoapods.org/pods/RefreshableSwiftUI)
[![License](https://img.shields.io/cocoapods/l/RefreshableSwiftUI.svg?style=flat)](https://cocoapods.org/pods/RefreshableSwiftUI)
[![Platform](https://img.shields.io/cocoapods/p/RefreshableSwiftUI.svg?style=flat)](https://cocoapods.org/pods/RefreshableSwiftUI)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

    @State var datas: [Int] = [0]
    
    var body: some View {
        RefreshableView(header: MJRefreshNormalHeader.self, footer: MJRefreshBackNormalFooter.self, headerAction: headerRefreshAction(_:), footerAction: footerRefreshAction(_:)) {
            LazyVStack(spacing: 12) {
                ForEach(datas, id: \.self) { data in
                    Text("\(data)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .background(.red)
                }
            }
        }
    }
    
    func headerRefreshAction(_ sender: MJRefreshHeader) {
        dispatch_queue_t.global().asyncAfter(deadline: .now() + 1) {
            Task { @MainActor in
                await sender.endRefreshing()
                datas = [0, 1, 2, 3, 4, 5, 6, 7, 8]
                //1.有新数据时
            }
        }
    }
    func footerRefreshAction(_ sender: MJRefreshFooter) {
        dispatch_queue_t.global().asyncAfter(deadline: .now() + 1) {
            Task { @MainActor in
                await sender.endRefreshing()
                
                datas += (1...10).map({ (datas.last ?? 0) + $0})
            }
        }
    }

## Installation

RefreshableSwiftUI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RefreshableSwiftUI'
```

## Author

kevinkate2025, kevinkate2025@gmail.com

## License

RefreshableSwiftUI is available under the MIT license. See the LICENSE file for more info.
