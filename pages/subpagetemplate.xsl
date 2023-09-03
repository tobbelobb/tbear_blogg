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
          <a href="/shop">
            Shop
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
                  <a href="/shop/Cups" data-dropdown-toggle="">
                    Cups
                  </a>
                  <a href="/shop/Heart_of_the_Ocean" data-dropdown-toggle="">
                    Heart of the Ocean
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
  <div class="h-card" style="display: none">
    <a class="u-url" rel="me" href="https://www.torbjornludvigsen.com">torbjornludvigsen.com</a>
    <span class="p-name" rel="me">Torbjørn Ludvigsen</span>
    <span class="p-nickname">tobben</span>
    <img class="u-photo" src="https://torbjornludvigsen.com/media/torbjornludvigsen_small.JPG" alt="Torbjørn Ludvigsen" />
    <span class="p-locality">Gothenburg</span>
  </div>
  <script src="/js/cart.js"></script>
  <script src="/js/lib.js"></script>
  <script src="/js/pages_script.js"></script>
  <script src="/js/swipe_menu.js"></script>
  <script data-goatcounter="https://torbjornludvigsen.goatcounter.com/count"
    async="true" src="//gc.zgo.at/count.js"></script>
</body>
</html>

</xsl:template>
</xsl:stylesheet>
