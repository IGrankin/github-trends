//
//  RepoChartsViewController.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SafariServices

class RepoChartsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var segmentColtrol: UISegmentedControl!
    let cellName = "repoCell"
    let cellXibName = "RepositoryCell"
    var viewModel: RepositoryViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupViewModel()
        
        setupSegmentControl()
        setupCollectionView()
        
        viewModel.newReposLoaded.bind { (success) in
            self.collectionView.reloadData()
        }
        viewModel.loadRepos()
    }
    
    func setupViewModel() {
//        let itemsRepo = TestRepository()
        let itemsRepo = GithubRepository()
        viewModel = RepositoryViewModel(itemsRepo: itemsRepo)
    }
    
    //MARK: UI setup
    
    func setupSegmentControl() {
        segmentColtrol = UISegmentedControl(items: viewModel.getTimePeriods())
        segmentColtrol.selectedSegmentIndex = viewModel.getLastChosenTimePeriod()
        segmentColtrol.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentColtrol)
        NSLayoutConstraint.activate([
            segmentColtrol.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentColtrol.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            segmentColtrol.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48)
        ])
        
        segmentColtrol.addTarget(self, action: #selector(segmentControllChanged(segment:)), for: .valueChanged)
    }
    
    @objc func segmentControllChanged(segment: UISegmentedControl) {
        viewModel.timePeriodWasChanged(to: segment.selectedSegmentIndex)
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
        return viewModel.getRepoCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RepositoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! RepositoryCell
        let model = viewModel.getRepo(for: indexPath.row)
        cell.repoNameLabel.text = model?.repoName
        cell.repoAuthorLabel.text = model?.username
        cell.repoDescLabel.text = model?.repoDesc
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width - 16 * 2, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = viewModel.getRepo(for: indexPath.row),
            let urlString = item.url,
            let url = URL(string: urlString) {
            let controller = SFSafariViewController(url: url)
            controller.dismissButtonStyle = .close
            controller.configuration.barCollapsingEnabled = true
            controller.modalTransitionStyle = .coverVertical
            self.present(controller, animated: true, completion: nil)
            controller.delegate = self
        }
    }
    
}

extension RepoChartsViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
