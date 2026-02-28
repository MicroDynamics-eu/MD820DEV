permissionset 50000 MD820
{
    Assignable = true;
    Caption = 'MD820 Permissionset';
    Access = Public; // internal/public;
    // ExcludedPermissionSets
    // IncludedPermissionSets = GeneratedPermission;
    Permissions = 
        tabledata Cue=RIMD;
}