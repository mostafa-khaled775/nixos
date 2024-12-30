{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "ayaspell";
  version = "3.7";

  src = fetchFromGitHub {
    owner = "linuxscout";
    repo = "ayaspell";
    rev = "36a90abb22c5033be58e709c8980160e0ce6c88c";
    sha256 = "sha256-J4da/Gz9S61z/Q7Vads+pss65O0EoJ/4CaCDs+23UyA=";
  };

  buildPhase = ''
    make build
  '';

  installPhase =
    let
      dictFileName = "templates/ar";
      readmeFile = "README.md";
    in
    ''
      runHook preInstall
      # hunspell dicts
      install -dm755 "$out/share/hunspell"
      install -m644 ${dictFileName}.dic "$out/share/hunspell/"
      install -m644 ${dictFileName}.aff "$out/share/hunspell/"
      # myspell dicts symlinks
      install -dm755 "$out/share/myspell/dicts"
      ln -sv "$out/share/hunspell/${dictFileName}.dic" "$out/share/myspell/dicts/"
      ln -sv "$out/share/hunspell/${dictFileName}.aff" "$out/share/myspell/dicts/"
      # docs
      install -dm755 "$out/share/doc"
      install -m644 ${readmeFile} $out/share/doc/${pname}.txt
      runHook postInstall
    '';

  meta = {
    homepage = "https://github.com/linuxscout/ayaspell";
    description = "AyaSpell Arabic Dictionary for Hunspell Spellchecker.";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.all;
  };
}
