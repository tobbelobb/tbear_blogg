<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"
            doctype-system="about:legacy-compat"
            encoding="UTF-8"
            indent="yes" />
<xsl:template match="/">
<html>
<head>
  <meta name="author" content="Torbjorn" />
  <meta name="keywords" content="Reprap, blog, development" />
  <meta name="description" content="Torbjørn Ludvigsen's Reprap blog." />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="style.css" type="text/css" />
  <link href="http://vitana.se/opr3d/tbear/feed.xml" rel="alternate" type="application/rss+xml" title="Torbjørn's Reprap blog's RSS feed" />

  <script type="text/javascript"
           src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML">
  </script>

  <title>Torbjørns Reprap blog</title>
</head>
<body>
<div id="SiteName">
  <div class="right">
    <a href="#Links">Contact, archive, etc</a>
  </div>
  <div class="left">
    Reprap blog <xsl:value-of select="posts/@year" />
  </div>
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
  Hangprinter Campaign: <a href="https://salt.bountysource.com/teams/hangprinter">Bountysource Salt</a>
</p>
<p>
  Hangprinter Merchandise USA: <a href="https://shop.spreadshirt.com/hangprinter-merchandise/">Spreadshirt.com</a>
</p>
<p>
  Hangprinter Merchandise Sweden: <a href="https://shop.spreadshirt.se/hangprinter-merchandise/">Spreadshirt.se</a>
</p>
<p>
  Hangprinter assebly workshops: <a href="https://www.eventbrite.com/e/hangprinter-assembly-workshop-1-tickets-44216520804">#1</a>
</p>
<p>
  Hangprinter Project: <a  href="2014.html#Hangprinter">[1]</a>,
                       <a  href="2015.html#Slideprinter_Update">[2]</a>,
                       <a  href="2015.html#hangprinter_project_2">[3]</a>,
                       <a  href="2015.html#hangprinter_project_3">[4]</a>,
                       <a  href="2015.html#hangprinter_project_4">[5]</a>,
                       <a  href="2015.html#hangprinter_project_5">[6]</a>,
                       <a  href="2015.html#hangprinter_project_6">[7]</a>,
                       <a  href="2015.html#hangprinter_project_7">[8]</a>,
                       <a  href="2015.html#hangprinter_project_8">[9]</a>,
                       <a  href="2015.html#hangprinter_project_9">[10]</a>,
                       <a  href="2015.html#hangprinter_project_10">[11]</a>,
                       <a  href="2015.html#hangprinter_project_11">[12]</a>,
                       <a  href="2015.html#hangprinter_project_12">[13]</a>,
                       <a  href="2015.html#hangprinter_project_13">[14]</a>,
                       <a  href="2015.html#hangprinter_project_14">[15]</a>,
                       <a  href="2015.html#hangprinter_project_15">[16]</a>,
                       <a  href="2015.html#hangprinter_project_16">[17]</a>,
                       <a  href="2015.html#hangprinter_project_17">[18]</a>,
                       <a  href="2015.html#hangprinter_project_18">[19]</a>,
                       <a  href="2016.html#hangprinter_project_19">[20]</a>,
                       <a  href="2016.html#hangprinter_project_20">[21]</a>,
                       <a  href="2016.html#hangprinter_project_21">[22]</a>,
                       <a  href="2016.html#hangprinter_project_22">[23]</a>,
                       <a  href="2016.html#hangprinter_project_23">[24]</a>,
                       <a  href="2016.html#hangprinter_project_24">[25]</a>,
                       <a  href="2016.html#hangprinter_project_25">[26]</a>,
                       <a  href="2016.html#hangprinter_project_26">[27]</a>,
                       <a  href="2016.html#hangprinter_project_27">[28]</a>,
                       <a  href="2017.html#hangprinter_project_28">[29]</a>,
                       <a  href="2017.html#hangprinter_project_29">[30]</a>,
                       <a  href="2017.html#hangprinter_project_30">[31]</a>,
                       <a  href="2017.html#hangprinter_project_31">[32]</a>,
                       <a  href="2017.html#hangprinter_project_32">[33]</a>,
                       <a  href="2017.html#hangprinter_project_33">[34]</a>,
                       <a  href="2017.html#hangprinter_project_34">[35]</a>,
                       <a  href="2017.html#hangprinter_project_35">[36]</a>,
                       <a  href="2017.html#hangprinter_project_36">[37]</a>,
                       <a  href="2017.html#hangprinter_project_37">[38]</a>,
                       <a  href="2017.html#hangprinter_project_38">[39]</a>,
                       <a  href="2017.html#hangprinter_project_39">[40]</a>,
                       <a  href="2017.html#hangprinter_project_40">[41]</a>,
                       <a  href="2017.html#hangprinter_project_41">[42]</a>,
                       <a  href="2017.html#hangprinter_project_42">[43]</a>,
                       <a  href="2017.html#hangprinter_project_43">[44]</a>,
                       <a  href="2017.html#hangprinter_project_44">[45]</a>,
                       <a  href="2017.html#hangprinter_project_45">[46]</a>,
                       <a  href="2017.html#hangprinter_project_46">[47]</a>,
                       <a  href="2017.html#hangprinter_project_46">[48]</a>,
                       <a  href="2017.html#hangprinter_project_46">[49]</a>
