{
  imports = [ ./system ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.alice = import ./home;
  };
}
