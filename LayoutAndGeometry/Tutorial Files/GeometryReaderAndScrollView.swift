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
                        let opacityChallenge = minY / 200
                        let scaleChallenge = max(0.5, minY / 400)
                        let hueChallenge = min(1.0, minY / fullView.size.height)
                        
                        Text("Row #\(index)")
//                            .font(.title)
                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
                            .background(Color(hue: hueChallenge, saturation: 1, brightness: 1))
                            .rotation3DEffect(
                                degrees, axis: (x: 0, y: 1, z: 0)
                            )
                            .scaleEffect(scaleChallenge)
                            .opacity(opacityChallenge)
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
