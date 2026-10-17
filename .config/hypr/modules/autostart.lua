-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on('hyprland.start', function()
    hl.exec_cmd 'hyprpaper'
    -- hl.exec_cmd 'waybar'
    hl.exec_cmd 'quickshell --config main'
    hl.exec_cmd 'systemctl --user start hyprpolkitagent'
    hl.exec_cmd 'vesktop'
    hl.exec_cmd 'hypridle'
    -- hl.exec_cmd 'dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP'

    hl.exec_cmd 'rclone mount gdrive-home: ~/Cloud/GoogleDrive-Home \
  --vfs-cache-mode full \
  --vfs-cache-max-size 2G \
  --vfs-cache-max-age 24h \
  --daemon'
    hl.exec_cmd 'rclone mount gdrive-ncssm: ~/Cloud/GoogleDrive-NCSSM \
  --vfs-cache-mode full \
  --vfs-cache-max-size 2G \
  --vfs-cache-max-age 24h \
  --daemon'
    hl.exec_cmd 'rclone mount onedrive-home: ~/Cloud/OneDrive-Home \
  --vfs-cache-mode full \
  --vfs-cache-max-size 2G \
  --vfs-cache-max-age 24h \
  --daemon'
    hl.exec_cmd 'rclone mount icloud-drive: ~/Cloud/iCloud-Drive \
  --vfs-cache-mode full \
  --vfs-cache-max-size 2G \
  --vfs-cache-max-age 24h \
  --daemon'
    hl.exec_cmd 'rclone mount icloud-photos: ~/Cloud/iCloud-Photos \
  --vfs-cache-mode full \
  --vfs-cache-max-size 2G \
  --vfs-cache-max-age 24h \
  --daemon'
end)
