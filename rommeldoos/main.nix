{ lib, pkgs, ... }:
{
  imports = [
    ../killioiden/main.nix
    ../modules/main.nix
    ./hardware-config.nix
  ];

  system.stateVersion = "26.05";
  boot.zfs.forceImportRoot = false;
  hardware.raspberry-pi.firmware.uboot.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    nano
    networkmanager
    openssh
    fish
    gh
    home-manager
    unzip
    zip
    wget
  ];

  boot.initrd.availableKernelModules = lib.mkForce [
    "ahci"
    "ata_piix"
    "autofs"
    "clk-rp1"
    "efivarfs"
    "ehci_hcd"
    "ehci_pci"
    "hid_apple"
    "hid_cherry"
    "hid_corsair"
    "hid_generic"
    "hid_lenovo"
    "hid_logitech_dj"
    "hid_logitech_hidpp"
    "hid_microsoft"
    "hid_roccat"
    "mmc_block"
    "nvme"
    "ohci_hcd"
    "ohci_pci"
    "pata_marvell"
    "pcie-brcmstb"
    "rp1"
    "sata_nv"
    "sata_sis"
    "sata_uli"
    "sata_via"
    "sd_mod"
    "sr_mod"
    #"tpm-crb"
    #"tpm-tis"
    "uhci_hcd"
    "usb-storage"
    "usbhid"
    "vc4"
    "xhci_hcd"
    "xhci_pci"
  ];
}
