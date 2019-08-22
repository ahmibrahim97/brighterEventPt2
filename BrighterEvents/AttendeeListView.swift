//
//  UserTableView.swift
//  BrighterEvents
//
//  Created by Ahmad Ibrahim on 7/21/19.
//  Copyright © 2019 BrighterEvents Inc. All rights reserved.
//

import Foundation
import UIKit

protocol AttendeeListViewDataSource: class {
    func getNumberOfAttendees(in view: AttendeeListView) -> Int
    func getDataForCell(in view: AttendeeListView, for section: Int) -> [AttendeeCell.Descriptor]
}

//protocol AttendeeListViewDelegate: class {
//    func checkedIn(in view: AttendeeListView, index: IndexPath)
//}

class AttendeeListView: UIView {
    let tableView = UITableView()
    
    weak var dataSource: AttendeeListViewDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup View
    
    func setupView() {
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.allowsSelection = true
        tableView.register(AttendeeCell.self, forCellReuseIdentifier: AttendeeCell.reuseIdentifier)
        addSubview(tableView)
    }
    
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupTableConstraints()
    }
    
    func setupTableConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
            ])
    }
    
    func reloadView() {
        tableView.reloadData()
    }
}

extension AttendeeListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.getNumberOfAttendees(in: self) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AttendeeCell.reuseIdentifier, for: indexPath) as? AttendeeCell else { return UITableViewCell() }
        guard let descriptor = dataSource?.getDataForCell(in: self, for: 0)[indexPath.row] else { return AttendeeCell() }
        cell.configure(with: descriptor)
        return cell
    }
}

extension AttendeeListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let checkInAction = UITableViewRowAction(style: .normal, title: "") { (action, index) in
            print("Checked In ", index)
        }
        checkInAction.backgroundColor = .green
        
        return [checkInAction]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
