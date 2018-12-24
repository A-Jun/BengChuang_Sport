//
//  TrainContentVC.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

private let BeginTrainHeight:CGFloat = kAutoWid(44)
class TrainContentVC: BaseViewController {
    
    private lazy var tableView: UITableView = {
        let tableView  = UITableView(frame: CGRect(x: 0, y: 0, width: view.width, height:view.height - kTrailHeight - BeginTrainHeight), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UINib.init(nibName: "TrainActionCell", bundle: Bundle.current), forCellReuseIdentifier: kTrainActionCellRI)
        
        return tableView
    }()
    
    private lazy var beginTrain: UIButton = {
        let beginTrain = UIButton.init(type: .custom)
        beginTrain.frame = CGRect(x: 0, y: tableView.frame.maxY, width: view.width, height: BeginTrainHeight)
        beginTrain.backgroundColor = UIColor.themeGreen
        beginTrain.titleLabel?.font = RJFontPingFangSC_Semibold(16)
        beginTrain.setTitle("开始训练", for: .normal)
        beginTrain.setTitleColor(UIColor.white, for: .normal)
        beginTrain.addTarget(self, action: #selector(beginTrainCilcked), for: .touchUpInside)
        return beginTrain
    }()
    //MARK: - 生命周期方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = true
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
            
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        navBackgroundAlpha = 0.0
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isTranslucent = false
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
           
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
            
        }
        navBackgroundAlpha = 1.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview(tableView)
        addSubview(beginTrain)
    }
    override func configureNavigation() {
        super.configureNavigation()
        addNavBarItemBtn(.right_first, nil, UIImage.currentBundle("下载-亮"), self, #selector(rightBarBtnCilcked), .touchUpInside)
    }
    @objc private func beginTrainCilcked() {
        let vc = TrainingVC()
        present(vc, animated: true, completion: nil)
    }
    @objc private func rightBarBtnCilcked() {
    }
}
extension TrainContentVC :UITableViewDelegate,UITableViewDataSource {
    /// Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        default:
            return 4
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTrainActionCellRI, for: indexPath) as! TrainActionCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kAutoWid(76)
    }
    /// Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let trainContentHeaderView = Bundle.current.loadNibNamed("TrainContentHeaderView", owner: nil, options: nil)?.first as! TrainContentHeaderView
            return trainContentHeaderView
        default:
            let trainActionHeaderView = Bundle.current.loadNibNamed("TrainActionHeaderView", owner: nil, options: nil)?.first as! TrainActionHeaderView
            return trainActionHeaderView
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return kAutoWid(344)
        default:
            return kAutoWid(44)
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return kAutoWid(6.0)
        default:
            return 0.000001
        }
    }
    
}
