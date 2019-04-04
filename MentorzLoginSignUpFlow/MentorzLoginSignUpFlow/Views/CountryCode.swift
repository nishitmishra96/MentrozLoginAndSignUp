//
//  CountryCode.swift
//  MentorzLoginSignUpFlow
//
//  Created by Nishit on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//


import UIKit
class CountryCodeTVC: UITableViewCell {
    
    
    @IBOutlet weak var countryNamelbl: UILabel!
    @IBOutlet weak var countryCodelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpFontForCell()
        
    }
    
    //Font Setup
    func setUpFontForCell() {
        countryCodelbl.font = UIFont(name: "Myriad Pro", size: 17)
        countryNamelbl.font = UIFont(name: "Myriad Pro", size: 17)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(_ obj: AnyObject?) {
        
        if let cellObj = obj as? Country{
            
            countryNamelbl.text = cellObj.name
            countryCodelbl.text = cellObj.code
            handleSelectedCountryCode(isSelected: cellObj.isSelected)
        }
        
    }
    
    func handleSelectedCountryCode(isSelected:Bool){
        
        if isSelected {
            countryNamelbl.textColor = UIColor.blue
            countryCodelbl.textColor = UIColor.blue
        }
        else{
            countryNamelbl.textColor = UIColor.black
            countryCodelbl.textColor = UIColor.black
        }
    }
    
}
