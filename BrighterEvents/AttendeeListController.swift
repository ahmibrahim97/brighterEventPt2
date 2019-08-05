//
//  ViewController.swift
//  BrighterEvents
//
//  Created by Ahmad Ibrahim on 7/13/19.
//  Copyright © 2019 BrighterEvents Inc. All rights reserved.
//

import UIKit

class AttendeeListController: UIViewController {
    let mainView: AttendeeListView
    let viewModel: AttendeeViewModel
    
    init(view: AttendeeListView, viewModel: AttendeeViewModel) {
        self.mainView = view
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        // Do any additional setup after loading the view.
    }

    func setupView() {
        view = mainView
        mainView.dataSource = self
    }
    
    func setupViewModel() {
        viewModel.delegate = self
        viewModel.loadData()
    }
}

extension AttendeeListController: AttendeeListViewDataSource {
    func getNumberOfAttendees(in view: AttendeeListView) -> Int {
        return viewModel.getAttendeeData().count
    }
    
    func getDataForCell(in view: AttendeeListView, for section: Int) -> [AttendeeCell.Descriptor] {
        return viewModel.getAttendeeData()
    }
}

extension AttendeeListController: AttendeeViewModelDelegate {
    func loadedData(from viewModel: AttendeeViewModel) {
        mainView.reloadView()
    }
}
