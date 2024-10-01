//
//  ContentView 2.swift
//  AppPockedTrainer
//
//  Created by  MacBook  on 23.10.2024.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstView() // Замените на свой первый экран
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }

            SecondView() // Замените на свой второй экран
                .tabItem {
                    Image(systemName: "star")
                    Text("Избранное")
                }

            // Добавьте больше вкладок по мере необходимости
        }
        .accentColor(.red) // Установите цвет выделения для вкладок
    }
}

struct FirstView: View {
    var body: some View {
        Text("Первый экран")
    }
}

struct SecondView: View {
    var body: some View {
        Text("Второй экран")
    }
}
