function set-opacity {
    param(
        [Parameter(Position=0, Mandatory=$true)]
        [ValidateRange(0, 100)]
        [int]$Opacity,

        [Parameter(Position=1, Mandatory=$false)]
        [ValidateSet('on', 'off')]
        [string]$Acrylic = 'on'
    )

    $settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

    if (Test-Path $settingsPath) {
        $settings = Get-Content $settingsPath -Raw | ConvertFrom-Json

        #ensure core settings structure exists
        if ($null -eq $settings.profiles) { $settings | Add-Member -MemberType NoteProperty -Name "profiles" -Value @{ "defaults" = @{} } }
        if ($null -eq $settings.profiles.defaults) { $settings.profiles | Add-Member -MemberType NoteProperty -Name "defaults" -Value @{} }

        # clear individual profile overrides to prevent structural blocks
        foreach ($profile in $settings.profiles.list) {
            if ($profile.PSObject.Properties['opacity']) { $profile.PSObject.Properties.Remove('opacity') }
            if ($profile.PSObject.Properties['useAcrylic']) { $profile.PSObject.Properties.Remove('useAcrylic') }
            if ($profile.PSObject.Properties['acrylicOpacity']) { $profile.PSObject.Properties.Remove('acrylicOpacity') }
        }

        # apply new settings to defaults
        $isAcrylic = $Acrylic -eq 'on'
        $decimalOpacity = [math]::Round(($Opacity / 100), 2)

        $settings.profiles.defaults | Add-Member -MemberType NoteProperty -Name "opacity" -Value $Opacity -Force
        $settings.profiles.defaults | Add-Member -MemberType NoteProperty -Name "useAcrylic" -Value $isAcrylic -Force
        $settings.profiles.defaults | Add-Member -MemberType NoteProperty -Name "acrylicOpacity" -Value $decimalOpacity -Force

        # save the updated settings back to the file
        $settings | ConvertTo-Json -Depth 32 | Set-Content $settingsPath -Encoding UTF8
        
        $msgStyle = if ($isAcrylic) { "with Acrylic blur" } else { "with CLEAR transparency" }
        Write-Host "Terminal opacity successfully set to $Opacity% $msgStyle!" -ForegroundColor Green
    } else {
        Write-Error "Windows Terminal settings file not found."
    }
}
