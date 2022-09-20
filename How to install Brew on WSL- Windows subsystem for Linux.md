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
