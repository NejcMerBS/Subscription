page 50103 "CSD Subscription Factbox"
{
    Caption = 'Subscription Factbox';
    PageType = ListPart;
    Editable = false;
    SourceTable = "CSD Customer Subscription";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Subscription Code"; rec."Subscription Code")
                {
                    ApplicationArea = All;
                }
                field("Item No"; rec."Item No")
                {
                    ApplicationArea = All;
                }
                field("Cancelled Date"; rec."Cancelled Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}