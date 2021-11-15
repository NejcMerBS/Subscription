tableextension 50100 "CSD Customer EXxt." extends Customer
{
    fields
    {
        field(50100; "CSD Subscription Customer"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("CSD Customer Subscription" where("Customer No" = field("No."), Active = const(true)));
            Editable = false;
        }
    }
}