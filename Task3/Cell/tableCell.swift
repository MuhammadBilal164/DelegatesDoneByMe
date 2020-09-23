//
//  tableCell.swift
//  Task3
//
//  Created by Umer Farooq on 22/09/2020.
//  Copyright © 2020 Umer Farooq. All rights reserved.
//

import UIKit



class tableCell: UITableViewCell, CollectionCellDelegate1 {
    
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    //MARK: - Variables
    weak var delegate:CollectionCellDelegate?
    var tableCellIndex :Int = 0
    let cellIdentifier = "cell"
    
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    
    //MARK: - SetupView
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "collectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    
    
    //MARK: - Actions
    @objc func BackToTableView(_ sender: UIButton){
        delegate?.returnCvIndex(tableIndex: tableCellIndex, data: sender.tag)
    }
    
    
    
    //MARK: - Helper Methods
    func returnCvIndex(tableIndex: Int, data: Int) {
        delegate?.returnCvIndex(tableIndex: tableIndex, data: data)
    }
}


//MARK: - UICollectionViewDelegate & DataSource
extension tableCell:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! collectionCell
        cell.delegate = self
        cell.pressBtn.tag = indexPath.row
        cell.tableIndex = self.tableCellIndex
        cell.pressBtn.addTarget(self, action: #selector(BackToTableView(_:)), for: .touchUpInside)
        return cell
    }
}
