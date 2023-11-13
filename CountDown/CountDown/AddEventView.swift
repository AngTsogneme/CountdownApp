//
//  AddEventView.swift
//  CountDown
//
//  Created by Ang T on 2023-11-10.
//

import SwiftUI

struct AddEventView: View {
    @State var eventName: String
    @State var eventDate = Date()
    var onAddEvent: (Event) -> Void
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField("Enter event name", text: $eventName)
                        .padding(.leading, 10.0)
                        .frame(width:300, height:50)
                        .border(.blue)
                    
                    DatePicker("Date of Event",
                               selection: $eventDate,
                               in: Date()...)
                    .datePickerStyle(GraphicalDatePickerStyle())
                }
                let seconds = eventDate.timeIntervalSince(Date())
                let days = String(round(seconds/86400))
                Text(days)
                let hours = String(round(Double((Int(seconds)%86400))/3600.0))
                Text(hours)
                let minutes = String(round(Double((Int(seconds)%3600))/60.0))
                Text(minutes)
                
                
                Button{
                    let newEvent = Event(eventName: eventName, eventDate:eventDate)
                    onAddEvent(newEvent)
                }label: {
                    CButtons(title: "Done")
                }
                
            }

        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        let events: [Event] = []
        AddEventView(eventName: "", onAddEvent: { _ in })
    }
}
