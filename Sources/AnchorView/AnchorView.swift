//
//  AnchorView.swift
//  
//
//  Created by DeShawn Jackson on 7/9/21.
//

import SwiftUI

struct AnchorView_Previews: PreviewProvider {
    static var previews: some View {
        Text("AnchorView")
            .font(.title)
            .anchorView(AnchorViewSample(orientation: .horizontal, anchor: .top))
            .anchorView(AnchorViewSample(orientation: .vertical, anchor: .trailing))
            .anchorView(AnchorViewSample(orientation: .horizontal, anchor: .bottom))
            .anchorView(AnchorViewSample(orientation: .vertical, anchor: .leading))
    }
    
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
}

public struct AnchorView: View {
    
    public let anchorView: AnyView
    public let content: () -> AnyView
    public let anchor: Anchor
    
    public init<AnchorView: AnchorViewProtocol, Content: View>(
        @ViewBuilder anchorView: @escaping () -> AnchorView,
        @ViewBuilder content: @escaping () -> Content
    ) {
        let anchorView = anchorView()
        self.anchor = anchorView.anchor
        self.anchorView = AnyView(anchorView)
        self.content = { AnyView(content()) }
    }
    
    public init<AnchorView: View, Content: View>(
        @ViewBuilder anchorView: @escaping () -> AnchorView,
        anchor: Anchor,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.anchor = anchor
        self.anchorView = AnyView(anchorView())
        self.content = { AnyView(content()) }
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            switch anchor {
            case .top: topAnchor
            case .bottom: bottomAnchor
            case .leading: leadingAnchor
            case .trailing: trailingAnchor
            }
        }
    }
    
    var topAnchor: some View {
        VStack(spacing: 0) {
            anchorView
            Spacer(minLength: 0)
            content()
            Spacer(minLength: 0)
        }
    }
    
    var bottomAnchor: some View {
        VStack(spacing: 0) {
            content()
            Spacer(minLength: 0)
            anchorView
            Spacer(minLength: 0)
        }
    }
    
    var leadingAnchor: some View {
        HStack(spacing: 0) {
            anchorView
            Spacer(minLength: 0)
            content()
            Spacer(minLength: 0)
        }
    }
    
    var trailingAnchor: some View {
        HStack(spacing: 0) {
            content()
            Spacer(minLength: 0)
            anchorView
            Spacer(minLength: 0)
        }
    }
}

