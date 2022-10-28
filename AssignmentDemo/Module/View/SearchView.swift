//
//  SearchView.swift
//  AssignmentDemo
//

import UIKit

class SearchView: UIView {
    @IBOutlet weak var searchBarItem: UISearchBar!
    
    init() {
        super.init(frame: .zero)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadNib() {
        let view = Bundle.main.loadNibNamed("SearchView", owner: self)?.first as? UIView
        view?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view?.frame = bounds
        addSubview(view ?? UIView())
    }
}
