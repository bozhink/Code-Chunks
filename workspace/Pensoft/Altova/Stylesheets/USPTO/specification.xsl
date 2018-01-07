<?xml-stylesheet href="stripDocumentation.xsl" type="text/xsl"?>
<xsl:stylesheet version="1.0" 
                exclude-result-prefixes="msxsl local doc" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                xmlns:local="#local-functions" 
                extension-element-prefixes="msxsl">

<doc:summary doc:public="yes" >
     <doc:title>Specification Stylesheet</doc:title>
     <doc:filename>specification.xsl</doc:filename>
     <doc:version>1.0</doc:version>
     <doc:doctype>specification v1.28</doc:doctype>
     <doc:doctype-date>2000-10-16</doc:doctype-date>
     <doc:dateCreated>2001-01-26</doc:dateCreated>
     <doc:lastModified>2001-02-21</doc:lastModified>
     <doc:description>This is the "driver" file for an XSL transformation;        
       all specification-specific template rules  
       are in this file; component files are "included" below      
     </doc:description>
</doc:summary>

<!--
*********************************************************************
*  John Dunning: 2001-01-26                                         *
*  DTD Version:  1.2.8                                              *
*    Distribution :  2000-10-16                                     *
*    Stylesheet revision date:  2001-01-29                          *
*                                                                   *
*  this is the "driver" file for an XSL transformation;             *
*  all specification-specific template rules are in this file;      *
*  component files are "included" below                             *
*********************************************************************
-->


<xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>

<xsl:preserve-space elements="*"/>

<xsl:template match="*">
    <xsl:apply-templates /> 
</xsl:template>

<!-- **** strip [ ] off version attribute for display **** -->
    <xsl:variable name="version" select="//spec.version/@version" doc:public="yes" doc:description="variable to hold version attribute for formatting by XSLT/XPath string functions."/>
    <xsl:variable name="ver" select="substring-after($version,'[')" doc:description="variable that uses the version variable and strips the '[' character from the replacement text"/>
    <xsl:variable name="ver2" select="substring-before($ver,']')" doc:description="variable that uses the ver variable and strips the ']' character from the replacement text; returns final value of version attribute without surrounding '[]' characters ."/>


<xsl:template match="/" doc:public="yes" doc:description="The root element of the document instance; creates an HTML document context">
    <html>
        <head>
            <xsl:call-template name="css_styles"/>
        </head>
    <body>
        <basefont face="Arial Unicode MS, Lucida Sans Unicode, Arial, Times New Roman"
                    size="2">
                <xsl:apply-templates select="//spec.title-block"/>
                <xsl:apply-templates select="//specification-block"/>
            </basefont>
            </body>
        </html>
</xsl:template>

    <xsl:template match="specification-block">
        <div style="margin-left: +35pt;">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    

    <xsl:template match="spec.title-block">
        <h1 align="center">
            <xsl:value-of select="spec.title/@text"/>
        </h1>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="table_data">
                    <xsl:value-of select="$ver2"/>
                </td>
                <td/>
            </tr>
            <tr>
                <td class="table_data">
                    Stylesheet Version  1.0</td>
                <td/>
            </tr>
        </table>
        <p/>
    </xsl:template>


    <xsl:template match="application-filing-date">
            of <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="application-number">
            application <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="application-reference">
            <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="continuity-statement">
        <div class="left_para">
        <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top">
                </td>
                <td width="85%">
                    <span class="para_text">
                        <xsl:apply-templates />
                    </span>
                </td>
                <td width="*"></td>
            </tr>
        </table>
        </div>
     </xsl:template>

    <xsl:template match="copyright">
        <div class="left_para">
        <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top">
                </td>
                <td width="85%">
                    <span class="para_text">
                        <xsl:apply-templates />
                    </span>
                </td>
                <td width="*"></td>
            </tr>
        </table>
        </div>
    </xsl:template>
    
    <xsl:template match="cross-reference">
        <u><xsl:apply-templates /></u>
    </xsl:template>
    
    <xsl:template match="paragraph" doc:public="yes" doc:description="This template rule uses extention element &lt;msxml:script&gt; to return a four-digit paragraph number (e.g., [0001]).">
        <div class="left_para">
        <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top">
                    <span class="para_text">
                        [<xsl:value-of select="local:FormatParagraphID(.)" />]    
                    </span>
                </td>
                <td width="85%">
                    <span class="para_text">
                        &#160;&#160;&#160;&#160;&#160;
                        <xsl:apply-templates />
                    </span>
                </td>
                <td width="*"></td>
            </tr>
        </table>
        </div>
        </xsl:template>


     <xsl:template match="program-listing-deposit">    
          <h3 style="margin-top: 3px;
                    margin-bottom: 3px;">
                  <xsl:value-of select="./heading"/>
          </h3>
        <div class="left_para">
        <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top">
                &#160;
                </td>
                <td width="85%">
                    <span class="para_text">
                            <xsl:apply-templates select="./program-listing" />
                    </span>
                </td>
                <td width="*"></td>
            </tr>
        </table>
        </div>
    </xsl:template>

    <xsl:template match="program-reference">
        <div style="text-decoration:    underline;
                    line-height: 200%">
                <xsl:value-of select="@text"/>
               [<xsl:value-of select="@id"/>]
                <xsl:apply-templates />
        </div>
    </xsl:template>


    <xsl:template match="referenced-applications">
        <div class="left_para">
        <table border="0" width="100%">
            <tr>
                <td width="8%" valign="top">
                </td>
                <td width="85%">
                    <span class="para_text">
                   <b>Referenced-applications</b><br/>
                        <xsl:apply-templates />
                    </span>
                </td>
                <td width="*"></td>
            </tr>
        </table>
        </div>
    </xsl:template>

    <xsl:template match="unknown-symbol" doc:public="yes" doc:description="writes text &quot;Unknown Symbol&quot; with a red background to signify that a character reference was not translated properly.">
        <span style="background-color: red;
                         font-size: 26pt;">
                         Unknown Symbol<!-- the text to display-->
        </span>
    </xsl:template>

    
    <msxsl:script implements-prefix="local"><![CDATA[
    

   function FormatParagraphID(nodeList)   {
   try    {
        var myNode = nodeList.item(0);
        var paragraphID = (myNode.getAttribute("number"));
           y =   myNode.getAttribute("number")
           if (y == null)
               return (" ")
        else
            for(var p = paragraphID.length; p < 4; p++)
            {
                paragraphID = "0" + paragraphID;    
            }    
            return paragraphID;
       }
    catch(e) {
        return "";
        }
    }
    

    function formatLabel(nodeList) {
    try {
           var myNode = nodeList.item(0);
        var label = myNode.getAttribute("label");
        var labelClose = label.indexOf("]");        
        var startLabel = label.substring(1,labelClose);
        return startLabel;
        }
    catch(e) {
        return "";
        }
    }

  ]]></msxsl:script>


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
<xsl:include href="figures_specification.xsl"/>
<xsl:include href="name.xsl"/>
<xsl:include href="para-fed.xsl"/>
<xsl:include href="party.xsl"/>
<xsl:include href="residence.xsl"/>
<xsl:include href="sequence-listing.xsl"/>

</xsl:stylesheet>
