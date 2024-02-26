//
//  AbsolutePositioningExample.swift
//  LayoutAndGeometry
//
//  Created by SCOTT CROWDER on 2/26/24.
//

import SwiftUI

struct AbsolutePositioningExample: View {
    var body: some View {
        Text("Absolution Positioning")
            .background(.blue)
            .position(x: 100, y: 100)
            .background(.red)
        
        Spacer()
        
        Text("Relative Positioning")
            .background(.yellow)
            .offset(x: 25, y: -25)
            .background(.black)
        
        Spacer()
    }
}

#Preview {
    AbsolutePositioningExample()
}
