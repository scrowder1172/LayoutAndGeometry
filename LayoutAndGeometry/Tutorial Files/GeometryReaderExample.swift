//
//  GeometryReaderExample.swift
//  LayoutAndGeometry
//
//  Created by SCOTT CROWDER on 2/26/24.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        VStack{
            GeometryReader{ geometryProxy in
                Image(.road)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometryProxy.size.width * 0.8)
                    .frame(width: geometryProxy.size.width, height: geometryProxy.size.height)
            }
            .padding(.leading)
            .offset(x: 10, y: 100)
        }
    }
}

#Preview {
    GeometryReaderExample()
}
