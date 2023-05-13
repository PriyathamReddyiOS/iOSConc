//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    private var baseUrl = "https://image.tmdb.org/t/p/w500"
    private var imageCache = NSCache<NSString,UIImage>()
    
    
    private let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Starwars"
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.font = .systemFont(ofSize: 20, weight: .bold)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainLabel
    }()
    
    private let subLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.textColor = .lightGray
        subLabel.font = .systemFont(ofSize: 14)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        return subLabel
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let overViewLabel: UILabel = {
        let overViewLabel = UILabel()
        overViewLabel.translatesAutoresizingMaskIntoConstraints = false
        overViewLabel.numberOfLines = 0
        overViewLabel.lineBreakMode = .byWordWrapping
        overViewLabel.textAlignment = .left
        overViewLabel.font = .systemFont(ofSize: 14)
        overViewLabel.adjustsFontSizeToFitWidth = true
        overViewLabel.adjustsFontForContentSizeCategory = true
        return overViewLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(imageView)
        view.addSubview(overViewLabel)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
           
            
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor),
            subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            imageView.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 2),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            overViewLabel.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 2),
            overViewLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8)
            
        ])
    }
    
    func dateFormatter(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = .current
        return formatter.string(from: date)
        
    }
    
    func convertUrlToImage(urlStr: String) {
      
        // check if there is a cache for the url
        if let image = imageCache.object(forKey: NSString(string: urlStr)) {
            self.imageView.image = image
            print("using cache")
            return
        }
      
        
        guard let url = URL(string: urlStr) else { return }
       DispatchQueue.global().async { [weak self] in
               // Fetch Image Data
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.imageCache.setObject(image, forKey: NSString(string: urlStr))
                        self?.imageView.image = image
                    }
                }
                
            } catch {
                print(error)
            }
            
           }
    }
    
    public func configureDetail(movie: Movie){
        mainLabel.text = movie.title
        subLabel.text = "Released Date: \(dateFormatter(date: movie.releaseDate))"
        overViewLabel.text = movie.overview
        print(movie.overview)
        if let path = movie.backdropPath {
            convertUrlToImage(urlStr: baseUrl + path)
        }
        
        
    }
    
    
    
}
