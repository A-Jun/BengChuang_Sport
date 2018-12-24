//
//  SportRecordVC.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class SportRecordVC: BaseViewController {

    private lazy var tableView: UITableView = {
        let tableView  = UITableView(frame:CGRect(x: 0, y: 0, width: view.width, height: view.height - kNavBarHeight), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UINib.init(nibName: "SportRecordCell", bundle: Bundle.current), forCellReuseIdentifier: kSportRecordCellRI)
        view.addSubview(tableView)
        return tableView
    }()
    
    //MARK: - 生命周期
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
        //配值tableView
        tableView.reloadData()
        
    }
    override func configureNavigation() {
        super.configureNavigation()
        navBarTitle("运动记录", .white)
        addNavBarItemBtn(.right_first, nil, UIImage.currentBundle( "guaml"), self, #selector(rightBarBtnCilcked), .touchUpInside)
    }
    @objc private func rightBarBtnCilcked() {
    }
}
extension SportRecordVC :UITableViewDelegate,UITableViewDataSource {
    /// Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 2
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSportRecordCellRI, for: indexPath) as! SportRecordCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kAutoWid(74)
    }
    /// Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let trainCourseView = Bundle.current.loadNibNamed("SportRecordHeaderView", owner: nil, options: nil)?.first as! SportRecordHeaderView
        return trainCourseView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kAutoWid(31)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    
}
