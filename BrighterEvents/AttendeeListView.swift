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
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
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
