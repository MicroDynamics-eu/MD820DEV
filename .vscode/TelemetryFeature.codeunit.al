/// <summary>
/// Adds support for the extension to use the "Telemetry" and "Feature Telemetry" codeunits.
/// </summary>
codeunit 50124 "Sample Telemetry Logger" implements "Telemetry Logger"
{
    Access = Internal;

    // Using a dictionary
    procedure LogMessage(EventId: Text; Message: Text; Verbosity: Verbosity; DataClassification: DataClassification; 
                        TelemetryScope: TelemetryScope; CustomDimensions: Dictionary of [Text, Text])
    begin
        Session.LogMessage(EventId, Message, Verbosity, DataClassification, TelemetryScope, CustomDimensions);
    end;

    // Using dimension overloads
    procedure LogMessage(EventId: Text; Message: Text; Verbosity: Verbosity; DataClassification: DataClassification; 
                        TelemetryScope: TelemetryScope; Key1: Text; Value1: Text; Key2: Text; Value2: Text)
    begin
        Session.LogMessage(EventId, Message, Verbosity, DataClassification, TelemetryScope, 
        Key1, Value1, Key2, Value2)

    end;
        
    // For the functionality to behave as expected, there must be exactly one implementation of the 
    //                              "Telemetry Logger" interface registered per app publisher
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Telemetry Loggers", 'OnRegisterTelemetryLogger', '', true, true)]
    local procedure OnRegisterTelemetryLogger(var Sender: Codeunit "Telemetry Loggers")
    var
        SampleTelemetryLogger: Codeunit "Sample Telemetry Logger";
    begin
        Sender.Register(SampleTelemetryLogger);
    end;
}