<title>How to install Brew on WSL- Windows subsystem for Linux - Linux Shou=
t</title>
<link rel=3D"canonical" href=3D"https://www.how2shout.com/linux/install-bre=
w-on-wsl-windows-subsystem-for-linux/">
<meta property=3D"og:locale" content=3D"en_US">
<meta property=3D"og:type" content=3D"article">
<meta property=3D"og:title" content=3D"How to install Brew on WSL- Windows =
subsystem for Linux">
<meta property=3D"og:description" content=3D"Homebrew or simply Brew is the=
 package management tool developed under open source license. The main purp=
ose of Brew is to install various software on macOS, however, it is not lim=
ited to that only. Yes, we can install it on Linux Distros and Windows 10 .=
.. Read more">
<meta property=3D"og:url" content=3D"https://www.how2shout.com/linux/instal=
l-brew-on-wsl-windows-subsystem-for-linux/">
<meta property=3D"og:site_name" content=3D"Linux Shout">
<meta property=3D"article:publisher" content=3D"https://www.facebook.com/ho=
w2shout">
<meta property=3D"article:published_time" content=3D"2020-08-29T18:53:54+00=
:00">
<meta property=3D"article:modified_time" content=3D"2021-01-01T06:26:03+00:=
00">
<meta property=3D"og:image" content=3D"https://www.how2shout.com/linux/wp-c=
ontent/uploads/2020/08/Install-Homw-Bre-w-on-Windows-10-WSL-Windows-subsyst=
em-for-Linux-min.jpg">
<meta property=3D"og:image:width" content=3D"1329">
<meta property=3D"og:image:height" content=3D"953">
<meta property=3D"og:image:type" content=3D"image/jpeg">
<meta name=3D"author" content=3D"Heyan Maurya">
<meta name=3D"twitter:card" content=3D"summary_large_image">
<meta name=3D"twitter:creator" content=3D"@h2smedia">
<meta name=3D"twitter:site" content=3D"@h2smedia">
<meta name=3D"twitter:label1" content=3D"Written by">
<meta name=3D"twitter:data1" content=3D"Heyan Maurya">
<meta name=3D"twitter:label2" content=3D"Est. reading time">
<meta name=3D"twitter:data2" content=3D"2 minutes">


<link rel=3D"dns-prefetch" href=3D"https://fonts.googleapis.com/">
<link rel=3D"dns-prefetch" href=3D"https://s.w.org/">
<link href=3D"https://fonts.gstatic.com/" crossorigin=3D"" rel=3D"preconnec=
t">
<link rel=3D"alternate" type=3D"application/rss+xml" title=3D"Linux Shout =
=C2=BB Feed" href=3D"https://www.how2shout.com/linux/feed/">
<link rel=3D"alternate" type=3D"application/rss+xml" title=3D"Linux Shout =
=C2=BB Comments Feed" href=3D"https://www.how2shout.com/linux/comments/feed=
/">
<link rel=3D"alternate" type=3D"application/rss+xml" title=3D"Linux Shout =
=C2=BB How to install Brew on WSL- Windows subsystem for Linux Comments Fee=
d" href=3D"https://www.how2shout.com/linux/install-brew-on-wsl-windows-subs=
ystem-for-linux/feed/">




<link rel=3D"stylesheet" id=3D"wp-block-library-css" href=3D"https://www.ho=
w2shout.com/linux/wp-includes/css/dist/block-library/style.min.css?ver=3D6.=
0.2" media=3D"all">

<link rel=3D"stylesheet" id=3D"copy-the-code-css" href=3D"https://www.how2s=
hout.com/linux/wp-content/plugins/copy-the-code/assets/css/copy-the-code.cs=
s?ver=3D2.5.0" media=3D"all">
<link rel=3D"stylesheet" id=3D"toc-screen-css" href=3D"https://www.how2shou=
t.com/linux/wp-content/plugins/table-of-contents-plus/screen.min.css?ver=3D=
2106" media=3D"all">
<link rel=3D"stylesheet" id=3D"wp-show-posts-css" href=3D"https://www.how2s=
hout.com/linux/wp-content/plugins/wp-show-posts/css/wp-show-posts-min.css?v=
er=3D1.1.3" media=3D"all">
<link rel=3D"stylesheet" id=3D"generate-style-css" href=3D"https://www.how2=
shout.com/linux/wp-content/themes/generatepress/assets/css/all.min.css?ver=
=3D3.1.3" media=3D"all">

<link rel=3D"stylesheet" id=3D"generate-sticky-css" href=3D"https://www.how=
2shout.com/linux/wp-content/plugins/gp-premium/menu-plus/functions/css/stic=
ky.min.css?ver=3D2.1.2" media=3D"all">
<link rel=3D"stylesheet" id=3D"generate-navigation-branding-css" href=3D"ht=
tps://www.how2shout.com/linux/wp-content/plugins/gp-premium/menu-plus/funct=
ions/css/navigation-branding.min.css?ver=3D2.1.2" media=3D"all">



<link rel=3D"https://api.w.org/" href=3D"https://www.how2shout.com/linux/wp=
-json/"><link rel=3D"alternate" type=3D"application/json" href=3D"https://w=
ww.how2shout.com/linux/wp-json/wp/v2/posts/1351"><link rel=3D"EditURI" type=
=3D"application/rsd+xml" title=3D"RSD" href=3D"https://www.how2shout.com/li=
nux/xmlrpc.php?rsd">
<link rel=3D"wlwmanifest" type=3D"application/wlwmanifest+xml" href=3D"http=
s://www.how2shout.com/linux/wp-includes/wlwmanifest.xml">
<meta name=3D"generator" content=3D"WordPress 6.0.2">
<link rel=3D"shortlink" href=3D"https://www.how2shout.com/linux/?p=3D1351">
<link rel=3D"alternate" type=3D"application/json+oembed" href=3D"https://ww=
w.how2shout.com/linux/wp-json/oembed/1.0/embed?url=3Dhttps%3A%2F%2Fwww.how2=
shout.com%2Flinux%2Finstall-brew-on-wsl-windows-subsystem-for-linux%2F">
<link rel=3D"alternate" type=3D"text/xml+oembed" href=3D"https://www.how2sh=
out.com/linux/wp-json/oembed/1.0/embed?url=3Dhttps%3A%2F%2Fwww.how2shout.co=
m%2Flinux%2Finstall-brew-on-wsl-windows-subsystem-for-linux%2F&amp;format=
=3Dxml">



<link rel=3D"icon" href=3D"https://www.how2shout.com/linux/wp-content/uploa=
ds/2020/05/Favicon-Linux-shout-min-60x60.png" sizes=3D"32x32">
<link rel=3D"icon" href=3D"https://www.how2shout.com/linux/wp-content/uploa=
ds/2020/05/Favicon-Linux-shout-min.png" sizes=3D"192x192">
<link rel=3D"apple-touch-icon" href=3D"https://www.how2shout.com/linux/wp-c=
ontent/uploads/2020/05/Favicon-Linux-shout-min-180x180.png">
<meta name=3D"msapplication-TileImage" content=3D"https://www.how2shout.com=
/linux/wp-content/uploads/2020/05/Favicon-Linux-shout-min.png">

<meta http-equiv=3D"origin-trial" content=3D"A+cA2PUOfIOKAdSDJOW5CP9ZlxONy1=
yu+hqAq72zUtKw4rLdihqRp6Nui/jUyCyegr+BUtH+C+Elv0ufn05yBQEAAACFeyJvcmlnaW4iO=
iJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hB=
ZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFB=
hcnR5Ijp0cnVlfQ=3D=3D"><meta http-equiv=3D"origin-trial" content=3D"A+zsdH3=
aNZT/bkjT8U/o5ACzyaeNYzTvtoVmwf/KOilfv39pxY2AIsOwhQJv+YnXp98i3TqrQibIVtMWs5=
UHjgoAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZ=
WF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1N1=
YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=3D=3D"><meta http-equiv=3D"o=
rigin-trial" content=3D"AxceVEhIegcDEHqLXFQ2+vPKqzCppoJYsRCZ/BdfVnbM/sUUF2B=
XV8lwNosyYjvoxnTh2FC8cOlAnA5uULr/zAUAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZX=
RhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZ=
XhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVl=
fQ=3D=3D"><meta http-equiv=3D"origin-trial" content=3D"A+cA2PUOfIOKAdSDJOW5=
CP9ZlxONy1yu+hqAq72zUtKw4rLdihqRp6Nui/jUyCyegr+BUtH+C+Elv0ufn05yBQEAAACFeyJ=
vcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeV=
NhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwia=
XNUaGlyZFBhcnR5Ijp0cnVlfQ=3D=3D"><meta http-equiv=3D"origin-trial" content=
=3D"A+zsdH3aNZT/bkjT8U/o5ACzyaeNYzTvtoVmwf/KOilfv39pxY2AIsOwhQJv+YnXp98i3Tq=
rQibIVtMWs5UHjgoAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbT=
o0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2M=
zk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=3D=3D"><meta http=
-equiv=3D"origin-trial" content=3D"AxceVEhIegcDEHqLXFQ2+vPKqzCppoJYsRCZ/Bdf=
VnbM/sUUF2BXV8lwNosyYjvoxnTh2FC8cOlAnA5uULr/zAUAAACLeyJvcmlnaW4iOiJodHRwczo=
vL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZH=
NBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhc=
nR5Ijp0cnVlfQ=3D=3D"><link rel=3D"preload" href=3D"https://adservice.google=
.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link=
 rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js?d=
