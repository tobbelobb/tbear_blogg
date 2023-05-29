<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:var="https://torbjornludvigsen.com/Variables">
<xsl:output method="html"
            doctype-system="about:legacy-compat"
            encoding="UTF-8"
            indent="yes" />
<var:allNavPages>
  <page cname="Home" url="/" />
  <page cname="Blog" url="/blog" />
  <page cname="Donate" url="/pages/donate" />
  <page cname="About" url="/pages/story" />
  <page cname="Links" url="/pages/links" />
</var:allNavPages>

<xsl:template match="/">
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, minimum-scale=1" />
  <meta name="theme-color" content="#FBE8A6" />
  <meta name="author" content="Torbjorn Ludvigsen" />
  <meta name="keywords" content="Reprap, development" />

  <!-- Meta description -->
  <xsl:text disable-output-escaping="yes">
    &lt;meta name="description" content="</xsl:text>
  <xsl:value-of select="/subpage/@description" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <meta property="og:type" content="website" />
  <meta property="og:title" content="Torbjorn Ludvigsen" />

  <!-- Link back to itself in every file... -->
  <xsl:text disable-output-escaping="yes">
    &lt;meta property="og:url" content="https://torbjornludvigsen.com/pages/</xsl:text>
  <xsl:value-of select="/subpage/@name" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <xsl:text disable-output-escaping="yes">
    &lt;link rel="canonical" href="https://torbjornludvigsen.com/pages/</xsl:text>
  <xsl:value-of select="/subpage/@name" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <!-- Meta og:description -->
  <xsl:text disable-output-escaping="yes">
    &lt;meta property="og:description" content="</xsl:text>
  <xsl:value-of select="/subpage/@description" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <meta property="og:image" content="https://torbjornludvigsen.com/media/torbjornludvigsen.JPG" />
  <meta name="twitter:card" content="summary" />
  <meta name="twitter:site" content="@tobbelobb" />
  <meta name="twitter:creator" content="@tobbelobb" />
  <link rel="preload" href="/fonts/OpenSansRegular.woff" as="font" type="font/woff" crossorigin="anonymous"/>

  <link rel="stylesheet" href="/styles/common_style.css" type="text/css" />
  <link rel="stylesheet" href="/styles/xsl_style.css" type="text/css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />

  <link rel="apple-touch-icon" sizes="180x180" href="/media/apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="/media/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="/media/favicon-16x16.png" />
  <link rel="manifest" href="/site.webmanifest" />
  <meta name="theme-color" media="(prefers-color-scheme: light)" content="#fffff" />
  <meta name="theme-color" media="(prefers-color-scheme: dark)" content="#212121" />
  <link rel="mask-icon" href="/media/safari-pinned-tab.svg" color="#ffffff" />
  <meta name="msapplication-TileColor" content="#fffff" />

  <title>
    Torbjorn Ludvigsen|<xsl:value-of select="/subpage/@cname" />
  </title>
</head>
<body>
  <xsl:variable name="currentCname" select="/subpage/@cname"/>
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
  <xsl:copy-of select="/subpage/*" />
  <script src="/js/cart.js"></script>
  <script src="/js/lib.js"></script>
  <script>
      window.SnipcartSettings = {
          publicApiKey: 'N2I3ZTcwYjctYTFmNC00M2U0LWJhOTMtOWM0YWZkZGVkZDEzNjM4MTkzMjAwOTMyMjY2NzM2',
          loadStrategy: 'on-user-interaction',
      };
      (()=>{var c,d;(d=(c=window.SnipcartSettings).version)!=null||(c.version="3.0");var s,S;(S=(s=window.SnipcartSettings).timeoutDuration)!=null||(s.timeoutDuration=2750);var l,p;(p=(l=window.SnipcartSettings).domain)!=null||(l.domain="cdn.snipcart.com");var w,u;(u=(w=window.SnipcartSettings).protocol)!=null||(w.protocol="https");var f=window.SnipcartSettings.version.includes("v3.0.0-ci")||window.SnipcartSettings.version!="3.0"&amp;&amp;window.SnipcartSettings.version.localeCompare("3.4.0",void 0,{numeric:!0,sensitivity:"base"})===-1,m=["focus","mouseover","touchmove","scroll","keydown"];window.LoadSnipcart=o;document.readyState==="loading"?document.addEventListener("DOMContentLoaded",r):r();function r(){window.SnipcartSettings.loadStrategy?window.SnipcartSettings.loadStrategy==="on-user-interaction"&amp;&amp;(m.forEach(t=>document.addEventListener(t,o)),setTimeout(o,window.SnipcartSettings.timeoutDuration)):o()}var a=!1;function o(){if(a)return;a=!0;let t=document.getElementsByTagName("head")[0],e=document.querySelector("#snipcart"),i=document.querySelector(`src[src^="${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}"][src$="snipcart.js"]`),n=document.querySelector(`link[href^="${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}"][href$="snipcart.css"]`);e||(e=document.createElement("div"),e.id="snipcart",e.setAttribute("hidden","true"),document.body.appendChild(e)),v(e),i||(i=document.createElement("script"),i.src=`${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}/themes/v${window.SnipcartSettings.version}/default/snipcart.js`,i.async=!0,t.appendChild(i)),n||(n=document.createElement("link"),n.rel="stylesheet",n.type="text/css",n.href=`${window.SnipcartSettings.protocol}://${window.SnipcartSettings.domain}/themes/v${window.SnipcartSettings.version}/default/snipcart.css`,t.prepend(n)),m.forEach(g=>document.removeEventListener(g,o))}function v(t){!f||(t.dataset.apiKey=window.SnipcartSettings.publicApiKey,window.SnipcartSettings.addProductBehavior&amp;&amp;(t.dataset.configAddProductBehavior=window.SnipcartSettings.addProductBehavior),window.SnipcartSettings.modalStyle&amp;&amp;(t.dataset.configModalStyle=window.SnipcartSettings.modalStyle),window.SnipcartSettings.currency&amp;&amp;(t.dataset.currency=window.SnipcartSettings.currency),window.SnipcartSettings.templatesUrl&amp;&amp;(t.dataset.templatesUrl=window.SnipcartSettings.templatesUrl))}})();
  </script>
  <script src="/js/pages_script.js"></script>
  <script src="/js/swipe_menu.js"></script>
  <script data-goatcounter="https://torbjornludvigsen.goatcounter.com/count"
    async="true" src="//gc.zgo.at/count.js"></script>
</body>
</html>

</xsl:template>
</xsl:stylesheet>
