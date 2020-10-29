using System;

namespace MTV.API.Domain.Factory.ItemVendlot
{
    public class TEVTB_ItemVendlotRequest
    {
        public string? CreatedBy { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? RecordDate { get; set; }
        public Guid? RowPointer { get; set; }
        public string? NoteExistsFlag { get; set; }
        public string? InWorkflow { get; set; }
        public string Po_num { get; set; }
        public Int16 Po_line { get; set; }
        public Int16 Po_release { get; set; }
        public Int16? Seq { get; set; }
        public string Item { get; set; }
        public string Vendlot { get; set; }
        public decimal Qty_shipped { get; set; }
        public string Printer { get; set; }
        public string Description { get; set; }
        public string Loc { get; set; }
        public string Po_vend_num { get; set; }
        public string Whse { get; set; }
    }
}
