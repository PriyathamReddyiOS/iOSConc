//
//  CustomSearchCell.swift
//  MovieBrowser
//
//  Created by priyatham reddy on 10/16/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class CustomSearchCell: UITableViewCell {
    
    static let identifier = "CustomSearchCell"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(ratingLabel)
        setUpConstraints()
        
    }
    
    public func configure(movie: Movie){
        titleLabel.text = movie.title
        ratingLabel.text = String(movie.voteAverage)
        dateLabel.text = dateFormatter(date: movie.releaseDate)
    }
    
    func dateFormatter(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = .current
        return formatter.string(from: date)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        ratingLabel.text = nil
        dateLabel.text = nil
    }
   
    func setUpConstraints() {
    NSLayoutConstraint.activate([
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
    titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
    
    dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
    dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
    dateLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
    dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
    
    ratingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
