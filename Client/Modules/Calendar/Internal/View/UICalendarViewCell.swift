//
//  CalendarViewDayCell.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

/// this cell holds all the data for a single calendar day
/// contains a date label on the left
/// contains a table view in the middle
class UICalendarViewCell: UICollectionViewCell {
    
    
    // MARK: Properties
    
    private var day: CalendarDay?
    
    
    // MARK: Views
    
    /// holds the information surrounding
    /// the day of the month and the day of the week
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    /// contains all the events for a single day
    /// one cell per event
    @IBOutlet weak var collectionView: UICollectionView!
}

extension UICalendarViewCell {
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        return layoutAttributes
    }
}


// MARK: - Public Setup Methods

extension UICalendarViewCell {
    func setUp(_ calendarDay: CalendarDay) {
        day = calendarDay
        
        titleLabel.text = calendarDay.date.dayNumberString
        detailLabel.text = calendarDay.date.weekdayShort
        
        collectionView.reloadData()
    }
}


// MARK: - Table View Protocol Conformance

extension UICalendarViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let day = day else {
            return 0
        }
        
        return day.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let day = day else {
            return UICollectionViewCell()
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICalendarViewEventCell.identifier,
                                                            for: indexPath) as? UICalendarViewEventCell
        else {
            return UICollectionViewCell()
        }
        
        let events = day.events
        let rowIndex = indexPath.row
        
        guard events.indices.contains(rowIndex) else {
            return UICollectionViewCell()
        }
        
        let event = events[rowIndex]
        
        cell.setUp(event)
        
        return cell
    }
}


// MARK: - Table View Delegate Conformation

extension UICalendarViewCell: UICollectionViewDelegate {
    
}


// MARK: - Table View Flow Layout Conformation

extension UICalendarViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width,
                      height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
}

extension UICalendarViewCell {
    static let identifier = "calendardaycell"
}
