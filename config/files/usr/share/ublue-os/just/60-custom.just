# vim: set ft=make :

# Enable xwaylandvideobridge
fix-screenshare:
    cp /usr/share/applications/org.kde.xwaylandvideobridge.desktop $HOME/.config/autostart/

check-local-overrides:
    #!/usr/bin/bash
    diff -r \
      --suppress-common-lines \
      --color="always" \
      --exclude "passwd*" \
      --exclude "group*" \
      --exclude="subgid*" \
      --exclude="subuid*" \
      --exclude="machine-id" \
      --exclude="adjtime" \
      --exclude="fstab" \
      --exclude="system-connections" \
      --exclude="shadow*" \
      --exclude="gshadow*" \
      --exclude="ssh_host*" \
      --exclude="cmdline" \
      --exclude="crypttab" \
      --exclude="hostname" \
      --exclude="localtime" \
      --exclude="locale*" \
      --exclude="*lock" \
      --exclude=".updated" \
      --exclude="*LOCK" \
      --exclude="vconsole*" \
      --exclude="00-keyboard.conf" \
      --exclude="grub" \
      --exclude="system.control*" \
      --exclude="cdi" \
      --exclude="default.target" \
      /usr/etc /etc 2>/dev/null | sed '/Binary\ files\ /d'

davinci-resolve-fix:
    #!/usr/bin/bash
    cd /opt/resolve/libs; \
    sudo mkdir _disabled; \
    sudo mv libglib-2.0.so* _disabled/; \
    cd /tmp; \
    sudo mkdir pixbuf; \
    cd pixbuf; \
    sudo wget "https://dl.fedoraproject.org/pub/fedora/linux/releases/38/Everything/x86_64/os/Packages/g/gdk-pixbuf2-2.42.10-2.fc38.x86_64.rpm"; \
    sudo rpm2cpio ./gdk-pixbuf2-2.42.10-2.fc38.x86_64.rpm | cpio -idmv; \
    cd usr/lib64; \
    sudo cp -r * /opt/resolve/libs/; \
    sudo rm -rf /tmp/pixbuf; \
