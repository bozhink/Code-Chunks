namespace WebApplication1.Common.Static
{
    using Newtonsoft.Json;

    public static class Serialization
    {
        public static string SerializeToJson(this object o)
        {
            return JsonConvert.SerializeObject(o);
        }
    }
}
