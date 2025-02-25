{ lib, buildPackages, fetchurl, perl, buildLinux, nixosTests, ... } @ args:

with lib;

buildLinux (args // rec {
  version = "6.1.28";

  # modDirVersion needs to be x.y.z, will automatically add .0 if needed
  modDirVersion = versions.pad 3 version;

  # branchVersion needs to be x.y
  extraMeta.branch = versions.majorMinor version;

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
    sha256 = "1w56qgf1vgk3dmh4xw6699kjm5pdqvyfzr19ah5yy3xj50a4q2bs";
  };
} // (args.argsOverride or { }))
