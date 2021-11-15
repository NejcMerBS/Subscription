table 50100 "CSD Subscription"
{
    DataClassification = ToBeClassified;
    Caption = 'Subscription';
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Item No"; Code[20])
        {
            Caption = 'Item No';
            TableRelation = Item;
        }
        field(4; "Invoicing Schedule"; Option)
        {
            Caption = 'Name';
            OptionMembers = "Posting Date","Begining of Period","End of Period","Beginning of Next Period";
            OptionCaption = 'Posting Date,Begining of Period,End of Period,Beginning of Next Period';
        }
        field(5; "Invoicing Frequence"; DateFormula)
        {
            Caption = 'Invoicing Frequence';
        }
        field(6; "Invoicing Price"; Decimal)
        {
            Caption = 'Invoicing Price';
        }
        field(7; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            TableRelation = "Deferral Template";
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}