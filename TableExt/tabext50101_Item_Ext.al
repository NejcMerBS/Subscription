tableextension 50101 "CSD Item Ext." extends Item
{
    fields
    {
        field(50100; "CSD Subsciption Item"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist("CSD Customer Subscription" WHERE("Item No" = FIELD("No."), Active = CONST(true)));
            Editable = false;
        }
    }
}