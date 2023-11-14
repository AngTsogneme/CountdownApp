//
//  EventDetailView.swift
//  CountDown
//
//  Created by Ang T on 2023-11-14.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    var body: some View {
//        let seconds = event.eventDate.timeIntervalSince(Date())
//        let days = String(round(seconds/86400))
//
//        let hours = String(round(Double((Int(seconds)%86400))/3600.0))
//
//        let minutes = String(round(Double((Int(seconds)%3600))/60.0))
 
        Text(event.eventName)
            .font(.title)

        CountdownTimerView(targetDate: event.eventDate)
    }
}


struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleEvent = Event(eventName: "Sample Event", eventDate: Date())
        return EventDetailView(event: sampleEvent)
    }
}
