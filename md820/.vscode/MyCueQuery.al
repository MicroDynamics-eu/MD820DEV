query 50130 "My Cue Query"
{
    QueryType = Normal;

    elements
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            column(SumSalesLCY; "Sales (LCY)")
            {
                Method = Sum;
            }
            filter(DocumentTypeFilter; "Document Type")
            {
            }
            filter(PostingDateFilter; "Posting Date")
            {
            }
        }
    }
}