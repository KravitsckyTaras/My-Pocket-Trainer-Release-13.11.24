import SwiftUI

struct MyData: View {
    var body: some View {
        TabView {
            ScrolWeuve() // Ваше основное представление
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
            
            // Добавьте другие вкладки по необходимости
            Text("Вкладка 2")
                .tabItem {
                    Image(systemName: "star")
                    Text("Вкладка 2")
                }
            
            Text("Вкладка 3")
                .tabItem {
                    Image(systemName: "person")
                    Text("Вкладка 3")
                }
        }
    }
}


struct MyData_Previews: PreviewProvider {
    static var previews: some View {
        MyData()
    }
}
