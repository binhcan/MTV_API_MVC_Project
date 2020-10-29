using System;

namespace API_Web_Server.Domain.Syteline.PoItem
{
    public class PoItemMst
    {
        public string Po_num { get; set; }
        public Int16 Po_line { get; set; }
        public Int16 Po_release { get; set; }
        public decimal Qty_ordered { get; set; }
        public string Item { get; set; }
        public string Po_vend_num { get; set; }
        public string Whse { get; set; }
        public decimal Order_mult { get; set; }
        public string Description { get; set; }
        public string Loc { get; set; }
    }
}
