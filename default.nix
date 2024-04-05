let
  fix = f: let x = f x; in x;
in
  fix (
    final: {
      # This Doesn't work (when using builtins.path or builtins.filterSource:
      # «error: path '/nix/store/1svp5mpw33csylw4xs9v08j5yjlpda5j-subdir' is not valid»
      out =
        import (builtins.path {
          path = ./subdir;
        })
        final;

      # This works
      out2 =
        import (builtins.fetchTree {
          type = "path";
          path = ./subdir2;
        })
        final;
    }
  )
