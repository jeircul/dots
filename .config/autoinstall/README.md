## Install Fedora Workstation with Qtile

### Preperation

- Download Fedora 38 Workstation, create bootable usb
- Boot usb, connect to wifi and then start installing
- Start setup on first boot
  - Uncheck automatic problem reporting
  - Enable Third-Party Repositories

```bash
URL="https://raw.githubusercontent.com/jeircul/dots/main/.config/autoinstall/setup_fedora38_qtile_from_gnome_ws.sh"
curl -sL "$URL" | bash
```

> :warning:
> You don't want to do this. Just don't.
