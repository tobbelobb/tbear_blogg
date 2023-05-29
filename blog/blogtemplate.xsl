<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"
            doctype-system="about:legacy-compat"
            encoding="UTF-8"
            indent="yes" />
<xsl:template match="/">
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, minimum-scale=1" />
  <meta name="theme-color" content="#FBE8A6" />
  <meta name="author" content="Torbjorn Ludvigsen" />
  <meta name="keywords" content="Reprap, blog, development" />
  <meta name="description" content="Reprap blog" />
  <meta property="og:type" content="website" />
  <meta property="og:title" content="Torbjorn Ludvigsen" />

  <xsl:text disable-output-escaping="yes">
    &lt;meta property="og:url" content="https://torbjornludvigsen.com/blog/</xsl:text>
  <xsl:value-of select="posts/@year" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <meta property="og:description" content="Reprap blog" />
  <meta property="og:image" content="https://torbjornludvigsen.com/media/torbjornludvigsen.JPG" />
  <meta name="twitter:card" content="summary" />
  <meta name="twitter:site" content="@tobbelobb" />
  <meta name="twitter:creator" content="@tobbelobb" />
  <link rel="preload" href="/fonts/OpenSansRegular.woff" as="font" type="font/woff" crossorigin="anonymous"/>
  <link rel="stylesheet" href="/styles/common_style.css" type="text/css" />
  <link rel="stylesheet" href="/styles/xsl_style.css" type="text/css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

  <link rel="apple-touch-icon" sizes="180x180" href="/media/apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="/media/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="/media/favicon-16x16.png" />
  <link rel="manifest" href="/site.webmanifest" />
  <meta name="theme-color" media="(prefers-color-scheme: light)" content="#fffff" />
  <meta name="theme-color" media="(prefers-color-scheme: dark)" content="#212121" />
  <link rel="mask-icon" href="/media/safari-pinned-tab.svg" color="#ffffff" />
  <meta name="msapplication-TileColor" content="#fffff" />

  <script type="text/javascript"
           src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML">
  </script>

  <title>Torbjorn Ludvigsen|Blog</title>
</head>
<body>
<div class="sticky">
  <nav>
    <ul>
      <li class="navbar-left">
        <a href="/">Torbjørn</a>
      </li>
      <li>
        <a href="#/cart" class="shopping-cart-icon snipcart-checkout">
          <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 576 512" class="cart-icon-svg">
            <path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path>
          </svg> <span class="cart-item-count">()</span>
        </a>
      </li>
      <li class="navbar-right">
        <div class="my-dropdown" data-dropdown="">
          <button class="link" data-dropdown-toggle="">Menu</button>
          <div class="my-dropdown-menu" data-dropdown-menu="">
            <div class="dropdown-inside-slideout">
              <a href="/shop" data-dropdown-toggle="">
                Shop
              </a>
              <button class="link mini-shop-toggle" data-mini-shop-toggle="">
                &gt;
              </button>
              <div class="mini-shop" data-mini-shop="">
                <a href="/shop/Heart_of_the_Ocean" data-dropdown-toggle="">
                  Heart of the Ocean
                </a>
                <a href="/shop/Another_Heart_of_the_Ocean" data-dropdown-toggle="">
                  Another Heart of the Ocean
                </a>
              </div>
            </div>
            <a href="/blog" data-dropdown-toggle="">
              Blog
            </a>
            <a href="/pages/story" data-dropdown-toggle="">
              Story
            </a>
            <a href="/pages/donate" data-dropdown-toggle="">
              Donate
            </a>
            <button
              class="link dark-mode-toggle"
              id="dark-mode-toggle"
              aria-label="toggle dark mode"
              value="Toggle dark mode">
              Light/Dark
            </button>
          </div>
        </div>
      </li>
    </ul>
  </nav>
</div>
<script src="/js/darkmode.js"></script>
<div id="SiteName">
  Reprap Blog <xsl:value-of select="posts/@year" />
</div>
<div id="MainContent">
  <xsl:for-each select="posts/post">
    <h1>
      <xsl:attribute name="id" >
        <xsl:value-of select="./@id" />
      </xsl:attribute>
      <xsl:value-of select="./@heading" />
    </h1>
    <div class="date"><xsl:value-of select="./@date" /></div>
    <xsl:copy-of select="./*" />
    <p>
      <xsl:choose>
         <xsl:when test="./@signature">
           <xsl:value-of select="./@signature" />
         </xsl:when>
         <xsl:otherwise>
           - tobben
         </xsl:otherwise>
      </xsl:choose>
    </p>
    <br /><br /><br />
  </xsl:for-each>
  <xsl:for-each select="posts/oldpost">
    <h1>
      <xsl:attribute name="id" >
        <xsl:value-of select="./@id" />
      </xsl:attribute>
      <xsl:value-of select="./@heading" />
    </h1>
    <div class="date"><xsl:value-of select="./@date" /></div>
    <xsl:copy-of select="./*" />
  </xsl:for-each>


