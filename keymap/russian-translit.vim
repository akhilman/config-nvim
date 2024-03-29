" Vim Keymap file for russian characters, ported from m17n
" (compatible with m17n 'ru-translit' keymap)
" Useful mainly with utf-8 but may work with other encodings

" Maintainer:   Akhmetgaleev Ildar <akhilman@gmail.com>
" Last Changed: 2023 Mar 16

" ru-translit.mim -- Cyrillic input method with translit keyboard layout
" Copyright (C) 2007, 2011
" Maxim Treskin <zerthurd@gmail.com>
"
" This file is part of the m17n contrib; a sub-part of the m17n
" library.
"
" The m17n library is free software; you can redistribute it and/or
" modify it under the terms of the GNU Lesser General Public License
" as published by the Free Software Foundation; either version 2.1 of
" the License, or (at your option) any later version.
"
" The m17n library is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
" Lesser General Public License for more details.
"
" You should have received a copy of the GNU Lesser General Public
" License along with the m17n library; if not, write to the Free
" Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
" Boston, MA 02110-1301, USA.
"
" Map based on ru-translit from m17h package which one is
" based on cyrillic-translit part from emacs leim by
" Ognyan Kulev <ogi@fmi.uni-sofia.bg> and Anton Zinoviev <anton@lml.bas.bg>


"  "Intuitively transliterated keyboard layout.
" Most convenient for entering Russian, but all Cyrillic characters
" are included.  Should handle most cases.  However:
"   for ц (TSE) use \"c\", never \"ts\"
"   щ (SHCHA = Bulgarian SHT) = \"shch\", \"sj\", \"/sht\" or \"/t\",
"   э (REVERSE ROUNDED E) = \"e'\" or \"e`\"
"   х (KHA) when after с (S) = \"x\" or \"kh\"
"   ъ (HARD SIGN) = \"~\", Ъ (CAPITAL HARD SIGN) = \"~~\",
"   ь (SOFT SIGN) = \"'\", Ь (CAPITAL SOFT SIGN) = \"''\",
"   я (YA) = \"ya\", \"ja\" or \"q\".
"
" Russian alphabet: a b v=w g d e yo=jo zh z i j=j' k l m n o p r s t
" u f h=kh=x c ch sh shch=/s=/sht ~ y ' e' yu=ju ya=ja=q
"
" Also included are Ukrainian є (YE) = \"/e\" and ї (YI) = \"yi\",
" Belarusian ў (SHORT U) = \"u'\",
" Serbo-Croatian ђ (DJE) = \"/d\", ћ (CHJE)= \"/ch\",
" Macedonian ѓ (GJE) = \"/g\", ѕ (DZE) = \"/s\", ќ (KJE) = \"/k\",
" cyrillic і (I DECIMAL) = \"/i\", ј (JE) = \"/j\",
" љ (LJE) = \"/l\", њ (NJE) = \"/n\" and џ (DZE) =\"/z\".
"


" All characters are given literally, conversion to another encoding (e.g.,
" UTF-8) should work.
scriptencoding utf-8

let b:keymap_name = "ru-tr"

loadkeymap
a	а
b	б
v	в
w	в
g	г
d	д

e	е
je	е

yo	ё
jo	ё

zh	ж
z	з
i	и

j	й
j'	й
j`	й
k	к
l	л

m	м
n	н
o	о
p	п
r	р
s	с
t	т
u	у

f	ф
x	х
h	х
kh	х

c	ц
ch	ч

sh	ш

shch	щ
sj	щ

/sht	щ
/t	щ

~	ъ
y	ы
'	ь
`	ь

e'	э
e`	э
e~	ѣ

yu	ю
ju	ю

ya	я
ja	я
q	я


A	А
B	Б
V	В
W	В
G	Г
D	Д

E	Е
Je	Е
JE	Е

Yo	Ё
YO	Ё
Jo	Ё
JO	Ё

Zh	Ж
ZH	Ж
Z	З
I	И

J	Й
J'	Й
J`	Й
K	К
L	Л

M	М
N	Н
O	О
P	П
R	Р
S	С
T	Т
U	У

F	Ф
X	Х
H	Х
Kh	Х
KH	Х

C	Ц
Ch	Ч
CH	Ч

Sh	Ш
SH	Ш

Shch	Щ
SHCH	Щ
Sj	Щ
SJ	Щ

/Sht	Щ
/SHT	Щ
/T	Щ

~~	Ъ
Y	Ы
''	Ь
E'	Э
E`	Э
E~	Ѣ

Yu	Ю
YU	Ю
Ju	Ю
JU	Ю

Ya	Я
YA	Я
Ja	Я
JA	Я
Q	Я


/e	є
yi	ї
u'	ў

/d	ђ
/ch	ћ

/g	ѓ
/s	ѕ
/k	ќ

/i	і
/j	ј
/l	љ
/n	њ
/z	џ

/u	ү
/o	ө

/E	Є
YE	Є
Yi	Ї
YI	Ї
U'	Ў

/D	Ђ
/Ch	Ћ
/CH	Ћ

/G	Ѓ
/S	Ѕ
/K	Ќ

/I	І
/J	Ј
/L	Љ
/N	Њ
/Z	Џ

/U	Ү
/O	Ө

" vim: ts=8 sw=8
