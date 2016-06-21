import UIKit

final class PhotoControlsView: UIView {
    
    // MARK: - Subviews
    
    private let removeButton = UIButton()
    private let cropButton = UIButton()
    
    // MARK: UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .whiteColor()
        
        removeButton.addTarget(
            self,
            action: #selector(PhotoControlsView.onRemoveButtonTap(_:)),
            forControlEvents: .TouchUpInside
        )
        
        cropButton.addTarget(
            self,
            action: #selector(PhotoControlsView.onCropButtonTap(_:)),
            forControlEvents: .TouchUpInside
        )
        
        addSubview(removeButton)
//        addSubview(cropButton)    // в первой итерации не показываем
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        removeButton.sizeToFit()
        removeButton.center = bounds.center
    }
    
    // MARK: - PhotoControlsView
    
    var onRemoveButtonTap: (() -> ())?
    var onCropButtonTap: (() -> ())?
    var onCameraButtonTap: (() -> ())?
    
    func setControlsTransform(transform: CGAffineTransform) {
        removeButton.transform = transform
        cropButton.transform = transform
    }
    
    func setColors(colors: MediaPickerColors) {
    }
    
    func setImages(images: MediaPickerImages) {
        removeButton.setImage(images.removePhotoIcon(), forState: .Normal)
        cropButton.setImage(images.cropPhotoIcon(), forState: .Normal)
    }
    
    // MARK: - Private
    
    @objc private func onRemoveButtonTap(sender: UIButton) {
        onRemoveButtonTap?()
    }
    
    @objc private func onCropButtonTap(sender: UIButton) {
        onCropButtonTap?()
    }
}
