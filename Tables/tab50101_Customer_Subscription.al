table 50101 "CSD Customer Subscription"
{
    Caption = 'Customer Subscription';

    fields
    {
        field(1; "Customer No"; Code[20])
        {
            Caption = 'Customer No.';

        }
        field(2; "Subscription Code"; Code[10])
        {
            Caption = 'Subscription Code';
            TableRelation = "CSD Subscription";
            trigger OnValidate()
            var
                Subscription: Record "CSD Subscription";
                Item: Record Item;
            begin
                if ("Subscription Code" <> xrec."Subscription Code") then
                    xrec.TestField("Last Invoice Date", 0D);
                Subscription.Get("Subscription Code");
                Subscription.TestField("Invoicing Frequence");
                Subscription.TestField("Item No");
                "Item No" := Subscription."Item No";
                Item.Get("Item No");
                Subscription."Deferral Code" := Item."Default Deferral Template Code";
                if Subscription."Invoicing Price" <> 0 then
                    "Invoicing Price" := Subscription."Invoicing Price";
                if Subscription."Invoicing Price" = 0 then
                    "Invoicing Price" := Item."Unit Price";
                case Subscription."Invoicing Schedule" of
                    subscription."Invoicing Schedule"::"Beginning of Next Period":
                        "Start Date" := CalcDate('<CM+1D', WorkDate());
                    Subscription."Invoicing Schedule"::"Begining of Period":
                        "Start Date" := CalcDate('<-CM>', WorkDate);
                    Subscription."Invoicing Schedule"::"End of Period":
                        "Start Date" := CalcDate('<CM>', WorkDate);
                    Subscription."Invoicing Schedule"::"Posting Date":
                        "Start Date" := WorkDate();
                end;
                "Next Invoicing Date" := "Start Date";
                Active := true;

            end;
        }
        field(3; "Item No"; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;

        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';

        }
        field(5; "Last Invoice Date"; Date)
        {
            Caption = 'Last Invoice Date.';

        }
        field(6; "Next Invoicing Date"; Date)
        {
            Caption = 'Next Invoicind Date';

        }
        field(7; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';

        }
        field(8; "Active"; Boolean)
        {
            Caption = 'Active';

        }
        field(9; "Invoicing Price"; Decimal)
        {
            Caption = 'Invoicing Price';

        }
        field(10; "Allow Line Discount"; Boolean)
        {
            Caption = 'Allow Line Discount';

        }
    }

    keys
    {
        key(PK; "Customer No", "Subscription Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}