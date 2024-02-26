//
//  AlignmentGuideExampleView.swift
//  LayoutAndGeometry
//
//  Created by SCOTT CROWDER on 2/26/24.
//

import SwiftUI

struct AlignmentGuideExampleView: View {
    
    var body: some View {
        ScrollView {
            Text("Live long and prosper")
                .frame(width: 300, height: 300, alignment: .topLeading)
                .offset(x: 25, y: 25)
                .border(.black)
            
            Divider()
            Spacer()
            
            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            
            Divider()
            Spacer()
            
            VStack(alignment: .leading) {
                
                Text("Hello, world!")
                    .background(.yellow)
                    .alignmentGuide(.leading) { d in
                        d[.trailing]
                    }
                Text("This is a longer line of text")
                    .background(.green)
                Text("A big bad wolf")
                    .background(.purple)
                    .alignmentGuide(.leading) { _ in
                        50
                    }
            }
            .background(.red)
            .frame(width: 400, height: 400)
            .background(.blue)
            
            Divider()
            Spacer()
            
            VStack(alignment: .leading) {
                ForEach(0..<10) {position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in
                            Double(position) * -10
                        }
                }
            }
        }
    }
}

#Preview {
    AlignmentGuideExampleView()
}
