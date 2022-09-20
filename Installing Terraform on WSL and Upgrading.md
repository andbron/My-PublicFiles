Sourced from here: https://dev.thanaism.com/2021/08/install-terraform/#:~:text=Installing%20Terraform%20on%20WSL2%20There%20are%20two%20ways,a%20Mac%2C%20you%20are%20probably%20familiar%20with%20homebrew.

<h2>This article shows you</h2>
<p>How to install and upgrade Terraform on WSL2 (Ubuntu 20.04).</p>
<p>The Reference Link is <a href=3D"[https://techblog.ap-com.co.jp/entr=
y/2021/08/17/061558](https://dev.thanaism.com/2021/08/install-terraform/#:~:text=Installing%20Terraform%20on%20WSL2%20There%20are%20two%20ways,a%20Mac%2C%20you%20are%20probably%20familiar%20with%20homebrew">here</a>.</p>
<h2>Installing Terraform on WSL2</h2>
<p>There are two ways to do this: using homebrew or downloading the binarie=
s directly.</p>
<p>If you are using a Mac, you are probably familiar with homebrew.</p>
<p>Unlike apt, it does not require <code class=3D"language-text">sudo</code=
>.<br>
(This time, I=E2=80=99ll leave the installation of homebrew itself to the o=
fficial page.</p>
<p>In addition, you can use <strong>tfenv</strong>, which is a package mana=
ger for Terraform, or not.</p>
<p>Personally, I recommend using tfenv because Terraform updates quickly.</=
p>
<h3>When not using tfenv</h3>
<p>If you use homebrew, you only need the following command.</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">brew install terraform</code></pre></div>
<p>If you want to download the binaries directly, do the following.</p>
<p><code class=3D"language-text">wget</code> and <code class=3D"language-te=
xt">unzip</code> are required, if not, install them.</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">sudo apt update &amp;&amp; sudo apt upgrad=
e -y
sudo apt install wget unzip</code></pre></div>
<p>Download the binary; the URL is different for each version, so check the=
 <a href=3D"https://www.terraform.io/downloads.html">official download page=
</a> or <a href=3D"https://github.com/hashicorp/terraform/releases">release=
 notes</a> and change it accordingly.</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">wget https://releases.hashicorp.com/terraf=
orm/1.0.4/terraform_1.0.4_linux_amd64.zip -O terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin
rm terraform.zip</code></pre></div>
<h3>When using tfenv</h3>
<p>If you use homebrew, you only need the following command.</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">brew install tfenv
tfenv install latest
tfenv use latest
terraform -v</code></pre></div>
<p>If you want to download the binaries directly, do the following.</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">git clone https://github.com/tfutils/tfenv=
.git ~/.tfenv
sudo ln -s ~/.tfenv/bin/* /usr/local/bin
tfenv --version

tfenv install latest
tfenv use latest
terraform -v</code></pre></div>
<p>In the above example, we put the symbolic sync in <code class=3D"languag=
e-text">/usr/local/bin</code>, but you can also add <code class=3D"language=
-text">~/.tfenv/bin</code> to your <code class=3D"language-text">PATH</code=
>.</p>
<h2>Upgrading Terraform in WSL2</h2>
<h3>When not using tfenv</h3>
<p>You will need to manually download the latest binary again (if you are u=
sing homebrew, you can do a <code class=3D"language-text">brew upgrade terr=
aform</code>).</p>
<h3>When using tfenv</h3>
<p>If you want to upgrade to the latest stable version, it is the same as d=
uring installation.</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">tfenv install latest
tfenv use latest
terraform -v</code></pre></div>
<p>If you want to use the specified version, check the available versions.<=
br>
To check an older version, you can use <code class=3D"language-text">head -=
n 20</code> instead, or remove <code class=3D"language-text">| head</code>.=
</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">tfenv list-remote | head</code></pre></div=
>
<p>Install the version you are looking for.</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">tfenv install 1.0.2
tfenv use 1.0.2
terraform -v</code></pre></div>
<p>You can check the installed version as follows;</p>
<div class=3D"gatsby-highlight" data-language=3D"sh"><pre class=3D"language=
-sh"><code class=3D"language-sh">tfenv list</code></pre></div>
