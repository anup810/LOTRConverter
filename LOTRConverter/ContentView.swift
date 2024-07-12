//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Anup Saud on 2024-07-11.
//

import SwiftUI

struct ContentView: View {
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
                        }
                        
                        //TextField
                        Text("TextField")
                            .foregroundStyle(.white)
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
                        }
                        Text("TextField")
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
                
                //Button
                Button{
                    
                }
            label:{
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            }
            //.border(.blue)
        }

    }
}

#Preview {
    ContentView()
}
