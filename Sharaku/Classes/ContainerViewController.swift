import UIKit

extension UIView {
    func add(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    func add(views: [UIView]) {
        views.forEach{ add(view: $0) }
    }
}

extension UIViewController {
    func removeFromContainer() {
        guard parent != nil else { return }
        willMove(toParentViewController: nil)
        view.removeFromSuperview()
        removeFromParentViewController()
    }

    func add(to viewController: UIViewController, container: UIView) {
        viewController.addChildViewController(self)
        container.add(view: view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.leftAnchor.constraint(equalTo: container.leftAnchor),
            view.rightAnchor.constraint(equalTo: container.rightAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
}

public final class ContainerViewController: UIViewController {
    private let filterViewController: SHViewController
    private let cropViewController: CropViewController
    private let containerView = UIView()
    private let filter: UIButton = {
       let b = UIButton()
        b.setTitleColor(.gray, for: .normal)
        b.setTitleColor(.black, for: .selected)
        b.setTitle("Filter", for: .normal)
        return b
    }()
    private let crop: UIButton = {
        let b = UIButton()
        b.setTitleColor(.gray, for: .normal)
        b.setTitleColor(.black, for: .selected)
        b.setTitle("Crop", for: .normal)
        return b
    }()

    public init(image: UIImage) {
        filterViewController = SHViewController(image: image)
        cropViewController = CropViewController(image: image)
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var prefersStatusBarHidden: Bool {
        return true
    }

    override public func loadView() {
        super.loadView()

        let topBar = UIView()
        topBar.backgroundColor = .white
        view.add(view: topBar)

        let next = UIButton()
        next.setTitleColor(.black, for: .normal)
        next.setTitle("Next", for: .normal)
        next.addTarget(self, action: #selector(ContainerViewController.didTapNext), for: .touchUpInside)

        let back = UIButton()
        back.setTitleColor(.black, for: .normal)
        back.setTitle("Back", for: .normal)
        back.addTarget(self, action: #selector(ContainerViewController.didTapBack), for: .touchUpInside)

        topBar.add(views: [next, back])

        NSLayoutConstraint.activate([
            topBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            topBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            topBar.topAnchor.constraint(equalTo: view.topAnchor),
            topBar.heightAnchor.constraint(equalToConstant: 44),

            next.rightAnchor.constraint(equalTo: topBar.rightAnchor, constant: -10),
            next.topAnchor.constraint(equalTo: topBar.topAnchor),
            next.bottomAnchor.constraint(equalTo: topBar.bottomAnchor),

            back.leftAnchor.constraint(equalTo: topBar.leftAnchor, constant: 10),
            back.topAnchor.constraint(equalTo: topBar.topAnchor),
            back.bottomAnchor.constraint(equalTo: topBar.bottomAnchor)
        ])

        let bottomTab = UIView()
        bottomTab.backgroundColor = .white
        view.add(view: bottomTab)

        bottomTab.add(views: [filter, crop])

        NSLayoutConstraint.activate([
            bottomTab.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomTab.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomTab.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomTab.heightAnchor.constraint(equalToConstant: 44),

            filter.leftAnchor.constraint(equalTo: bottomTab.leftAnchor),
            filter.bottomAnchor.constraint(equalTo: bottomTab.bottomAnchor),
            filter.topAnchor.constraint(equalTo: bottomTab.topAnchor),
            filter.rightAnchor.constraint(equalTo: bottomTab.centerXAnchor),

            crop.leftAnchor.constraint(equalTo: bottomTab.centerXAnchor),
            crop.bottomAnchor.constraint(equalTo: bottomTab.bottomAnchor),
            crop.topAnchor.constraint(equalTo: bottomTab.topAnchor),
            crop.rightAnchor.constraint(equalTo: bottomTab.rightAnchor),
        ])

        view.add(view: containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topBar.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomTab.topAnchor),
        ])
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        showFilter()
        filter.addTarget(self, action: #selector(ContainerViewController.showFilter), for: .touchUpInside)
        crop.addTarget(self, action: #selector(ContainerViewController.showCrop), for: .touchUpInside)
    }

    func showFilter() {
        if let image = cropViewController.croppedImage {
            filterViewController.image = image
        }
        cropViewController.removeFromContainer()
        filterViewController.add(to: self, container: containerView)
        filter.isSelected = true
        crop.isSelected = false
    }

    func showCrop() {
        filterViewController.removeFromContainer()
        cropViewController.add(to: self, container: containerView)
        filter.isSelected = false
        crop.isSelected = true
    }

    func didTapNext() {
        print(#function)
    }

    func didTapBack() {
        dismiss(animated: true, completion: nil)
    }
}