omain=3Dwww.how2shout.com" as=3D"script"><meta http-equiv=3D"origin-trial" =
content=3D"A+cA2PUOfIOKAdSDJOW5CP9ZlxONy1yu+hqAq72zUtKw4rLdihqRp6Nui/jUyCye=
gr+BUtH+C+Elv0ufn05yBQEAAACFeyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo=
0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mz=
k5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=3D=3D"><meta http-=
equiv=3D"origin-trial" content=3D"A+zsdH3aNZT/bkjT8U/o5ACzyaeNYzTvtoVmwf/KO=
ilfv39pxY2AIsOwhQJv+YnXp98i3TqrQibIVtMWs5UHjgoAAACLeyJvcmlnaW4iOiJodHRwczov=
L2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHN=
BUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcn=
R5Ijp0cnVlfQ=3D=3D"><meta http-equiv=3D"origin-trial" content=3D"AxceVEhIeg=
cDEHqLXFQ2+vPKqzCppoJYsRCZ/BdfVnbM/sUUF2BXV8lwNosyYjvoxnTh2FC8cOlAnA5uULr/z=
AUAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0=
dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1N1YmR=
vbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=3D=3D"><link rel=3D"preload" hr=
ef=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2=
shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.go=
ogle.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><lin=
k rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.=
js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"=
https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com=
" as=3D"script"><meta http-equiv=3D"origin-trial" content=3D"AzVDZQXqn8yacU=
yRQ+RDGadgISPnFQVyZItZ2AcXWiEHcBAUzfaj3S/mk2egxYyxI8IzHNGsB0k+hHwEn4uNIAkAA=
AB4eyJvcmlnaW4iOiJodHRwczovL2ltYXNkay5nb29nbGVhcGlzLmNvbTo0NDMiLCJmZWF0dXJl=
IjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1RoaXJkUGF=
ydHkiOnRydWV9"><link rel=3D"preload" href=3D"https://adservice.google.com.a=
u/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=
=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><meta http-equiv=3D"origin-trial" content=3D"AzVDZQX=
qn8yacUyRQ+RDGadgISPnFQVyZItZ2AcXWiEHcBAUzfaj3S/mk2egxYyxI8IzHNGsB0k+hHwEn4=
uNIAkAAAB4eyJvcmlnaW4iOiJodHRwczovL2ltYXNkay5nb29nbGVhcGlzLmNvbTo0NDMiLCJmZ=
WF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1Ro=
aXJkUGFydHkiOnRydWV9"><link rel=3D"preload" href=3D"https://adservice.googl=
e.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><lin=
k rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js?=
domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"htt=
ps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com=
" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/=
adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"=
preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"s=
cript"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/=
integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preloa=
d" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.ho=
w2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.=
google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"=
><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrato=
r.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><meta http-equiv=3D"origin-trial" content=3D"AzVDZQXqn8yacUyR=
Q+RDGadgISPnFQVyZItZ2AcXWiEHcBAUzfaj3S/mk2egxYyxI8IzHNGsB0k+hHwEn4uNIAkAAAB=
4eyJvcmlnaW4iOiJodHRwczovL2ltYXNkay5nb29nbGVhcGlzLmNvbTo0NDMiLCJmZWF0dXJlIj=
oiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1RoaXJkUGFyd=
HkiOnRydWV9"><link rel=3D"preload" href=3D"https://adservice.google.com.au/=
adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"=
preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3D=
www.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adse=
rvice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"s=
cript"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/int=
egrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" =
href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.ho=
w2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.=
google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><l=
ink rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrato=
r.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout=
.com" as=3D"script"><meta http-equiv=3D"origin-trial" content=3D"AzVDZQXqn8=
yacUyRQ+RDGadgISPnFQVyZItZ2AcXWiEHcBAUzfaj3S/mk2egxYyxI8IzHNGsB0k+hHwEn4uNI=
AkAAAB4eyJvcmlnaW4iOiJodHRwczovL2ltYXNkay5nb29nbGVhcGlzLmNvbTo0NDMiLCJmZWF0=
dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1RoaXJ=
kUGFydHkiOnRydWV9"><link rel=3D"preload" href=3D"https://adservice.google.c=
om.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link r=
el=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js?dom=
ain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https:=
//adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" a=
s=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/ads=
id/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"pre=
load" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3D=
www.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adse=
rvice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scri=
pt"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/int=
egrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" =
href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2s=
hout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goo=
gle.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><l=
ink rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.j=
s?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"h=
ttps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.c=
om" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.co=
m/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=
=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?do=
main=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https=
://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/a=
dsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"p=
reload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><meta http-equiv=3D"origin-trial" content=
=3D"AzVDZQXqn8yacUyRQ+RDGadgISPnFQVyZItZ2AcXWiEHcBAUzfaj3S/mk2egxYyxI8IzHNG=
sB0k+hHwEn4uNIAkAAAB4eyJvcmlnaW4iOiJodHRwczovL2ltYXNkay5nb29nbGVhcGlzLmNvbT=
o0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2M=
zk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><link rel=3D"preload" href=3D"https://adse=
rvice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"s=
cript"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/int=
egrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" =
href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.ho=
w2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.=
google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><l=
ink rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrato=
r.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout=
.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.=
com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js?do=
main=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https=
://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/ad=
sid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"pr=
eload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"s=
cript"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/=
integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preloa=
d" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.ho=
w2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.=
google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"=
><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrato=
r.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"=
script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid=
/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prelo=
ad" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.h=
ow2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice=
.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script=
"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrat=
or.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"=
script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid=
/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prelo=
ad" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.h=
ow2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice=
.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script=
"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrat=
or.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"=
script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid=
/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prelo=
ad" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.h=
ow2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice=
.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script=
"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrat=
or.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"=
script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid=
/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prelo=
ad" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.h=
ow2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice=
.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script=
"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrat=
or.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"=
script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid=
/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prelo=
ad" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.h=
ow2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice=
.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script=
"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrat=
or.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"=
script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid=
/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prelo=
ad" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.h=
ow2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice=
.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script=
"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrat=
or.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domai=
n=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://=
adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"=
script"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid=
/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prelo=
ad" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.h=
ow2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice=
.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script=
"><link rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrat=
or.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=
=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link =
rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" =
as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com.au=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D=
"preload" href=3D"https://adservice.google.com/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=
=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com/adsi=
d/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"prel=
oad" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=3Dw=
ww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://adser=
vice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"scrip=
t"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/inte=
grator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" h=
ref=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.how2sh=
out.com" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.goog=
le.com.au/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><li=
nk rel=3D"preload" href=3D"https://adservice.google.com/adsid/integrator.js=
?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"ht=
tps://adservice.google.com.au/adsid/integrator.js?domain=3Dwww.how2shout.co=
m" as=3D"script"><link rel=3D"preload" href=3D"https://adservice.google.com=
/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><meta http-e=
quiv=3D"origin-trial" content=3D"AzVDZQXqn8yacUyRQ+RDGadgISPnFQVyZItZ2AcXWi=
EHcBAUzfaj3S/mk2egxYyxI8IzHNGsB0k+hHwEn4uNIAkAAAB4eyJvcmlnaW4iOiJodHRwczovL=
2ltYXNkay5nb29nbGVhcGlzLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNB=
UElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><link rel=3D"=
preload" href=3D"https://adservice.google.com.au/adsid/integrator.js?domain=
=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preload" href=3D"https://a=
dservice.google.com/adsid/integrator.js?domain=3Dwww.how2shout.com" as=3D"s=
cript"><link rel=3D"preload" href=3D"https://adservice.google.com.au/adsid/=
integrator.js?domain=3Dwww.how2shout.com" as=3D"script"><link rel=3D"preloa=
d" href=3D"https://adservice.google.com/adsid/integrator.js?domain=3Dwww.ho=
w2shout.com" as=3D"script"><meta http-equiv=3D"origin-trial" content=3D"AzV=
DZQXqn8yacUyRQ+RDGadgISPnFQVyZItZ2AcXWiEHcBAUzfaj3S/mk2egxYyxI8IzHNGsB0k+hH=
wEn4uNIAkAAAB4eyJvcmlnaW4iOiJodHRwczovL2ltYXNkay5nb29nbGVhcGlzLmNvbTo0NDMiL=
CJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJp=
c1RoaXJkUGFydHkiOnRydWV9"></head>
<body class=3D"post-template-default single single-post postid-1351 single-=
format-standard wp-embed-responsive post-image-above-header post-image-alig=
ned-center sticky-menu-no-transition sticky-enabled both-sticky-menu mobile=
-header mobile-header-sticky right-sidebar nav-below-header separate-contai=
ners fluid-header active-footer-widgets-2 nav-search-enabled nav-aligned-ri=
ght header-aligned-left dropdown-hover aa-prefix-how2s- using-mouse" itemty=
pe=3D"https://schema.org/Blog" itemscope=3D"" aria-hidden=3D"false">
<svg xmlns=3D"http://www.w3.org/2000/svg" viewBox=3D"0 0 0 0" width=3D"0" h=
eight=3D"0" focusable=3D"false" role=3D"none" style=3D"visibility: hidden; =
position: absolute; left: -9999px; overflow: hidden;"><defs><filter id=3D"w=
p-duotone-dark-grayscale"><feColorMatrix color-interpolation-filters=3D"sRG=
B" type=3D"matrix" values=3D" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .5=
87 .114 0 0 .299 .587 .114 0 0 "></feColorMatrix><feComponentTransfer color=
-interpolation-filters=3D"sRGB"><feFuncR type=3D"table" tableValues=3D"0 0.=
49803921568627"></feFuncR><feFuncG type=3D"table" tableValues=3D"0 0.498039=
21568627"></feFuncG><feFuncB type=3D"table" tableValues=3D"0 0.498039215686=
27"></feFuncB><feFuncA type=3D"table" tableValues=3D"1 1"></feFuncA></feCom=
ponentTransfer><feComposite in2=3D"SourceGraphic" operator=3D"in"></feCompo=
site></filter></defs></svg><svg xmlns=3D"http://www.w3.org/2000/svg" viewBo=
x=3D"0 0 0 0" width=3D"0" height=3D"0" focusable=3D"false" role=3D"none" st=
yle=3D"visibility: hidden; position: absolute; left: -9999px; overflow: hid=
den;"><defs><filter id=3D"wp-duotone-grayscale"><feColorMatrix color-interp=
olation-filters=3D"sRGB" type=3D"matrix" values=3D" .299 .587 .114 0 0 .299=
 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 "></feColorMatrix><feC=
