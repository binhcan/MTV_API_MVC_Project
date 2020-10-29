using MTV.API.Domain.Factory.ItemVendlot;
using MTV.API.Extensions;
using MTV.API.Helper;
using MTV.API.Helper.Barcode;
using MTV.API.Helper.PDF;
using MTV.API.Helper.Printting;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using MTV.Utilities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using static MTV.API.Startup;

namespace MTV.API.Persistence.Repositories.Factory
{
    public class TEVTB_ItemVendlotRepository : FactoryDbBaseRepository, ITEVTB_ItemVendlotRepository
    {
        public TEVTB_ItemVendlotRepository(FactoryDbContext context) : base(context) { }

        public async Task AddAsync(TEVTB_ItemVendlot itemVendlot)
        {
            itemVendlot.CreatedBy ??= "LOG";
            itemVendlot.UpdatedBy ??= "LOG";
            itemVendlot.CreateDate = DateTime.Now;
            itemVendlot.RecordDate = DateTime.Now;
            itemVendlot.RowPointer = Guid.NewGuid();
            itemVendlot.NoteExistsFlag = "0";
            itemVendlot.InWorkflow = "0";

            var tmp_result = _context.TEVTB_ItemVendlot.Where(x => (x.Item == itemVendlot.Item && x.Po_num == itemVendlot.Po_num && x.Po_line == itemVendlot.Po_line && x.Po_release == itemVendlot.Po_release));

            if (!tmp_result.Any())
            {
                itemVendlot.Seq = 0;
            }
            else
            {
                itemVendlot.Seq = (short)(tmp_result.Max(x => x.Seq) + 1);
            }

            //Dummy Data
            Dictionary<string, string> dummyData = new Dictionary<string, string>
            {
                { "Part-Number", " {0}".FormatWith(itemVendlot.Item) },
                { "Lot-Number", "LN: {0}".FormatWith(itemVendlot.Vendlot) },
                { "Vendor", itemVendlot.Description },
                { "WH", itemVendlot.Whse },
                { "Location", itemVendlot.Loc },
                { "Quantity", itemVendlot.Qty_shipped.ToString() },
                { "V", itemVendlot.Po_vend_num },
                { "Date", DateTime.Now.ToString("dd-MMM-yyyy")}
            };

            bool printRqResult = MakePrintRequest(itemVendlot, dummyData);

            if (printRqResult)
            {
                await _context.TEVTB_ItemVendlot.AddAsync(itemVendlot);
            }
            else
            {
                throw new Exception(API_Message.error("E-LOG-006"));
            }
        }

        public bool MakePrintRequest(TEVTB_ItemVendlot itemVendlot, Dictionary<string, string> data)
        {

            string content = "{0}|{1}|{2}|{3}|{4}|{5}|{6}".FormatWith(itemVendlot.Item, itemVendlot.Vendlot, itemVendlot.Description, itemVendlot.Whse, itemVendlot.Loc, String.Format("{0:0.000000}", itemVendlot.Qty_shipped) , itemVendlot.Po_vend_num);
            BarcodeHandler barcode = new BarcodeHandler();
            barcode.GenerateQRCode(content, Directory.GetCurrentDirectory() + Setting.Configuration["FILE_QR_CODE_TEMP"]);

            PDFHandler pDFHandler = new PDFHandler();
            string FileName = "TEVRP_{0}_{1}_{2}.pdf".FormatWith(DateTime.Now.ToString("dd_MMM_yyyy"), itemVendlot.Item, itemVendlot.Vendlot);
            string FilePath = LinkPDFReportToFolder(itemVendlot.Printer, itemVendlot.CreatedBy, FileName);
            pDFHandler.CreateTevReportFromTemplate(FilePath, data);

            Printers printers = new Printers();
            string PrinterName = printers.GetPrinterByIP(itemVendlot.Printer);
            if (PrinterName != "Not Found")
            {
                printers.PrintOnBarcode(FilePath, PrinterName);
                //return printers.IsPrinterOk(PrinterName, 10000);
                //printers.CheckInfo(PrinterName);
                return true;
            }
            else
            {
                throw new Exception(API_Message.error("E-LOG-005"));
            }
        }

        private string LinkPDFReportToFolder(string printerName, string user, string file)
        {
            string reportFolderPath = "{0}{1}\\{2}".FormatWith(Setting.Configuration["PRINTER-HOST"], printerName, user);
            bool exists = System.IO.Directory.Exists(reportFolderPath);

            if (!exists)
                System.IO.Directory.CreateDirectory(reportFolderPath);
            string FilePath = "{0}\\{1}".FormatWith(reportFolderPath, file);
            return FilePath;
        }

    }
}
