//
//  ViewController.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import UIKit
enum ViewControllerState {
    case loading
    case error
    case success
}


class NumbersViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var refreshControl: UIRefreshControl!
    var viewModel:  NumbersViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshControl()
        collectionView.collectionViewLayout = NumbersCollectoinViewLayout()
        viewModel?.loadData()
    }
    
}

extension NumbersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numbers.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberCell", for: indexPath) as? NumberCollectionViewCell else {
            assertionFailure("Should not fall through")
            return UICollectionViewCell()
        }
        
        let viewData = viewModel.numbers[indexPath.row]
        cell.configure(with: viewData)
        return cell
        
    }
    
    
}


extension NumbersViewController: NumbersViewModelDelegate {
    func reloadData(state: ViewControllerState) {
        switch state {
        case .loading:
            refreshControl.beginRefreshing()
        case .error:
            // TODO: Error handling UI
            refreshControl.endRefreshing()
        case .success:
            refreshControl.endRefreshing()
            self.collectionView.reloadData()
        }
    }
}

extension NumbersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewDataItem =  viewModel.numbers[indexPath.row]
        let layout = collectionViewLayout as? NumbersCollectoinViewLayout
        return CGSize(width: layout?.itemSize.width ?? 50, height: viewDataItem.isHaveOppositeNumber ? 100.0 : 50 )
    }
}

private extension NumbersViewController {
    
    @objc func refresh(_ sender: AnyObject) {
        viewModel.loadData()
    }
    
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string:"Refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    func setupCollectionView() {
        
    }
}
