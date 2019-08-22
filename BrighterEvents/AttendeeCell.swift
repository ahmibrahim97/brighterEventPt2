//
//  AttendeeCell.swift
//  BrighterEvents
//
//  Created by Ahmad Ibrahim on 8/3/19.
//  Copyright © 2019 BrighterEvents Inc. All rights reserved.
//

import Foundation
import UIKit

class AttendeeCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: AttendeeCell.self)
    
    struct Descriptor {
        var firstName: String?
        var lastName: String?
    }
    
    let attendeeName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Views
    
    func setupViews() {
        setupAttendeeName()
    }
    
    func setupAttendeeName() {
        attendeeName.text = ""
        attendeeName.adjustsFontSizeToFitWidth = true
        attendeeName.font = .systemFont(ofSize: 25)
        contentView.addSubview(attendeeName)
    }
    
    // MARK: Constraints
    
    func setupConstraints() {
        setupAttendeeNameConstraints()
    }
    
    func setupAttendeeNameConstraints() {
        attendeeName.translatesAutoresizingMaskIntoConstraints = false
        attendeeName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        attendeeName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        attendeeName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        attendeeName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    }
    
    func configure(with descriptor: AttendeeCell.Descriptor) {
        setupViews()
        setupConstraints()
        attendeeName.text = (descriptor.lastName ?? "LastName") + ", " + (descriptor.firstName ?? "FirstName")
    }
}
