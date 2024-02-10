//
//  ArrivalImage.swift
//  Test01
//
//  Created by Jiaqi Yi on 2/9/24.
//

import SwiftUI

struct ArrivalImage: View {
    var body: some View {
        Image("Arrival_1").clipShape(Circle()).overlay {
            Circle().stroke(.blue, lineWidth: 40)
        }
    }
}

#Preview {
    ArrivalImage()
}