omponentTransfer color-interpolation-filters=3D"sRGB"><feFuncR type=3D"tabl=
e" tableValues=3D"0 1"></feFuncR><feFuncG type=3D"table" tableValues=3D"0 1=
"></feFuncG><feFuncB type=3D"table" tableValues=3D"0 1"></feFuncB><feFuncA =
type=3D"table" tableValues=3D"1 1"></feFuncA></feComponentTransfer><feCompo=
site in2=3D"SourceGraphic" operator=3D"in"></feComposite></filter></defs></=
svg><svg xmlns=3D"http://www.w3.org/2000/svg" viewBox=3D"0 0 0 0" width=3D"=
0" height=3D"0" focusable=3D"false" role=3D"none" style=3D"visibility: hidd=
en; position: absolute; left: -9999px; overflow: hidden;"><defs><filter id=
=3D"wp-duotone-purple-yellow"><feColorMatrix color-interpolation-filters=3D=
"sRGB" type=3D"matrix" values=3D" .299 .587 .114 0 0 .299 .587 .114 0 0 .29=
9 .587 .114 0 0 .299 .587 .114 0 0 "></feColorMatrix><feComponentTransfer c=
olor-interpolation-filters=3D"sRGB"><feFuncR type=3D"table" tableValues=3D"=
0.54901960784314 0.98823529411765"></feFuncR><feFuncG type=3D"table" tableV=
alues=3D"0 1"></feFuncG><feFuncB type=3D"table" tableValues=3D"0.7176470588=
2353 0.25490196078431"></feFuncB><feFuncA type=3D"table" tableValues=3D"1 1=
"></feFuncA></feComponentTransfer><feComposite in2=3D"SourceGraphic" operat=
or=3D"in"></feComposite></filter></defs></svg><svg xmlns=3D"http://www.w3.o=
rg/2000/svg" viewBox=3D"0 0 0 0" width=3D"0" height=3D"0" focusable=3D"fals=
e" role=3D"none" style=3D"visibility: hidden; position: absolute; left: -99=
99px; overflow: hidden;"><defs><filter id=3D"wp-duotone-blue-red"><feColorM=
atrix color-interpolation-filters=3D"sRGB" type=3D"matrix" values=3D" .299 =
.587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 "></=
feColorMatrix><feComponentTransfer color-interpolation-filters=3D"sRGB"><fe=
FuncR type=3D"table" tableValues=3D"0 1"></feFuncR><feFuncG type=3D"table" =
tableValues=3D"0 0.27843137254902"></feFuncG><feFuncB type=3D"table" tableV=
alues=3D"0.5921568627451 0.27843137254902"></feFuncB><feFuncA type=3D"table=
" tableValues=3D"1 1"></feFuncA></feComponentTransfer><feComposite in2=3D"S=
ourceGraphic" operator=3D"in"></feComposite></filter></defs></svg><svg xmln=
s=3D"http://www.w3.org/2000/svg" viewBox=3D"0 0 0 0" width=3D"0" height=3D"=
0" focusable=3D"false" role=3D"none" style=3D"visibility: hidden; position:=
 absolute; left: -9999px; overflow: hidden;"><defs><filter id=3D"wp-duotone=
-midnight"><feColorMatrix color-interpolation-filters=3D"sRGB" type=3D"matr=
ix" values=3D" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .29=
9 .587 .114 0 0 "></feColorMatrix><feComponentTransfer color-interpolation-=
filters=3D"sRGB"><feFuncR type=3D"table" tableValues=3D"0 0"></feFuncR><feF=
uncG type=3D"table" tableValues=3D"0 0.64705882352941"></feFuncG><feFuncB t=
ype=3D"table" tableValues=3D"0 1"></feFuncB><feFuncA type=3D"table" tableVa=
lues=3D"1 1"></feFuncA></feComponentTransfer><feComposite in2=3D"SourceGrap=
hic" operator=3D"in"></feComposite></filter></defs></svg><svg xmlns=3D"http=
://www.w3.org/2000/svg" viewBox=3D"0 0 0 0" width=3D"0" height=3D"0" focusa=
ble=3D"false" role=3D"none" style=3D"visibility: hidden; position: absolute=
; left: -9999px; overflow: hidden;"><defs><filter id=3D"wp-duotone-magenta-=
yellow"><feColorMatrix color-interpolation-filters=3D"sRGB" type=3D"matrix"=
 values=3D" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .=
587 .114 0 0 "></feColorMatrix><feComponentTransfer color-interpolation-fil=
ters=3D"sRGB"><feFuncR type=3D"table" tableValues=3D"0.78039215686275 1"></=
feFuncR><feFuncG type=3D"table" tableValues=3D"0 0.94901960784314"></feFunc=
G><feFuncB type=3D"table" tableValues=3D"0.35294117647059 0.47058823529412"=
></feFuncB><feFuncA type=3D"table" tableValues=3D"1 1"></feFuncA></feCompon=
entTransfer><feComposite in2=3D"SourceGraphic" operator=3D"in"></feComposit=
e></filter></defs></svg><svg xmlns=3D"http://www.w3.org/2000/svg" viewBox=
=3D"0 0 0 0" width=3D"0" height=3D"0" focusable=3D"false" role=3D"none" sty=
le=3D"visibility: hidden; position: absolute; left: -9999px; overflow: hidd=
en;"><defs><filter id=3D"wp-duotone-purple-green"><feColorMatrix color-inte=
rpolation-filters=3D"sRGB" type=3D"matrix" values=3D" .299 .587 .114 0 0 .2=
99 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 "></feColorMatrix><f=
eComponentTransfer color-interpolation-filters=3D"sRGB"><feFuncR type=3D"ta=
ble" tableValues=3D"0.65098039215686 0.40392156862745"></feFuncR><feFuncG t=
ype=3D"table" tableValues=3D"0 1"></feFuncG><feFuncB type=3D"table" tableVa=
lues=3D"0.44705882352941 0.4"></feFuncB><feFuncA type=3D"table" tableValues=
=3D"1 1"></feFuncA></feComponentTransfer><feComposite in2=3D"SourceGraphic"=
 operator=3D"in"></feComposite></filter></defs></svg><svg xmlns=3D"http://w=
