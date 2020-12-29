import UIKit

class BaseViewController: UIViewController {

	// MARK: - IBOutlet properties

	// MARK: - Properties

    var lastClick: TimeInterval = Date().timeIntervalSince1970

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

	}

	// MARK: - ViewLifeCycle

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		self.navigationController?.navigationBar.tintColor = UIColor.white
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)

	}

	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)

	}

	// MARK: - IBAction methods

	// MARK: - Methods

	// MARK: - Custom bar button

	func customLeftButton(_ buttonImage: UIImage?,
						  frame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 20),
						  imageEdgeInsets: UIEdgeInsets = .zero) {
		let leftButton = UIButton()
		leftButton.adjustsImageWhenHighlighted = true
		leftButton.imageEdgeInsets = imageEdgeInsets
		leftButton.frame = frame
		leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
		leftButton.setImage(buttonImage, for: .normal)

		let leftButtonItem = UIBarButtonItem(customView: leftButton)

		self.navigationItem.leftBarButtonItem = leftButtonItem
	}

	func customRightButton(_ buttonImage: UIImage?,
						   frame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 20),
						   imageEdgeInsets: UIEdgeInsets = .zero) {
		let rightButton = UIButton()
		rightButton.adjustsImageWhenHighlighted = true
		rightButton.imageEdgeInsets = imageEdgeInsets
		rightButton.frame = frame
		rightButton.addTarget(self, action: #selector(rightButtonDidTap), for: .touchUpInside)
		rightButton.setImage(buttonImage, for: .normal)

		let rightBarButton = UIBarButtonItem(customView: rightButton)

		self.navigationItem.rightBarButtonItem = rightBarButton
	}

	func customRightButton(_ title: String?,
						   frame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 20),
						   imageEdgeInsets: UIEdgeInsets = .zero) {
		let rightButton = UIButton()
		rightButton.frame = frame
		rightButton.addTarget(self, action: #selector(rightButtonDidTap), for: .touchUpInside)
		rightButton.setTitle(title, for: .normal)

		let rightBarButton = UIBarButtonItem(customView: rightButton)

		self.navigationItem.rightBarButtonItem = rightBarButton
	}

	func customLeftButton(_ title: String?,
						  frame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 20),
						  imageEdgeInsets: UIEdgeInsets = .zero) {
		let rightButton = UIButton()
		rightButton.frame = frame
		rightButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
		rightButton.setTitle(title, for: .normal)

		let rightBarButton = UIBarButtonItem(customView: rightButton)

		self.navigationItem.rightBarButtonItem = rightBarButton
	}

	func customLeftButton(_ button: UIButton) {
		button.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
		let leftButtonItem = UIBarButtonItem(customView: button)
		self.navigationItem.leftBarButtonItem = leftButtonItem
	}

	func customRightButton(_ button: UIButton) {
		button.addTarget(self, action: #selector(rightButtonDidTap), for: .touchUpInside)
		let leftButtonItem = UIBarButtonItem(customView: button)
		self.navigationItem.leftBarButtonItem = leftButtonItem
	}

	func alignedRightBarButtonItems() {
		let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
		spacer.width = 8
		let barButton = CustomBarButtonItem(position: .right,
											image: UIImage(named: "icon-dot-vertical"))

		barButton.customView?.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
		barButton.customView?.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

		if let _customView = barButton.customView as? UIButton {
			_customView.addTarget(self, action: #selector(rightButtonDidTap), for: .touchUpInside)
		}

		let barButtonsItems = [
			spacer,
			barButton
		]

		self.navigationItem.rightBarButtonItems = barButtonsItems
	}

	// MARK: - Double click

	func isDoubleClick() -> Bool {
		let now: TimeInterval = Date().timeIntervalSince1970

		if (now - lastClick) < 0.3 {
			logD("Double click")
			return true
		}

		self.lastClick = now

		return false
	}

	// MARK: - @objc method

	@objc func leftButtonDidTap() {

	}

	@objc func rightButtonDidTap() {

	}
}
