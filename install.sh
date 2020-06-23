#!/usr/bin/env sh
SCRIPT_ROOT=$(cd "$(dirname "$0")" || exit 1; pwd)
if [ -d "$SCRIPT_ROOT/setup" ]; then
  SCRIPT_ROOT="$(dirname "${SCRIPT_ROOT}")"
fi
echo "########################################"
echo "# Running keithamus dotfiles installer"
echo "# \`$SCRIPT_ROOT/install.sh\`"
echo "########################################"

installScript() {
  echo "###"
  echo "# Installing $1"
  echo "###"
  sh "$SCRIPT_ROOT/$2/install.sh"
}

if [ "$(uname -s)" = "Darwin" ]
then
  sleep 1
  cat <<EOF
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@888@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8GLti:,;8@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8C1:.     :8@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8f:         t@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L:          :0@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8t.          ,C@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@81           ;G@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@f          ,t8@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:        ,t0@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@G.    .:iL8@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@880GCLLLCG08@@@@@@@011tfLG8@@80GCLLLLCCG08@@@@@@@@@@@@@@
@@@@@@@@@@@@8Gfi:,..     .,:;1LG08@@@@@80Cf1;,..       .,:;tL0@@@@@@@@@@
@@@@@@@@@8C1:.                 .,:i1t1;:.                    .;f0@@@@@@@
@@@@@@@8L;.                                                     ,10@@@@@
@@@@@@G;                                                          :G@@@@
@@@@@f.                                                         :tG8@@@@
@@@@t                                                         :L8@@@@@@@
@@@f                                                        .18@@@@@@@@@
@@G.                                                       .f@@@@@@@@@@@
@@1                                                        t@@@@@@@@@@@@
@0,                                                       ,0@@@@@@@@@@@@
@C.                                                       i@@@@@@@@@@@@@
@L                                                        1@@@@@@@@@@@@@
@L                                                        i@@@@@@@@@@@@@
@G.                                                       ,0@@@@@@@@@@@@
@0,                                                        1@@@@@@@@@@@@
@@i                                                        .f@@@@@@@@@@@
@@L                                                         .18@@@@@@@@@
@@8;                                                          :L8@@@@@@@
@@@C.                                                           :f0@@@@@
@@@@1                                                             ,;f0@@
@@@@8;                                                              .C@@
@@@@@G,                                                             t@@@
@@@@@@G,                                                           1@@@@
@@@@@@@G:                                                         t8@@@@
@@@@@@@@0;                                                      .f@@@@@@
@@@@@@@@@8t.                                                   :C@@@@@@@
@@@@@@@@@@@C:                                                .10@@@@@@@@
@@@@@@@@@@@@8t.                                             :L@@@@@@@@@@
@@@@@@@@@@@@@@Gi.                 ..,,...                 ,f8@@@@@@@@@@@
@@@@@@@@@@@@@@@@Gt:.        .:itLCG0000GGLti:,.        ,;f0@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@8GLt1i1tLC08@@@@@@@@@@@@@@80CLt1111fC0@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
EOF

  export OS="macos"
  echo $OS

  installScript "Desktop Apps" desktop-apps
  installScript "CLI Tools" cli-tools
  installScript "OSX tweaks" osx
  installScript "Git" git
  installScript "SSH" ssh
  installScript "GPG" gpg
  installScript "ASDF" asdf
  installScript "Fish" fish
  installScript "Hammerspoon" hammerspoon
  installScript "Powerline Fonts" powerline-fonts
  installScript "Todo" todo
  installScript "VIM" vim

elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
then
  sleep 1
  cat <<EOF
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@8800GGGGG0088@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@80GCLLfffffffffLLC08@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@80CLffffffffffffffffffLC0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@0GLfffffffffffffffffffffffLG8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@80000008@@@@@@@@@@@
@@@@@@@@0CLfffffffffLCCLffffffffffffffL8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8CLLLLLLCC0@@@@@@@@@
@@@@@@@GLfffffffffff0@@80CfffffffffffffL8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8CLLLLLLLLLL0@@@@@@@@
@@@@@@8LfffffffffffL8@@@@@0LffffffffffffC@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@80GGGGGGG088@@@@@@@@@@@@@0LLLLLLLLLLC8@@@@@@@@
@@@@@@@GffffffffffffG@@@@@@8CfffffffffffL8@@@@@@@@@@@@@@@@@@@@@@@@@@@8CLffffffffffLC08@@@@@@@@@@GLLLLLLLLLL0@@@@@@@@@
@@@@@@@8CfffffffffffL8@@@@@@8Lfffffffffff0@@@@@@@@@@@88@@@@@@@@@@@@@8LfffffffffffffffL0@@@@@@@@@CLLLLLLLLLG@@@@@@@@@@
@@@@@@@@8CfffffffffffC8@@@@@@0fffffffffff0@@@@@@@80GGGGGG088@@@@@@@@GfffffffLffffffffffC@@@@@@@8CLLLLLLLLG@@@@@@@@@@@
@@@@@@@@@8CfffffffffffG8@@@@@8LfffffffffL8@@@@@80CCCCCCCCCCG08@@@@@@Gffffff088GLffffffffG@@@@@@0CLLLLLLLG@@@@@@@@@@@@
@@@@@@@@@@8CfffffffffffC8@@@@8LfffffffffC@@@@@8GCCCCCCCCCCCCCG8@@@@@GfffffL8@@@0ffffffffC@@@@@@0LLLLLLLG@@@@@@@@@@@@@
@@@@@@@@@@@8CfffffffffffL08@8GfffffffffC8@@@@@GCCCCCCCCCCCCCCCG8@@@@0fffffL8@@@@LfffffffC@@@@@@GLLLLLC0@@@@@@@@@@@@@@
@@@@@@@@@@@@8GffffffffffffLLLffffffffLG8@@@@@0CCCCCCCGGCCCCCCCCG@@@@0fffffL8@@@8Lfffffff0@@@@@@GLLLLC0@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@GfffffffffffffffffffffC0@@@@@@@GCCCCCG8@@8GCCCCCCC8@@@8ffffffG@80LfffffffC@@@@@@@GLLLC8@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@GfffffffffffffffffLC0@@@@@@@@@GCCCCC8@@@@8GCCCCCC0@@@8LffffffLLffffffffG8@@@@@@@0CCG8@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@GffffffffffffLLCG8@@@@@@@@@@@GCCCCC8@@@@@0CCCCCCG@@@8LfffffffffffffLC0@@@@@@@@@@88@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@GfffffffffffG8@@@@@@@@@@@@@@0CCCCCG8@@@8GCCCCCCG@@@@CffffffffLLCG08@@@@@@@@@@888@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@GLfffffffffC8@@@@@@@@@@@@@@8CCCCCCG080GCCCCCCC0@@@@CfffffC0888@@@@@@@@@@@@8GCCC0@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@0LfffffffffC@@@@@@@@@@@@@@@0CCCCCCCCCCCCCCCCC0@@@@GfffffG@@@@@@@@@@@@@@@@GLLLLC8@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@0LfffffffffG@@@@@@@@@@@@@@8GCCCCCCCCCCCCCCCG8@@@@0fffffC@@@@@@@@@@@@@@@@0CCCC0@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@0LffffffffL0@@@@@@@@@@@@@@8GCCCCCCCCCCCCCG8@@@@@8fffffC@@@@@@@@@@@@@@@@@8888@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@0LffffffffL8@@@@@@@@@@@@@@@8GCCCCCCCCCG0@@@@@@@8LffffC@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@8CffffffffC8@@@@@@@@@@@@@@@@880000088@@@@@@@@@@CffffG@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@8Cffffffff0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@GfffL8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@GLffffffC@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@80G08@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@8@@8@@@@@@@@@@0CLfffLG@@8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@88888888@@@@@@@@80GGG0@@@888888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@88888888@@@@@@@@@@@@@@@@@@8888@@@@@@@@@@@@@@@@@@8@@@@@@@@@@@@@@@@8GLftttfLG8@@@@@8GLfttttLG8@@@@@@@@@@@@@
@@@@@@@@@@88888888888@@8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8C1;itfffti;1C8@@01;ifLLLt;;L@@@@@@@@@@@@@
@@@@@@88888888888888@@@88@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8f;iL8@@@@@0f;;L@@f;;G@@@@8ftC@@@@@@@@@@@@@
@@@@88888888@8888888@@@88888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Gi;f@@@@@@@@8t;i8@Gi;itfLLCG8@@@@@@@@@@@@@@
@@88888888888888888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@G;;C@@@@@@@@@f;i0@@8CLftt1ii1L8@@@@@@@@@@@@
@@@@88888888888888@@@@@@@@@@@@@@@@@8@@@@@@@@@@@@8@@@@@@@@@@@@@@@@@@@@@@@@@81;10@@@@@@@Gi;t8@CLC@@@@88f;;C@@@@@@@@@@@@
@@@@@888888888888@@@@@@@@888@@@@@@@@@@@@@@@@@@@@@@@@@@0CCCCCCCCCCCCCCLC8@@@G1;ifGG0GCfi;t0@@t;iCG000Ct;iG@@@@@@@@@@@@
@@@@8888888888888@@@@@@@888888@@@@@@@@@@@@@@@@@@@@@@@@0GGGGGGGGGGGGGGGG8@@@@8Ct1iiiii1fG8@@@Gf1iiiiii1fG@@@@@@@@@@@@@
@@88888888888888888888@@@888888@@@@@@@@@@@@@@8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8000008@@@@@@@@80000008@@@@@@@@@@@@@@@
@@8888888888@@8888888888@@888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@8888888888@@8@8888888888888@@@@88888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@8888888888@@8888888888888888@@@8888888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
EOF


  export OS="pop"
  echo $OS

  installScript "Desktop Apps" desktop-apps
  installScript "CLI Tools" cli-tools
  installScript "Git" git
  installScript "SSH" ssh
  installScript "GPG" gpg
  installScript "ASDF" asdf
  installScript "Fish" fish
  installScript "Powerline Fonts" powerline-fonts
  installScript "Todo" todo
  installScript "VIM" vim

