table 50101 "Cue"
{
    DataClassification = CustomerContent;
    Caption = 'My Cue Table';
    ReplicateData = false;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(2; "Sales Invoice - Open"; Integer)
        {
            Caption = 'Sales Invoice - Open';
            FieldClass = FlowField;
            CalcFormula = Count("Sales Header" where("Document Type" = const(Invoice), Status = const(Open)));
        }
        field(3; "Sales Invoice - Released"; Integer)
        {
            Caption = 'Sales Invoice - Released';
            FieldClass = FlowField;
            CalcFormula = Count("Sales Header" where("Document Type" = const(Invoice), Status = const(Released)));
        }
        field(4; "Sales This Month"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sales This Month';
            AutoFormatExpression = GetAmountFormat();
            AutoFormatType = 11;
            DecimalPlaces = 0 : 0;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure CalcSalesThisMonthAmount() Amount: Decimal
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        CustomLedgEntrySales: Query "My Cue Query";
    begin
        CustomLedgEntrySales.SetRange(DocumentTypeFilter, CustLedgerEntry."Document Type"::Invoice);
        CustomLedgEntrySales.SetRange(PostingDateFilter, CalcDate('<-CM>', Workdate()), Workdate());

        CustomLedgEntrySales.Open();
        if CustomLedgEntrySales.Read() then
            Amount := CustomLedgEntrySales.SumSalesLCY;
        CustomLedgEntrySales.Close();
    end;

    procedure GetAmountFormat(): Text
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        exit(TypeHelper.GetAmountFormatLCYWithUserLocale());
    end;
}