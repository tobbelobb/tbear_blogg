<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"
            doctype-system="about:legacy-compat"
            encoding="UTF-8"
            indent="yes" />
<xsl:template match="/">
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="theme-color" content="#FBE8A6" />
  <!-- A color theme: -->
  <!-- #FBE8A6 light yellow -->
  <!-- #F4976C more orange -->
  <!-- #303C6C darker blue -->
  <!-- #B4DFE5 lighter blue/cyan -->
  <!-- #D2FDFF even lighter blue/cyan -->
  <meta name="author" content="Torbjorn Ludvigsen" />
  <meta name="keywords" content="Reprap, blog, development" />
  <meta name="description" content="Reprap blog" />
  <meta property="og:type" content="website" />
  <meta property="og:title" content="Torbjorn Ludvigsen" />

  <!-- Link back to itself in every file... -->
  <xsl:text disable-output-escaping="yes">
    &lt;meta property="og:url" content="https://torbjornludvigsen.com/blog/</xsl:text>
  <xsl:value-of select="posts/@year" />
  <xsl:text disable-output-escaping="yes">"&gt;</xsl:text>

  <meta property="og:description" content="Reprap blog" />
  <meta property="og:image" content="https://torbjornludvigsen.com/torbjornludvigsen.JPG" />
  <meta name="twitter:card" content="summary" />
  <meta name="twitter:site" content="@tobbelobb" />
  <meta name="twitter:creator" content="@tobbelobb" />
  <link rel="preload" href="../../OpenSansRegular.woff" as="font" type="font/woff" crossorigin="anonymous"/>
  <link rel="stylesheet" href="../../style.css?v=2" type="text/css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

  <link rel="apple-touch-icon" sizes="180x180" href="../../apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="../../favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="../../favicon-16x16.png" />
  <link rel="manifest" href="../../site.webmanifest" />
  <link rel="mask-icon" href="../../safari-pinned-tab.svg" color="#5bbad5" />
  <meta name="msapplication-TileColor" content="#2d89ef" />

  <script type="text/javascript"
           src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML">
  </script>

  <title>Torbjorn Ludvigsen|Blog</title>
</head>
<body>
<nav>
  <ul>
    <li><a href="../../">Home</a></li>
    <li><a href="../../blog" class="active">Blog</a></li>
    <li><a href="../../donate">Donate</a></li>
    <li><a href="../../about">About</a></li>
    <li><a href="../../links">Links</a></li>
  </ul>
</nav>
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
  Hangprinter Campaign: <a href="https://salt.bountysource.com/teams/hangprinter">Bountysource Salt</a>
</p>
<p>
  Hangprinter Merchandise USA: <a href="https://shop.spreadshirt.com/hangprinter-merchandise/">Spreadshirt.com</a>
</p>
<p>
  Hangprinter Merchandise Sweden: <a href="https://shop.spreadshirt.se/hangprinter-merchandise/">Spreadshirt.se</a>
