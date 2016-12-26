REBOL [Type: 'index]

title "View Tests"
summary "May require newer version of View."
backdrop [gradient 1x1 230.140.140 150.170.150 grid 150.170.150]

file "Draw Test" %view/draw-test.r [31-May-2005/16:35-7:00]
info "Tests for DRAW scalar vector graphics functions"

file "Spline Time" %view/spline-time.r
info "Update lines and splines in real time."

file "Secure" %view/secure.r 9-Jun-2005/10:35-7:00
info "Checks sandbox security for reblets"

file "Random" %view/random.r [7-jun-2005/13:39-7:00]
info "Random number generator check"

file "Draw Matrix" %draw-matrix.r [16-jun-2005/10:56-7:00]
info "Test DRAW Matrix a bit"

file "Image Bounce" %image-bounce.r [16-jun-2005/10:56-7:00]
info "Image draw test"

file "Gradient Test" %grads.r
file "Grad Image Test" %grad-image.r
file "Color Names" %color-names.r
file "Buttons" %buttons.r
file "Scroll Test" %scroll-test.r
file "Arc Angle" %arc-angle.r 17-jun-2005/13:27-7:00
file "TLC" %tlc.r info "Tint, Luma, Contrast Test"
file "Reflect" %reflected.r
file "Grad All" %grad-all.r
file "Grad Color" %grad-col.r
file "Cross Fade" %cross-fade.r
file "Bounce Inside" %bounce-in.r
file "Bounce Outside" %bounce-out.r
file "Line Cap Join" %line-cap-join.r

file "Seek Test" http://www.rebol.net/tests/seek.r "New /seek refinement"