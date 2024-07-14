//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Anup Saud on 2024-07-12.
//

import SwiftUI
struct ExchangeRateView: View {
    let leftImage: ImageResource
    let text:String
    let rightImage: ImageResource
    var body: some View {
        HStack{
            //left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            //Exchange rate text
            Text(text)
            //right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}
#Preview {
    ExchangeRateView(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpiece)
}
