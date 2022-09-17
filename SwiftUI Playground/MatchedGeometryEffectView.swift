//
//  MatchedGeometryEffectView.swift
//  SwiftUI Playground
//
//  Created by Timur Piriev on 17.09.2022.
//

import SwiftUI

struct MatchedGeometryEffectView: View {
    
    @Namespace private var animation
    let avatarId = "avatar"
    let titleId = "title"
    let subtitleId = "subtitle"
    
    @State private var isLarge = false
    
    var body: some View {
        VStack(spacing: 80) {
            Text("Tap on image")
            Group {
                if isLarge {
                    largeView
                } else {
                    compactView
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    isLarge.toggle()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Matched geometry effect")
    }
    
    @ViewBuilder
    var largeView: some View {
        VStack {
            image
                .frame(height: 300)
            titleAndSubtitle
        }
    }
    
    @ViewBuilder
    var compactView: some View {
        HStack(alignment: .top) {
            image
                .frame(width: 150, height: 150)
            VStack(alignment: .leading) {
                titleAndSubtitle
            }
        }
    }
    
    @ViewBuilder
    var image: some View {
        Image("avatar")
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .matchedGeometryEffect(id: avatarId, in: animation)
    }
    
    @ViewBuilder
    var titleAndSubtitle: some View {
        Group {
            Text("John Doe")
                .foregroundColor(.primary)
                .font(.largeTitle)
                .matchedGeometryEffect(id: titleId, in: animation)
            Text("Designer")
                .foregroundColor(.secondary)
                .font(.subheadline)
                .matchedGeometryEffect(id: subtitleId, in: animation)
        }
    }
}

struct MatchedGeometryEffectView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectView()
    }
}
