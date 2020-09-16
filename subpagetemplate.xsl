<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:var="https://torbjornludvigsen.com/Variables">
<xsl:output method="html"
            doctype-system="about:legacy-compat"
            encoding="UTF-8"
            indent="yes" />
<var:allNavPages>
  <page cname="Home" url="../" />
  <page cname="Blog" url="../blog" />
  <page cname="Donate" url="../donate" />
  <page cname="About" url="../about" />
  <page cname="Links" url="../links" />
</var:allNavPages>

<xsl:template match="/">
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    &lt;meta property="og:url" content="https://torbjornludvigsen.com/</xsl:text>
  <xsl:value-of select="/subpage/@name" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <!-- Meta og:description -->
  <xsl:text disable-output-escaping="yes">
    &lt;meta property="og:description" content="</xsl:text>
  <xsl:value-of select="/subpage/@description" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <meta property="og:image" content="https://torbjornludvigsen.com/torbjornludvigsen.JPG" />
  <meta name="twitter:card" content="summary" />
  <meta name="twitter:site" content="@tobbelobb" />
  <meta name="twitter:creator" content="@tobbelobb" />
  <link rel="preload" href="../OpenSansRegular.woff" as="font" type="font/woff" crossorigin="anonymous"/>

  <link rel="stylesheet" href="../style.css?v=1.4" type="text/css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />

  <link rel="apple-touch-icon" sizes="180x180" href="../apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="../favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="../favicon-16x16.png" />
  <link rel="manifest" href="../site.webmanifest" />
  <link rel="mask-icon" href="../safari-pinned-tab.svg" color="#5bbad5" />
  <meta name="msapplication-TileColor" content="#2d89ef" />

  <title>
    Torbjorn Ludvigsen|<xsl:value-of select="/subpage/@cname" />
  </title>
</head>
<body>
  <xsl:variable name="currentCname" select="/subpage/@cname"/>
  <nav>
    <ul>
      <xsl:for-each select="document('')/xsl:stylesheet/var:allNavPages/page">
        <li>
          <a>
            <xsl:attribute name="href" >
              <xsl:value-of select="./@url" />
            </xsl:attribute>
            <xsl:if test="$currentCname=./@cname">
              <xsl:attribute name="class" >active</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="./@cname" />
          </a>
        </li>
      </xsl:for-each>
    </ul>
  </nav>
  <xsl:copy-of select="/subpage/*" />
</body>
</html>

</xsl:template>
</xsl:stylesheet>
