add_cus_dep('gnu','tex', 0, 'makegnu2tex');
sub makegnu2tex {
    system("gnuplot \"$_[0].gnu\"") ;
}

add_cus_dep('glo','gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s \"$_[0]\".ist -t \"$_[0]\".glg -o \"$_[0]\".gls \"$_[0]\".glo") ;
}

add_cus_dep('idx','ind', 0, 'makeidx2ind');
sub makeidx2ind {
    system("makeindex -o \"$_[0]\".ind \"$_[0]\".idx") ;
}

add_cus_dep('acn','acr', 0, 'makeacn2acr');
sub makeacn2acr {
    system("makeglossaries -s \"$_[0]\".ist -t \"$_[0]\".glg -o \"$_[0]\".acr \"$_[0]\".acn") ;
}
