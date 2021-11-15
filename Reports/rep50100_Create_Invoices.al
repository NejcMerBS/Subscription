report 50100 "CSD Create Invoices"
{
    Caption = 'Create Invoices';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Customer Subscription"; "CSD Customer Subscription")
        {
            RequestFilterFields = "Customer No", "Item No";

            trigger OnPreDataItem()
            begin
                if not Confirm(CreateWarningtxt) then
                    CurrReport.Quit();
                "Customer Subscription".SetRange(Active, true);
                "Customer Subscription".SetFilter("Next Invoicing Date", '<=%1', WorkDate);
            end;

            trigger OnAfterGetRecord()
            var
                SalesLine: Record "Sales Line";
                OldCustomer: Code[20];
                OldInvoiceDate: Date;
                NextLineNo: Integer;

            begin
                IF (OldCustomer <> "Customer Subscription"."Customer No") OR
                (OldInvoiceDate <> "Customer Subscription"."Next Invoicing Date") THEN BEGIN
                    OldCustomer := "Customer Subscription"."Customer No";
                    OldInvoiceDate := "Customer Subscription"."Next Invoicing Date";
                    NextLineNo := 0;
                    CLEAR(SalesHeader);
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader.VALIDATE("Sell-to Customer No.", "Customer Subscription"."Customer No");
                    SalesHeader.VALIDATE("Location Code", '');
                    SalesHeader.VALIDATE("Posting Date", "Customer Subscription"."Next Invoicing Date");
                    SalesHeader.INSERT(TRUE);
                    InvoiceCounter += 1;
                END;
                NextLineNo += 10000;
                SalesLine.INIT;
                SalesLine."Line No." := NextLineNo;
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine.VALIDATE("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
                SalesLine.INSERT;
                SalesLine.VALIDATE(Type, SalesLine.Type::Item);
                SalesLine.VALIDATE("No.", "Customer Subscription"."Item No");
                SalesLine.VALIDATE(Quantity, 1);
                SalesLine.VALIDATE("Allow Line Disc.", "Customer Subscription"."Allow Line Discount");
                SalesLine.VALIDATE("Unit Price", "Customer Subscription"."Invoicing Price");
                SalesLine.MODIFY;
            end;

            trigger OnPostDataItem()
            begin
                Message(InvCounterTxt, InvoiceCounter, SalesHeader."Document Type");
            end;

        }
    }

    var
        CreateWarningtxt: TextConst ENU = 'Create subscriptions for all customers?';
        SalesHeader: record "Sales Header";
        InvoiceCounter: Integer;
        InvCounterTxt: TextConst ENU = '%1 %2()s Created';
}