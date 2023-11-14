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
                
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(.label))
                            .imageScale(.large)
                            .frame(width:44, height:44)
                    }
                }.padding()
                
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
        let _: [Event] = []
        AddEventView(eventName: "", onAddEvent: { _ in })
    }
}
