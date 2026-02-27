page 50070 "Activities Card Part"
{
    Caption = 'My Activities Card Part';
    PageType = CardPart;
    SourceTable = "Activities Cue";
    ApplicationArea = All; // set as default for document
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup(CueNameWide)
            {
                CuegroupLayout = Wide;
                ShowCaption = false;
                field("Sales This Month"; rec."Sales This Month")
                {
                    DrillDownPageID = "Sales Invoice List";
                    ApplicationArea = Basic, Suite;
                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownSalesThisMonth;
                    end;
                }
                field("Sales This Month (MyCueTable)"; MyCueTableRec."Sales This Month")
                {
                    DrillDownPageID = "Customer Ledger Entries";
                    ApplicationArea = Basic, Suite;
                }
            }
            cuegroup(CueNameNonWide)
            {
                Caption = 'Cue Name NonWide';
                field("Ongoing Sales Quotes"; rec."Ongoing Sales Quotes")
                {
                    Caption = 'Sales Quotes';
                    DrillDownPageID = "Sales Quotes";
                    ApplicationArea = Basic, Suite;
                }
                field("Ongoing Sales Orders"; rec."Ongoing Sales Orders")
                {
                    Caption = 'Sales Orders';
                    DrillDownPageID = "Sales Order List";
                    ApplicationArea = Basic, Suite;
                }
                field("Sales Invoice Open (MyCueTable)"; MyCueTableRec."Sales Invoice - Open")
                {
                    Caption = 'Sales Invoice Open (MyCueTable)';
                    DrillDownPageID = "Sales Order List";
                    ApplicationArea = Basic, Suite;
                }
            }
            cuegroup(CueNameAdded)
            {
                field("Sales Invoice Released (MyCueTable)"; MyCueTableRec."Sales Invoice - Released")
                {
                    Caption = 'Sales Invoice Released (MyCueTable)';
                    DrillDownPageID = "Sales Order List";
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Set Up Cues")
            {
                trigger OnAction()
                var
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CuesAndKpis.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        // Implementing the Singleton Design Pattern
        if not Rec.Get() then begin
            Rec.Init();
            rec.Insert();
        end;
        // Implementing the Singleton Design Pattern for MyCueTable
        if not MyCueTableRec.Get() then begin
            MyCueTableRec.Init();
            MyCueTableRec.Insert();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        MyCueTableRec."Sales This Month" := MyCueTableRec.CalcSalesThisMonthAmount();
        MyCueTableRec.CalcFields("Sales Invoice - Open", "Sales Invoice - Released");
    end;

    var
        ActivitiesMgt: Codeunit "Activities Mgt.";
        CuesAndKpis: Codeunit "Cues And KPIs";
        MyCueTableRec: Record Cue;
}