<br /><br /><br /><br /><br /><br /><br /><br />
<h1 id="Links">
  Links
</h1>
<p>
  Hangprinter Campaign: <a href="https://github.com/sponsors/tobbelobb/">Github Sponsors</a>
</p>
<p>
  Hangprinter Merchandise USA: <a href="https://shop.spreadshirt.com/hangprinter-merchandise/">Spreadshirt.com</a>
</p>
<p>
  Hangprinter Merchandise Sweden: <a href="https://shop.spreadshirt.se/hangprinter-merchandise/">Spreadshirt.se</a>
</p>
<p>
  Hangprinter Project: <a  href="/blog/2014#Hangprinter">[1]</a>,
                       <a  href="/blog/2015#Slideprinter_Update">[2]</a>,
                       <a  href="/blog/2015#hangprinter_project_2">[3]</a>,
                       <a  href="/blog/2015#hangprinter_project_3">[4]</a>,
                       <a  href="/blog/2015#hangprinter_project_4">[5]</a>,
                       <a  href="/blog/2015#hangprinter_project_5">[6]</a>,
                       <a  href="/blog/2015#hangprinter_project_6">[7]</a>,
                       <a  href="/blog/2015#hangprinter_project_7">[8]</a>,
                       <a  href="/blog/2015#hangprinter_project_8">[9]</a>,
                       <a  href="/blog/2015#hangprinter_project_9">[10]</a>,
                       <a  href="/blog/2015#hangprinter_project_10">[11]</a>,
                       <a  href="/blog/2015#hangprinter_project_11">[12]</a>,
                       <a  href="/blog/2015#hangprinter_project_12">[13]</a>,
                       <a  href="/blog/2015#hangprinter_project_13">[14]</a>,
                       <a  href="/blog/2015#hangprinter_project_14">[15]</a>,
                       <a  href="/blog/2015#hangprinter_project_15">[16]</a>,
                       <a  href="/blog/2015#hangprinter_project_16">[17]</a>,
                       <a  href="/blog/2015#hangprinter_project_17">[18]</a>,
                       <a  href="/blog/2015#hangprinter_project_18">[19]</a>,
                       <a  href="/blog/2016#hangprinter_project_19">[20]</a>,
                       <a  href="/blog/2016#hangprinter_project_20">[21]</a>,
                       <a  href="/blog/2016#hangprinter_project_21">[22]</a>,
                       <a  href="/blog/2016#hangprinter_project_22">[23]</a>,
                       <a  href="/blog/2016#hangprinter_project_23">[24]</a>,
                       <a  href="/blog/2016#hangprinter_project_24">[25]</a>,
                       <a  href="/blog/2016#hangprinter_project_25">[26]</a>,
                       <a  href="/blog/2016#hangprinter_project_26">[27]</a>,
                       <a  href="/blog/2016#hangprinter_project_27">[28]</a>,
                       <a  href="/blog/2017#hangprinter_project_28">[29]</a>,
                       <a  href="/blog/2017#hangprinter_project_29">[30]</a>,
                       <a  href="/blog/2017#hangprinter_project_30">[31]</a>,
                       <a  href="/blog/2017#hangprinter_project_31">[32]</a>,
                       <a  href="/blog/2017#hangprinter_project_32">[33]</a>,
                       <a  href="/blog/2017#hangprinter_project_33">[34]</a>,
                       <a  href="/blog/2017#hangprinter_project_34">[35]</a>,
                       <a  href="/blog/2017#hangprinter_project_35">[36]</a>,
                       <a  href="/blog/2017#hangprinter_project_36">[37]</a>,
                       <a  href="/blog/2017#hangprinter_project_37">[38]</a>,
                       <a  href="/blog/2017#hangprinter_project_38">[39]</a>,
                       <a  href="/blog/2017#hangprinter_project_39">[40]</a>,
                       <a  href="/blog/2017#hangprinter_project_40">[41]</a>,
                       <a  href="/blog/2017#hangprinter_project_41">[42]</a>,
                       <a  href="/blog/2017#hangprinter_project_42">[43]</a>,
                       <a  href="/blog/2017#hangprinter_project_43">[44]</a>,
                       <a  href="/blog/2017#hangprinter_project_44">[45]</a>,
                       <a  href="/blog/2017#hangprinter_project_45">[46]</a>,
                       <a  href="/blog/2017#hangprinter_project_46">[47]</a>,
                       <a  href="/blog/2017#hangprinter_project_47">[48]</a>,
                       <a  href="/blog/2017#hangprinter_project_48">[49]</a>,
                       <a  href="/blog/2017#hangprinter_project_49">[50]</a>,
                       <a  href="/blog/2017#hangprinter_project_50">[51]</a>,
                       <a  href="/blog/2018#hangprinter_project_51">[52]</a>,
                       <a  href="/blog/2018#hangprinter_project_52">[53]</a>,
                       <a  href="/blog/2018#hangprinter_project_53">[54]</a>,
                       <a  href="/blog/2018#hangprinter_project_54">[55]</a>,
                       <a  href="/blog/2018#hangprinter_project_55">[56]</a>,
                       <a  href="/blog/2018#hangprinter_project_56">[57]</a>,
                       <a  href="/blog/2018#hangprinter_project_57">[58]</a>,
                       <a  href="/blog/2018#hangprinter_project_58">[59]</a>,
                       <a  href="/blog/2018#hangprinter_project_59">[60]</a>,
                       <a  href="/blog/2018#hangprinter_project_60">[61]</a>,
                       <a  href="/blog/2018#hangprinter_project_61">[62]</a>,
                       <a  href="/blog/2018#hangprinter_project_62">[63]</a>,
                       <a  href="/blog/2020#hangprinter_project_63">[64]</a>,
                       <a  href="/blog/2020#hangprinter_project_64">[65]</a>,
                       <a  href="/blog/2020#hangprinter_project_65">[66]</a>,
                       <a  href="/blog/2020#hangprinter_project_66">[67]</a>,
                       <a  href="/blog/2020#hangprinter_project_67">[68]</a>,
                       <a  href="/blog/2020#hangprinter_project_68">[69]</a>,
                       <a  href="/blog/2021#hangprinter_project_69">[70]</a>,
                       <a  href="/blog/2021#hangprinter_project_70">[71]</a>,
                       <a  href="/blog/2021#hangprinter_project_71">[72]</a>,
                       <a  href="/blog/2021#hangprinter_project_72">[73]</a>,
                       <a  href="/blog/2021#hangprinter_project_73">[74]</a>,
                       <a  href="/blog/2021#hangprinter_project_74">[75]</a>,
                       <a  href="/blog/2021#hangprinter_project_75">[76]</a>,
                       <a  href="/blog/2021#hangprinter_project_76">[77]</a>
