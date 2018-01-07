<?xml version="1.0" encoding="UTF-8"?>

<!--  generalize.xsl 1.0; 14 June 2001
 | Convert specialied DITA topics into revertable, "generalized" form
 |
 | Copyright IBM Corporation, 2001, 2002
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers.
 +======================================
 |
 *-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:output method="xml" indent="no"/>

     <xsl:template match="*[@class]">
          <xsl:variable name="generalize" select="substring-before(substring-after(@class,'/'),' ')" />
                <xsl:element name="{$generalize}">
                     <xsl:copy-of select="@*"/>
                    <xsl:apply-templates/>
                </xsl:element>
     </xsl:template>

     <xsl:template match="*|@*|comment()|processing-instruction()|text()">
       <xsl:copy>
         <xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"/>
       </xsl:copy>
     </xsl:template>
</xsl:stylesheet>