ww.w3.org/2000/svg" viewBox=3D"0 0 0 0" width=3D"0" height=3D"0" focusable=
=3D"false" role=3D"none" style=3D"visibility: hidden; position: absolute; l=
eft: -9999px; overflow: hidden;"><defs><filter id=3D"wp-duotone-blue-orange=
"><feColorMatrix color-interpolation-filters=3D"sRGB" type=3D"matrix" value=
s=3D" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .1=
14 0 0 "></feColorMatrix><feComponentTransfer color-interpolation-filters=
=3D"sRGB"><feFuncR type=3D"table" tableValues=3D"0.098039215686275 1"></feF=
uncR><feFuncG type=3D"table" tableValues=3D"0 0.66274509803922"></feFuncG><=
feFuncB type=3D"table" tableValues=3D"0.84705882352941 0.41960784313725"></=
feFuncB><feFuncA type=3D"table" tableValues=3D"1 1"></feFuncA></feComponent=
Transfer><feComposite in2=3D"SourceGraphic" operator=3D"in"></feComposite><=
/filter></defs></svg><a class=3D"screen-reader-text skip-link" href=3D"http=
s://www.how2shout.com/linux/install-brew-on-wsl-windows-subsystem-for-linux=
/#content" title=3D"Skip to content">Skip to content</a> <nav id=3D"mobile-=
header" itemtype=3D"https://schema.org/SiteNavigationElement" itemscope=3D"=
" class=3D"main-navigation mobile-header-navigation has-branding has-sticky=
-branding stuckElement">
<div class=3D"inside-navigation grid-container grid-parent">
<form method=3D"get" class=3D"search-form navigation-search" action=3D"http=
s://www.how2shout.com/linux/">
<input type=3D"search" class=3D"search-field" value=3D"" name=3D"s" title=
=3D"Search">
</form><div class=3D"navigation-branding"><p class=3D"main-title" itemprop=
=3D"headline">
<a href=3D"https://www.how2shout.com/linux/" rel=3D"home">
Linux Shout
</a>
</p></div> <div class=3D"mobile-bar-items">
<span class=3D"search-item">
<a aria-label=3D"Open Search Bar" href=3D"https://www.how2shout.com/linux/i=
nstall-brew-on-wsl-windows-subsystem-for-linux/#">
<span class=3D"gp-icon icon-search"><svg viewBox=3D"0 0 512 512" aria-hidde=
n=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em" height=3D"1em=
"><path fill-rule=3D"evenodd" clip-rule=3D"evenodd" d=3D"M208 48c-88.366 0-=
160 71.634-160 160s71.634 160 160 160 160-71.634 160-160S296.366 48 208 48z=
M0 208C0 93.125 93.125 0 208 0s208 93.125 208 208c0 48.741-16.765 93.566-44=
.843 129.024l133.826 134.018c9.366 9.379 9.355 24.575-.025 33.941-9.379 9.3=
66-24.575 9.355-33.941-.025L337.238 370.987C301.747 399.167 256.839 416 208=
 416 93.125 416 0 322.875 0 208z"></path></svg><svg viewBox=3D"0 0 512 512"=
 aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em" he=
ight=3D"1em"><path d=3D"M71.029 71.029c9.373-9.372 24.569-9.372 33.942 0L25=
6 222.059l151.029-151.03c9.373-9.372 24.569-9.372 33.942 0 9.372 9.373 9.37=
2 24.569 0 33.942L289.941 256l151.03 151.029c9.372 9.373 9.372 24.569 0 33.=
942-9.373 9.372-24.569 9.372-33.942 0L256 289.941l-151.029 151.03c-9.373 9.=
372-24.569 9.372-33.942 0-9.372-9.373-9.372-24.569 0-33.942L222.059 256 71.=
029 104.971c-9.372-9.373-9.372-24.569 0-33.942z"></path></svg></span> </a>
</span>
</div>
<button class=3D"menu-toggle" aria-controls=3D"mobile-menu" aria-expanded=
=3D"false">
<span class=3D"gp-icon icon-menu-bars"><svg viewBox=3D"0 0 512 512" aria-hi=
dden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em" height=3D"=
1em"><path d=3D"M0 96c0-13.255 10.745-24 24-24h464c13.255 0 24 10.745 24 24=
s-10.745 24-24 24H24c-13.255 0-24-10.745-24-24zm0 160c0-13.255 10.745-24 24=
-24h464c13.255 0 24 10.745 24 24s-10.745 24-24 24H24c-13.255 0-24-10.745-24=
-24zm0 160c0-13.255 10.745-24 24-24h464c13.255 0 24 10.745 24 24s-10.745 24=
-24 24H24c-13.255 0-24-10.745-24-24z"></path></svg><svg viewBox=3D"0 0 512 =
512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em=
" height=3D"1em"><path d=3D"M71.029 71.029c9.373-9.372 24.569-9.372 33.942 =
0L256 222.059l151.029-151.03c9.373-9.372 24.569-9.372 33.942 0 9.372 9.373 =
9.372 24.569 0 33.942L289.941 256l151.03 151.029c9.372 9.373 9.372 24.569 0=
 33.942-9.373 9.372-24.569 9.372-33.942 0L256 289.941l-151.029 151.03c-9.37=
3 9.372-24.569 9.372-33.942 0-9.372-9.373-9.372-24.569 0-33.942L222.059 256=
 71.029 104.971c-9.372-9.373-9.372-24.569 0-33.942z"></path></svg></span><s=
pan class=3D"mobile-menu">Menu</span> </button>
<div id=3D"mobile-menu" class=3D"main-nav"><ul id=3D"menu-menu-1" class=3D"=
 menu sf-menu"><li id=3D"menu-item-110" class=3D"menu-item menu-item-type-c=
ustom menu-item-object-custom menu-item-110"><a href=3D"https://www.how2sho=
ut.com/">H2S Media</a></li>
<li id=3D"menu-item-6283" class=3D"menu-item menu-item-type-custom menu-ite=
m-object-custom menu-item-home menu-item-6283"><a href=3D"https://www.how2s=
hout.com/linux">Home</a></li>
<li id=3D"menu-item-9" class=3D"menu-item menu-item-type-taxonomy menu-item=
-object-category current-post-ancestor current-menu-parent current-post-par=
ent menu-item-has-children menu-item-9"><a title=3D"Linux Distros" href=3D"=
https://www.how2shout.com/linux/category/linux/">Linux Distros<span role=3D=
"presentation" class=3D"dropdown-menu-toggle"><span class=3D"gp-icon icon-a=
rrow"><svg viewBox=3D"0 0 330 512" aria-hidden=3D"true" xmlns=3D"http://www=
.w3.org/2000/svg" width=3D"1em" height=3D"1em"><path d=3D"M305.913 197.085c=
0 2.266-1.133 4.815-2.833 6.514L171.087 335.593c-1.7 1.7-4.249 2.832-6.515 =
2.832s-4.815-1.133-6.515-2.832L26.064 203.599c-1.7-1.7-2.832-4.248-2.832-6.=
514s1.132-4.816 2.832-6.515l14.162-14.163c1.7-1.699 3.966-2.832 6.515-2.832=
 2.266 0 4.815 1.133 6.515 2.832l111.316 111.317 111.316-111.317c1.7-1.699 =
4.249-2.832 6.515-2.832s4.815 1.133 6.515 2.832l14.162 14.163c1.7 1.7 2.833=
 4.249 2.833 6.515z"></path></svg></span></span></a>
<ul class=3D"sub-menu">
<li id=3D"menu-item-5658" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-5658"><a href=3D"https://www.how2shout.com/li=
nux/tag/pop_os/">Pop!_OS</a></li>
<li id=3D"menu-item-5659" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-5659"><a href=3D"https://www.how2shout.com/li=
nux/tag/debian/">Debian</a></li>
<li id=3D"menu-item-3018" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-3018"><a href=3D"https://www.how2shout.com/li=
nux/tag/mx-linux/">MX linux</a></li>
<li id=3D"menu-item-5660" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-5660"><a href=3D"https://www.how2shout.com/li=
nux/tag/elementary-os/">Elementary OS</a></li>
<li id=3D"menu-item-5661" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-5661"><a href=3D"https://www.how2shout.com/li=
nux/tag/manjaro/">Manjaro Linux</a></li>
<li id=3D"menu-item-5662" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-5662"><a href=3D"https://www.how2shout.com/li=
nux/tag/oracle-linux/">Oracle linux</a></li>
<li id=3D"menu-item-5663" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-5663"><a href=3D"https://www.how2shout.com/li=
nux/tag/opensuse/">Opensuse</a></li>
</ul>
</li>
<li id=3D"menu-item-10" class=3D"menu-item menu-item-type-taxonomy menu-ite=
m-object-category menu-item-has-children menu-item-10"><a title=3D"Ubuntu L=
inux" href=3D"https://www.how2shout.com/linux/category/ubuntu/">Ubuntu<span=
 role=3D"presentation" class=3D"dropdown-menu-toggle"><span class=3D"gp-ico=
