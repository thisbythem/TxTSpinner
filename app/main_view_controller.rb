class MainViewController < UIViewController

  def viewDidLoad
    super

    logo_image = UIImage.imageNamed('txt-logo')

    @logo_view = UIImageView.new
    @logo_view.userInteractionEnabled = true
    @logo_view.image = logo_image
    @logo_view.size = [logo_image.size.width, logo_image.size.height]
    @logo_view.center = view.center
    @logo_view.when_tapped { logo_view_was_tapped }

    self.view.addSubview @logo_view
  end

  def logo_view_was_tapped
    timing = CAMediaTimingFunction.send('functionWithControlPoints::::', 0.28, -0.3, 0.12, 1.0)

    rotateAnimation = CABasicAnimation.animationWithKeyPath("transform.rotation")
    rotateAnimation.toValue = Math::PI / 180 * 720
    rotateAnimation.duration = 2.0
    rotateAnimation.timingFunction = timing

    @logo_view.layer.addAnimation(rotateAnimation, forKey: :logo_spinning)
  end

end
