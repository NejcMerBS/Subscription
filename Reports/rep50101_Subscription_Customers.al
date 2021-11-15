report 50101 "CSD Subscription Customer"
{
    Caption = 'Subscription Customer';
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SubScriptionCustomers.rdl';
    WordLayout = 'layout/MyWordLayout.docx';
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = where("CSD Subscription Customer" = const(true));
            RequestFilterFields = "No.";
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(City; City)
            {
                IncludeCaption = true;
            }
            column(Last_Date_Modified; "Last Date Modified")
            {
                IncludeCaption = true;
            }
            column(Balance__LCY_; "Balance (LCY)")
            {
                IncludeCaption = true;
            }

        }
        dataitem("Company Information"; "Company Information")
        {
            column(Picture; Picture)
            {
                IncludeCaption = true;
            }
            column(CompanyName; COMPANYNAME)
            {

            }
        }
    }
    labels
    {
        ReportNameCap = 'Customer List';
        TotalCap = 'Total';
        OfCap = ' of ';
        PageNoCap = 'Page No';
    }
}