</p>
<p>
  Hangprinter Project: <a  href="../2014#Hangprinter">[1]</a>,
                       <a  href="../2015#Slideprinter_Update">[2]</a>,
                       <a  href="../2015#hangprinter_project_2">[3]</a>,
                       <a  href="../2015#hangprinter_project_3">[4]</a>,
                       <a  href="../2015#hangprinter_project_4">[5]</a>,
                       <a  href="../2015#hangprinter_project_5">[6]</a>,
                       <a  href="../2015#hangprinter_project_6">[7]</a>,
                       <a  href="../2015#hangprinter_project_7">[8]</a>,
                       <a  href="../2015#hangprinter_project_8">[9]</a>,
                       <a  href="../2015#hangprinter_project_9">[10]</a>,
                       <a  href="../2015#hangprinter_project_10">[11]</a>,
                       <a  href="../2015#hangprinter_project_11">[12]</a>,
                       <a  href="../2015#hangprinter_project_12">[13]</a>,
                       <a  href="../2015#hangprinter_project_13">[14]</a>,
                       <a  href="../2015#hangprinter_project_14">[15]</a>,
                       <a  href="../2015#hangprinter_project_15">[16]</a>,
                       <a  href="../2015#hangprinter_project_16">[17]</a>,
                       <a  href="../2015#hangprinter_project_17">[18]</a>,
                       <a  href="../2015#hangprinter_project_18">[19]</a>,
                       <a  href="../2016#hangprinter_project_19">[20]</a>,
                       <a  href="../2016#hangprinter_project_20">[21]</a>,
                       <a  href="../2016#hangprinter_project_21">[22]</a>,
                       <a  href="../2016#hangprinter_project_22">[23]</a>,
                       <a  href="../2016#hangprinter_project_23">[24]</a>,
                       <a  href="../2016#hangprinter_project_24">[25]</a>,
                       <a  href="../2016#hangprinter_project_25">[26]</a>,
                       <a  href="../2016#hangprinter_project_26">[27]</a>,
                       <a  href="../2016#hangprinter_project_27">[28]</a>,
                       <a  href="../2017#hangprinter_project_28">[29]</a>,
                       <a  href="../2017#hangprinter_project_29">[30]</a>,
                       <a  href="../2017#hangprinter_project_30">[31]</a>,
                       <a  href="../2017#hangprinter_project_31">[32]</a>,
                       <a  href="../2017#hangprinter_project_32">[33]</a>,
                       <a  href="../2017#hangprinter_project_33">[34]</a>,
                       <a  href="../2017#hangprinter_project_34">[35]</a>,
                       <a  href="../2017#hangprinter_project_35">[36]</a>,
                       <a  href="../2017#hangprinter_project_36">[37]</a>,
                       <a  href="../2017#hangprinter_project_37">[38]</a>,
                       <a  href="../2017#hangprinter_project_38">[39]</a>,
                       <a  href="../2017#hangprinter_project_39">[40]</a>,
                       <a  href="../2017#hangprinter_project_40">[41]</a>,
                       <a  href="../2017#hangprinter_project_41">[42]</a>,
                       <a  href="../2017#hangprinter_project_42">[43]</a>,
                       <a  href="../2017#hangprinter_project_43">[44]</a>,
                       <a  href="../2017#hangprinter_project_44">[45]</a>,
                       <a  href="../2017#hangprinter_project_45">[46]</a>,
                       <a  href="../2017#hangprinter_project_46">[47]</a>,
                       <a  href="../2017#hangprinter_project_47">[48]</a>,
                       <a  href="../2017#hangprinter_project_48">[49]</a>,
                       <a  href="../2017#hangprinter_project_49">[50]</a>,
                       <a  href="../2017#hangprinter_project_50">[51]</a>,
                       <a  href="../2018#hangprinter_project_51">[52]</a>,
                       <a  href="../2018#hangprinter_project_52">[53]</a>,
                       <a  href="../2018#hangprinter_project_53">[54]</a>,
                       <a  href="../2018#hangprinter_project_54">[55]</a>,
                       <a  href="../2018#hangprinter_project_55">[56]</a>,
                       <a  href="../2018#hangprinter_project_56">[57]</a>,
                       <a  href="../2018#hangprinter_project_57">[58]</a>,
                       <a  href="../2018#hangprinter_project_58">[59]</a>,
                       <a  href="../2018#hangprinter_project_59">[60]</a>,
                       <a  href="../2018#hangprinter_project_60">[61]</a>,
                       <a  href="../2018#hangprinter_project_61">[62]</a>,
                       <a  href="../2018#hangprinter_project_62">[63]</a>,
                       <a  href="../2020#hangprinter_project_63">[64]</a>
</p>
<p>
  Hangprinter Project Homepage: <a href="https://hangprinter.org">hangprinter.org</a>
</p>
<p>
  Print Issue Solution Filter Project: <a href="../2014#Introducing_PISF">[1]</a>,
                                       <a href="../2014#Presenting_PISF_Again">[2]</a>,
                                       <a href="../2014#PISF_Online_Sort_Of">[3]</a>,
                                       <a href="../2014#PISF">[4]</a>
</p>
<p>
  Sourcing RepRappro Mendel in Larvik: <a href="../2014#Sourcing_Mendel_1">[1]</a>,
                                       <a href="../2014#Sourcing_Mendel_2">[2]</a>,
                                       <a href="../2014#Sourcing_Mendel_3">[3]</a>,
                                       <a href="../2014#Sourcing_Mendel_4">[4]</a>,
                                       <a href="../2014#Sourcing_Mendel_5">[5]</a>,
                                       <a href="../2014#Sourcing_Mendel_6">[6]</a>,
                                       <a href="../2014#Sourcing_Mendel_7">[7]</a>
</p>
<p>
  Archive: <a href="../2014">2014</a>, <a href="../2015">2015</a>, <a href="../2016">2016</a>, <a href="../2017">2017</a>, <a href="../2018">2018</a>, <a href="../2020">2020</a>
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
Everything on this homepage, except those videos who are published via Vimeo or Youtube, is licenced under the <a href="https://www.gnu.org/licenses/fdl">Gnu Free Documentation Licence</a>.
The videos published via Vimeo or Youtube are also licenced via Vimeo or Youtube.
</p>
</div>
<br /><br /><br /><br /><br /><br /><br /><br />
<script type="text/javascript">
  MathJax.Hub.Configured()
</script>
<script data-goatcounter="https://torbjornludvigsen.goatcounter.com/count"
  async="true" src="//gc.zgo.at/count.js"></script>
</body>
</html>

</xsl:template>
</xsl:stylesheet>
