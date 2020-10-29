﻿using API_Web_Server.Extensions;
using Microsoft.Extensions.Logging;
using Spire.Pdf;
using System;
using System.Linq;
using System.Management;
using System.Printing;
using System.Drawing.Printing;

namespace API_Web_Server.Helper.Printting
{
    public class Printers
    {
        public static int jobIdentifier;
        public void PrintOnBarcode(string Filepath, string PrinterName)
        {
            try
            {
                PdfDocument pdf = new PdfDocument();
                pdf.LoadFromFile(Filepath);

                //Set the printer 
                pdf.PrintSettings.PrinterName = PrinterName;

                // Setting print
                pdf.PrintSettings.Landscape = false;
                pdf.PageScaling = PdfPrintPageScaling.FitSize;
                pdf.PrintSettings.SelectSinglePageLayout(Spire.Pdf.Print.PdfSinglePageScalingMode.FitSize, false);

                // Make print request
                pdf.Print();
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-LOG-006"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-LOG-006"));
            }

        }

        public string GetPrinterByIP(string address)
        {
            Logging.iLogger.LogError("IP : " + address);
            try
            {
                foreach (string printname in PrinterSettings.InstalledPrinters)
                {
                    if (printname == address)
                    {
                        return printname;
                    }
                }
                //var scope = new ManagementScope(@"\root\cimv2");
                //scope.Connect();

                //var searcher = new ManagementObjectSearcher("SELECT * FROM Win32_Printer");
                //var results = searcher.Get();
                //foreach (var printer in results)
                //{
                //    var portName = printer.Properties["PortName"].Value;
                //    var searcher2 = new ManagementObjectSearcher("SELECT * FROM Win32_TCPIPPrinterPort where Name LIKE '" + portName + "'");
                //    var results2 = searcher2.Get();
                //    foreach (var printer2 in results2)
                //    {
                //        Logging.iLogger.LogError("HostAddress : " + printer2.Properties["HostAddress"].Value.ToString());
                //        if (printer2.Properties["HostAddress"].Value.ToString() == address)
                //        {
                //            //Logging.iLogger.LogInformation("WorkOffline:" + printer["WorkOffline"].ToString().ToLower());
                //            //Logging.iLogger.LogInformation("WorkOffline: " + printer["WorkOffline"].ToString().ToLower());
                //            //Logging.iLogger.LogInformation("PrinterState: " + printer["PrinterState"].ToString().ToLower());
                //            //Logging.iLogger.LogInformation("PrinterStatus: " + printer["PrinterStatus"].ToString().ToLower());
                //            //Logging.iLogger.LogInformation("ExtendedPrinterStatus: " + printer["ExtendedPrinterStatus"].ToString().ToLower());
                //            return printer.Properties["Name"].Value.ToString();
                //        }
                //        //Logging.iLogger.LogInformation("Name:" + printer.Properties["Name"].Value);
                //        ////Logging.iLogger.LogInformation("PortName:" + portName);
                //        //Logging.iLogger.LogInformation("PortNumber:" + printer2.Properties["PortNumber"].Value);
                //        //Logging.iLogger.LogInformation("HostAddress:" + printer2.Properties["HostAddress"].Value);
                //    }
                //}
                return "Not Found";
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-LOG-005"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-LOG-005"));
            }
            
        }

        public bool IsPrinterOk(string name, int checkTimeInMillisec)
        {
            System.Collections.IList value = null;
            do
            {
                //checkTimeInMillisec should be between 2000 and 5000
                System.Threading.Thread.Sleep(checkTimeInMillisec);
                // or use Timer with Threading.Monitor instead of thread sleep

                using System.Management.ManagementObjectSearcher searcher = new System.Management.ManagementObjectSearcher("SELECT * FROM Win32_PrintJob WHERE Name like '%" + name + "%'");
                value = null;

                if (searcher.Get().Count == 0) // Number of pending document.
                    return true; // return because we haven't got any pending document.
                else
                {
                    foreach (System.Management.ManagementObject printer in searcher.Get())
                    {
                        value = printer.Properties.Cast<System.Management.PropertyData>().Where(p => p.Name.Equals("Status")).Select(p => p.Value).ToList();
                        break;
                    }
                }
            }
            while (value.Contains("Printing") || value.Contains("UNKNOWN") || value.Contains("OK"));

            return !value.Contains("Error");
        }

        public int CheckInfo(string printerName)
        {
            var server = new LocalPrintServer();
            PrintQueueCollection myPrintQueues = server.GetPrintQueues();

            foreach (PrintQueue queue in myPrintQueues)
            {
                if (queue.FullName == printerName)
                {
                    queue.Refresh();
                    PrintJobInfoCollection jobs = queue.GetPrintJobInfoCollection();
                    foreach (PrintSystemJobInfo job in jobs)
                    {

                        if (job.HostingPrintQueue.FullName == printerName)
                        {
                            if (job.IsBlocked)
                            {
                                Logging.iLogger.LogInformation("The job is blocked.");
                            }
                            if (job.IsCompleted || job.IsPrinted)
                            {
                                Logging.iLogger.LogInformation("The job has finished. Have user recheck all output bins and be sure the correct printer is being checked.");
                            }
                            if (job.IsDeleted || job.IsDeleting)
                            {
                                Logging.iLogger.LogInformation("The user or someone with administration rights to the queue has deleted the job. It must be resubmitted.");
                            }
                            if (job.IsInError)
                            {
                                Logging.iLogger.LogInformation("The job has errored.");
                            }
                            if (job.IsOffline)
                            {
                                Logging.iLogger.LogInformation("The printer is offline. Have user put it online with printer front panel.");
                            }
                            if (job.IsPaperOut)
                            {
                                Logging.iLogger.LogInformation("The printer is out of paper of the size required by the job. Have user add paper.");
                            }

                            //if (job.IsPaused || job.HostingPrintQueue.IsPaused)
                            //{
                            //    HandlePausedJob(job);
                            //    //HandlePausedJob is defined in the complete example.
                            //}

                            if (job.IsPrinting)
                            {
                                Logging.iLogger.LogInformation("The job is printing now.");
                            }
                            if (job.IsSpooling)
                            {
                                Logging.iLogger.LogInformation("The job is spooling now.");
                            }
                            if (job.IsUserInterventionRequired)
                            {
                                Logging.iLogger.LogInformation("The printer needs human intervention.");
                            }
                            jobIdentifier = job.JobIdentifier;
                        }
                    }
                }
            }
            return jobIdentifier;

        }
    }
}