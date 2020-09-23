//
//  collectionCell.swift
//  Task3
//
//  Created by Umer Farooq on 22/09/2020.
//  Copyright © 2020 Umer Farooq. All rights reserved.
//

import UIKit
protocol CollectionCellDelegate: AnyObject {
    func returnCvIndex(tableIndex:Int, data: Int)
}

protocol CollectionCellDelegate1: AnyObject {
    func returnCvIndex(tableIndex:Int,data: Int)
}

class collectionCell: UICollectionViewCell {
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var pressBtn: UIButton!
    
    
    
    //MARK: - Variables
    weak var delegate:CollectionCellDelegate1?
    var tableIndex :Int = 0

    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    //MARK: - Actions
    @IBAction func CallDelegate(_ sender: Any) {
        delegate?.returnCvIndex(tableIndex: tableIndex, data: 0)
    }
}
