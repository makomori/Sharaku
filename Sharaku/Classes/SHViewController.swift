//
//  SHViewController.swift
//  Pods
//
//  Created by 母利 睦人 on 2017/01/04.
//
//

import UIKit

public protocol SHViewControllerDelegate {
    func shViewControllerImageDidFilter(image: UIImage)
}

public class SHViewController: UIViewController {
    public var delegate: SHViewControllerDelegate?
    fileprivate let filterNameList = [
        "No Filter",
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectMono",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CILinearToSRGBToneCurve",
        "CISRGBToneCurveToLinear"
    ]
    var filterIndex = 0
    let context = CIContext(options: nil)
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var collectionView: UICollectionView?
    var image: UIImage?

    public init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.image = image
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        if let view = UINib(nibName: "SHViewController", bundle: Bundle(for: self.classForCoder)).instantiate(withOwner: self, options: nil).first as? UIView {
            self.view = view
            if let image = self.image {
                imageView?.image = image
            }
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SHCollectionViewCell", bundle: Bundle(for: self.classForCoder))
        collectionView?.register(nib, forCellWithReuseIdentifier: "cell")
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imageViewDidSwipeLeft() {
        if filterIndex == filterNameList.count {
            filterIndex = 0
        } else {
            filterIndex += 1
        }
        if filterIndex != 0 {
            applyFilter()
        } else {
            imageView?.image = image
        }
    }

    @IBAction func imageViewDidSwipeRight() {
        if filterIndex == 0 {
            filterIndex = filterNameList.count - 1
        } else {
            filterIndex -= 1
        }
        if filterIndex != 0 {
            applyFilter()
        } else {
            imageView?.image = image
        }
    }

    func applyFilter() {
        let filterName = filterNameList[filterIndex]
        if let image = self.image {
            let filteredImage = createFilteredImage(filterName: filterName, image: image)
            imageView?.image = filteredImage
        }
    }

    func createFilteredImage(filterName: String, image: UIImage) -> UIImage {
        // 1 - create source image
        let sourceImage = CIImage(image: image)

        // 2 - create filter using name
        let filter = CIFilter(name: filterName)
        filter?.setDefaults()

        // 3 - set source image
        filter?.setValue(sourceImage, forKey: kCIInputImageKey)

        // 4 - output filtered image as cgImage with dimension.
        let outputCGImage = context.createCGImage((filter?.outputImage!)!, from: (filter?.outputImage!.extent)!)

        // 5 - convert filtered CGImage to UIImage
        let filteredImage = UIImage(cgImage: outputCGImage!)

        return filteredImage
    }

    @IBAction func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButtontapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension  SHViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SHCollectionViewCell
        var filteredImage = image
        if indexPath.row != 0 {
            filteredImage = createFilteredImage(filterName: filterNameList[indexPath.row], image: image!)
        }
        cell.imageView.image = filteredImage
        cell.filterNameLabel.text = filterNameList[indexPath.row]
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterNameList.count
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterIndex = indexPath.row
        if filterIndex != 0 {
            applyFilter()
        } else {
            imageView?.image = image
        }
    }
}
