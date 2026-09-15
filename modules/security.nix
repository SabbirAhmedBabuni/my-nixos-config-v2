{ ... }:
{
  # Minor hardening: only members of "wheel" can use sudo at all.
  security.sudo.execWheelOnly = true;
}
