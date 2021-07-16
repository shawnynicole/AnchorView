//
//  View+.swift
//  
//
//  Created by DeShawn Jackson on 7/15/21.
//

import SwiftUI

extension View {
    
    public func anchorView<AnchoredView: AnchorViewProtocol>(_ anchorView: AnchoredView) -> some View {
        AnchorView(anchorView: { anchorView }, content: { self })
    }
    
    public func anchorView<AnchoredView: View>(anchor: Anchor, anchorView: AnchoredView) -> some View {
        AnchorView(anchorView: { anchorView }, anchor: anchor, content: { self })
    }
    
    public func anchorView<AnchoredView: View>(anchor: Anchor, anchorView: @escaping () -> AnchoredView) -> some View {
        AnchorView(anchorView: anchorView, anchor: anchor, content: { self })
    }
}
