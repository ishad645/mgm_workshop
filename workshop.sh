#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��`aaworkshop.sh �X]o�@}f~�	k�&*����ƾtI�l[����l6�S!"C �M���0P�P�e5K|�����˹�'��v�'#���Š�nH}�%�M;�p�J|j�SB�g�D��b���JB��ɕv���>\cF�նp-��̰���X���d�C'�(T�E�b?�Zh�� ]ڋ�k�����z�� X�߾u�6|�B��0�E���v�(�������`�/\���� �����8���Es�Κ��>�bƢ;�����4�����Q��M���F�q�~'�zU���Ox�����>l�e�`ړ;�N@�[�^W�ա��&�X��^�j��K���bE��(E���@���BQ6S�:4Ϟ�ӂ~�K���i��hhj��mQ�4���۫`rR(��2������^���[0X�K���#yG�"�D�$.R�FՂh���a^�BgR�Ө����V���.Vj���{,�^H�l��%b#;���1��Q��p �yL��yM@U�TK9+Vg3@[.���"I�"yT*��H�nj��0��p�-g#UIa��-
��ɵ�D��,�Q"mC�գKc�9�g���	ժ_Z�m�w	�+�[�;3�S�Պ���@SL��Mt)������Z��w��)�w��/��M����^� ڮ�ۂ��j����ݽ~���\�Vzc5ݏ^܏K���Z��vI��Y���_�_/��%�!���{|1{=��ӛ��C�DE��;ǞRtp��Q��tp��g�zя��_r�V,�  