//
//  ViewModel.swift
//  BrighterEvents
//
//  Created by Ahmad Ibrahim on 7/21/19.
//  Copyright © 2019 BrighterEvents Inc. All rights reserved.
//


// status: 0 Not Checked In
// status: 1 Checked In

import Foundation
protocol AttendeeViewModelDelegate: class {
    func loadedData(from viewModel: AttendeeViewModel)
}

class AttendeeViewModel {
    weak var delegate: AttendeeViewModelDelegate?
    private var myData = [AttendeeCell.Descriptor]()
    let userDefaults = UserDefaults.init()

    func loadData() {
        let example: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 0, firstName: "Ahmad", lastName: "Ibrahim")
        let example2: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 1, firstName: "Obaida", lastName: "Albaroudi")
        let example3: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 2, firstName: "Ahmad", lastName: "Jawaid")
        let example4: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 3, firstName: "Omar", lastName: "Mawi")
        let example5: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 4, firstName: "Majd", lastName: "Said")
        let example6: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 5, firstName: "Mureed", lastName: "Ibrahim")
        let example7: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 6, firstName: "Nuh", lastName: "Zamani")
        let example8: AttendeeCell.Descriptor = AttendeeCell.Descriptor(id: 7, firstName: "Yousef", lastName: "Abdelfattah")

        myData.append(example)
        myData.append(example2)
        myData.append(example3)
        myData.append(example4)
        myData.append(example5)
        myData.append(example6)
        myData.append(example7)
        myData.append(example8)
        for i in myData {
            userDefaults.set(0, forKey: String(i.id ?? 0))
        }
        delegate?.loadedData(from: self)
    }
    
    func getAttendeeData() -> [AttendeeCell.Descriptor] {
        return myData
    }
    
    func checkIn(attendee: AttendeeCell.Descriptor) {
        let userId = userDefaults.integer(forKey: String(attendee.id ?? 0))
        
        if userId == 0 {
            userDefaults.set(1, forKey: String(attendee.id ?? 0))
        } else {
            userDefaults.set(0, forKey: String(attendee.id ?? 0))
        }
        
        // use UserDefaults to store if user was checked in
    }
    
    func checkedIn(attendee: AttendeeCell.Descriptor) -> Bool {
        let userId = userDefaults.integer(forKey: String(attendee.id ?? 0))
        
        if userId == 0 {
            return false
        } else {
            return true
        }
    }
}
