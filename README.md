# Click to Move Settings

Click to Move Settings restores the **Click-to-Move** option in **Interface > Mouse** for clients where the setting is missing from the UI.

When enabled, clicking the ground moves your character to that location. The addon adds a checkbox near the other mouse options and saves its value through the game's `autointeract` CVar, so the control reflects and changes the actual Click-to-Move setting.

If the client already shows its own `autointeract` checkbox in the Mouse panel, the addon leaves that control alone and does not add a duplicate.

## Install

1. Copy the `ClickToMoveSettings` folder into your client's `Interface\AddOns` folder.
2. Restart the client, or enable the addon from the character-selection AddOns screen.
3. Open **Escape > Interface > Mouse** and toggle **Click-to-Move**.

The addon targets the WoW 3.3.5-era interface (`Interface: 30300`).
