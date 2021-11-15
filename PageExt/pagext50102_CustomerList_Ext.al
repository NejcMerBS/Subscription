pageextension 50102 "CSD Customer List" extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Customer Subscriptions Factbox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Customer No" = field("No.");
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addafter("C&ontact")
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