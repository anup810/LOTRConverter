//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Anup Saud on 2024-07-12.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            //background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)

                
                //Currency icons
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
                    ForEach(Currency.allCases){ currency in
                        CurrencyIcon(currencyIconImage: currency.image, currencyText: currency.name)
                        
                    }
     
                }
            
                

                
                //Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                //Currency icons
                
                //Done Button
                Button("Done"){
                    dismiss()
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }.padding()
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}
