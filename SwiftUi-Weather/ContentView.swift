//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Rajesh Patangay on 9/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack(spacing: 10) {
                CityTextView(cityName: "Coppell, TX")
                MainWeatherStatusViewView(imageName: isNight ? "moon.stars.fill"  : "cloud.sun.fill",
                                          temperature: 76)

                WeatherDaysView()
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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
    
    var dayOfWeek: String;
    var imageName: String;
    var temperature: Int;
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
            
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
//    var topColor: Color;
//    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {

    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusViewView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}

struct WeatherDaysView: View {
    var body: some View {
        HStack(spacing: 20) {
            WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
            WeatherDayView(dayOfWeek: "WED", imageName: "cloud.bolt.rain.fill", temperature: 76)
            WeatherDayView(dayOfWeek: "THU", imageName: "sunset.fill", temperature: 78)
            WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.bolt.fill", temperature: 72)
            WeatherDayView(dayOfWeek: "SAT", imageName: "sun.haze.fill", temperature: 70)
        }
    }
}


