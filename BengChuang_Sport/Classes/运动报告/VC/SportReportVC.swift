//
//  SportReport.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class SportReportVC: BaseViewController {
    
    private lazy var tableView: UITableView = {
        let tableView  = UITableView(frame: CGRect(x: kAutoWid(12), y: 0, width: view.width - kAutoWid(24), height: view.height - kNavBarHeight), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UINib.init(nibName: "SportRecordCell", bundle: Bundle.current), forCellReuseIdentifier: kSportRecordCellRI)
        view.addSubview(tableView)
        return tableView
    }()
    
    private var dataSource = [([String:Any])](){
        didSet{
            self.tableView.reloadData()
        }
    }

    
    //MARK: - 生命周期方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stateBarStyle = .lightContent
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.themeBrown), for: UIBarMetrics.default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dataSource = [["title":"有效运动时长","subtitle":"22","unit":"分钟","describe":"单场运动时间低于大众平击水平"],
                      ["title":"消耗卡路里","subtitle":"128","unit":"大卡","describe":"相当于中速步行2909步，慢跑0.7公里，登上48米高峰"],
                      ["title":"弹跳频率","subtitle":"27","unit":"次","describe":"运动强度较高，训练及健身效果明显"],
                      ["title":"最大弹跳高度","subtitle":"120","unit":"米","describe":"表现神勇，爆发力超越全国49%的蹦床爱好者"]]
        
    }
    
    //MARK: - 配置UI
    /// 配置界面
    private func configureUI() {
        
       
        //配值tableView
        self.view.backgroundColor = UIColor.themeBrown
        tableView.backgroundColor = UIColor.themeBrown
        tableView.bounces = false
        tableView.register(UINib.init(nibName: "SportReportCell", bundle: Bundle.current), forCellReuseIdentifier: kSportReportCellRI)
    }
    override func configureNavigation() {
        super.configureNavigation()
        navBarTitle("运动报告", .white)
        addNavBarItemBtn(.right_first, nil, UIImage.currentBundle( "下载44"), self, #selector(rightBarBtnCilcked), .touchUpInside)
    }
    @objc private func rightBarBtnCilcked() {
    }
}
extension SportReportVC :UITableViewDelegate,UITableViewDataSource {
    /// Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSportReportCellRI, for: indexPath) as! SportReportCell
        cell.selectionStyle = .none
        cell.updateCell(dataSource[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kAutoWid(61)
    }
    /// Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let chatView = Bundle.current.loadNibNamed("SportReportHeaderView", owner: nil, options: nil)?.first as! SportReportHeaderView
        return chatView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kAutoWid(296)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            cell.corners([UIRectCorner.topRight,UIRectCorner.topLeft], radii: CGSize(width: kAutoWid(14), height: kAutoWid(14)))
        }
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.corners([UIRectCorner.bottomLeft,UIRectCorner.bottomRight], radii: CGSize(width: kAutoWid(14), height: kAutoWid(14)))
        }
    }
}
