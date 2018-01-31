import UIKit
import GenericDataSource

class PhotoCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - ReusableCell
    public static var height: CGFloat = 128.0

    // MARK: - ConfigurableCell
    func configure(_ item: PhotoViewModel, at indexPath: IndexPath) {
        label.text = item.caption
        imageView.image = UIImage(named: item.imageName)
    }
}
