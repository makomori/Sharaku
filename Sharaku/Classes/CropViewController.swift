import UIKit


final class CropViewController: UIViewController {
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let image: UIImage

    var croppedImage: UIImage? {
        return cropView.croppedImage
    }

    private let cropView = CropView()
    override func loadView() {
        super.loadView()
        cropView.clipsToBounds = true
        view.add(view: cropView)

        NSLayoutConstraint.activate([
            cropView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cropView.rightAnchor.constraint(equalTo: view.rightAnchor),
            cropView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cropView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cropView.image = image
    }
}
