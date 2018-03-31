<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output cdata-section-elements="atom:content"
            indent="yes" />
<xsl:template match="/">
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <atom:link href="https://vitana.se/opr3d/tbear/feed.xml" rel="self" type="application/rss+xml" />
    <title>Torbjørn's Reprap blog</title>
    <description>Thoughts, progress, images and videos of a Reprapper.</description>
    <link>https://vitana.se/opr3d/tbear</link>
    <xsl:for-each select="document('2018.xml')/posts/post">
      <item>
        <title><xsl:value-of select="./@heading" /></title>
        <description></description>
        <link>https://vitana.se/opr3d/tbear/2018.html#<xsl:value-of select="./@id" /></link>
        <guid>https://vitana.se/opr3d/tbear/2018.html#<xsl:value-of select="./@id" /></guid>
      </item>
    </xsl:for-each>
    <xsl:for-each select="document('2017.xml')/posts/post">
      <item>
        <title><xsl:value-of select="./@heading" /></title>
        <description></description>
        <link>https://vitana.se/opr3d/tbear/2017.html#<xsl:value-of select="./@id" /></link>
        <guid>https://vitana.se/opr3d/tbear/2017.html#<xsl:value-of select="./@id" /></guid>
      </item>
    </xsl:for-each>
    <xsl:for-each select="document('2016.xml')/posts/post">
      <item>
        <title><xsl:value-of select="./@heading" /></title>
        <description></description>
        <link>https://vitana.se/opr3d/tbear/2016.html#<xsl:value-of select="./@id" /></link>
        <guid>https://vitana.se/opr3d/tbear/2016.html#<xsl:value-of select="./@id" /></guid>
      </item>
    </xsl:for-each>
    <xsl:for-each select="document('2015.xml')/posts/post">
      <item>
        <title><xsl:value-of select="./@heading" /></title>
        <description></description>
        <link>https://vitana.se/opr3d/tbear/2015.html#<xsl:value-of select="./@id" /></link>
        <guid>https://vitana.se/opr3d/tbear/2015.html#<xsl:value-of select="./@id" /></guid>
      </item>
    </xsl:for-each>
    <xsl:for-each select="document('2014.xml')/posts/post">
      <item>
        <title><xsl:value-of select="./@heading" /></title>
        <description></description>
        <link>https://vitana.se/opr3d/tbear/2014.html#<xsl:value-of select="./@id" /></link>
        <guid>https://vitana.se/opr3d/tbear/2014.html#<xsl:value-of select="./@id" /></guid>
      </item>
    </xsl:for-each>
  </channel>
</rss>
</xsl:template>
</xsl:stylesheet>
