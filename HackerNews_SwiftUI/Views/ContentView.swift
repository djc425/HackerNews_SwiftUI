//
//  ContentView.swift
//  H4X0R_News_DC
//
//  Created by David Chester on 10/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    let now = Date.now
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) {row in
                NavigationLink(
                    destination: DetailView(url: row.url),
                    label: {
                        HStack {
                            Text(String(row.points))
                            Text(row.title)
                        }
                    })
                
                //for every single item within our posts array, it will create an individual Text view based on using the title property of our initialized Post objects from our posts array. And the order of these Text views is based on the id value that we gave to our initialized Post objects within the posts array.
                
            }
           .navigationTitle("Hacker News \(Text(Date.now, format: .dateTime.month().day()))")
            
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // we use the ContentView method onAppear to load our fetchData method from the networkmanager. onAppear is similar to ViewDidLoad, where each time this view loads up, it will call the code within onAppear (in this case it being the fetchData() method from our NetworkManager)
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//let posts = [
//    Post(id: "1", title: "Hello!"),
//    Post(id: "2", title: "Hello there"),
//    Post(id: "3", title: "General Kenobi")
//
//]
