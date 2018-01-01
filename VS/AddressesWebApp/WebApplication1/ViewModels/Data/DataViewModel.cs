namespace WebApplication1.ViewModels.Data
{
    using System;
    using System.ComponentModel;

    public class DataViewModel
    {
        public DateTime StartTime { get; set; }

        public string FileName { get; set; }

        public int[] Days { get; set; }

        [Description("Day Friday")]
        public bool Friday { get; set; }

        [Description("Day Monday")]
        public bool Monday { get; set; }

        [Description("Day Saturday")]
        public bool Saturday { get; set; }

        [Description("Day Sunday")]
        public bool Sunday { get; set; }

        [Description("Day Thursday")]
        public bool Thursday { get; set; }

        [Description("Day Tuesday")]
        public bool Tuesday { get; set; }

        [Description("Day Wednesday")]
        public bool Wednesday { get; set; }
    }
}
