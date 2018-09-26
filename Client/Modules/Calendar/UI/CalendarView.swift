//
//  CalendarView.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class CalendarView: UIView {
    
    // MARK: Views
    
    /// encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day
    private weak var calendarTableView: UITableView!
    
    
    // MARK: Protocols
    
    var delegate: CalendarViewDelegate?
    var dataSource: CalendarViewDataSource?
    
    
    // MARK: Initializers
    
    init(_ frame: CGRect,
         delegate: CalendarViewDelegate? = nil,
         dataSource: CalendarViewDataSource? = nil) {
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        let calendarTableView = UITableView()
        self.calendarTableView = calendarTableView
        
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}

extension CalendarView {
    func didMoveTo(_ date: Date) {
        
    }
}

private extension CalendarView {
    func setUp() {
        setUpTableView()
    }
    
    
    // MARK: Table View Set Up
    
    func setUpTableView() {
        initializeTableView()
        styleTableView()
        constrainTableView()
    }
    
    func initializeTableView() {
        self.calendarTableView.delegate = self
        self.calendarTableView.dataSource = self
        
        self.calendarTableView.register(CalendarViewDayCell.self,
                                        forCellReuseIdentifier: CalendarViewDayCell.identifier)
    }
    
    func styleTableView() {
        
    }
    
    func constrainTableView() {
        calendarTableView.translatesAutoresizingMaskIntoConstraints = false
        
        calendarTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        calendarTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        calendarTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        calendarTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}

extension CalendarView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        guard let dataSource = dataSource else {
            return 0
        }
        
        let events = dataSource.day(for: Date()).events
        
        return events.count
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarViewDayCell.identifier,
                                                       for: indexPath) as? CalendarViewEventCell else {
            return UITableViewCell()
        }
        
        let events = dataSource.day(for: Date()).events
        let rowIndex = indexPath.row
        
        guard events.indices.contains(rowIndex) else {
            return UITableViewCell()
        }
        
        let event = events[rowIndex]
        
        cell.setUp(event)
        
        return cell
    }
}