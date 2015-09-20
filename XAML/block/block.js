/// -----------------------------------------------------------------------------------------------
/// Do not remove these references. They are used by Popfly to provide intellisense in your editor.
///
/// For Popfly Block development documentation, please see http://go.microsoft.com/fwlink/?LinkId=106942
/// 
/// <reference name="MicrosoftAjax.js" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" />
/// <reference name="Microsoft.Popfly.Explorer.Wizard.BlockAPI.js" assembly="Microsoft.Popfly.Explorer.Wizard, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c1ceb53b217f2480" />
/// -----------------------------------------------------------------------------------------------

function ImageSlideShowClass()
{
    ImageSlideShowClass.initializeBase(this);
	this.fullScreenIconPosition = "none";
	
    this.isInitialized = false;
    this.index = -1; 
    this.images = new Array();
    this.controls = "on";
    this.isPaused = false;
    this.forceNext = false;
    this.forcePrev = false;
    this.isSliding = false;
    

	var xamlSB = new Sys.StringBuilder();
	xamlSB.append("<Image xmlns='http://schemas.microsoft.com/client/2007' xmlns:x='http://schemas.microsoft.com/winfx/2006/xaml' Name='image' Opacity='0' Width='640' Height='480' Stretch='Uniform'>");
	xamlSB.append("  <Image.Resources>");
	xamlSB.append("    <Storyboard Name='fadeIn' Duration='0:0:5'>");
	xamlSB.append("      <DoubleAnimation Storyboard.TargetName='image' Storyboard.TargetProperty='Opacity' To='1' Duration='0:0:1' />");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard Name='fadeOut' Duration='0:0:1'>");
	xamlSB.append("      <DoubleAnimation Storyboard.TargetName='image' Storyboard.TargetProperty='Opacity' To='0' Duration='0:0:1' />");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("  </Image.Resources>");
	xamlSB.append("</Image>");
	
	this.imageXaml = xamlSB.toString();
	
	
	
    xamlSB = new Sys.StringBuilder();
	xamlSB.append("<Canvas xmlns='http://schemas.microsoft.com/client/2007' xmlns:x='http://schemas.microsoft.com/winfx/2006/xaml' x:Name='btn_Thumbnail' Width='34' Height='34' Background='#00000000'>");
	xamlSB.append("  <Canvas.Resources>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbnailEnter'>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_Preview' Storyboard.TargetProperty='(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleX)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeySpline='0,1,1,1' KeyTime='00:00:00.3000000' Value='1' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_Preview' Storyboard.TargetProperty='(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleY)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeySpline='0,1,1,1' KeyTime='00:00:00.3000000' Value='1' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbnailLeave'>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_Preview' Storyboard.TargetProperty='(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleX)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeySpline='0,0,1,0' KeyTime='00:00:00.3000000' Value='0' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_Preview' Storyboard.TargetProperty='(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleY)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeySpline='0,0,1,0' KeyTime='00:00:00.3000000' Value='0' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("  </Canvas.Resources>");
	xamlSB.append("  <Image Width='34' Height='34' Stretch='UniformToFill' x:Name='img_Thumbnail' />");
	xamlSB.append("  <Rectangle Width='34' Height='34' Stroke='#FFFFFFFF' />");
	xamlSB.append("  <Canvas RenderTransformOrigin='0.5,1' x:Name='cvs_Preview' Width='150' Height='120' Canvas.Left='-58' Canvas.Top='-126'>");
	xamlSB.append("    <Canvas.RenderTransform>");
	xamlSB.append("      <TransformGroup>");
	xamlSB.append("        <ScaleTransform ScaleX='0' ScaleY='0' />");
	xamlSB.append("        <SkewTransform AngleX='0' AngleY='0' />");
	xamlSB.append("        <RotateTransform Angle='0' />");
	xamlSB.append("        <TranslateTransform X='0' Y='0' />");
	xamlSB.append("      </TransformGroup>");
	xamlSB.append("    </Canvas.RenderTransform>");
	xamlSB.append("    <Path Width='17.167' Height='8.167' Fill='#FF5B5B5B' Stretch='Fill' Stroke='#FF5B5B5B' Data='M67.166667,119 L74.166331,122.5 80.665683,119 z' Canvas.Left='66.334' Canvas.Top='118.668' />");
	xamlSB.append("    <Canvas Width='150' Height='120'>");
	xamlSB.append("      <Canvas.Clip>");
	xamlSB.append("        <RectangleGeometry Rect='0,0,150,120' RadiusX='5' RadiusY='5' />");
	xamlSB.append("      </Canvas.Clip>");
	xamlSB.append("      <Image Width='150' Height='120' x:Name='img_Preview' Stretch='UniformToFill' />");
	xamlSB.append("      <Rectangle Width='150' Height='120' Stroke='#FF5B5B5B' StrokeThickness='2' RadiusX='5' RadiusY='5' />");
	xamlSB.append("    </Canvas>");
	xamlSB.append("  </Canvas>");
	xamlSB.append("</Canvas>");


    this.thumbnailXaml = xamlSB.toString();
}

ImageSlideShowClass.prototype.getXaml = function()
{
	var xamlSB = new Sys.StringBuilder();
	xamlSB.append("<Canvas xmlns='http://schemas.microsoft.com/client/2007' xmlns:x='http://schemas.microsoft.com/winfx/2006/xaml' Width='640' Height='480' x:Name='cvs_Main'>");
	xamlSB.append("  <Canvas.Resources>");
	xamlSB.append("    <Storyboard x:Name='stb_InfoIn'>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_InfoOverlay' Storyboard.TargetProperty='(Canvas.Top)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeySpline='0.358,0.997,0.756,1' KeyTime='00:00:00.7000000' Value='0' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_InfoOut'>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_InfoOverlay' Storyboard.TargetProperty='(Canvas.Top)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeySpline='0.358,0,0.583,0.007' KeyTime='00:00:00.5000000' Value='-70' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbLeftEnter'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.4000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.4000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.4000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbRightEnter'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path1' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path1' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle1' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbLeftLeave'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.4000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.4000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.4000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbRightLeave'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path1' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path1' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle1' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ControlsIn'>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_Controls' Storyboard.TargetProperty='(UIElement.Opacity)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeyTime='00:00:00.3000000' Value='1' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ControlsOut'>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='cvs_Controls' Storyboard.TargetProperty='(UIElement.Opacity)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeyTime='00:00:01' Value='0' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ControlsPreview'>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:02' Storyboard.TargetName='cvs_Controls' Storyboard.TargetProperty='(UIElement.Opacity)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeyTime='00:00:01' Value='0' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("      <DoubleAnimationUsingKeyFrames BeginTime='00:00:02' Storyboard.TargetName='cvs_InfoOverlay' Storyboard.TargetProperty='(Canvas.Top)'>");
	xamlSB.append("        <SplineDoubleKeyFrame KeySpline='0.358,0,0.583,0.007' KeyTime='00:00:00.5000000' Value='-70' />");
	xamlSB.append("      </DoubleAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");	
	xamlSB.append("    <Storyboard x:Name='stb_PauseEnter'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle2' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle3' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_PauseLeave'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle2' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF707070' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='rectangle3' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF707070' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_BackEnter'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy1' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy1' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_BackLeave'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy1' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy1' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ForwardEnter'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy2' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy2' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy3' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy3' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ForwardLeave'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy2' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy2' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy3' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_Copy3' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_PlayEnter'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path2' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path2' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_PlayLeave'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path2' Storyboard.TargetProperty='(Shape.Fill).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path2' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbsSlideLeft'>");
	xamlSB.append("      <DoubleAnimation Storyboard.TargetName='cvs_Thumbs' Storyboard.TargetProperty='(Canvas.Left)' By='-260' Duration='0:0:0.5' />");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_ThumbsSlideRight'>");
	xamlSB.append("      <DoubleAnimation Storyboard.TargetName='cvs_Thumbs' Storyboard.TargetProperty='(Canvas.Left)' By='260' Duration='0:0:0.5' />");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_FullScreenEnter'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_FullScreenIcon' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FFFFFFFF' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("    <Storyboard x:Name='stb_FullScreenLeave'>");
	xamlSB.append("      <ColorAnimationUsingKeyFrames BeginTime='00:00:00' Storyboard.TargetName='path_FullScreenIcon' Storyboard.TargetProperty='(Shape.Stroke).(SolidColorBrush.Color)'>");
	xamlSB.append("        <SplineColorKeyFrame KeyTime='00:00:00.5000000' Value='#FF6A6A6A' />");
	xamlSB.append("      </ColorAnimationUsingKeyFrames>");
	xamlSB.append("    </Storyboard>");
	xamlSB.append("  </Canvas.Resources>");
	xamlSB.append("  <Canvas.Clip>");
	xamlSB.append("    <RectangleGeometry Rect='0,0,640,480' />");
	xamlSB.append("  </Canvas.Clip>");
	xamlSB.append("  <Canvas Width='640' Height='430' x:Name='cvs_InfoMouse'>");
	xamlSB.append("    <Canvas x:Name='cvs_Images' Width='640' Height='480' />");
	xamlSB.append("    <Canvas x:Name='cvs_InfoOverlay' Width='640' Height='68' Canvas.Top='0'>");
	xamlSB.append("      <Rectangle Width='636' Height='65' Fill='#BF666666' RadiusX='5' RadiusY='5' Canvas.Left='2' Canvas.Top='2' />");
	xamlSB.append("      <TextBlock x:Name='txt_Title' Width='615' Height='18' Canvas.Left='17' Canvas.Top='12' FontFamily='Trebuchet MS' FontSize='18' Foreground='#FFFFFFFF' Text='' TextWrapping='Wrap' />");
	xamlSB.append("      <TextBlock Width='615' Height='14' Canvas.Left='17' Canvas.Top='41' FontFamily='Trebuchet MS' Foreground='#FFFFFFFF' Text='' TextWrapping='Wrap' x:Name='txt_Info' FontSize='12' />");
	xamlSB.append("    </Canvas>");
	xamlSB.append("  </Canvas>");
	xamlSB.append("  <Canvas Width='640' Height='50' Canvas.Top='430' x:Name='cvs_Controls' Opacity='1'>");
	xamlSB.append("    <Rectangle Width='640' Height='50' Fill='#FFFFFFFF' />");
	xamlSB.append("    <Canvas Width='300' Height='42' Canvas.Left='170' Canvas.Top='4' x:Name='cvs_ThumbControls' Cursor='Hand' Background='#00000000'>");
	xamlSB.append("      <Rectangle Width='300' Height='42' Fill='#FFDADADA' RadiusY='5.241' RadiusX='5.241' />");
	xamlSB.append("      <Canvas Width='260' Height='34' Canvas.Top='4' Canvas.Left='20' x:Name='cvs_ThumbHolder' Clip='M0,0 L260,0 L260,34 L0,34 z M-190,-438 L450,-438 L450,-1 L-190,-1 z'>");
	xamlSB.append("        <Canvas Width='260' Height='34' Canvas.Top='0' Canvas.Left='0' x:Name='cvs_Thumbs' />");
	xamlSB.append("      </Canvas>");
	xamlSB.append("      <Canvas Width='15' Height='26' Canvas.Top='8' Canvas.Left='2' x:Name='btn_ThumbLeft' Background='#00000000'>");
	xamlSB.append("        <Path Width='6' Height='9.708' Fill='#FF6A6A6A' Stretch='Fill' Canvas.Left='1.5' Canvas.Top='8.167' Data='M7.4159999,8.8330004 L2.4746874,13.416595 7.4729853,17.542129 z' StrokeDashCap='Round' StrokeLineJoin='Round' Stroke='#FF6A6A6A' x:Name='path' />");
	xamlSB.append("        <Rectangle Width='2.891' Height='10' Fill='#FF6A6A6A' Canvas.Left='9.366' Canvas.Top='8' RadiusY='0.829' RadiusX='0.829' x:Name='rectangle' />");
	xamlSB.append("      </Canvas>");
	xamlSB.append("      <Canvas x:Name='btn_ThumbRight' Width='15' Height='26' Canvas.Left='283' Canvas.Top='8' RenderTransformOrigin='0.5,0.5' Background='#00000000'>");
	xamlSB.append("        <Canvas.RenderTransform>");
	xamlSB.append("          <TransformGroup>");
	xamlSB.append("            <ScaleTransform ScaleX='-1' ScaleY='1' />");
	xamlSB.append("            <SkewTransform AngleX='0' AngleY='0' />");
	xamlSB.append("            <RotateTransform Angle='0' />");
	xamlSB.append("            <TranslateTransform X='0' Y='0' />");
	xamlSB.append("          </TransformGroup>");
	xamlSB.append("        </Canvas.RenderTransform>");
	xamlSB.append("        <Path Width='6' Height='9.708' Fill='#FF6A6A6A' Stretch='Fill' Stroke='#FF6A6A6A' StrokeDashCap='Round' StrokeLineJoin='Round' Canvas.Left='1.5' Canvas.Top='8.167' Data='M7.4159999,8.8330004 L2.4746874,13.416595 7.4729853,17.542129 z' x:Name='path1' />");
	xamlSB.append("        <Rectangle Width='2.891' Height='10' Fill='#FF6A6A6A' RadiusX='0.829' RadiusY='0.829' Canvas.Left='9.366' Canvas.Top='8' x:Name='rectangle1' />");
	xamlSB.append("      </Canvas>");
	xamlSB.append("    </Canvas>");
	xamlSB.append("    <Canvas x:Name='cvs_SlideControls' Width='70' Height='24' Canvas.Left='56' Canvas.Top='13' Cursor='Hand' Background='#01000000'>");
	xamlSB.append("      <Rectangle Width='70' Height='24' RadiusX='5' RadiusY='5'>");
	xamlSB.append("        <Rectangle.Fill>");
	xamlSB.append("          <LinearGradientBrush EndPoint='0.5,1' StartPoint='0.5,0'>");
	xamlSB.append("            <GradientStop Color='#FFE6E6E6' Offset='0' />");
	xamlSB.append("            <GradientStop Color='#FF9F9F9F' Offset='1' />");
	xamlSB.append("          </LinearGradientBrush>");
	xamlSB.append("        </Rectangle.Fill>");
	xamlSB.append("      </Rectangle>");
	xamlSB.append("      <Canvas x:Name='btn_Pause' Width='20' Height='20' Canvas.Left='25' Canvas.Top='2' Background='#00000000'>");
	xamlSB.append("        <Rectangle Width='5.5' Height='15' Fill='#FF6A6A6A' RadiusX='0.625' RadiusY='0.625' Canvas.Left='3.125' Canvas.Top='2.625' x:Name='rectangle2' />");
	xamlSB.append("        <Rectangle Width='5.5' Height='15' Fill='#FF6A6A6A' RadiusX='0.625' RadiusY='0.625' Canvas.Left='11.45' Canvas.Top='2.625' x:Name='rectangle3' />");
	xamlSB.append("      </Canvas>");
	xamlSB.append("      <Canvas x:Name='btn_Back' Width='20' Height='20' Canvas.Top='2' Canvas.Left='3' Background='#00000000'>");
	xamlSB.append("        <Path Width='6' Height='9.708' Fill='#FF6A6A6A' Stretch='Fill' Canvas.Left='3.337' Canvas.Top='4.827' Data='M7.4159999,8.8330004 L2.4746874,13.416595 7.4729853,17.542129 z' StrokeDashCap='Round' StrokeLineJoin='Round' Stroke='#FF6A6A6A' x:Name='path_Copy' />");
	xamlSB.append("        <Path Width='6' Height='9.708' Fill='#FF6A6A6A' Stretch='Fill' Canvas.Left='9.851' Canvas.Top='4.827' Data='M7.4159999,8.8330004 L2.4746874,13.416595 7.4729853,17.542129 z' StrokeDashCap='Round' StrokeLineJoin='Round' Stroke='#FF6A6A6A' x:Name='path_Copy1' />");
	xamlSB.append("      </Canvas>");
	xamlSB.append("      <Canvas x:Name='btn_Forward' Width='20' Height='20' Canvas.Top='2' Canvas.Left='47' RenderTransformOrigin='0.5,0.5' Background='#00000000'>");
	xamlSB.append("        <Canvas.RenderTransform>");
	xamlSB.append("          <TransformGroup>");
	xamlSB.append("            <ScaleTransform ScaleX='-1' ScaleY='1' />");
	xamlSB.append("            <SkewTransform AngleX='0' AngleY='0' />");
	xamlSB.append("            <RotateTransform Angle='0' />");
	xamlSB.append("            <TranslateTransform X='0' Y='0' />");
	xamlSB.append("          </TransformGroup>");
	xamlSB.append("        </Canvas.RenderTransform>");
	xamlSB.append("        <Path Width='6' Height='9.708' Fill='#FF6A6A6A' Stretch='Fill' Canvas.Left='3.337' Canvas.Top='4.827' Data='M7.4159999,8.8330004 L2.4746874,13.416595 7.4729853,17.542129 z' StrokeDashCap='Round' StrokeLineJoin='Round' Stroke='#FF6A6A6A' x:Name='path_Copy2' />");
	xamlSB.append("        <Path Width='6' Height='9.708' Fill='#FF6A6A6A' Stretch='Fill' Canvas.Left='9.851' Canvas.Top='4.827' Data='M7.4159999,8.8330004 L2.4746874,13.416595 7.4729853,17.542129 z' StrokeDashCap='Round' StrokeLineJoin='Round' Stroke='#FF6A6A6A' x:Name='path_Copy3' />");
	xamlSB.append("      </Canvas>");
	xamlSB.append("      <Canvas x:Name='btn_Play' Width='20' Height='20' Canvas.Left='25' Canvas.Top='2' Background='#00000000' Visibility='Collapsed'>");
	xamlSB.append("        <Path x:Name='path2' Width='14.667' Height='14.75' Fill='#FF6A6A6A' Stretch='Fill' Stroke='#FF6A6A6A' StrokeDashCap='Round' StrokeEndLineCap='Flat' StrokeLineJoin='Round' StrokeStartLineCap='Flat' Data='M3.25,3 L3.25,16.75 16.916667,10 z' Canvas.Left='2.75' Canvas.Top='2.749' />");
	xamlSB.append("      </Canvas>");
	xamlSB.append("    </Canvas>");
	xamlSB.append("    <Canvas x:Name='cvs_ScreenControls' Width='63' Height='24' Canvas.Left='513' Canvas.Top='13'>");
	xamlSB.append("      <Canvas x:Name='btn_FullScreen' Width='23' Height='24' Canvas.Left='38' Canvas.Top='0'>");
	xamlSB.append("        <Rectangle Width='23' Height='24' RadiusX='3.167' RadiusY='3.167'>");
	xamlSB.append("          <Rectangle.Fill>");
	xamlSB.append("            <LinearGradientBrush EndPoint='0.5,1' StartPoint='0.5,0'>");
	xamlSB.append("              <GradientStop Color='#FFDFDFDF' Offset='0' />");
	xamlSB.append("              <GradientStop Color='#FFA1A1A1' Offset='1' />");
	xamlSB.append("            </LinearGradientBrush>");
	xamlSB.append("          </Rectangle.Fill>");
	xamlSB.append("        </Rectangle>");
	xamlSB.append("        <Path x:Name='path_FullScreenIcon' Width='18.375' Height='15' Stretch='Fill' Stroke='#FF6A6A6A' StrokeDashCap='Round' StrokeEndLineCap='Round' StrokeLineJoin='Round' StrokeStartLineCap='Round' StrokeThickness='2' Data='M17.312,8.4375 L17.299001,13 C17.299001,13.552285 16.851313,14 16.299062,14 L1.9999387,14 C1.4476878,14 1,13.552285 1,13 L1,2 C1,1.4477153 1.4476878,1 1.9999387,1 L9.8747281,1 M10.5,7.75 L16.803,1.7469999 M17.374508,1.0630001 L13.625,1.0629998 17.375,4.6879996 z' Canvas.Left='2.25' Canvas.Top='5.25' RenderTransformOrigin='0.5,0.5'>");
	xamlSB.append("          <Path.RenderTransform>");
	xamlSB.append("            <TransformGroup>");
	xamlSB.append("              <ScaleTransform ScaleX='1' ScaleY='1' />");
	xamlSB.append("              <SkewTransform AngleX='0' AngleY='0' />");
	xamlSB.append("              <RotateTransform Angle='0' />");
	xamlSB.append("              <TranslateTransform X='0' Y='0' />");
	xamlSB.append("            </TransformGroup>");
	xamlSB.append("          </Path.RenderTransform>");
	xamlSB.append("        </Path>");
	xamlSB.append("      </Canvas>");
	xamlSB.append("    </Canvas>");
	xamlSB.append("  </Canvas>");
	xamlSB.append("</Canvas>");


    return xamlSB.toString();
};

ImageSlideShowClass.prototype.clearImages = function()
{
    if (this.isInitialized)
    {
        this.images = new Array();
        this.thumbnailCanvas.children.clear();
        this.canvas.children.clear();
        this.index = -1;
    }
    
};

ImageSlideShowClass.prototype.addImage = function(title, name, url)
{
    Array.add(this.images, {Title:title, Name:name, Url:url});
    this.addPendingImage(url);
};

ImageSlideShowClass.prototype.imageLoaded = function(image)
{
    if (!this.isInitialized)
    {
        this.content.onFullScreenChange = delegate(this, this.OnFullScreenChange);
        this.root.findName("cvs_InfoMouse").addEventListener("MouseEnter", delegate(this, this.Main_OnMouseEnter));
        this.root.findName("cvs_InfoMouse").addEventListener("MouseLeave", delegate(this, this.Main_OnMouseLeave));
        this.root.findName("cvs_Main").addEventListener("MouseMove", delegate(this, this.Main_OnMouseMove));
        this.root.findName("cvs_Main").addEventListener("MouseLeave", delegate(this, this.Main_OnMouseLeave));

        this.root.findName("stb_ThumbsSlideLeft").addEventListener("Completed", delegate(this, this.ThumbsSlide_OnCompleted));
        this.root.findName("stb_ThumbsSlideRight").addEventListener("Completed", delegate(this, this.ThumbsSlide_OnCompleted));

        var buttons = new Array("ThumbLeft", "ThumbRight", "Back", "Forward", "Pause", "Play", "FullScreen");
        for (var i = 0; i < buttons.length; i++)
        {
            this.root.findName("btn_" + buttons[i]).addEventListener("MouseEnter", delegate(this, this.Button_OnMouseEnter));
            this.root.findName("btn_" + buttons[i]).addEventListener("MouseLeave", delegate(this, this.Button_OnMouseLeave));
            this.root.findName("btn_" + buttons[i]).addEventListener("MouseLeftButtonDown", delegate(this, this.Button_OnMouseDown));
            this.root.findName("btn_" + buttons[i]).cursor = "Hand";
        }

        this.canvas = this.root.findName("cvs_Images");
        this.thumbnailCanvas = this.root.findName("cvs_Thumbs");
        this.holder = this.root.findName("cvs_ThumbHolder");
    
		if (this.controls = "on")
		{
			this.root.findName("stb_ControlsPreview").Begin();
			this.controls = "off";
		}
            
        this.isInitialized = true; 
    }
    

    var thumbnail = this.content.createFromXaml(this.thumbnailXaml, true);
    thumbnail.findName("img_Preview").source = image.Source;
    thumbnail.findName("img_Thumbnail").source = image.Source;
	thumbnail["Canvas.Left"] = this.thumbnailCanvas.children.count * (thumbnail.Width + 10);

    thumbnail.findName("btn_Thumbnail").addEventListener("MouseEnter", delegate(this, this.Button_OnMouseEnter));
    thumbnail.findName("btn_Thumbnail" ).addEventListener("MouseLeave", delegate(this, this.Button_OnMouseLeave));
    thumbnail.findName("btn_Thumbnail").addEventListener("MouseLeftButtonDown", delegate(this, this.Thumbnail_OnMouseDown));
	thumbnail.Tag = "" + this.thumbnailCanvas.children.count;
	thumbnail.Cursor = "Hand";
	
	this.thumbnailCanvas.width = this.thumbnailCanvas.children.count * (thumbnail.Width + 10);
	this.thumbnailCanvas.children.add(thumbnail);
	
	
	
	
	
    // create the object and set the image source
    var object = this.content.createFromXaml(this.imageXaml, true);
    object.Source = image.Source;

    // call the onCompleted handler when the image is done animating
    object.findName("fadeIn").addEventListener("completed", delegate(this, this.onCompleted));


    var arrayIndex = this.canvas.children.count;    
    object.Tag = "" + arrayIndex;


    // add the image to our canvas
    this.canvas.children.add(object);

    // if this is the first image, start the animation
    if(this.index == -1)
    {
        this.showNextImage();
    }

	this.CheckButtons();
};


ImageSlideShowClass.prototype.showNextImage = function()
{
    // get the next image
    this.index++;
    if(this.index >= this.canvas.children.count)
    {
        this.index = 0;
    }
    var image = this.canvas.children.getItem(this.index);


    this.root.findName("txt_Title").Text = this.images[this.index].Title;
    this.root.findName("txt_Info").Text = this.images[this.index].Name;


    // zoom the image in
    image.findName("fadeIn").begin();
};

ImageSlideShowClass.prototype.showPrevImage = function()
{
    // get the next image
    this.index--;
    if(this.index < 0)
    {
        this.index = this.canvas.children.count -1;
    }
    var image = this.canvas.children.getItem(this.index);


    this.root.findName("txt_Title").Text = this.images[this.index].Title;
    this.root.findName("txt_Info").Text = this.images[this.index].Name;


    // zoom the image in
    image.findName("fadeIn").begin();
};

ImageSlideShowClass.prototype.onCompleted = function(sender)
{
    if (!this.isPaused || this.forceNext || this.forcePrev)
    {
        // start fading the image out
        sender.findName("fadeOut").begin();

        if (this.forcePrev)
        {
            this.showPrevImage();
        }
        else
        {
            this.showNextImage();
        }
        
        this.forceNext = false;
        this.forcePrev = false;  
    }
    
};

ImageSlideShowClass.prototype.ThumbsSlide_OnCompleted = function(sender)
{
    this.isSliding = false;
    this.CheckButtons();
};

/***********************
      Mouse Events
 **********************/
ImageSlideShowClass.prototype.Main_OnMouseMove = function(sender, args)
{
    if (args.GetPosition(this.canvas).Y > this.canvas.Height - 50)
    {
        if (this.controls == "off")
        {
            this.root.findName("stb_ControlsIn").Begin();
            this.controls = "on";
        }
    }
    else
    {
        if (this.controls == "on")
        {
            this.root.findName("stb_ControlsOut").Begin();
            this.controls = "off";
        }
    }
    
};

ImageSlideShowClass.prototype.Thumbnail_OnMouseDown = function(sender, args)
{
    var name = sender.Name.replace(/btn_/g, "");
    var image = this.canvas.children.getItem(this.index);
    
    this.forceNext = true;
    this.index = parseInt(sender.Tag) - 1;
    
    image.findName("fadeIn").stop();
    image.Opacity = "1";
    image.findName("fadeIn").begin();
    image.findName("fadeIn").pause();
    image.findName("fadeIn").seek("0:0:5");
    image.findName("fadeIn").resume();
};


ImageSlideShowClass.prototype.Button_OnMouseDown = function(sender, args)
{
    var name = sender.Name.replace(/btn_/g, "");
    var image = this.canvas.children.getItem(this.index);
    
    if (name == "Pause")
    {
        this.isPaused = true;
        
        sender.Visibility = "Collapsed";
        this.root.findName("btn_Play").Visibility = "Visible";
    }
    else if (name == "Play")
    {
        this.isPaused = false;
        image.findName("fadeIn").begin();
        
        sender.Visibility = "Collapsed";
        this.root.findName("btn_Pause").Visibility = "Visible";
    }
    else if (name == "Forward")
    {
        this.forceNext = true;
        image.findName("fadeIn").stop();
        image.Opacity = "1";
        image.findName("fadeIn").begin();
        image.findName("fadeIn").pause();
        image.findName("fadeIn").seek("0:0:5");
        image.findName("fadeIn").resume();
    }
    else if (name == "Back")
    {
        this.forcePrev = true;
        image.findName("fadeIn").stop();
        image.Opacity = "1";
        image.findName("fadeIn").begin();
        image.findName("fadeIn").pause();
        image.findName("fadeIn").seek("0:0:5");
        image.findName("fadeIn").resume();
    }
    else if (name == "ThumbLeft")
    {
        if (!this.isSliding)
        {
            if (this.thumbnailCanvas["Canvas.Left"] < 0)
            {
                this.isSliding = true;
                //this.thumbnailCanvas["Canvas.Left"] -= holder.Width;
                this.root.findName("stb_ThumbsSlideRight").begin();
            }
        }    
    }
    else if (name == "ThumbRight")
    {
        //alert(this.thumbnailCanvas["Canvas.Left"] + " " + this.thumbnailCanvas.Width + " " + holder.Width);
        if (!this.isSliding)
        {
            if (this.thumbnailCanvas["Canvas.Left"] + this.thumbnailCanvas.Width > this.holder.Width)
            {
                this.isSliding = true;
                //this.thumbnailCanvas["Canvas.Left"] -= holder.Width;
                this.root.findName("stb_ThumbsSlideLeft").begin();
            }
        }
    }
    else if (name == "FullScreen")
    {
        this.content.fullScreen = !this.content.fullScreen;
    }
    
};

ImageSlideShowClass.prototype.Button_OnMouseEnter = function(sender, args)
{
    var name = sender.Name.replace(/btn_/g, "");
    
    if (name == "Thumbnail")
    {
        sender["Canvas.ZIndex"] = 10;
    }
    else if (name == "ThumbRight")
    {
        if (this.thumbnailCanvas["Canvas.Left"] + this.thumbnailCanvas.Width <= this.holder.Width)
        {
            return;
        }    
    }
    else if (name == "ThumbLeft")
    {
        if (this.thumbnailCanvas["Canvas.Left"] >= 0)
        {
            return;
        }    
    }
    
       
    sender.findName("stb_" + name + "Enter").Begin();
};

ImageSlideShowClass.prototype.Button_OnMouseLeave = function(sender, args)
{
    var name = sender.Name.replace(/btn_/g, "");

    if (name == "Thumbnail")
    {
        sender["Canvas.ZIndex"] = 1;
    }

    sender.findName("stb_" + name + "Leave").Begin();
};



ImageSlideShowClass.prototype.CheckButtons = function()
{
	if (this.thumbnailCanvas["Canvas.Left"] >= 0)
    {
		this.root.findName("stb_ThumbLeftLeave").Begin();
		this.root.findName("btn_ThumbLeft").Visibility = "Collapsed";
    }
    else
    {
    	this.root.findName("btn_ThumbLeft").Visibility = "Visible";
    }
    
    if (this.thumbnailCanvas["Canvas.Left"] + this.thumbnailCanvas.Width < this.holder.Width)
    {
		this.root.findName("stb_ThumbRightLeave").Begin();
		this.root.findName("btn_ThumbRight").Visibility = "Collapsed";
    }
    else
    {
    	this.root.findName("btn_ThumbRight").Visibility = "Visible";
    }
};



ImageSlideShowClass.prototype.Main_OnMouseEnter = function(sender, args)
{
    this.root.findName("stb_InfoIn").Begin();
};

ImageSlideShowClass.prototype.Main_OnMouseLeave = function(sender, args)
{
    this.root.findName("stb_InfoOut").Begin();
    
    if (this.controls == "on")
    {
        this.root.findName("stb_ControlsOut").Begin();
        this.controls = "off";
    }
};

ImageSlideShowClass.prototype.OnFullScreenChange = function(sender, args)
{
    if (this.content.fullScreen)
    {
        this.root.findName("path_FullScreenIcon").RenderTransform.children.getItem(0).ScaleX = -1;
        this.root.findName("path_FullScreenIcon").RenderTransform.children.getItem(0).ScaleY = -1;
    }
    else
    {
        this.root.findName("path_FullScreenIcon").RenderTransform.children.getItem(0).ScaleX = 1;
        this.root.findName("path_FullScreenIcon").RenderTransform.children.getItem(0).ScaleY = 1;
    }
    
    this.onResize();
};


//Initialize the silverlight
ImageSlideShowClass.registerClass('ImageSlideShowClass', Popfly.Blocks.SilverBase);