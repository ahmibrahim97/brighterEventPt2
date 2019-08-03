//
//  UserTableView.swift
//  BrighterEvents
//
//  Created by Ahmad Ibrahim on 7/21/19.
//  Copyright © 2019 BrighterEvents Inc. All rights reserved.
//

import Foundation
import UIKit

class AttendeeListView: UIView {
    let tableView = UITableView()
    
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
//        tableView.dataSource = self
//        tableView.delegate = self
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
//        tableView.register(AttendeeCell.self, forCellReuseIdentifier: AttendeeCell.reuseIdentifier)
        
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
}
