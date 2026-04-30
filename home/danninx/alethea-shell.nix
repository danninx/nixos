{inputs, ...}: {
  imports = [
    inputs.alethea-shell.homeManagerModules.default
  ];

  services.alethea-shell = {
    enable = true;
    enableSystemdIntegration = true;
    enableHyprlandBindings = true;
  };
}
