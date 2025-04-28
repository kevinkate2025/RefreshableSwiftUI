import SwiftUI
import MJRefresh

public struct RefreshableView<Header: MJRefreshHeader, Footer: MJRefreshFooter, Content: View> {
    private var header: Header.Type?
    private var footer: Footer.Type?
    private var content: Content
    
    public typealias HeaderRefreshAction = (_ sender: Header) -> Void
    public typealias FooterRefreshAction = (_ sender: Footer) -> Void
    
    private var headerAction: HeaderRefreshAction?
    private var footerAction: FooterRefreshAction?
    
    public init(header: Header.Type? = nil, footer: Footer.Type? = nil, headerAction: HeaderRefreshAction? = nil, footerAction: FooterRefreshAction? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.header = header
        self.footer = footer
        self.headerAction = headerAction
        self.footerAction = footerAction
        self.content = content()
    }
}

extension RefreshableView: UIViewRepresentable {
    public func makeUIView(context: Context) -> UIScrollView {
        let uiView = UIScrollView()
        uiView.showsVerticalScrollIndicator = false
        uiView.alwaysBounceVertical = true
        
        if let header = header {
            uiView.mj_header = header.init { [weak uiView] in
                guard let uiView = uiView,
                      let mj_header = uiView.mj_header as? Header,
                      let headerAction = headerAction else {
                    return
                }
                headerAction(mj_header)
            }
        }
        
        if let footer = footer {
            uiView.mj_footer = footer.init { [weak uiView] in
                guard let uiView = uiView,
                      let mj_footer = uiView.mj_footer as? Footer ,
                      let footerAction = footerAction else {
                    return
                }
                footerAction(mj_footer)
            }
        }
        return uiView
    }
    
    public func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
        if let hosting = context.coordinator.hosting {
            hosting.view.removeFromSuperview()
        }
        
        let hosting = UIHostingController(rootView: content)
        context.coordinator.hosting = hosting
        uiView.addSubview(hosting.view)
    }
    
    public func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIScrollView, context: Context) -> CGSize? {
        guard let width = proposal.width,
              let height = proposal.height else {
            return nil
        }
        
        let size = CGSizeMake(width, height)
        uiView.frame = CGRect(origin: .zero, size: size)
        
        guard let hosting = context.coordinator.hosting else {
            uiView.contentSize = .zero
            return size
        }
        
        
        let contentSize = hosting.view.intrinsicContentSize
        
        hosting.view.frame = CGRect(origin: .zero, size: CGSize(width: width, height: contentSize.height))
        uiView.contentSize = contentSize
        
        // 上拉加载如果有更多内容就向上稍微滚动一点
        if contentSize.height > height + uiView.contentOffset.y {
            let offsetY = min(contentSize.height - height, uiView.contentOffset.y + 44)
            uiView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)
        }
        return size
    }
    
    public class Coordinator: NSObject {
        var hosting: UIHostingController<Content>?
        
        @objc func headerRefreshAction(_ sender: MJRefreshHeader) {
            
        }
    }
    public func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}
