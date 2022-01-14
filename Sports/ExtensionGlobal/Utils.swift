//
//  Utils.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import UIKit
extension String {
    func convertDateFormater() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
            let newDate = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return  dateFormatter.string(from: newDate!)
    }
}
extension UILabel{
    class func setupLabel(title: String, alignment: NSTextAlignment, color: UIColor, alpha: Double, size: Int, numberLines: Int ) -> UILabel{
        let label = UILabel()
        label.text = title
        label.textAlignment = alignment
        label.textColor = color.withAlphaComponent(alpha)
        label.font = UIFont.systemFont(ofSize: CGFloat(size))
        label.numberOfLines = numberLines
        return label
    }
}

// функция для кнопки

extension UIButton{
    class func setupButton(title: String, color: UIColor, activation: Bool, invisibility: Bool, laeyerRadius: Double, alpha: Double, textcolor: UIColor  ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(textcolor, for: .normal)
        button.backgroundColor = color.withAlphaComponent(alpha)
        button.layer.cornerRadius = laeyerRadius //30/2  // скругляем кнопку
        button.isEnabled = activation   //диактивация кнопки изначально кнопка не активна (активна после заполнения всех полей)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isHidden = invisibility
       
        return button
    }
}
