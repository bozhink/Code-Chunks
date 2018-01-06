<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="urn:schemas-uspto-gov:document"
                exclude-result-prefixes="doc"
                version="1.0">
                
    <doc:summary>
        <doc:title>Documentation Stripper</doc:title>
        <doc:filename>stripDocumentation.xsl</doc:filename>
        <doc:version>0.7</doc:version>
        <doc:dateCreated>2000-01-02</doc:dateCreated>
        <doc:lastModified>2001-01-03</doc:lastModified>
        <doc:description><span style="color:blue;font-size:14pt;font-family:Impact;">Documentation Stripper</span> 
        removes all doc: space documentation from a stylesheet to create a lighter weight
        version of the stylesheet for production use. Save the resulting file under a separate
        name from the documented file.  Documentation Stripper is copyright 2000 by 
        <a href="mailto:cagle@olywa.net">Kurt Cagle</a>. Customized for USPTO by John Dunning,
        2001.  For use in  commercial products, please contact the author for permissions.
        </doc:description>
    </doc:summary>

    <xsl:output method="xml" indent="no" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="xsl:include">
            <xsl:copy-of select="document(@href) //xsl:template" />            
    </xsl:template>
    
    <xsl:template match="*|@*|text()|comment()">
	     <xsl:copy><xsl:apply-templates select="*|@*|text()|comment()"/></xsl:copy>
	</xsl:template>
        
    <xsl:template match="*[namespace-uri(.)='urn:schemas-uspto-gov:document']|@*[namespace-uri(.)='urn:schemas-uspto-gov:document']"/>

</xsl:stylesheet>