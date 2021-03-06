//
//  CardCollectionCell.swift
//  CardTest
//
//  Created by Luigi Aiello on 01/11/17.
//  Copyright © 2017 Luigi Aiello. All rights reserved.
//

import UIKit
import Cards

class CardCollectionCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet private weak var view: UIView!
    
    //MARK:- Variables
    public var card: CardHighlight!
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    // MARK: - Methods
    func set(imageString: String? = "", locationString: String = "", index: Int, viewController controller: UIViewController) {
    
        let imageView: UIImageView = UIImageView(frame: self.view.frame)
        if let img = imageString, let imageUrl = URL(string: img) {
            imageView.kf.setImage(with: imageUrl, placeholder: nil, completionHandler: { (image, error, cache, url) in
                if error == nil {
                    let card = CardArticle(frame: CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height))
                    card.delegate = controller as? CardDelegate
                    card.backgroundImage = image
                    card.cardRadius = 10
                    card.shadowBlur = 5
                    card.title = ""
                    card.category = ""
                    card.subtitle = ""
                    card.tag = index
                    card.hasParallax = true
                    self.view.addSubview(card)
                }
            })
        }
    }
    
    private func reset() {
        view.subviews.forEach { $0.removeFromSuperview() }
    }
}
