namespace MyNamespace
{
  public partial class MyPageCode
  {
    void ClickHandler(object sender, RoutedEventArgs e)
	{
	  Button b = e.Source as Button;
	  b.BackGround = Brushes.Red;
	}
  }
}