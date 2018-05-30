//
//  NewsViewController.swift
//  OneMore
//
//  Created by Thinh Nguyen X on 4/18/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import UIKit
import SwiftUtils

private struct Config {
    static let itemWidth = kScreenSize.width
    static let itemHeight = kScreenSize.height
    static let rowHeightTable = 100 * Ratio.horizontal
}
class NewsViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var heardView: UIView!
    @IBOutlet fileprivate weak var newImgeView: UIImageView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Function
    private func setupUI() {
        configTableView()
        view.backgroundColor = App.Color.blue008
        heardView.backgroundColor = App.Color.red180
        loadImageGif()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewTableViewCell.self)
        tableView.rowHeight = Config.rowHeightTable
    }
    
    private func loadImageGif() {
        newImgeView.loadGif(asset: "football")
    }
}

// MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

// MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(NewTableViewCell.self)
        return cell
    }
}
