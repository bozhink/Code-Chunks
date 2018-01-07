<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for CSS styles</doc:title>
    <doc:filename>commoncss.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
       Inserts CSS formatting styles into the &lt;head&gt; of the resulting HTML document.
    </doc:description>
</doc:summary>

<xsl:template name="css_styles" doc:description="Inserts a &lt;style&gt; element containing a list of CSS styles used by USPTO stylesheets into the &lt;head&gt; section of the resulting HTML document.">
<style type="text/css">
            a     {text-decoration: none;color:blue;}
            
            a:visited {color: blue; }
            
            
            .bar {font-family: Code 39;
                  font-size: 16pt;}

            .break_avoid {page-break-inside: avoid;}
            
            .break_before {page-break-before: always;}
            
            .break_before_after {page-break-before: always;
                                 page-break-after: always;}

            .claim_text {margin-left: +30pt;
                         font-size: 10pt;
                             line-height: 200%;}

            .grant_claim_text {margin-left: +60pt;
                                   line-height: 200%;}

            .head {    font-size: 12pt;
                    font-weight: bold;
                      margin-top: 2em;
                      margin-bottom: 2em;}
                      
            heading {margin-top: 3px;
                     margin-bottom: 3px;
                     text-transform: uppercase;}
                     

             h3         {margin-top: 3px;
                     margin-bottom: 3px;
                     font-weight: normal;
                     text-align: center;
                     text-transform: uppercase;}

                     
                      
            .headinfo_large {font-size: 12pt;}
                             
            .headinfo_reg   {font-size: 10pt;
                             font-weight: bold;}


            .left_para {margin-top: 8px;
                        margin-bottom: 8px;
                        margin-left: -30pt;}
                        
                        
            .list_item {list-style-type: none;
                         display: list-item;
                         margin-left: +30pt;
                           line-height: 200%;}
                           
            .mono       {line-height: 200%;
                        font-family: monospace;}

            paragraph {font-size: 10pt;
                       line-height: 200%;}
            
            .para_text {line-height: 200%;
                        font-size: 10pt;
                        margin-top: 8px;
                        margin-bottom: 8px;}

            .smallcaps     {text-transform: uppercase;
                         font-size: 9pt; }            
            
            .smalltitle {display: block;
                    text-align: center;
                    text-transform: uppercase;
                    font-size:16pt;
                    font-weight:bold;
                    margin-top:3mm;
                    margin-bottom: 3mm;}

            .table_head {font-size: 12pt;
                         font-weight: bold; 
                         margin-top: 2em; 
                         margin-bottom: 2em;}

            .table_data {font-size: 10pt;
                       vertical-align: top;}

            .text  {line-height: 200%;
                    font-size: 10pt;}
                    
            .title {display: block;
                    text-align: center;
                    font-size:26pt;
                    font-family:serif;
                    font-weight:bold;
                    margin-top:3mm;
                    margin-bottom: 3mm;}

</style>
</xsl:template>
</xsl:stylesheet>