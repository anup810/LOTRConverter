//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Anup Saud on 2024-07-12.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyIconImage: ImageResource
    let currencyText: String
    var body: some View {
        ZStack(alignment: .bottom) {
            //Image
            Image(currencyIconImage)
                .resizable()
                .scaledToFit()
            //Text
            Text(currencyText)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyIconImage: .copperpenny, currencyText: "Copper Penny")
}