n icon-arrow"><svg viewBox=3D"0 0 330 512" aria-hidden=3D"true" xmlns=3D"ht=
tp://www.w3.org/2000/svg" width=3D"1em" height=3D"1em"><path d=3D"M305.913 =
197.085c0 2.266-1.133 4.815-2.833 6.514L171.087 335.593c-1.7 1.7-4.249 2.83=
2-6.515 2.832s-4.815-1.133-6.515-2.832L26.064 203.599c-1.7-1.7-2.832-4.248-=
2.832-6.514s1.132-4.816 2.832-6.515l14.162-14.163c1.7-1.699 3.966-2.832 6.5=
15-2.832 2.266 0 4.815 1.133 6.515 2.832l111.316 111.317 111.316-111.317c1.=
7-1.699 4.249-2.832 6.515-2.832s4.815 1.133 6.515 2.832l14.162 14.163c1.7 1=
.7 2.833 4.249 2.833 6.515z"></path></svg></span></span></a>
<ul class=3D"sub-menu">
<li id=3D"menu-item-8683" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-8683"><a href=3D"https://www.how2shout.com/li=
nux/tag/ubuntu-22-04/">Ubuntu 22.04</a></li>
<li id=3D"menu-item-8681" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-post_tag menu-item-8681"><a href=3D"https://www.how2shout.com/li=
nux/tag/ubuntu-20-04/">ubuntu 20.04</a></li>
</ul>
</li>
<li id=3D"menu-item-4868" class=3D"menu-item menu-item-type-custom menu-ite=
m-object-custom menu-item-has-children menu-item-4868"><a href=3D"https://w=
ww.how2shout.com/linux/install-brew-on-wsl-windows-subsystem-for-linux/#">R=
HEL Based<span role=3D"presentation" class=3D"dropdown-menu-toggle"><span c=
lass=3D"gp-icon icon-arrow"><svg viewBox=3D"0 0 330 512" aria-hidden=3D"tru=
e" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em" height=3D"1em"><path =
d=3D"M305.913 197.085c0 2.266-1.133 4.815-2.833 6.514L171.087 335.593c-1.7 =
1.7-4.249 2.832-6.515 2.832s-4.815-1.133-6.515-2.832L26.064 203.599c-1.7-1.=
7-2.832-4.248-2.832-6.514s1.132-4.816 2.832-6.515l14.162-14.163c1.7-1.699 3=
.966-2.832 6.515-2.832 2.266 0 4.815 1.133 6.515 2.832l111.316 111.317 111.=
316-111.317c1.7-1.699 4.249-2.832 6.515-2.832s4.815 1.133 6.515 2.832l14.16=
2 14.163c1.7 1.7 2.833 4.249 2.833 6.515z"></path></svg></span></span></a>
<ul class=3D"sub-menu">
<li id=3D"menu-item-4869" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-category menu-item-4869"><a href=3D"https://www.how2shout.com/li=
nux/category/rocky-linux/">Rocky Linux</a></li>
<li id=3D"menu-item-4064" class=3D"menu-item menu-item-type-taxonomy menu-i=
tem-object-category menu-item-4064"><a href=3D"https://www.how2shout.com/li=
nux/category/almalinux/">AlmaLinux</a></li>
<li id=3D"menu-item-967" class=3D"menu-item menu-item-type-taxonomy menu-it=
em-object-category menu-item-967"><a title=3D"centos" href=3D"https://www.h=
ow2shout.com/linux/category/centos/">CentOS</a></li>
</ul>
</li>
<li id=3D"menu-item-3028" class=3D"menu-item menu-item-type-post_type menu-=
item-object-post menu-item-3028"><a href=3D"https://www.how2shout.com/linux=
/best-ubuntu-live-usb-creators/">Ubuntu live USB creators</a></li>
<li class=3D"search-item menu-item-align-right"><a aria-label=3D"Open Searc=
h Bar" href=3D"https://www.how2shout.com/linux/install-brew-on-wsl-windows-=
subsystem-for-linux/#"><span class=3D"gp-icon icon-search"><svg viewBox=3D"=
0 0 512 512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" widt=
h=3D"1em" height=3D"1em"><path fill-rule=3D"evenodd" clip-rule=3D"evenodd" =
d=3D"M208 48c-88.366 0-160 71.634-160 160s71.634 160 160 160 160-71.634 160=
-160S296.366 48 208 48zM0 208C0 93.125 93.125 0 208 0s208 93.125 208 208c0 =
48.741-16.765 93.566-44.843 129.024l133.826 134.018c9.366 9.379 9.355 24.57=
5-.025 33.941-9.379 9.366-24.575 9.355-33.941-.025L337.238 370.987C301.747 =
399.167 256.839 416 208 416 93.125 416 0 322.875 0 208z"></path></svg><svg =
viewBox=3D"0 0 512 512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/200=
0/svg" width=3D"1em" height=3D"1em"><path d=3D"M71.029 71.029c9.373-9.372 2=
4.569-9.372 33.942 0L256 222.059l151.029-151.03c9.373-9.372 24.569-9.372 33=
.942 0 9.372 9.373 9.372 24.569 0 33.942L289.941 256l151.03 151.029c9.372 9=
.373 9.372 24.569 0 33.942-9.373 9.372-24.569 9.372-33.942 0L256 289.941l-1=
51.029 151.03c-9.373 9.372-24.569 9.372-33.942 0-9.372-9.373-9.372-24.569 0=
-33.942L222.059 256 71.029 104.971c-9.372-9.373-9.372-24.569 0-33.942z"></p=
ath></svg></span></a></li></ul></div> </div>
</nav>
<nav class=3D"auto-hide-sticky has-branding main-navigation sub-menu-right =
stuckElement" id=3D"site-navigation" aria-label=3D"Primary" itemtype=3D"htt=
ps://schema.org/SiteNavigationElement" itemscope=3D"" style=3D"">
<div class=3D"inside-navigation grid-container grid-parent">
<div class=3D"navigation-branding"><p class=3D"main-title" itemprop=3D"head=
line">
<a href=3D"https://www.how2shout.com/linux/" rel=3D"home">
Linux Shout
</a>
</p></div><form method=3D"get" class=3D"search-form navigation-search" acti=
on=3D"https://www.how2shout.com/linux/">
<input type=3D"search" class=3D"search-field" value=3D"" name=3D"s" title=
=3D"Search">
</form> <div class=3D"mobile-bar-items">
<span class=3D"search-item">
<a aria-label=3D"Open Search Bar" href=3D"https://www.how2shout.com/linux/i=
nstall-brew-on-wsl-windows-subsystem-for-linux/#">
<span class=3D"gp-icon icon-search"><svg viewBox=3D"0 0 512 512" aria-hidde=
n=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em" height=3D"1em=
"><path fill-rule=3D"evenodd" clip-rule=3D"evenodd" d=3D"M208 48c-88.366 0-=
160 71.634-160 160s71.634 160 160 160 160-71.634 160-160S296.366 48 208 48z=
M0 208C0 93.125 93.125 0 208 0s208 93.125 208 208c0 48.741-16.765 93.566-44=
.843 129.024l133.826 134.018c9.366 9.379 9.355 24.575-.025 33.941-9.379 9.3=
66-24.575 9.355-33.941-.025L337.238 370.987C301.747 399.167 256.839 416 208=
 416 93.125 416 0 322.875 0 208z"></path></svg><svg viewBox=3D"0 0 512 512"=
 aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em" he=
ight=3D"1em"><path d=3D"M71.029 71.029c9.373-9.372 24.569-9.372 33.942 0L25=
6 222.059l151.029-151.03c9.373-9.372 24.569-9.372 33.942 0 9.372 9.373 9.37=
2 24.569 0 33.942L289.941 256l151.03 151.029c9.372 9.373 9.372 24.569 0 33.=
942-9.373 9.372-24.569 9.372-33.942 0L256 289.941l-151.029 151.03c-9.373 9.=
372-24.569 9.372-33.942 0-9.372-9.373-9.372-24.569 0-33.942L222.059 256 71.=
029 104.971c-9.372-9.373-9.372-24.569 0-33.942z"></path></svg></span> </a>
</span>
</div>
<button class=3D"menu-toggle" aria-controls=3D"primary-menu" aria-expanded=
=3D"false">
<span class=3D"gp-icon icon-menu-bars"><svg viewBox=3D"0 0 512 512" aria-hi=
dden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em" height=3D"=
1em"><path d=3D"M0 96c0-13.255 10.745-24 24-24h464c13.255 0 24 10.745 24 24=
s-10.745 24-24 24H24c-13.255 0-24-10.745-24-24zm0 160c0-13.255 10.745-24 24=
-24h464c13.255 0 24 10.745 24 24s-10.745 24-24 24H24c-13.255 0-24-10.745-24=
-24zm0 160c0-13.255 10.745-24 24-24h464c13.255 0 24 10.745 24 24s-10.745 24=
-24 24H24c-13.255 0-24-10.745-24-24z"></path></svg><svg viewBox=3D"0 0 512 =
512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" width=3D"1em=
" height=3D"1em"><path d=3D"M71.029 71.029c9.373-9.372 24.569-9.372 33.942 =
0L256 222.059l151.029-151.03c9.373-9.372 24.569-9.372 33.942 0 9.372 9.373 =
9.372 24.569 0 33.942L289.941 256l151.03 151.029c9.372 9.373 9.372 24.569 0=
 33.942-9.373 9.372-24.569 9.372-33.942 0L256 289.941l-151.029 151.03c-9.37=
