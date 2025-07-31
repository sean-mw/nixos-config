{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    homeStateVersion = "24.11";
    user = "sean";
    hosts = [
      { hostname = "thinkcentre"; stateVersion = "24.11"; system = "x86_64-linux"; }
      { hostname = "macbook-air-m3"; stateVersion = "25.05"; system = "aarch64-linux"; }
    ];

    makeSystem = { hostname, stateVersion, system }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs hostname stateVersion user;
      };
      modules = [
        ./hosts/${hostname}/configuration.nix
      ];
    };
  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion system; 
        };
      }) {} hosts;

    homeConfigurations = nixpkgs.lib.listToAttrs (
      map (host: {
        name = "${user}@${host.hostname}";
        value = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${host.system};
          extraSpecialArgs = {
            inherit inputs homeStateVersion user;
          };
          modules = [
            ./home-manager/home.nix
          ];
        };
      }) hosts
    );
  };
}
