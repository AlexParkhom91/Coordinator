import Combine
import EasyAutolayout
import UIKit

final class MailnSignInView: UIViewController {
    var viewModel: MailnSignInViewModel!
    private var cancellables: Set<AnyCancellable> = []
    private let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.titleSubject.sink { [weak self] value in
            self?.title = value
        }.store(in: &cancellables)
    }

    private func setupUI() {
        view.backgroundColor = .red
        view.addSubview(nextButton)
        nextButton.pin
            .center(in: view)
        nextButton.setTitle("Show Screen2", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonDidTapped), for: .touchUpInside)
    }

    @objc private func nextButtonDidTapped() {
        viewModel.nextSubject.send()
    }
}
