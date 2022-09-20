<p>Homebrew or simply Brew is the package management tool developed under open source license. The main purpose of Brew is to install various software
 on macOS, however, it is not limited to that only. Yes, we can install it 
on Linux Distros and Windows 10 using the WSL- Windows system for Linux.</p
>
<p>Here in the article, we will learn the steps to set up Brew on Windows 1
0 WSL to install various packagesE280A6</p>
<div id3D"toc_container" class3D"no_bullets contracted" style3D"width: a
uto; display: table;"><p class3D"toc_title"> <span class3D"toc_toggle">[<
a href3D"https://www.how2shout.com/linux/install-brew-on-wsl-windows-subsy
stem-for-linux/#">show</a>]</span></p><ul class3D"toc_list" style3D"displ
ay: none;"><li><a href3D"https://www.how2shout.com/linux/install-brew-on-w
sl-windows-subsystem-for-linux/#HomeBrew_installation_on_Windows_10-_WSL_Wi
ndows_Subsystem_for_Linux">HomeBrew installation on Windows 10- WSL (Window
s Subsystem for Linux)</a><ul><li><a href3D"https://www.how2shout.com/linu
x/install-brew-on-wsl-windows-subsystem-for-linux/#Open_Ubuntu_WSL_App">Ope
n Ubuntu WSL App</a></li><li><a href3D"https://www.how2shout.com/linux/ins
tall-brew-on-wsl-windows-subsystem-for-linux/#Run_Update_command">Run Updat
e command:</a></li><li><a href3D"https://www.how2shout.com/linux/install-b
rew-on-wsl-windows-subsystem-for-linux/#Install_tool_require_to_setup_Brew"
>Install tool require to setup Brew</a></li><li><a href3D"https://www.how2
shout.com/linux/install-brew-on-wsl-windows-subsystem-for-linux/#Command_to
_Install_HomeBrew_on_WSL_Windows_10">Command to Install HomeBrew on WSL Win
dows 10</a></li><li><a href3D"https://www.how2shout.com/linux/install-brew
-on-wsl-windows-subsystem-for-linux/#Add_Homebrew_to_your_system_PATH">Add 
Homebrew to your system PATH</a></li><li><a href3D"https://www.how2shout.c
om/linux/install-brew-on-wsl-windows-subsystem-for-linux/#Use_Brew_on_WSL">
Use Brew on WSL</a></li></ul></li></ul></div>
<h2><span id3D"HomeBrew_installation_on_Windows_10-_WSL_Windows_Subsystem_
for_Linux">HomeBrew installation on Windows 10- WSL (Windows Subsystem for 
Linux)</span></h2>
<p>Before starting the tutorial, I am assuming that you already have the WS
L with Ubuntu on your Windows 10 or server system. If not then follow the t
utorial: <a href3D"https://www.how2shout.com/how-to/enable-windows-subsyst
em-linux-feature.html" target3D"_blank" rel3D"noopener noreferrer">Steps 
to enable WSL with Ubuntu.</a></p>
<h3><span id3D"Open_Ubuntu_WSL_App">Open Ubuntu WSL App</span></h3>
<p>Currently, there are two long term Ubuntu versions available on Microsof
t Store to install: Ubuntu 18.04 LTS &amp; Ubuntu 20.04 LTS Linux. You can 
opt for any of them, the steps given here will be the same. Therefore, what
ever the Linux version you have on your Windows 10, open that.</p>
<h3><span id3D"Run_Update_command">Run Update command:</span></h3>
<p>To make sure the Packages and Repos available on your Linux WSL app are 
up to date, just run a system update command:</p>
<span data-button-text3D"Copy Me" data-button-position3D"outside" data-bu
tton-copy-text3D"Copied!" data-style3D"button" data-button-title3D"Copy 
to Clipboard" data-selector3D"pre" class3D"copy-the-code-wrap copy-the-co
de-style-button copy-the-code-outside-wrap"><div class3D"copy-the-code-out
side"><button class3D"copy-the-code-button" data-style3D"button" title3D
"Copy to Clipboard">Copy Me</button></div><pre class3D"copy-the-code-targe
t">sudo apt update</pre></span>
<h3><span id3D"Install_tool_require_to_setup_Brew">Install tool require to
 setup Brew</span></h3>
