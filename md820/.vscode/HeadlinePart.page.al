page 50102 "Headline Part"
{
    PageType = HeadlinePart;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Welcome; Welcome)
                {
                    ApplicationArea = All;
                }
                field(Awesome; BusinessCentralIsAwesomeLbl)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Hyperlink('https://www.microdynamics.nl');
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Welcome := StrSubstNo(WelcomeLbl, UserId(), HeadlinesCU.GetUserGreetingText());
    end;

    var
        WelcomeLbl: Label 'Welcome %1 - %2';
        BusinessCentralIsAwesomeLbl: Label '<qualifier>MicroDynamics Info</qualifier><payload>Headlines in <emphasize>Business Central</emphasize> are awesome!</payload>';
        Welcome: Text;
        HeadlinesCU: Codeunit Headlines;
}

// Codeunit 1439 Headlines contains unique functions that you can use when developing a HeadlinePart:

// GetMaxQualifierLength - Returns the max length for a qualifier. This function is 50 characters.
// GetMaxPayloadLength - Returns the max length for a payload. This function is 75 characters.
// Truncate - Shortens a text by the specified maximum length.
// Emphasize - Emphasizes a string of text in the headline.
// GetHeadlineText - This function accepts a qualifier and a payload as a parameter and returns a formatted headline as a parameter by reference.
// GetUserGreetingText - Returns a corresponding greeting for the current user based on the time of the day.