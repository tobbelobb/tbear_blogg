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
    <xsl:variable name="array" select="document('catalouge.xml')/filelist/file"/>
    <xsl:for-each select="$array">
      <xsl:variable name="filename" select="."/>
      <xsl:for-each select="document($filename)/posts/post">
        <item>
          <title><xsl:value-of select="./@heading" /></title>
          <description></description>
          <link>https://vitana.se/opr3d/tbear/<xsl:value-of select="$filename" />#<xsl:value-of select="./@id" /></link>
          <guid>https://vitana.se/opr3d/tbear/<xsl:value-of select="$filename" />#<xsl:value-of select="./@id" /></guid>
        </item>
    </xsl:for-each>
    </xsl:for-each>
  </channel>
</rss>
</xsl:template>
</xsl:stylesheet>
