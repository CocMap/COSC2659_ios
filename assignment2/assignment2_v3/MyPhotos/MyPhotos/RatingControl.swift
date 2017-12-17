//
//  RatingControl.swift
//  MyPhotos
//
//  Created by Tran, Tran Le Nha on 12/17/17.
//  Copyright © 2017 Tran, Tran Le Nha. All rights reserved.
//

import UIKit


@IBDesignable class RatingControl: UIStackView {
        
class RatingControl: UIStackView {
    
    

        
        //-----MARK: Properties-----
        @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
        @IBInspectable var starCount: Int = 5
    
        private var ratingButtons = [UIButton]()
        var rating = 0;
    
        
        
        //-----MARK: Initialization-----
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupButtons()
        }
        
        required init(coder: NSCoder) {
            super.init(coder: coder)
            setupButtons()
        }
        
        //-----MARK: Button actions-----
        func ratingButtonTapped(button: UIButton){
            print("Button pressed 👍")
        }
        
        //-----MARK: Private Methods-----
        private func setupButtons() {
            
            for _ in 0..<starCount {
                
                //create a button
                let button = UIButton()
                button.backgroundColor = UIColor.red
                
                //add constraints
                button.translatesAutoresizingMaskIntoConstraints = false
                button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
                button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
                
                //setup the button action
                button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
                
                //add the button to the stack
                addArrangedSubview(button)
                
                //add the new button to the rating button array
                ratingButtons.append(button)
                
            }
        }
    }

}
