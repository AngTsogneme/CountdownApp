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
    let now = Date()
    var body: some View {
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
            Text(String(round(eventDate.timeIntervalSince(Date())/3600)))
//            Text(DateInterval(start: now, duration: 1, end: eventDate))
            Button{
                
            }label: {
                CButtons(title: "Done")
            }
        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView(eventName: "")
    }
}

