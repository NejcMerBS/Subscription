pageextension 50103 "CSD Item Card Ext." extends "Item Card"
{
    layout
    {
        addlast(content)
        {
            field("CSD Subsciption Item";rec."CSD Subsciption Item")
            {
                ApplicationArea = all;
            }
        }
        addfirst(factboxes)
        {
            part("Customer Subscription Factbox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Item No" = field("No.");
                ApplicationArea = all;

            }
        }
    }

    actions
    {
        addlast(History)
        {
            action("Subscriptions")
            {
                ApplicationArea = all;
                Caption = 'Subscriptions';
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Item No" = field("No.");
                Image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}