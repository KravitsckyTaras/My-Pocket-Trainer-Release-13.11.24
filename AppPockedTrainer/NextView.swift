import SwiftUI

// Модель данных для изображений
struct ImageData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

struct NextView: View {
    @State private var timeRemaining = 10
    @State private var timer: Timer?
    @State private var timerIsRunning = false
    @State private var timerIsPaused = false
    @State private var isCountingDown = false
    @State private var cyclesCompleted = 0
    @State private var totalCyclesCompleted = 0
    @State private var iconColors = Array(repeating: Color.black, count: 8)
    @State private var activeIconIndex = 0
    @State private var imageIndex = 0
    @State private var showCompletionSheet = false
    @State private var hasStarted = false
    @State private var selectedImage: ImageData?
    @State private var showContinueButton = false
    @State private var textInputs = Array(repeating: "", count: 8) // Поля для ввода текста

    var imageName: String
    let images = [
        ImageData(name: "1", description: "Описание для изображения 1"),
        ImageData(name: "2", description: "Описание для изображения 2"),
        ImageData(name: "3", description: "Описание для изображения 3"),
        ImageData(name: "4", description: "Описание для изображения 4"),
        ImageData(name: "5", description: "Описание для изображения 5"),
        ImageData(name: "6", description: "Описание для изображения 6")
    ]
    let icons = ["heart.circle", "dumbbell", "heart.circle", "dumbbell", "heart.circle", "dumbbell", "heart.circle", "dumbbell"]

    private func startTimer() {
        timer?.invalidate()
        timeRemaining = 1
        isCountingDown = false
        cyclesCompleted = 0
        activeIconIndex = 0
        iconColors = Array(repeating: Color.black, count: 8)
        totalCyclesCompleted = 0
        showCompletionSheet = false
        timerIsRunning = true
        hasStarted = true
        showContinueButton = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timerIsRunning && !timerIsPaused {
                if isCountingDown {
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else {
                        isCountingDown = false
                        timeRemaining = 1
                        cyclesCompleted += 1
                        if cyclesCompleted >= 8 {
                            completeFullCycle()
                        }
                    }
                } else {
                    if timeRemaining < 1 {
                        timeRemaining += 1
                    } else {
                        updateActiveIcon()
                        isCountingDown = true
                    }
                }
            }
        }
    }
    
    private func pauseTimer() {
        timerIsPaused = true
        showContinueButton = true
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timerIsRunning = false
        showContinueButton = false
    }
    
    private func updateActiveIcon() {
        if activeIconIndex < iconColors.count {
            iconColors[activeIconIndex] = .red
            activeIconIndex += 1
        }
    }
    
    private func completeFullCycle() {
        totalCyclesCompleted += 1
        cyclesCompleted = 0
        activeIconIndex = 0
        iconColors = Array(repeating: Color.black, count: 8)
        
        if imageIndex < images.count - 1 {
            imageIndex += 1
        } else {
            imageIndex = 0
        }
        
        if totalCyclesCompleted >= 6 {
            stopTimer()
            showCompletionSheet = true
        }
    }

    var body: some View {
        ZStack {
            if imageName == "START" {
                Image("listBumagy")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Label {
                        Text("\(timeRemaining) s.Ex \(totalCyclesCompleted + 1) of 6")
                    } icon: {
                        Image(systemName: "clock")
                    }
                    .font(.largeTitle)
                    .padding()

                   
                    .padding(.bottom)

                    VStack(spacing: 10) {
                        HStack(spacing: 30) {
                            ForEach(0..<4, id: \.self) { index in
                                Image(systemName: icons[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 40)
                                    .foregroundColor(iconColors[index])
                            }
                        }
                        HStack(spacing: 30) {
                            ForEach(4..<8, id: \.self) { index in
                                Image(systemName: icons[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 40)
                                    .foregroundColor(iconColors[index])
                            }
                        }
                    }
                    

                    if timerIsRunning {
                        Image(images[imageIndex].name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 370, height: 370)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(images) { imageData in
                                    Image(imageData.name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 370, height: 370)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .onTapGesture {
                                            selectedImage = imageData
                                        }
                                }
                            }
                            .padding(30)
                            .frame(maxWidth: .infinity, maxHeight: 400, alignment: .top)
                        }
                    }

                    HStack {
                        Spacer()
                        Button(action: startTimer) {
                            Text(showContinueButton ? "Continue" : "Start")
                                .frame(width: 100, height: 100)
                                .background(timerIsRunning ? Color.black : Color.red)
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
                        Spacer()
                        Button(action: pauseTimer) {
                            Text("Pause")
                                .frame(width: 100, height: 100)
                                .background(timerIsRunning && !timerIsPaused ? Color.yellow : Color.gray)
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
                        Spacer()
                        Button(action: stopTimer) {
                            Text("Stop")
                                .frame(width: 100, height: 100)
                                .background(timerIsRunning ? Color.red : Color.black)
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
                        Spacer()
                    }
                }
                .sheet(isPresented: $showCompletionSheet) {
                    VStack {
                        Text("Вітаю! Тренування закінчилося, продовжуй у такому ж дусі і ти досягнеш своєї мети!")
                            .font(.largeTitle)
                            .padding()
                        
                        Button(action: {
                            showCompletionSheet = false
                        }) {
                            Text("ОК")
                                .font(.title)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
                .sheet(item: $selectedImage) { imageData in
                    VStack {
                        Image(imageData.name)
                            .resizable()
                            .scaledToFit()
                            .edgesIgnoringSafeArea(.all)
                        
                        Text(imageData.description)
                            .font(.title)
                            .padding()
                    }
                }
            } else if imageName == "Arny2" {
                Image("listBumagy")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    // Ваш контент здесь
                }
            } else if imageName == "KayG" {
                Image("listBumagy")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            } else {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NextView(imageName: "Arny2")
                .previewDisplayName("Arny2 Preview")
            
            NextView(imageName: "KayG")
                .previewDisplayName("KayG Preview")
            
            NextView(imageName: "START")
                .previewDisplayName("START")
        }
    }
}
