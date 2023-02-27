//
//  DiaryDetailViewController.swift
//  SimpleDiary
//
//  Created by Yutaka Inoue on 2023/02/25.
//

import UIKit

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var imageScroll: UIScrollView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var navigationBar: UINavigationBar!

    let imageNames = ["photo.artframe", "photo.artframe", "photo.artframe"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        imageScroll.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageScroll.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            imageScroll.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2),
            imageScroll.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor),
            imageScroll.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            text.topAnchor.constraint(equalTo: imageScroll.bottomAnchor),
            text.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            text.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            text.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

            pageControl.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            pageControl.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            pageControl.bottomAnchor.constraint(equalTo: self.text.topAnchor)
        ])

        imageScroll.contentSize = CGSize(width: self.view.frame.width * 3,
                                        height: self.view.frame.height / 2)

        viewSetting()
    }

    func viewSetting() {
        createImageView(images: imageNames)
        pageControl.numberOfPages = 3
    }

    func createImageView(images: [String]) {
        var pageIndex: CGFloat = 0

        for image in images {

            let imageView = UIImageView(frame: CGRect(x: self.view.frame.width * pageIndex,
                                                      y: 0,
                                                      width: self.view.frame.width,
                                                      height: self.view.frame.height / 2))

            let image = UIImage(systemName: image)
            imageView.image = image
            imageView.tintColor = .black

            imageScroll.addSubview(imageView)
            pageIndex += 1
        }
    }

    @IBAction func dissmissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
extension DiaryDetailViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }

}

