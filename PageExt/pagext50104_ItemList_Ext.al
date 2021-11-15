pageextension 50104 "CSD Item List ext." extends "Item List"
{
    layout
    {
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
                image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}