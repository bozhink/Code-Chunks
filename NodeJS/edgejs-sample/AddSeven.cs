using System.Threading.Tasks;

public class Startup
{
    public async Task<object> Invoke(object input)
    {
        int value = (int)input;
        return Helper.AddSeven(value);
    }
}

static class Helper
{
    public static int AddSeven(int value) => value + 7;
}