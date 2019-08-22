//
//  ViewModel.swift
//  BrighterEvents
//
//  Created by Ahmad Ibrahim on 7/21/19.
//  Copyright © 2019 BrighterEvents Inc. All rights reserved.
//

import Foundation
protocol AttendeeViewModelDelegate: class {
    func loadedData(from viewModel: AttendeeViewModel)
}

class AttendeeViewModel {
    weak var delegate: AttendeeViewModelDelegate?
    private var myData = [AttendeeCell.Descriptor]()

    func loadData() {
        let example: AttendeeCell.Descriptor = AttendeeCell.Descriptor(firstName: "Ahmad", lastName: "Ibrahim")
        let example2: AttendeeCell.Descriptor = AttendeeCell.Descriptor(firstName: "Obaida", lastName: "Albaroudi")
        let example3: AttendeeCell.Descriptor = AttendeeCell.Descriptor(firstName: "Ahmad", lastName: "Jawaid")
        let example4: AttendeeCell.Descriptor = AttendeeCell.Descriptor(firstName: "Omar", lastName: "Mawi")
        let example5: AttendeeCell.Descriptor = AttendeeCell.Descriptor(firstName: "Majd", lastName: "Said")

        myData.append(example)
        myData.append(example2)
        myData.append(example3)
        myData.append(example4)
        myData.append(example5)
        delegate?.loadedData(from: self)
    }
    
    func getAttendeeData() -> [AttendeeCell.Descriptor] {
        return myData
    }

}
