{ pkgs ? import <nixpkgs> { }
, specialArgs ? { } }:

(pkgs.callPackage ./. specialArgs).overrideAttrs (attrs: {
	nativeBuildInputs = attrs.nativeBuildInputs ++ [
		pkgs.yj
	];
})
