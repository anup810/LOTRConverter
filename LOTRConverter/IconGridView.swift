//
//  IconGridView.swift
//  LOTRConverter
//
//  Created by Anup Saud on 2024-07-14.
//

import SwiftUI

struct IconGridView: View {
    @Binding var selectedCurrency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            ForEach(Currency.allCases){ currency in
                if selectedCurrency == currency{

                    CurrencyIcon(currencyIconImage: currency.image, currencyText: currency.name)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .overlay{
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                }

                }else{
                    CurrencyIcon(currencyIconImage: currency.image, currencyText: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
      
            }

        }
    }
}

#Preview {
    IconGridView(selectedCurrency: .constant(.copperPenny))}
