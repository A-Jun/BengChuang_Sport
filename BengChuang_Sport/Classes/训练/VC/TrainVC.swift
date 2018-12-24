//
//  TrainVC.swift
//  xunlian
//
//  Created by RJ on 2018/12/7.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainVC: BaseViewController {

    private lazy var tableView: UITableView = {
        let tableView  = UITableView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height - kTabBarHeight - kNavBarHeight), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UINib.init(nibName: "TrainCell", bundle: Bundle.current), forCellReuseIdentifier: kTrainCellRI)
        view.addSubview(tableView)
        return tableView
    }()
    
    //MARK: - 生命周期
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stateBarStyle = .default
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.white), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    /// 配置界面
    private func configureUI() {
        
        //配值tableView
        tableView.reloadData()
    }
    
    override func configureNavigation() {
        navBarTitle("运动", .six3)
        addNavBarItemBtn(.left_first, nil, UIImage.currentBundle("日历"), self, #selector(sportRecordBarBtnCilcked), .touchUpInside)
        addNavBarItemBtn(.right_first, nil, UIImage.currentBundle("JINRI"), self, #selector(rightBarBtnCilcked), .touchUpInside)
    }
    @objc private func sportRecordBarBtnCilcked() {
        let vc = SportRecordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func rightBarBtnCilcked() {
    }
}
extension TrainVC :UITableViewDelegate,UITableViewDataSource {
     /// Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        default:
            return 7
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: kTrainCellRI, for: indexPath) as! TrainCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kAutoWid(98)
    }
    /// Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let todaySportView = Bundle.current.loadNibNamed("TodaySportView", owner: nil, options: nil)?.first as! TodaySportView
            return todaySportView
        default:
            let trainCourseView = Bundle.current.loadNibNamed("TrainCourseView", owner: nil, options: nil)?.first as! TrainCourseView
            return trainCourseView
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return kAutoWid(270)
        default:
            return kAutoWid(40)
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return kAutoWid(10)
        default:
            return 0.000001
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TrainContentVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
