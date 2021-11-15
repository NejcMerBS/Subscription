pageextension 50101 "CSD Customer Card Ext." extends "Customer Card"
{

    layout
    {
        addlast(General)
        {
            field("Subscription Customer"; rec."CSD Subscription Customer")
            {
                Caption = 'Subscription Customer';
                ApplicationArea = all;
            }
        }
        addfirst(factboxes)
        {
            part("Subscription Factbox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Customer No" = field("No.");
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addfirst("&Customer")
        {
            action("Subscriptions")
            {
                ApplicationArea = all;
                Caption = 'Subscriptions';
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Customer No" = field("No.");
                Image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }

        }
    }
}