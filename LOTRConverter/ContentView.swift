//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Anup Saud on 2024-07-11.
//

import SwiftUI
import TipKit

struct ContentView: View {
   @State var showExchangeInfo:Bool = false
    @State var showSelectedCurrency: Bool = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
   @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurreny: Currency = . goldPiece
    
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectedCurrency.toggle()
                            }
                            .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        //TextField
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftAmount) {
                                if leftTyping{
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurreny)
                                }
                            }
                            .onChange(of: leftCurrency) {
                                rightAmount = leftCurrency.convert(leftAmount, to: rightCurreny)
                            }

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
                            Text(rightCurreny.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //currency text
                            Image(rightCurreny.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }.padding(.bottom,-5)
                            .onTapGesture {
                                showSelectedCurrency.toggle()

                            }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightAmount) {
                                if rightTyping{
                                    leftAmount = rightCurreny.convert(rightAmount, to: leftCurrency)
                                }
                            }
                            .onChange(of: rightCurreny) {
                                leftAmount = rightCurreny.convert(rightAmount, to: leftCurrency)
                            }
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
                        .sheet(isPresented: $showExchangeInfo, content: {
                            ExchangeInfo()
                        })
                    
                }
            }
            .sheet(isPresented: $showSelectedCurrency, content: {
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurreny)
            })
            .task {
                try? Tips.configure()
            }
            //.border(.blue)
        } .onTapGesture(perform: {
            leftTyping = false
            rightTyping = false
        })

    }
}

#Preview {
    ContentView()
}