3 9.372-24.569 9.372-33.942 0-9.372-9.373-9.372-24.569 0-33.942L222.059 256=
 71.029 104.971c-9.372-9.373-9.372-24.569 0-33.942z"></path></svg></span><s=
pan class=3D"mobile-menu">Menu</span> </button>
<div id=3D"primary-menu" class=3D"main-nav"><ul id=3D"menu-menu-2" class=3D=
" menu sf-menu"><li class=3D"menu-item menu-item-type-custom menu-item-obje=
ct-custom menu-item-110"><a href=3D"https://www.how2shout.com/">H2S Media</=
a></li>
<li class=3D"menu-item menu-item-type-custom menu-item-object-custom menu-i=
tem-home menu-item-6283"><a href=3D"https://www.how2shout.com/linux">Home</=
a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-category cu=
rrent-post-ancestor current-menu-parent current-post-parent menu-item-has-c=
hildren menu-item-9"><a title=3D"Linux Distros" href=3D"https://www.how2sho=
ut.com/linux/category/linux/">Linux Distros<span role=3D"presentation" clas=
s=3D"dropdown-menu-toggle"><span class=3D"gp-icon icon-arrow"><svg viewBox=
=3D"0 0 330 512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" =
width=3D"1em" height=3D"1em"><path d=3D"M305.913 197.085c0 2.266-1.133 4.81=
5-2.833 6.514L171.087 335.593c-1.7 1.7-4.249 2.832-6.515 2.832s-4.815-1.133=
-6.515-2.832L26.064 203.599c-1.7-1.7-2.832-4.248-2.832-6.514s1.132-4.816 2.=
832-6.515l14.162-14.163c1.7-1.699 3.966-2.832 6.515-2.832 2.266 0 4.815 1.1=
33 6.515 2.832l111.316 111.317 111.316-111.317c1.7-1.699 4.249-2.832 6.515-=
2.832s4.815 1.133 6.515 2.832l14.162 14.163c1.7 1.7 2.833 4.249 2.833 6.515=
z"></path></svg></span></span></a>
<ul class=3D"sub-menu">
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-5658"><a href=3D"https://www.how2shout.com/linux/tag/pop_os/">Pop!_=
OS</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-5659"><a href=3D"https://www.how2shout.com/linux/tag/debian/">Debia=
n</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-3018"><a href=3D"https://www.how2shout.com/linux/tag/mx-linux/">MX =
linux</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-5660"><a href=3D"https://www.how2shout.com/linux/tag/elementary-os/=
">Elementary OS</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-5661"><a href=3D"https://www.how2shout.com/linux/tag/manjaro/">Manj=
aro Linux</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-5662"><a href=3D"https://www.how2shout.com/linux/tag/oracle-linux/"=
>Oracle linux</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-5663"><a href=3D"https://www.how2shout.com/linux/tag/opensuse/">Ope=
nsuse</a></li>
</ul>
</li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-category me=
nu-item-has-children menu-item-10"><a title=3D"Ubuntu Linux" href=3D"https:=
//www.how2shout.com/linux/category/ubuntu/">Ubuntu<span role=3D"presentatio=
n" class=3D"dropdown-menu-toggle"><span class=3D"gp-icon icon-arrow"><svg v=
iewBox=3D"0 0 330 512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000=
/svg" width=3D"1em" height=3D"1em"><path d=3D"M305.913 197.085c0 2.266-1.13=
3 4.815-2.833 6.514L171.087 335.593c-1.7 1.7-4.249 2.832-6.515 2.832s-4.815=
-1.133-6.515-2.832L26.064 203.599c-1.7-1.7-2.832-4.248-2.832-6.514s1.132-4.=
816 2.832-6.515l14.162-14.163c1.7-1.699 3.966-2.832 6.515-2.832 2.266 0 4.8=
15 1.133 6.515 2.832l111.316 111.317 111.316-111.317c1.7-1.699 4.249-2.832 =
6.515-2.832s4.815 1.133 6.515 2.832l14.162 14.163c1.7 1.7 2.833 4.249 2.833=
 6.515z"></path></svg></span></span></a>
<ul class=3D"sub-menu">
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-8683"><a href=3D"https://www.how2shout.com/linux/tag/ubuntu-22-04/"=
>Ubuntu 22.04</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-post_tag me=
nu-item-8681"><a href=3D"https://www.how2shout.com/linux/tag/ubuntu-20-04/"=
>ubuntu 20.04</a></li>
</ul>
</li>
<li class=3D"menu-item menu-item-type-custom menu-item-object-custom menu-i=
tem-has-children menu-item-4868"><a href=3D"https://www.how2shout.com/linux=
/install-brew-on-wsl-windows-subsystem-for-linux/#">RHEL Based<span role=3D=
"presentation" class=3D"dropdown-menu-toggle"><span class=3D"gp-icon icon-a=
rrow"><svg viewBox=3D"0 0 330 512" aria-hidden=3D"true" xmlns=3D"http://www=
.w3.org/2000/svg" width=3D"1em" height=3D"1em"><path d=3D"M305.913 197.085c=
0 2.266-1.133 4.815-2.833 6.514L171.087 335.593c-1.7 1.7-4.249 2.832-6.515 =
2.832s-4.815-1.133-6.515-2.832L26.064 203.599c-1.7-1.7-2.832-4.248-2.832-6.=
514s1.132-4.816 2.832-6.515l14.162-14.163c1.7-1.699 3.966-2.832 6.515-2.832=
 2.266 0 4.815 1.133 6.515 2.832l111.316 111.317 111.316-111.317c1.7-1.699 =
4.249-2.832 6.515-2.832s4.815 1.133 6.515 2.832l14.162 14.163c1.7 1.7 2.833=
 4.249 2.833 6.515z"></path></svg></span></span></a>
<ul class=3D"sub-menu">
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-category me=
nu-item-4869"><a href=3D"https://www.how2shout.com/linux/category/rocky-lin=
ux/">Rocky Linux</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-category me=
nu-item-4064"><a href=3D"https://www.how2shout.com/linux/category/almalinux=
/">AlmaLinux</a></li>
<li class=3D"menu-item menu-item-type-taxonomy menu-item-object-category me=
nu-item-967"><a title=3D"centos" href=3D"https://www.how2shout.com/linux/ca=
tegory/centos/">CentOS</a></li>
</ul>
</li>
<li class=3D"menu-item menu-item-type-post_type menu-item-object-post menu-=
item-3028"><a href=3D"https://www.how2shout.com/linux/best-ubuntu-live-usb-=
creators/">Ubuntu live USB creators</a></li>
<li class=3D"search-item menu-item-align-right"><a aria-label=3D"Open Searc=
h Bar" href=3D"https://www.how2shout.com/linux/install-brew-on-wsl-windows-=
subsystem-for-linux/#"><span class=3D"gp-icon icon-search"><svg viewBox=3D"=
0 0 512 512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/2000/svg" widt=
h=3D"1em" height=3D"1em"><path fill-rule=3D"evenodd" clip-rule=3D"evenodd" =
d=3D"M208 48c-88.366 0-160 71.634-160 160s71.634 160 160 160 160-71.634 160=
-160S296.366 48 208 48zM0 208C0 93.125 93.125 0 208 0s208 93.125 208 208c0 =
48.741-16.765 93.566-44.843 129.024l133.826 134.018c9.366 9.379 9.355 24.57=
5-.025 33.941-9.379 9.366-24.575 9.355-33.941-.025L337.238 370.987C301.747 =
399.167 256.839 416 208 416 93.125 416 0 322.875 0 208z"></path></svg><svg =
viewBox=3D"0 0 512 512" aria-hidden=3D"true" xmlns=3D"http://www.w3.org/200=
0/svg" width=3D"1em" height=3D"1em"><path d=3D"M71.029 71.029c9.373-9.372 2=
4.569-9.372 33.942 0L256 222.059l151.029-151.03c9.373-9.372 24.569-9.372 33=
.942 0 9.372 9.373 9.372 24.569 0 33.942L289.941 256l151.03 151.029c9.372 9=
.373 9.372 24.569 0 33.942-9.373 9.372-24.569 9.372-33.942 0L256 289.941l-1=
51.029 151.03c-9.373 9.372-24.569 9.372-33.942 0-9.372-9.373-9.372-24.569 0=
-33.942L222.059 256 71.029 104.971c-9.372-9.373-9.372-24.569 0-33.942z"></p=
ath></svg></span></a></li></ul></div> </div>
</nav>
<div class=3D"site grid-container container hfeed grid-parent" id=3D"page" =
style=3D"height: auto !important;">
<div class=3D"site-content" id=3D"content" style=3D"height: auto !important=
;">
<div class=3D"content-area grid-parent mobile-grid-100 grid-70 tablet-grid-=
70" id=3D"primary" style=3D"height: auto !important;">
<main class=3D"site-main" id=3D"main" style=3D"height: auto !important;">
<article id=3D"post-1351" class=3D"post-1351 post type-post status-publish =
format-standard has-post-thumbnail hentry category-linux tag-linux tag-tuto=
rial tag-ubuntu tag-ubuntu-18-04 tag-ubuntu-20-04 tag-windows-10-wsl tag-wi=
ndows-subsystem-for-linux tag-wsl tag-wsl-1 tag-wsl-2" itemtype=3D"https://=
schema.org/CreativeWork" itemscope=3D"">
<div class=3D"inside-article">
<header class=3D"entry-header" aria-label=3D"Content">
<h1 class=3D"entry-title" itemprop=3D"headline">How to install Brew on WSL-=
 Windows subsystem for Linux</h1> <div class=3D"entry-meta">
