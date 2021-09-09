//
//  StatusViewModel.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/8/21.
//

import SwiftUI

class StatusChanged: ObservableObject {
    @Published var status: StatusViewModel = .notConfigured
    
    func updateStatus(_ status: StatusViewModel) {
        self.status = status
    }
}

enum StatusViewModel: Int, CaseIterable {
    case notConfigured
    case available
    case busy
    case AtSchool
    case atTheMovies
    case atWork
    case atTheGym
    case inAMeeting
    case sleeping
    case urgentCalls
    
    var title: String {
        switch self {
        case .notConfigured: return "Click here to update your status"
        case .available: return "Available"
        case .busy: return "Busy"
        case .AtSchool: return "At School"
        case .atTheMovies: return "At the Movies"
        case .atWork: return "At Work"
        case .atTheGym: return "At the Gym"
        case .inAMeeting: return "In a Meeting"
        case .sleeping: return "Sleeping"
        case .urgentCalls: return "Urgent Calls Only"
        }
    }
    
}


