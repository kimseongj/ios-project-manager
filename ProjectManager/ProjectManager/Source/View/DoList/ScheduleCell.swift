//
//  ScheduleCell.swift
//  ProjectManager
//
//  Created by songjun, vetto on 2023/05/17.
//

import UIKit

final class ScheduleCell: UICollectionViewCell {
    private let cellPadding: CGFloat = 15
    private let yesterdayInterval: Double = -86400
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .headline)
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let expirationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(contentLabel)
        stackView.addArrangedSubview(expirationLabel)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cellPadding),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cellPadding),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: cellPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -cellPadding)
        ])
    }
    
    func configureLabel(schedule: Schedule) {
        titleLabel.text = schedule.title
        contentLabel.text = schedule.content
        expirationLabel.text = DateFormatterManager.shared.convertToDate(from: schedule.expirationDate)
        
        if schedule.expirationDate < Date(timeIntervalSinceNow: yesterdayInterval) {
            expirationLabel.textColor = .systemRed
        }
    }
}
