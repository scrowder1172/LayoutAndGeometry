//
//  GeometryReaderFramesAndCoordinates.swift
//  LayoutAndGeometry
//
//  Created by SCOTT CROWDER on 2/26/24.
//

import SwiftUI

struct GeometryReaderFramesAndCoordinates: View {
    var body: some View {
        TabView {
            OuterView()
                .tabItem {
                    Label("Outerview", systemImage: "1.circle")
                }
                .background(.red)
                .coordinateSpace(name: "Custom")
            GeometryReaderFramesExample()
            .tabItem {
                Label("VStack", systemImage: "2.circle")
            }
        }
    }
}

struct GeometryReaderFramesExample: View {
    var body: some View {
        VStack{
            GeometryReader {proxy in
                Text("Hello, world!")
                    .frame(width: proxy.size.width * 0.9)
                    .background(.red)
            }
            .background(.green)
            
            Text("More text")
                .background(.blue)
        }
    }
}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

#Preview {
    GeometryReaderFramesAndCoordinates()
}