</p>
<p>
  Hangprinter Project Homepage: <a href="https://hangprinter.org">hangprinter.org</a>
</p>
<p>
  Print Issue Solution Filter Project: <a href="2014.html#Introducing_PISF">[1]</a>,
                                       <a href="2014.html#Presenting_PISF_Again">[2]</a>,
                                       <a href="2014.html#PISF_Online_Sort_Of">[3]</a>,
                                       <a href="2014.html#PISF">[4]</a>
</p>
<p>
  Sourcing RepRappro Mendel in Larvik: <a href="2014.html#Sourcing_Mendel_1">[1]</a>,
                                       <a href="2014.html#Sourcing_Mendel_2">[2]</a>,
                                       <a href="2014.html#Sourcing_Mendel_3">[3]</a>,
                                       <a href="2014.html#Sourcing_Mendel_4">[4]</a>,
                                       <a href="2014.html#Sourcing_Mendel_5">[5]</a>,
                                       <a href="2014.html#Sourcing_Mendel_6">[6]</a>,
                                       <a href="2014.html#Sourcing_Mendel_7">[7]</a>
</p>
<p>
Archive: <a href="2014.html">2014</a>, <a href="2015.html">2015</a>, <a href="2016.html">2016</a>, <a href="2017.html">2017</a>, <a href="2018.html">2018</a>
</p>
<p>
Github Profile: <a href="https://github.com/tobbelobb/">link</a><br />
</p>
<p>
Vimeo User: <a href="https://vimeo.com/user23166500">link</a><br />
</p>
<p>
Twitter User: <a href="https://twitter.com/tobbelobb">link</a><br />
</p>
<p>
Work Microblog: <a href="http://opensourceecology.org/wiki/Tobben_Log">link</a><br />
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
Company website (in Norwegian): <a href="http://ludvigsen3dprinting.com/">link</a>
</p>
<p>
Email: <a href="mailto:post@ludvigsen3dprinting.com">post@ludvigsen3dprinting.com</a>
</p>
<p>
RepRap Forums User: <a href="http://forums.reprap.org/profile.php?1,22385">link</a>
</p>
<p>
Forums threads: <a href="http://forums.reprap.org/read.php?178,344022">Hangprinter version 1</a>,
                <a href="http://forums.reprap.org/read.php?1,738858">Hangprinter version 2</a>,
                <a href="http://forums.reprap.org/read.php?1,792937">Hangprinter version 3</a>
</p>
<p>
  Source for this blog: <a href="https://github.com/tobbelobb/tbear_blogg">Github repo</a>
</p>
<p>
Everything on this homepage, except the videos, is licenced under the <a href="https://www.gnu.org/licenses/fdl">Gnu Free Documentation Licence</a>.
The videos are licenced via Vimeo or Youtube.
</p>
</div>
<br /><br /><br /><br /><br /><br /><br /><br />
<script type="text/javascript">
  MathJax.Hub.Configured()
</script>
</body>
</html>

</xsl:template>
</xsl:stylesheet>