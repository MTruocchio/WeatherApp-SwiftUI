//
//  ContentView.swift
//  WeatherApp
//
//  Created by Marcelino Santana Truocchio on 18/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Contagem, MG")
                MainWeatherStatusView(weatherImage: isNight ? "cloud.moon.rain.fill" : "cloud.sun.rain.fill", temperature: "22")
                Spacer()
                HStack(spacing:25){
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.rain.fill", temperature: "22")
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temperature: "28")
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.rain.fill", temperature: "26")
                    WeatherDayView(dayOfWeek: "TUR", imageName: "cloud.sun.rain.fill", temperature: "19")
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: "10")
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label:{
                    DefaultButton(btnLabel: "Change Day Time", backgroundColor: .white, textColor: isNight ? .gray : .blue)
                }
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black: .blue, isNight ? Color("lightGrey"): Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 100)
    }
}
struct MainWeatherStatusView: View{
    var weatherImage: String
    var temperature: String
    var body: some View{
        VStack(spacing:10){
            Image(systemName:weatherImage )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct DefaultButton: View {
    var btnLabel: String
    var backgroundColor: Color
    var textColor: Color
    var body: some View{
        Text(btnLabel)
            .frame(width: 180, height: 50)
            .font(.system(size: 20, weight: .medium, design: .default))
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
