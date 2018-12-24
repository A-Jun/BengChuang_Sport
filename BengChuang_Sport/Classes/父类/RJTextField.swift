//
//  RJTextField.swift
//  YiChunSports
//
//  Created by RJ on 2018/11/5.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class RJTextField: UITextField {
    
    /// 上移间距
    var moveUpMagin:CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    private func configureUI() -> Void {
        cofigureNotification()
    }
    private func cofigureNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAction(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAction(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc private func keyboardAction(sender:Notification) -> Void {
        guard let userInfo = sender.userInfo else { return  }
        guard let rect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return  }
        guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        let window = UIApplication.shared.keyWindow
        let maxY = self.convert(self.bounds, to: window).maxY
        if sender.name == UIResponder.keyboardWillShowNotification {
            if maxY > rect.minY && self.isFirstResponder{
                UIView.animate(withDuration: duration) {
                    window?.origin.y -= maxY - rect.minY + self.moveUpMagin
                }
            }
        }else{
            UIView.animate(withDuration: duration) {
                window?.origin.y = 0
            }
            
        }
        
    }
    func removeObserver() ->  Void{
        NotificationCenter.default.removeObserver(self)
    }
    
}