</p>
<p>
  Hangprinter Project Homepage: <a href="https://hangprinter.org">hangprinter.org</a>
</p>
<p>
  Print Issue Solution Filter Project: <a href="/blog/2014#Introducing_PISF">[1]</a>,
                                       <a href="/blog/2014#Presenting_PISF_Again">[2]</a>,
                                       <a href="/blog/2014#PISF_Online_Sort_Of">[3]</a>,
                                       <a href="/blog/2014#PISF">[4]</a>
</p>
<p>
  Sourcing RepRappro Mendel in Larvik: <a href="/blog/2014#Sourcing_Mendel_1">[1]</a>,
                                       <a href="/blog/2014#Sourcing_Mendel_2">[2]</a>,
                                       <a href="/blog/2014#Sourcing_Mendel_3">[3]</a>,
                                       <a href="/blog/2014#Sourcing_Mendel_4">[4]</a>,
                                       <a href="/blog/2014#Sourcing_Mendel_5">[5]</a>,
                                       <a href="/blog/2014#Sourcing_Mendel_6">[6]</a>,
                                       <a href="/blog/2014#Sourcing_Mendel_7">[7]</a>
</p>
<p>
  Archive: <a href="/blog/2014">2014</a>, <a href="/blog/2015">2015</a>, <a href="/blog/2016">2016</a>, <a href="/blog/2017">2017</a>, <a href="/blog/2018">2018</a>, <a href="/blog/2020">2020</a>, <a href="/blog/2021">2021</a>
</p>
<p>
Github Profile: <a href="https://github.com/tobbelobb/">link</a><br />
</p>
<p>
Gitlab Profile: <a href="https://gitlab.com/tobben">link</a><br />
</p>
<p>
Hangprinter project on Gitlab: <a href="https://gitlab.com/hangprinter">link</a><br />
</p>
<p>
Vimeo User: <a href="https://vimeo.com/user23166500">link</a><br />
</p>
<p>
Youtube User: <a href="https://www.youtube.com/channel/UCw1Nz0VCw4z-dfq4WjSkFzQ">link</a><br />
</p>
<p>
Twitter User: <a href="https://twitter.com/tobbelobb">link</a><br />
</p>
<p>
Master's Thesis: <a href="http://opensourceecology.org/wiki/File:Thesis.pdf">link</a><br />
</p>
<p>
Linkedin Profile: <a href="https://se.linkedin.com/in/torbjorn-ludvigsen">link</a><br />
</p>
<p>
Appropedia User: <a href="http://www.appropedia.org/User:Tobben">link</a><br />
</p>
<p>
RepRap Forums User: <a href="http://forums.reprap.org/profile.php?1,22385">link</a>
</p>
<p>
Forums threads: <a href="http://forums.reprap.org/read.php?178,344022">Hangprinter version 1</a>,
                <a href="http://forums.reprap.org/read.php?1,738858">Hangprinter version 2</a>,
                <a href="http://forums.reprap.org/read.php?1,792937">Hangprinter version 3</a>,
                <a href="https://reprap.org/forum/list.php?423">List of Hangprinter threads</a>
