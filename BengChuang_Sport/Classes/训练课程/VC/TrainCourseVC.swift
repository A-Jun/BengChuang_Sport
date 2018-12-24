//
//  TrainCourseVC.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainCourseVC: BaseViewController {

    private lazy var tableView: UITableView = {
        let tableView  = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UINib.init(nibName: "TrainCourseCell", bundle: Bundle.current), forCellReuseIdentifier: kTrainCourseCellRI)
        view.addSubview(tableView)
        return tableView
    }()
    
    //MARK: - 生命周期方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stateBarStyle = .lightContent
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.themeBrown), for: UIBarMetrics.default)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    /// 配置界面
    private func configureUI() {
        tableView.reloadData()
    }
    override func configureNavigation() {
        super.configureNavigation()
        navBarTitle("全部课程", .white)
    }
}
extension TrainCourseVC :UITableViewDelegate,UITableViewDataSource {
    /// Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTrainCourseCellRI, for: indexPath) as! TrainCourseCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kAutoWid(130)
    }
    /// Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let trainCourseHeaderView = Bundle.current.loadNibNamed("TrainCourseHeaderView", owner: nil, options: nil)?.first as! TrainCourseHeaderView
        return trainCourseHeaderView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kAutoWid(49)
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
