codeunit 50125 TelemetryTest
{
    trigger OnRun()
    var
        TelemetryLogger: codeunit "Sample Telemetry Logger";
    begin
        // LogMessage('MyExt-0001', 'This is a critical error message', Verbosity::Critical, DataClassification::CustomerContent, TelemetryScope::All, 'result', 'failed', 'reason', 'critical error in code');
        // TelemetryDictionary();
        // TelemetryOverload();
        // TelemetryLogger.LogMessage('MyExt-0010', 'This is a critical error message', Verbosity::Critical, DataClassification::CustomerContent, TelemetryScope::All, 'result', 'failed', 'reason', 'critical error in code');
    LogCustomTelemetry()
    end;

    procedure TelemetryDictionary()
    var
        CustDimension: Dictionary of [Text, Text];
    begin
        CustDimension.Add('Result', 'failed');
        CustDimension.Add('Reason', 'critical error in code');
        LogMessage(
          'MyExt-0002',
          'Critical error happened: MyExt module 1',
          Verbosity::Normal,
          DataClassification::SystemMetadata,
          // TelemetryScope::ExtensionPublisher, // this event will only go to app telemetry
          TelemetryScope::All,
          CustDimension
        );
    end;

    procedure TelemetryOverload()
    begin
        LogMessage(
          'MyExt-0003',
          'Critical error happened: MyExt module 3',
          Verbosity::Critical,
          DataClassification::SystemMetadata,
          // TelemetryScope::ExtensionPublisher, // this event will only go to app telemetry
          TelemetryScope::All,
          'Result', 'failed',
          'Reason', 'critical error in code'
        );
    end;

procedure LogCustomTelemetry()
var
    Dimensions: Dictionary of [Text, Text];
begin
    Dimensions.Add('Scenario', 'DemoLogging');
    Dimensions.Add('PipelineRun', '12345');

    Session.LogMessage(
        'MyExtensionEvent',                     // Event ID
        'Custom log with dimensions',           // Message text
        Verbosity::Normal,                      // Verbosity level
        DataClassification::SystemMetadata,     // Data classification
        TelemetryScope::ExtensionPublisher,     // Scope
        Dimensions                              // Custom dimensions
    );
end;

}