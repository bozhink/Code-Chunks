<?xml-stylesheet href="stripDocumentation.xsl" type="text/xsl"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc">
                
<doc:summary doc:public="yes" >
    <doc:title>[ doctype ] Stylesheet</doc:title>
    <doc:filename>[file].xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>[doctype version]</doc:doctype>
    <doc:doctype-date>[doctype revision date]</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>[date this file was modified]</doc:lastModified>
    <doc:description>This is the "driver" file for an XSL transformation;        
       all [doctype] specific template rules  
       are in this file; component files are "included" below      
    </doc:description>
</doc:summary>
                
<!-- include component stylesheets, overriding subsequent declarations -->

<xsl:include href="abstract.xsl"/>
<xsl:include href="address.xsl"/>
<xsl:include href="appendix.xsl"/>
<xsl:include href="biological-deposit.xsl"/>
<xsl:include href="cals.xsl"/>
<xsl:include href="citation.xsl"/>
<xsl:include href="claims.xsl"/>
<xsl:include href="classifications.xsl"/>
<xsl:include href="common.xsl"/>
<xsl:include href="correspondence-address.xsl"/>
<xsl:include href="css-styles.xsl"/>
<xsl:include href="cwu.xsl"/>
<xsl:include href="document-id.xsl"/>
<xsl:include href="figures.xsl"/>
<xsl:include href="inventor-block.xsl"/>
<xsl:include href="name.xsl"/>
<xsl:include href="para-fed.xsl"/>
<xsl:include href="party.xsl"/>
<xsl:include href="residence.xsl"/>
<xsl:include href="sequence-listing.xsl"/>

<xsl:output method="html" indent="yes" omit-xml-declaration="yes" media-type="text/html"/>

<xsl:preserve-space elements="*"/>

<xsl:template match="*">
    <xsl:apply-templates /> 
</xsl:template>

<xsl:template match="/" doc:public="yes" doc:description="The root element of the document instance; creates an HTML document context">
    <html>
        <head>
            <xsl:call-template name="css_styles"/>
        </head>
        <body>
        <basefont face="Arial Unicode MS, Lucida Sans Unicode, Times New Roman "
                    size="2">
        <div style="margin-left: +35pt;">
            <xsl:apply-templates />
        </div>
        </basefont>
        </body>
    </html>
</xsl:template>

<!-- insert template rules specific to the formatting of this individual doctype below -->
<!-- see files pap.xsl, specification.xsl for examples -->

</xsl:stylesheet>