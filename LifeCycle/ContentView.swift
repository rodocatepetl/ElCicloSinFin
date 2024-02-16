//
//  ContentView.swift
//  LifeCycle
//
//  Created by Rodolfo Castillo on 13/02/24.
//

import SwiftUI

struct TimerView: View {
    @State private var timerValue: Int = 0
    @State private var timer: Timer?
    @Binding var initialDate: Date
    
    var body: some View {
        VStack {
            Text("Tiempo transcurrido: \(timerValue) segundos")
                .font(.title)
                .padding()
        }
        .onAppear(perform: startTimer)
        .onDisappear(perform: stopTimer)
    }
    
    func startTimer() {
        let currentTime = Date().timeIntervalSince1970
        let startTime = initialDate.timeIntervalSince1970
        let cursorTime = currentTime - startTime
        timerValue = Int(cursorTime)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timerValue += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
}

struct ContentView: View {
    
    @State var initialDate: Date = Date()
    @State var timerHasShown: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: TimerView(initialDate: $initialDate)) {
                    Text("Ver temporizador")
                }.onTapGesture {
                    if !timerHasShown {
                        self.initialDate = Date()
                        timerHasShown = true
                    }
                }
            }
            .navigationTitle("Inicio")
        }
    }
}

/*En este ejemplo:
 
 TimerView es una vista que muestra el tiempo transcurrido. Utiliza dos estados: timerValue para almacenar el tiempo actual y timer para manejar el temporizador.
 El temporizador comienza cuando la vista aparece (onAppear) y se detiene cuando la vista desaparece (onDisappear).
 ContentView es la vista principal que contiene un botón de navegación que lleva a TimerView.
 TimerApp es la aplicación principal que define la vista principal.
 Cuando el usuario navega a TimerView, el temporizador comienza a contar. Cuando el usuario vuelve atrás (o cambia a otra vista), el temporizador se detiene. Esto es útil para realizar un seguimiento del tiempo que el usuario pasa en una vista específica, lo que podría ser útil para análisis o métricas de usuario.*/
