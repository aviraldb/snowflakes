{
  description = "Nix Templates for development";

  outputs = { self }: {
    templates = {

      rust = {
        path = ./templates/rust;
        description = "Rust development";
      };

      c = {
        path = ./templates/c;
        description = "C development";
      };

      go = {
        path = ./templates/go;
        description = "GO backend";
      };

    };
  };
}
