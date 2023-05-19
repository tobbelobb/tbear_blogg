saxon-xslt hangprinter-is-prior-art/hangprinter-is-prior-art.xml blogtemplate.xsl > hangprinter-is-prior-art/index.html
saxon-xslt 2022/2022.xml blogtemplate.xsl > 2022/index.html
saxon-xslt 2021/2021.xml blogtemplate.xsl > 2021/index.html
saxon-xslt 2020/2020.xml blogtemplate.xsl > 2020/index.html
saxon-xslt 2019/2019.xml blogtemplate.xsl > 2019/index.html
saxon-xslt 2018/2018.xml blogtemplate.xsl > 2018/index.html
saxon-xslt 2017/2017.xml blogtemplate.xsl > 2017/index.html
saxon-xslt 2016/2016.xml blogtemplate.xsl > 2016/index.html
saxon-xslt 2015/2015.xml blogtemplate.xsl > 2015/index.html
saxon-xslt 2014/2014.xml blogtemplate.xsl > 2014/index.html
saxon-xslt super-secret/super-secret.xml blogtemplate.xsl > super-secret/index.html
saxon-xslt rust/rust.xml blogtemplate.xsl > rust/index.html

# Let the main page be a copy of the 2022 page for now
cp 2022/index.html index.html
# The new index should point to itself without the 2022 part
sed -i 's/<meta property="og:url" content="https:\/\/torbjornludvigsen.com\/blog\/2022/<meta property="og:url" content="https:\/\/torbjornludvigsen.com\/blog/g' index.html
# Remove the "this is 2022" part for front page blog version
sed -i 's/Reprap Blog 2022//g' index.html