</p>
<p>
  Source for this blog: <a href="https://gitlab.com/tobben/tbear_blogg">Gitlab repo</a>
</p>
<p>
Everything on this homepage, except those videos who are published via Vimeo or Youtube, is licensed under the <a href="https://www.gnu.org/licenses/fdl">Gnu Free Documentation License</a>.
The videos published via Vimeo or Youtube are also licensed via Vimeo or Youtube.
</p>
</div>
<script src="/js/cart.js"></script>
<script src="/js/lib.js"></script>
<script>
    window.SnipcartSettings = {
        publicApiKey: 'N2I3ZTcwYjctYTFmNC00M2U0LWJhOTMtOWM0YWZkZGVkZDEzNjM4MTkzMjAwOTMyMjY2NzM2',
        loadStrategy: 'on-user-interaction',
    };
    (()=>{var c,d;(d=(c=window.SnipcartSettings).version)!=null||(c.version="3.0");var s,S;(S=(s=window.SnipcartSettings).timeoutDuration)!=null||(s.timeoutDuration=2750);var l,p;(p=(l=window.SnipcartSettings).domain)!=null||(l.domain="cdn.snipcart.com");var w,u;(u=(w=window.SnipcartSettings).protocol)!=null||(w.protocol="https");var f=window.SnipcartSettings.version.includes("v3.0.0-ci")||window.SnipcartSettings.version!="3.0"&amp;&amp;window.SnipcartSettings.version.localeCompare("3.4.0",void 0,{numeric:!0,sensitivity:"base"})===-1,m=["focus","mouseover","touchmove","scroll","keydown"];window.LoadSnipcart=o;document.readyState==="loading"?document.addEventListener("DOMContentLoaded",r):r();function r(){window.SnipcartSettings.loadStrategy?window.SnipcartSettings.loadStrategy==="on-user-interaction"&amp;&amp;(m.forEach(t=>document.addEventListener(t,o)),setTimeout(o,window.SnipcartSettings.timeoutDuration)):o()}var a=!1;function o(){if(a)return;a=!0;let t=document.getElementsByTagName("head")[0],e=document.querySelector("#snipcart"),i=document.querySelector(`src[src^="${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}"][src$="snipcart.js"]`),n=document.querySelector(`link[href^="${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}"][href$="snipcart.css"]`);e||(e=document.createElement("div"),e.id="snipcart",e.setAttribute("hidden","true"),document.body.appendChild(e)),v(e),i||(i=document.createElement("script"),i.src=`${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}/themes/v${window.SnipcartSettings.version}/default/snipcart.js`,i.async=!0,t.appendChild(i)),n||(n=document.createElement("link"),n.rel="stylesheet",n.type="text/css",n.href=`${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}/themes/v${window.SnipcartSettings.version}/default/snipcart.css`,t.prepend(n)),m.forEach(g=>document.removeEventListener(g,o))}function v(t){!f||(t.dataset.apiKey=window.SnipcartSettings.publicApiKey,window.SnipcartSettings.addProductBehavior&amp;&amp;(t.dataset.configAddProductBehavior=window.SnipcartSettings.addProductBehavior),window.SnipcartSettings.modalStyle&amp;&amp;(t.dataset.configModalStyle=window.SnipcartSettings.modalStyle),window.SnipcartSettings.currency&amp;&amp;(t.dataset.currency=window.SnipcartSettings.currency),window.SnipcartSettings.templatesUrl&amp;&amp;(t.dataset.templatesUrl=window.SnipcartSettings.templatesUrl))}})();
</script>
<script type="text/javascript">
  MathJax.Hub.Configured()
</script>
<script src="/js/pages_script.js"></script>
<script src="/js/swipe_menu.js"></script>
<script data-goatcounter="https://torbjornludvigsen.goatcounter.com/count"
  async="true" src="//gc.zgo.at/count.js"></script>
</body>
</html>

</xsl:template>
</xsl:stylesheet>
