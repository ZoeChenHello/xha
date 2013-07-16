BEGIN {
    FS=",";
    print "// CAUTION:"
    print "//       Do not edit this file manually."
    print "//       This file is generated by \"gawk -f errdef.awk mtcerrno.def\""
    print ""
}

/^[ \t]*errdef/ {
    print "#define" $2,$3
    printf("\terrentry(\"%s\", %s, %s, %s)\n", substr($2, match($2, /[^ \t]*/) + 1, length($2) - 1), $2, $4, $5);
}

!/^[ \t]*errdef/ {
    print $0;
}