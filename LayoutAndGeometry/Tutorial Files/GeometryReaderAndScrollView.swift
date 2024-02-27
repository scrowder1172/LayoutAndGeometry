//
//  GeometryReaderAndScrollView.swift
//  LayoutAndGeometry
//
//  Created by SCOTT CROWDER on 2/27/24.
//

import SwiftUI

struct GeometryReaderAndScrollView: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader{ fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        
                        let minY = proxy.frame(in: .global).minY
                        let degrees: Angle = Angle.degrees(minY - fullView.size.height / 2) / 5
                        let opacity = 1 - abs(minY - UIScreen.main.bounds.height / 2) / (UIScreen.main.bounds.height / 2)
                        let scaleEffect = 1 + minY / 500
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(
                                degrees, axis: (x: 0, y: 1, z: 0)
                            )
                            .scaleEffect(scaleEffect)
                            .opacity(opacity)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    GeometryReaderAndScrollView()
}
