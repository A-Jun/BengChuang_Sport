//
//  CourseDetailVC.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class CourseDetailVC: BaseViewController {

    
    
    private lazy var tableView: UITableView = {
        let tableView  = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UINib.init(nibName: "TrainCell", bundle: Bundle.current), forCellReuseIdentifier: kTrainCellRI)
        view.addSubview(tableView)
        return tableView
    }()
    //MARK: - 生命周期方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stateBarStyle = .default
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.white), for: UIBarMetrics.default)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    /// 配置界面
    private func configureUI() {
        tableView.reloadData()
    }
}
extension CourseDetailVC :UITableViewDelegate,UITableViewDataSource {
    /// Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTrainCellRI, for: indexPath) as! TrainCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kAutoWid(98)
    }
    /// Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.000001
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TrainContentVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
