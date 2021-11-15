pageextension 50100 "BusinessManager RoleCenter Ext" extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Payments)
        {
            action("Subscriptions")
            {
                CaptionML = ENU = 'Subscriptions';
                Promoted = true;
                PromotedIsBig = true;
                Image = InsuranceRegisters;
                RunObject = page "CSD Subscription List";
                ApplicationArea = all;

            }
            action("Create Invoices")
            {
                CaptionML = ENU = 'Create Incvoices';
                Promoted = true;
                PromotedIsBig = true;
                Image = CreateJobSalesInvoice;
                RunObject = report "CSD Create Invoices";
                ApplicationArea = all;
            }
            action("Subscription Customers")
            {
                CaptionML = ENU = 'Subscription Customers';
                Promoted = true;
                PromotedIsBig = true;
                Image = Report;
                RunObject = report "CSD Subscription Customer";
                ApplicationArea = all;

            }
        }
    }
}