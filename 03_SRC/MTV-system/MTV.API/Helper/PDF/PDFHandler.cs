using MTV.API.Extensions;
using Microsoft.Extensions.Logging;
using Spire.Pdf;
using Spire.Pdf.Exporting;
using Spire.Pdf.General.Find;
using Spire.Pdf.Graphics;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using MTV.Utilities;

namespace MTV.API.Helper.PDF
{
    public class PDFHandler
    {
        public void DelTextOnPDFFile(PdfDocument doc, string regex, string replacement, PdfTrueTypeFont font, int horizontal = 0, int vertical = 1)
        {
            PdfPageBase page = doc.Pages[0];
            PdfTextFindCollection collection = page.FindText(regex);
            //Creates a brush
            PdfBrush brush = new PdfSolidBrush(Color.Black);
            //page.Canvas.DrawString("Hello E-iceblue Support Team", font, brush, new PointF(10, 10));

            RectangleF rec;
            foreach (PdfTextFind find in collection.Finds)
            {
                // Gets the bound of the found text in page
                rec = find.Bounds;
                page.Canvas.DrawRectangle(PdfBrushes.White, rec);
                page.Canvas.DrawString(replacement, font, brush, (float)(rec.X - horizontal), (float)(rec.Y - vertical));
            }
        }


        public void ReplaceImageOnPDFFile(PdfDocument doc, Dictionary<string, string> data)
        {
            PdfPageBase page = doc.Pages[0];
            PdfImageInfo[] imageInfo = page.ImagesInfo;
            RectangleF rect = imageInfo[0].Bounds;
            page.DeleteImage(0);

            PdfImage image = PdfImage.FromFile(Directory.GetCurrentDirectory() + Setting.Configuration["FILE_QR_CODE_TEMP"]);
            PointF position = new PointF(rect.X, rect.Y);
            page.Canvas.DrawImage(image, position);


            PdfBrush brush = new PdfSolidBrush(Color.Black);
            PdfTrueTypeFont BigFont = new PdfTrueTypeFont(new Font("Helvetica", 54f, FontStyle.Bold), true);
            PdfTrueTypeFont NormalFont = new PdfTrueTypeFont(new Font("Helvetica", 46f, FontStyle.Regular), true);
            page.Canvas.DrawString("PN: {0}".FormatWith(data["Part-Number"]), BigFont, brush, new PointF(rect.X + 210, rect.Y + 15));
            page.Canvas.DrawString(data["Lot-Number"], BigFont, brush, new PointF(rect.X + 210, rect.Y + 95));
            page.Canvas.DrawString(data["Vendor"], font: NormalFont, brush, new PointF(rect.X + 10, rect.Y + 195));
            page.Canvas.DrawString("WH: {0}".FormatWith(data["WH"]), font: NormalFont, brush, new PointF(rect.X + 10, rect.Y + 250));
            page.Canvas.DrawString("V: {0}".FormatWith(data["V"]), font: NormalFont, brush, new PointF(rect.X + 350, rect.Y + 250));
            page.Canvas.DrawString("LC: {0}".FormatWith(data["Location"]), font: NormalFont, brush, new PointF(rect.X + 10, rect.Y + 310));
            page.Canvas.DrawString("MTV {0}".FormatWith(data["Date"]), font: NormalFont, brush, new PointF(rect.X + 10, rect.Y + 370));
            page.Canvas.DrawString("QTY: {0}".FormatWith(data["Quantity"]), font: NormalFont, brush, new PointF(rect.X + 420, rect.Y + 370));
        }

        public void CreateTevReportFromTemplate(string output, Dictionary<string, string> data)
        {
            try
            {
                //Loadding Template document and get actual size
                PdfDocument templateDoc = new PdfDocument();
                templateDoc.LoadFromFile(Directory.GetCurrentDirectory() + Setting.Configuration["FILE_TEMPLATE_LOG_TEVRP"], FileFormat.PDF);
                ReplaceImageOnPDFFile(templateDoc, data);

                // Save the document to file. 
                templateDoc.SaveToFile(output, FileFormat.PDF);
            }
            catch (System.Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-LOG-004"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-LOG-004"));
            }
            
        }

    }
}