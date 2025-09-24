saxon-xslt hangprinter-is-prior-art/hangprinter-is-prior-art.xml blogtemplate.xsl > hangprinter-is-prior-art/index.html
saxon-xslt 2025/2025.xml blogtemplate.xsl > 2025/index.html
saxon-xslt 2023/2023.xml blogtemplate.xsl > 2023/index.html
saxon-xslt 2022/2022.xml blogtemplate.xsl > 2022/index.html
saxon-xslt 2021/2021.xml blogtemplate.xsl > 2021/index.html
saxon-xslt 2020/2020.xml blogtemplate.xsl > 2020/index.html
saxon-xslt 2019/2019.xml blogtemplate.xsl > 2019/index.html
saxon-xslt 2018/2018.xml blogtemplate.xsl > 2018/index.html
saxon-xslt 2017/2017.xml blogtemplate.xsl > 2017/index.html
saxon-xslt 2016/2016.xml blogtemplate.xsl > 2016/index.html
saxon-xslt 2015/2015.xml blogtemplate.xsl > 2015/index.html
saxon-xslt 2014/2014.xml blogtemplate.xsl > 2014/index.html
saxon-xslt misc_attic/project-overhanger/project-overhanger.xml blogtemplate.xsl > misc_attic/project-overhanger/index.html
saxon-xslt misc_attic/rust/rust.xml blogtemplate.xsl > misc_attic/rust/index.html

# Let the main page be a copy of the 2025 page for now
cp 2025/index.html index.html
# The new index should point to itself without the 2023 part
sed -i 's/<meta property="og:url" content="https:\/\/torbjornludvigsen.com\/blog\/2025/<meta property="og:url" content="https:\/\/torbjornludvigsen.com\/blog/g' index.html
# Remove the "this is 2023" part for front page blog version
sed -i 's/Reprap Blog 2025//g' index.html
