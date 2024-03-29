//
//  CustomPTR.swift
//  BushelRefresh_Example
//
//  Created by Alex (Work) on 7/6/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import BushelRefresh

class CustomPTR: UIView, RefreshView {
    
    //
    // MARK: UI
    //
    @IBOutlet var label: UILabel!
    
    //
    // MARK: Initialization
    //
    static func createView() -> RefreshView {
        let view = UINib(nibName: "CustomPTR", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomPTR
        return view
    }
    
    //
    // MARK: State
    //
    var delegate: RefreshDelegate?
    
    public var state: RefreshState = .stopped {
        didSet {
            refreshWithCurrentState()
        }
    }
    
    //
    // MARK: Layout
    //
    func refreshWithCurrentState() {
        switch state {
        case .stopped:
            label.text = "Stopped"
            backgroundColor = .red
            delegate?.didStop()
        case .committed:
            label.text = "Committed"
            backgroundColor = .yellow
            delegate?.didCommit()
        case .loading:
            label.text = "Loading"
            backgroundColor = .green
            delegate?.didBeginLoading()
        }
    }
    
    //
    // MARK: Actions
    //
    func startAnimating() {
        self.state = .loading
    }
    
    func stopAnimating() {
        self.state = .stopped
    }

}
