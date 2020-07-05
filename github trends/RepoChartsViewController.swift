//
//  RepoChartsViewController.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RepoChartsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var segmentColtrol: UISegmentedControl!
    let cellName = "repoCell"
    let cellXibName = "RepositoryCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupSegmentControl()
        setupCollectionView()
    }
    
    func setupSegmentControl() {
        segmentColtrol = UISegmentedControl(items: ["Daily", "Weekly", "Montly"])
        segmentColtrol.selectedSegmentIndex = 0
        segmentColtrol.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentColtrol)
        NSLayoutConstraint.activate([
            segmentColtrol.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentColtrol.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            segmentColtrol.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48)
        ])
    }
}

extension RepoChartsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        //Flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 16
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //Constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: segmentColtrol.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.backgroundColor = .systemBackground
        //Delegates
        collectionView.register(UINib(nibName: cellXibName, bundle: nil), forCellWithReuseIdentifier: cellName)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RepositoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! RepositoryCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width - 16 * 2, height: 180)
    }
    
}
