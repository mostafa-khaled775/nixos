{ ... }:
{
  services.kanshi = {
    enable = true;
    profiles = {
      main = {
        outputs = [
	  {
	    criteria = "HDMI-A-1";
	    # scale = 1.4;
	    position = "0,0";
	  }
	  {
	    criteria = "eDP-1";
	    position = "1980,0";
	  }
	];
      };
    };
  };
}