<span class=3D"posted-on"><time class=3D"entry-date updated-date" datetime=
=3D"2021-01-01T06:26:03+00:00" itemprop=3D"dateModified">Last Updated on: J=
anuary 1, 2021</time></span> <span class=3D"byline">by <span class=3D"autho=
r vcard" itemprop=3D"author" itemtype=3D"https://schema.org/Person" itemsco=
pe=3D""><a class=3D"url fn n" href=3D"https://www.how2shout.com/linux/autho=
r/heyan/" title=3D"View all posts by Heyan Maurya" rel=3D"author" itemprop=
=3D"url"><span class=3D"author-name" itemprop=3D"name">Heyan Maurya</span><=
/a></span></span> </div>
</header>
<div class=3D"entry-content" itemprop=3D"text">
<p>Homebrew or simply Brew is the package management tool developed under o=
pen source license. The main purpose of Brew is to install various software=
 on macOS, however, it is not limited to that only. Yes, we can install it =
on Linux Distros and Windows 10 using the WSL- Windows system for Linux.</p=
>
<p>Here in the article, we will learn the steps to set up Brew on Windows 1=
0 WSL to install various packages=E2=80=A6</p>
<div id=3D"toc_container" class=3D"no_bullets contracted" style=3D"width: a=
uto; display: table;"><p class=3D"toc_title"> <span class=3D"toc_toggle">[<=
a href=3D"https://www.how2shout.com/linux/install-brew-on-wsl-windows-subsy=
stem-for-linux/#">show</a>]</span></p><ul class=3D"toc_list" style=3D"displ=
ay: none;"><li><a href=3D"https://www.how2shout.com/linux/install-brew-on-w=
sl-windows-subsystem-for-linux/#HomeBrew_installation_on_Windows_10-_WSL_Wi=
ndows_Subsystem_for_Linux">HomeBrew installation on Windows 10- WSL (Window=
s Subsystem for Linux)</a><ul><li><a href=3D"https://www.how2shout.com/linu=
x/install-brew-on-wsl-windows-subsystem-for-linux/#Open_Ubuntu_WSL_App">Ope=
n Ubuntu WSL App</a></li><li><a href=3D"https://www.how2shout.com/linux/ins=
tall-brew-on-wsl-windows-subsystem-for-linux/#Run_Update_command">Run Updat=
e command:</a></li><li><a href=3D"https://www.how2shout.com/linux/install-b=
rew-on-wsl-windows-subsystem-for-linux/#Install_tool_require_to_setup_Brew"=
>Install tool require to setup Brew</a></li><li><a href=3D"https://www.how2=
shout.com/linux/install-brew-on-wsl-windows-subsystem-for-linux/#Command_to=
_Install_HomeBrew_on_WSL_Windows_10">Command to Install HomeBrew on WSL Win=
dows 10</a></li><li><a href=3D"https://www.how2shout.com/linux/install-brew=
-on-wsl-windows-subsystem-for-linux/#Add_Homebrew_to_your_system_PATH">Add =
Homebrew to your system PATH</a></li><li><a href=3D"https://www.how2shout.c=
om/linux/install-brew-on-wsl-windows-subsystem-for-linux/#Use_Brew_on_WSL">=
Use Brew on WSL</a></li></ul></li></ul></div>
<h2><span id=3D"HomeBrew_installation_on_Windows_10-_WSL_Windows_Subsystem_=
for_Linux">HomeBrew installation on Windows 10- WSL (Windows Subsystem for =
Linux)</span></h2>
<p>Before starting the tutorial, I am assuming that you already have the WS=
L with Ubuntu on your Windows 10 or server system. If not then follow the t=
utorial: <a href=3D"https://www.how2shout.com/how-to/enable-windows-subsyst=
em-linux-feature.html" target=3D"_blank" rel=3D"noopener noreferrer">Steps =
to enable WSL with Ubuntu.</a></p>
<h3><span id=3D"Open_Ubuntu_WSL_App">Open Ubuntu WSL App</span></h3>
<p>Currently, there are two long term Ubuntu versions available on Microsof=
t Store to install: Ubuntu 18.04 LTS &amp; Ubuntu 20.04 LTS Linux. You can =
opt for any of them, the steps given here will be the same. Therefore, what=
ever the Linux version you have on your Windows 10, open that.</p>
<h3><span id=3D"Run_Update_command">Run Update command:</span></h3>
<p>To make sure the Packages and Repos available on your Linux WSL app are =
up to date, just run a system update command:</p>
<span data-button-text=3D"Copy Me" data-button-position=3D"outside" data-bu=
tton-copy-text=3D"Copied!" data-style=3D"button" data-button-title=3D"Copy =
to Clipboard" data-selector=3D"pre" class=3D"copy-the-code-wrap copy-the-co=
de-style-button copy-the-code-outside-wrap"><div class=3D"copy-the-code-out=
side"><button class=3D"copy-the-code-button" data-style=3D"button" title=3D=
"Copy to Clipboard">Copy Me</button></div><pre class=3D"copy-the-code-targe=
t">sudo apt update</pre></span>
<h3><span id=3D"Install_tool_require_to_setup_Brew">Install tool require to=
 setup Brew</span></h3>
