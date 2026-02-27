page 50163 MyRoleCenter
{
    PageType = RoleCenter;
    ApplicationArea = All;
    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline Part") { }
            part(Activities; "Activities Card Part") { }
        }
    }
    actions
    {
        area(Sections)
        {
            group(Group1Name)
            {
                Caption = 'SectionGroup1';
                action(Gr1ActionName1) { Caption = 'Gr1Action1'; }
                action(Gr1ActionName2) { Caption = 'Gr1Action2'; }
                action(Gr1ActionName3) { Caption = 'Gr1Action3'; }
            }
            group(Group2Name)
            {
                Caption = 'SectionGroup2';
                action(Gr2ActionName1) { Caption = 'Gr2Action1'; }
                action(Gr2ActionName2) { Caption = 'Gr2Action2'; }
                action(Gr2ActionName3) { Caption = 'Gr2Action3'; }
            }
            group(Group3Name)
            {
                Caption = 'SectionGroup3';
                action(Gr3ActionName1) { Caption = 'Gr3Action1'; }
                action(Gr3ActionName2) { Caption = 'Gr3Action2'; }
                action(Gr3ActionName3) { Caption = 'Gr3Action3'; }
            }
        }
        area(Embedding)
        {
            action(EmbeddingAction1)
            {
                Caption = 'Telemetry Test';
                RunObject = codeunit TelemetryTest;
            }
            action(EmbeddingAction2) { Caption = 'EmbAction2'; }
            action(EmbeddingAction3) { Caption = 'EmbAction3'; }
            action(EmbeddingAction4) { Caption = 'EmbAction4'; }
            action(EmbeddingAction5) { Caption = 'EmbAction5'; }
        }

        area(Creation)
        {
            action(CreationAction1)
            {
                Caption = 'CreateAction1';
                RunObject = Page "Customer Card";
                RunPageMode = Create;
            }
            action(CreationAction2)
            {
                Caption = 'CreateAction2';
                RunObject = Page "Customer Card";
                RunPageMode = Create;
            }
            action(CreationAction3)
            {
                Caption = 'CreateAction3';
                RunObject = Page "Customer Card";
                RunPageMode = Create;
            }
            action(CreationAction4)
            {
                Caption = 'CreateAction4';
                RunObject = Page "Customer Card";
                RunPageMode = Create;
            }
            action(CreationAction5)
            {
                Caption = 'CreateAction5';
                RunObject = Page "Customer Card";
                RunPageMode = Create;
            }
        }

        area(Processing)
        {
            action(ProcessAction1)
            {
                Caption = 'ProcAction1';
                RunObject = report "Customer - Summary Aging";
            }
            action(ProcessAction2)
            {
                Caption = 'ProcAction2';
                RunObject = report "Customer - Summary Aging";
            }
            group(GroupedProc3)
            {
                action(ProcessAction3a)
                {
                    Caption = 'ProcAction3a';
                    RunObject = report "Customer - Summary Aging";
                }
                action(ProcessAction3b)
                {
                    Caption = 'ProcAction3b';
                    RunObject = report "Customer - Summary Aging";
                }
                action(ProcessAction3c)
                {
                    Caption = 'ProcAction3c';
                    RunObject = report "Customer - Summary Aging";
                }
            }
            action(ProcessAction4)
            {
                Caption = 'ProcAction4';
                RunObject = report "Customer - Summary Aging";
            }
        }

        area(Reporting)
        {
            action(ReportAction1)
            {
                Caption = 'RepAction1';
                RunObject = report "Customer - List";
            }

            action(ReportAction2)
            {
                Caption = 'RepAction2';
                RunObject = report "Customer - List";
            }
            action(ReportAction3)
            {
                Caption = 'RepAction3';
                RunObject = report "Customer - List";
            }

        }
    }
}