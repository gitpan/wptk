system "echo '
\$mw->Button(-text => \"wptk OK!\", -command => \\&exit)->pack;
\' | $^X ./wptk.template -";
exit 0;


