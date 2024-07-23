{ ... }: {
  services = {
    upower = {
      enable = true;
      usePercentageForPolicy = true;
      percentageAction = 10;
      criticalPowerAction = "Hibernate";
    };
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger.turbo = "never";
      };
    };
  };
}
