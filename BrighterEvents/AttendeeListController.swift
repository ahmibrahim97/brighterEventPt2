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
        // Do any additional setup after loading the view.
    }

}