elif  [ "$(uname -s)" = "Linux" -a "$(id -u -n)" = "vsonline" ]
then

cat <<EOF
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@800GCCCLLLCCGG088@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@8GCf1;:,..        ...,:i1fC08@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@8Gfi:.                         ,:1L0@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@8C1:.                                 .;fG@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@Gt:                                        .;L8@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@Gi.   ...                                 ...   :f0@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@01.    iG0GCf1:.                       ,;tLCG0C,    ,f8@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@8f,     ,0@@@@@@8Gf:  .,,:;;;;;;::,.. .iL0@@@@@@@L      ;C@@@@@@@@@@@@@@@@@
@@@@@@@@@@0i       i@@@@@@@@@@8CCG088@@@@@@8880GCG@@@@@@@@@@0,      .f8@@@@@@@@@@@@@@@
@@@@@@@@@G:        i@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0.        18@@@@@@@@@@@@@@
@@@@@@@@G,         .G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@f          i8@@@@@@@@@@@@@
@@@@@@@0,          ,L@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@f.          1@@@@@@@@@@@@@
@@@@@@8;          ;G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@G:          f@@@@@@@@@@@@
@@@@@@L          i8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0:         ,0@@@@@@@@@@@
@@@@@8:         ,0@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@L.         t@@@@@@@@@@@
@@@@@C.         t@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:         :8@@@@@@@@@@
@@@@@t          C@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@1         .0@@@@@@@@@@
@@@@@1         .G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@t          C@@@@@@@@@@
@@@@@1          C@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@i          C@@@@@@@@@@
@@@@@t          i@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0,         .G@@@@@@@@@@
@@@@@L          .L@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8i          ,8@@@@@@@@@@
@@@@@0,          .L@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8i           1@@@@@@@@@@@
@@@@@@t           .iG@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8L:           .G@@@@@@@@@@@
@@@@@@0:            .1C8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0L;.            1@@@@@@@@@@@@
@@@@@@@C.     .,,.    .:1L08@@@@@@@@@@@@@@@@@@@@@@@@@8Gfi,              ;8@@@@@@@@@@@@
@@@@@@@@f.    ,L00Ct,     .:itfCG@@@@@@@@@@@@@@8GLf1;,.                :0@@@@@@@@@@@@@
@@@@@@@@@L.    .;C@@01.         1@@@@@@@@@@@@@@8:                     :G@@@@@@@@@@@@@@
@@@@@@@@@@C,     .t@@@Ci,       L@@@@@@@@@@@@@@@i                    i0@@@@@@@@@@@@@@@
@@@@@@@@@@@0i      t@@@@0CLtttfL8@@@@@@@@@@@@@@@i                  ,f8@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@L:     iG@@@@@@@@@@@@@@@@@@@@@@@@@@i                .iG@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@8f:    .;tC08888808@@@@@@@@@@@@@@@i              .iC@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@8L;.     .,,::,,C@@@@@@@@@@@@@@@i            ,1G@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@Gt:.         C@@@@@@@@@@@@@@@i         ,iL0@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@8Gfi,.    .G@@@@@@@@@@@@@@@t     .:1L0@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@8GL1i1C@@@@@@@@@@@@@@@@8fiitC08@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
EOF

  export OS="vsonline"
  echo $OS

  installScript "Git" git
  installScript "CLI Tools" cli-tools
  installScript "Powerline Fonts" powerline-fonts
  installScript "Fish" fish
  installScript "ASDF" asdf
  installScript "VIM" vim

else
  echo "Unknown OS: $(uname -a) $(id) $GDMSESSION"
fi


