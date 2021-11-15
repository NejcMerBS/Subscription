page 50101 "CSD Subscription List"
{
    Caption = 'Subscription List';
    PageType = List;
    SourceTable = "CSD Subscription";
    CardPageId = "CSD Subscription Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; rec.Code)
                {
                    Caption = 'Code';
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = All;

                }
                field("Item No"; rec."Item No")
                {
                    Caption = 'Item No';
                    ApplicationArea = All;

                }
                field("Invoicing Schedule"; rec."Invoicing Schedule")
                {
                    Caption = 'Invoicing Schedule';
                    ApplicationArea = All;

                }
                field("Invoicing Frequence"; rec."Invoicing Frequence")
                {
                    Caption = 'Invoicing Frequence';
                    ApplicationArea = All;

                }
                field("Invoicing Price"; rec."Invoicing Price")
                {
                    Caption = 'Invoicing Price';
                    ApplicationArea = All;

                }
            }
        }
    }
}