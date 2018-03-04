//
//  MovieCell.swift
//  Flix
//
//  Created by Pranaya Adhikari on 1/23/18.
//  Copyright © 2018 Pranaya Adhikari. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {


  
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!{
        didSet{
            titleLabel.text =  movie.title
            overviewLabel.text = movie.overview
            posterImageView.af_setImage(withURL: movie.posterUrl!)
        }
    }
    
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
