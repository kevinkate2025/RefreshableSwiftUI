//
//  ContentView.swift
//  RefreshableSwiftUI_Example
//
//  Created by Kevin on 4/13/25.
//

import SwiftUI
import RefreshableSwiftUI
import MJRefresh

struct ContentView: View {
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
}


#Preview {
    ContentView()
}
