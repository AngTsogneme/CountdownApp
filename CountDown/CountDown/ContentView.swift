//
//  ContentView.swift
//  CountDown
//
//  Created by Ang T on 2023-11-10.
//

import SwiftUI

struct Event {
    var eventName: String
    var eventDate: Date
}


struct ContentView: View {
    
    @State private var events: [Event] = []
    @State private var isAddEventViewPresented = false
    @State public var selectedEvent: Event? = nil
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Events")
                    .font(.title)
                    .fontWeight(.semibold)
                
                
                ForEach(events, id: \.eventName) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        EventBannerView(EventName: event.eventName, EventDate: event.eventDate)
                    }
                }
                Spacer()
                Button{
                    isAddEventViewPresented.toggle()
                }label: {
                    CButtons(title: "Add Event")
                }
                .sheet(isPresented: $isAddEventViewPresented) {
                    AddEventView(eventName: "") {
                        newEvent in events.append(newEvent)
                        isAddEventViewPresented = false
                    }
                }
                
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let event = Event(eventName: "Preview", eventDate: Date())
        ContentView(selectedEvent: event)
        
    }
}

struct EventBannerView: View{
    var EventName: String
    var EventDate: Date
   
    var body: some View{
        LazyVGrid(columns: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Columns@*/[GridItem(.fixed(200))]/*@END_MENU_TOKEN@*/) {
            ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 350, height: 90)
                    .foregroundColor(.yellow)
                HStack{
                    VStack(alignment: .leading){
                        Text(EventName)
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding(.bottom,0.5)

                       
                            
                    }
                    Spacer()
                    Text(EventDate.formatted())
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }.padding()
                
            }
        }
    }
}