<p>There are few tools that we need to have on the system such as curl in o=
rder to download and install HomeBrew on our WSL 1 or 2 Linux apps. Therefo=
re run below command with sudo access.</p>
<span data-button-text=3D"Copy Me" data-button-position=3D"outside" data-bu=
tton-copy-text=3D"Copied!" data-style=3D"button" data-button-title=3D"Copy =
to Clipboard" data-selector=3D"pre" class=3D"copy-the-code-wrap copy-the-co=
de-style-button copy-the-code-outside-wrap"><div class=3D"copy-the-code-out=
side"><button class=3D"copy-the-code-button" data-style=3D"button" title=3D=
"Copy to Clipboard">Copy Me</button></div><pre class=3D"copy-the-code-targe=
t">sudo apt-get install build-essential curl file git</pre></span>
<h3><span id=3D"Command_to_Install_HomeBrew_on_WSL_Windows_10">Command to I=
nstall HomeBrew on WSL Windows 10</span></h3>
<p>Once you down with the above step, now here is the script that is availa=
ble on Github to install Brew instantly on Windows Subsystem for Linux. Jus=
t copy and paste the below command in your Ubuntu WSL Linux app.</p>
<span data-button-text=3D"Copy Me" data-button-position=3D"outside" data-bu=
tton-copy-text=3D"Copied!" data-style=3D"button" data-button-title=3D"Copy =
to Clipboard" data-selector=3D"pre" class=3D"copy-the-code-wrap copy-the-co=
de-style-button copy-the-code-outside-wrap"><div class=3D"copy-the-code-out=
side"><button class=3D"copy-the-code-button" data-style=3D"button" title=3D=
"Copy to Clipboard">Copy Me</button></div><pre class=3D"copy-the-code-targe=
t">/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/in=
stall/master/install.sh)"</pre></span>
<h3><span id=3D"Add_Homebrew_to_your_system_PATH"><strong>Add Homebrew to y=
our system PATH</strong></span></h3>
<p>By default, you won=E2=80=99t be able to run Brew without switching to t=
he directory where it has been installed. Thus, to use it from anywhere reg=
ardless of which directory you are, we need to tell the Ubuntu WSL Linux ap=
p about it by adding it to the bin. Run the following commands on your Linu=
x system one by one.</p>
<span data-button-text=3D"Copy Me" data-button-position=3D"outside" data-bu=
tton-copy-text=3D"Copied!" data-style=3D"button" data-button-title=3D"Copy =
to Clipboard" data-selector=3D"pre" class=3D"copy-the-code-wrap copy-the-co=
de-style-button copy-the-code-outside-wrap"><div class=3D"copy-the-code-out=
side"><button class=3D"copy-the-code-button" data-style=3D"button" title=3D=
"Copy to Clipboard">Copy Me</button></div><pre class=3D"copy-the-code-targe=
t">test -d ~/.linuxbrew &amp;&amp; eval $(~/.linuxbrew/bin/brew shellenv)</=
pre></span>
<span data-button-text=3D"Copy Me" data-button-position=3D"outside" data-bu=
tton-copy-text=3D"Copied!" data-style=3D"button" data-button-title=3D"Copy =
to Clipboard" data-selector=3D"pre" class=3D"copy-the-code-wrap copy-the-co=
de-style-button copy-the-code-outside-wrap"><div class=3D"copy-the-code-out=
side"><button class=3D"copy-the-code-button" data-style=3D"button" title=3D=
"Copy to Clipboard">Copy Me</button></div><pre class=3D"copy-the-code-targe=
t">test -d /home/linuxbrew/.linuxbrew &amp;&amp; eval $(/home/linuxbrew/.li=
nuxbrew/bin/brew shellenv)</pre></span>
<span data-button-text=3D"Copy Me" data-button-position=3D"outside" data-bu=
tton-copy-text=3D"Copied!" data-style=3D"button" data-button-title=3D"Copy =
to Clipboard" data-selector=3D"pre" class=3D"copy-the-code-wrap copy-the-co=
de-style-button copy-the-code-outside-wrap"><div class=3D"copy-the-code-out=
side"><button class=3D"copy-the-code-button" data-style=3D"button" title=3D=
"Copy to Clipboard">Copy Me</button></div><pre class=3D"copy-the-code-targe=
t">test -r ~/.bash_profile &amp;&amp; echo "eval \$($(brew --prefix)/bin/br=
ew shellenv)" &gt;&gt;~/.bash_profile</pre></span>
<span data-button-text=3D"Copy Me" data-button-position=3D"outside" data-bu=
tton-copy-text=3D"Copied!" data-style=3D"button" data-button-title=3D"Copy =
to Clipboard" data-selector=3D"pre" class=3D"copy-the-code-wrap copy-the-co=
de-style-button copy-the-code-outside-wrap"><div class=3D"copy-the-code-out=
side"><button class=3D"copy-the-code-button" data-style=3D"button" title=3D=
"Copy to Clipboard">Copy Me</button></div><pre class=3D"copy-the-code-targe=
t">echo "eval \$($(brew --prefix)/bin/brew shellenv)" &gt;&gt;~/.profile</p=
re></span>
<h3><span id=3D"Use_Brew_on_WSL">Use Brew on WSL</span></h3>
<p>Finally, this Package Manager is successfully installed on your system, =
now its time to see whether it is working or not. For that let=E2=80=99s us=
e the brew to install the git on our system. The command will be:</p>
<p><code>brew install <em>package-name</em></code></p><div class=3D"how2s-c=
ontent_2" style=3D"margin-top: 3px; margin-bottom: 3px; " id=3D"how2s-21377=
11836">
<div style=3D"width:100%">
<div class=3D"ads-line">
<div class=3D"adsbyvli" style=3D"width: 300px !important; height: initial !=
important; visibility: visible !important; opacity: 1 !important; margin: 0=
px auto !important; display: flex !important; justify-content: center !impo=
rtant; align-items: center !important; min-height: 250px !important;" data-=
ad-slot=3D"vi_1505561072" data-id=3D"vi_1505561072_1"><vli id=3D"container_=
vi_1505561072_1" style=3D"visibility: visible; display: block !important; p=
osition: relative !important; margin: 0px auto !important; width: 300px !im=
portant; height: 250px !important;"><vli style=3D"visibility: visible;" id=
=3D"vi_1505561072_1" data-google-query-id=3D"COf5keGdovoCFZuHZgIdMRcAQA"><i=
frame class=3D"vliIgnore" style=3D"display: block !important; width: 300px;=
 height: 250px;" id=3D"ifr_vi_1505561072_1" src=3D"cid:frame-7F180FE2EB35ED=
5A713B36E868A6483B@mhtml.blink" frameborder=3D"0" scrolling=3D"no" marginhe=
ight=3D"0" marginwidth=3D"0" topmargin=3D"0" leftmargin=3D"0" allowtranspar=
ency=3D"true" width=3D"300" height=3D"250" sandbox=3D"allow-forms allow-poi=
nter-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin all=
ow-scripts allow-top-navigation-by-user-activation"> </iframe></vli><iframe=
 id=3D"debug_vi_1505561072_1" frameborder=3D"no" scrolling=3D"no" allowtran=
sparency=3D"true" hidefocus=3D"true" marginwidth=3D"0" marginheight=3D"0" t=
opmargin=3D"0" leftmargin=3D"0" style=3D"width: 100%; height: 100%; positio=
n: absolute; background-color: rgba(255, 255, 255, 0.8); top: 0px; left: 0p=
x; z-index: 10000; display: none !important; opacity: 0 !important;"></ifra=
me><vli id=3D"__icon_vi_1505561072_1" style=3D"position: absolute !importan=
t; bottom: 0px !important; left: 0px !important; display: inline-block !imp=
ortant; height: 16px !important; line-height: 1 !important; font-size: 16px=
 !important;"><iframe class=3D"vliIgnore" frameborder=3D"no" scrolling=3D"n=
o" allowtransparency=3D"true" hidefocus=3D"true" marginwidth=3D"0" width=3D=
"16" height=3D"16" marginheight=3D"0" topmargin=3D"0" leftmargin=3D"0"></if=
rame></vli></vli></div>

</div>
<div class=3D"ads-line">
<div class=3D"adsbyvli" style=3D"width: 300px !important; height: initial !=
important; visibility: visible !important; opacity: 1 !important; margin: 0=
px auto !important; display: flex !important; justify-content: center !impo=
rtant; align-items: center !important; min-height: 250px !important;" data-=
ad-slot=3D"vi_1505561072" data-id=3D"vi_1505561072_2"><vli id=3D"container_=
vi_1505561072_2" style=3D"visibility: visible; display: block !important; p=
osition: relative !important; margin: 0px auto !important; width: 300px !im=
portant; height: 250px !important;"><vli style=3D"visibility: visible;" id=
=3D"vi_1505561072_2" data-google-query-id=3D"CPWhleGdovoCFdSQZgIdWoALVg"><d=
iv id=3D"google_ads_iframe_/22157535595/15055_How2shout.com/15055_How2shout=
.com_1_96__container__" style=3D"border: 0pt none; display: inline-block; w=
idth: 300px; height: 250px;"><iframe frameborder=3D"0" src=3D"cid:frame-DC8=
0749D29B027AE3201A6403C44A1FB@mhtml.blink" id=3D"google_ads_iframe_/2215753=
5595/15055_How2shout.com/15055_How2shout.com_1_96" title=3D"3rd party ad co=
ntent" name=3D"" scrolling=3D"no" marginwidth=3D"0" marginheight=3D"0" widt=
h=3D"1" height=3D"1" data-is-safeframe=3D"true" sandbox=3D"allow-forms allo=
w-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts all=
ow-top-navigation-by-user-activation" role=3D"region" aria-label=3D"Adverti=
sement" tabindex=3D"0" data-google-container-id=3D"3s" style=3D"border: 0px=
; vertical-align: bottom; width: 300px; height: 250px;" data-load-complete=
=3D"true"></iframe></div></vli><iframe id=3D"debug_vi_1505561072_2" framebo=
rder=3D"no" scrolling=3D"no" allowtransparency=3D"true" hidefocus=3D"true" =
marginwidth=3D"0" marginheight=3D"0" topmargin=3D"0" leftmargin=3D"0" style=
=3D"width: 100%; height: 100%; position: absolute; background-color: rgba(2=
55, 255, 255, 0.8); top: 0px; left: 0px; z-index: 10000; display: none !imp=
ortant; opacity: 0 !important;"></iframe><vli id=3D"__icon_vi_1505561072_2"=
 style=3D"position: absolute !important; bottom: 0px !important; left: 0px =
!important; display: inline-block !important; height: 16px !important; line=
-height: 1 !important; font-size: 16px !important;"><iframe class=3D"vliIgn=
ore" frameborder=3D"no" scrolling=3D"no" allowtransparency=3D"true" hidefoc=
us=3D"true" marginwidth=3D"0" width=3D"16" height=3D"16" marginheight=3D"0"=
 topmargin=3D"0" leftmargin=3D"0"></iframe></vli></vli></div>

</div>
</div>
<div style=3D"clear: both;"></div> </div>
<p><code>brew install git</code></p>
<p>To update it, use:</p>
<p><code>brew update</code></p>
<p>To get the info about any package:</p>
<p><code>brew info python</code></p>
<p>To learn more about its commands see the<a href=3D"https://docs.brew.sh/=
" target=3D"_blank" rel=3D"noopener noreferrer"> official documentation.&nb=
sp;</a></p>
