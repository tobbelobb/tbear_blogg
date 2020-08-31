saxon-xslt 2020/2020.xml blogtemplate.xsl > 2020/index.html
saxon-xslt 2018/2018.xml blogtemplate.xsl > 2018/index.html
saxon-xslt 2017/2017.xml blogtemplate.xsl > 2017/index.html
saxon-xslt 2016/2016.xml blogtemplate.xsl > 2016/index.html
saxon-xslt 2015/2015.xml blogtemplate.xsl > 2015/index.html
saxon-xslt 2014/2014.xml blogtemplate.xsl > 2014/index.html

# Let the main page be a copy of the 2020 page for now
cp 2020/index.html index.html
sed -i 's/="\.\/bilder/="bilder/g' index.html
sed -i 's/="bilder/="2020\/bilder/g' index.html
