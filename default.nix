{ stdenv
, ruby_3_2
}:

stdenv.mkDerivation {
	pname = "TODO";
	version = "TODO";

	nativeBuildInputs = [ ruby_3_2 ];
	buildInputs = [];
}