<p>There are few tools that we need to have on the system such as curl in o
rder to download and install HomeBrew on our WSL 1 or 2 Linux apps. Therefo
re run below command with sudo access.</p>
<span data-button-text3D"Copy Me" data-button-position3D"outside" data-bu
tton-copy-text3D"Copied!" data-style3D"button" data-button-title3D"Copy 
to Clipboard" data-selector3D"pre" class3D"copy-the-code-wrap copy-the-co
de-style-button copy-the-code-outside-wrap"><div class3D"copy-the-code-out
side"><button class3D"copy-the-code-button" data-style3D"button" title3D
"Copy to Clipboard">Copy Me</button></div><pre class3D"copy-the-code-targe
t">sudo apt-get install build-essential curl file git</pre></span>
<h3><span id3D"Command_to_Install_HomeBrew_on_WSL_Windows_10">Command to I
nstall HomeBrew on WSL Windows 10</span></h3>
<p>Once you down with the above step, now here is the script that is availa
ble on Github to install Brew instantly on Windows Subsystem for Linux. Jus
t copy and paste the below command in your Ubuntu WSL Linux app.</p>
<span data-button-text3D"Copy Me" data-button-position3D"outside" data-bu
tton-copy-text3D"Copied!" data-style3D"button" data-button-title3D"Copy 
to Clipboard" data-selector3D"pre" class3D"copy-the-code-wrap copy-the-co
de-style-button copy-the-code-outside-wrap"><div class3D"copy-the-code-out
side"><button class3D"copy-the-code-button" data-style3D"button" title3D
"Copy to Clipboard">Copy Me</button></div><pre class3D"copy-the-code-targe
t">/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"</pre></span>
<h3><span id3D"Add_Homebrew_to_your_system_PATH"><strong>Add Homebrew to y
our system PATH</strong></span></h3>
<p>By default, you wont be able to run Brew without switching to the directory where it has been installed. Thus, to use it from anywhere reg
ardless of which directory you are, we need to tell the Ubuntu WSL Linux ap
p about it by adding it to the bin. Run the following commands on your Linu
x system one by one.</p>
<span data-button-text3D"Copy Me" data-button-position3D"outside" data-bu
tton-copy-text3D"Copied!" data-style3D"button" data-button-title3D"Copy 
to Clipboard" data-selector3D"pre" class3D"copy-the-code-wrap copy-the-co
de-style-button copy-the-code-outside-wrap"><div class3D"copy-the-code-out
side"><button class3D"copy-the-code-button" data-style3D"button" title3D
"Copy to Clipboard">Copy Me</button></div><pre class3D"copy-the-code-targe
t">sudo apt update</pre></span>test -d ~/.linuxbrew &amp;&amp; eval $(~/.linuxbrew/bin/brew shellenv)</p></pre></span>
<span data-button-text3D"Copy Me" data-button-position3D"outside" data-bu
tton-copy-text3D"Copied!" data-style3D"button" data-button-title3D"Copy 
to Clipboard" data-selector3D"pre" class3D"copy-the-code-wrap copy-the-co
de-style-button copy-the-code-outside-wrap"><div class3D"copy-the-code-out
side"><button class3D"copy-the-code-button" data-style3D"button" title3D
"Copy to Clipboard">Copy Me</button></div><pre class3D"copy-the-code-targe
t">test -d /home/linuxbrew/.linuxbrew &amp;&amp; eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)</pre></span>
<span data-button-text3D"Copy Me" data-button-position3D"outside" data-bu
tton-copy-text3D"Copied!" data-style3D"button" data-button-title3D"Copy 
to Clipboard" data-selector3D"pre" class3D"copy-the-code-wrap copy-the-co
de-style-button copy-the-code-outside-wrap"><div class3D"copy-the-code-out
side"><button class3D"copy-the-code-button" data-style3D"button" title3D
"Copy to Clipboard">Copy Me</button></div></p>test -r ~/.bash_profile &amp;&amp; echo "eval \$($(brew --prefix)/bin/brew shellenv)" &gt;&gt;~/.bash_profile</p>
<span data-button-text3D"Copy Me" data-button-position3D"outside" data-bu
tton-copy-text3D"Copied!" data-style3D"button" data-button-title3D"Copy 
to Clipboard" data-selector3D"pre" class3D"copy-the-code-wrap copy-the-co
de-style-button copy-the-code-outside-wrap"><div class3D"copy-the-code-out
side"><button class3D"copy-the-code-button" data-style3D"button" title3D
"Copy to Clipboard">Copy Me</button></div></p>echo "eval \$($(brew --prefix)/bin/brew shellenv)" &gt;&gt;~/.profile</p>
<h3><span id3D"Use_Brew_on_WSL">Use Brew on WSL</span></h3>
<p>Finally, this Package Manager is successfully installed on your system, 
now its time to see whether it is working or not. For that letE28099s us
e the brew to install the git on our system. The command will be:</p>
brew install <em>package-name</em></p>


</div>
</div>
<div style3D"clear: both;"></div> </div>
<p><code>brew install git</code></p>
<p>To update it, use:</p>
<p><code>brew update</code></p>
<p>To get the info about any package:</p>
<p><code>brew info python</code></p>
<p>To learn more about its commands see the<a href3D"https://docs.brew.sh/
" target3D"_blank" rel3D"noopener noreferrer"> official documentation.&nb
sp;</a></p>
