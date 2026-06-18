{
  description = "Nix Templates for development";

  outputs = { self }: {
    templates = {

      default = self.templates.rust;

      rust = {
        path = ./templates/rust;
        description = "Rust development";
      };

      c = {
        path = ./templates/c;
        description = "C development";
      };

    };
  };
}
