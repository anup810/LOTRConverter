//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Anup Saud on 2024-07-11.
//

import SwiftUI

struct ContentView: View {
   @State var showExchangeInfo:Bool = false
   @State var leftAmount = ""
    @State var rightAmount = ""
    
    var body: some View {
        ZStack{
            //background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                

            VStack{
                //Prancing pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency Exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency Conversion section
                HStack{
                    //left conversion section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //currency text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.padding(.bottom, -5)
                        
                        //TextField
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
 
                    }
                    
                    //equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //Right conversion Section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Image
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //currency text
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }.padding(.bottom,-5)
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }.padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                Spacer()
                
                //Button
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                        print("ShowExchangeInfo Value: \(showExchangeInfo)")
                        
                    }
                label:{
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                }.padding(.trailing)
                    
                }
            }
            //.border(.blue)
        }

    }
}

#Preview {
    ContentView()
}
