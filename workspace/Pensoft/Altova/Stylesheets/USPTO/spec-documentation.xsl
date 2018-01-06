<?xml-stylesheet type="text/xsl" href="spec-documentation.xsl"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:doc="urn:schemas-uspto-gov:document"
    exclude-result-prefixes="doc"
    version="1.0">

<xsl:import href="specification.xsl" doc:description="The &quot;driver&quot; file for the XSL tranformation resulting in an HTML document
         from a &lt;specification&gt; XML document instance.    
         The specification.xsl file calls its child templates through &lt;xsl:include&gt;"/>

<xsl:output method="xml" indent="yes" media-type="text/html"/>
    
    <doc:summary>
        <doc:title>Specification Documentation</doc:title>
        <doc:filename>spec-documentation.xsl</doc:filename>
        <doc:version>1.0</doc:version>
        <doc:dateCreated>2001-02-16</doc:dateCreated>
        <doc:lastModified>2001-02-21</doc:lastModified>
        <doc:description>Genarates a summary of characteristics of the XSLT stylesheets used 
        for the Specification doctype.
        </doc:description>
    </doc:summary>
    
   <xsl:template name="displayPage" doc:public="no" doc:description="The displayPage named template is the 
   heart of the documentation.xsl stylesheet, and coordinates the display of all other elements. 
   You can call this as a named template from your own routines as well, by passing the code 
   to be documented as a node set to the $stylesheet parameter and setting $isRootPage to &quot;yes&quot;.
   The details of this are included in the article Document Your XSLT by Kurt Cagle. Documentation Generator is copyright 2000 by 
   Kurt Cagle, customized for USPTO by John Dunning, 2001.  For use in commercial products, please contact the author for permissions.">
    
        <xsl:param name="stylesheet" doc:description="This should be the document node (&lt;xsl:stylesheet&gt;)
        of the stylesheet to be documented. Note that if you apply documentation.xsl as 
        an executed stylesheet, this will be done automatically."/>
        <xsl:param name="isRootPage" select="'no'" doc:description="This is useful to 
        insure that even if there is no &lt;doc:summary&gt; that some kind of title 
        description will appear for the document. Set to &quot;yes&quot; to make sure this happens, 
        as it normally defaults to &quot;no&quot;."/>
   
           <xsl:for-each select="$stylesheet">
            <xsl:choose>
                <xsl:when test="//doc:summary">
                    <xsl:apply-templates select="//doc:summary"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="$isRootPage='yes'">
                    <h2>Current Stylesheet</h2>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
                <xsl:call-template name="outputDisplay">
                    <xsl:with-param name="outputNodeCnd" select="//xsl:output"/>
                    <xsl:with-param name="stylesheet" select="//xsl:stylesheet"/>
                </xsl:call-template>
                
                <xsl:if test="//xsl:import">
                    <h3>Imports</h3>
                    <ul>
                        <xsl:apply-templates select="//xsl:import"/>
                    </ul>
                </xsl:if>
                <xsl:if test="//xsl:include">
                    <h3>Includes</h3>
                    <ul>
                        <xsl:apply-templates select="//xsl:include"/>
                    </ul>
                </xsl:if>
                <xsl:if test="//xsl:stylesheet/xsl:param">
                    <h3>Global Parameters</h3> 
                    <ul>
                        <xsl:apply-templates select="//xsl:stylesheet/xsl:param"/>
                    </ul>
                </xsl:if>
                <xsl:if test="//xsl:stylesheet/xsl:variable[@doc:public='yes']">
                    <h3>Global Variables</h3>
                    <ul>
                        <xsl:apply-templates select="//xsl:stylesheet/xsl:variable"/>
                    </ul>
                </xsl:if>
        <h5>Element Template Rules:     <xsl:value-of select="count(xsl:template/@match)" /></h5>

        <xsl:for-each select="xsl:template/@match">
            <xsl:if test="not(substring(., 1, 3)='doc') and not(substring(.,1,3)='xsl')">
            <span style="background-color:addfff">
                &#160;&#160;&#160;<xsl:value-of select="." />
            </span>
            </xsl:if>
        </xsl:for-each>
                
                
                <xsl:apply-templates select="//xsl:template[@match and not(@mode)]"/>
                <xsl:apply-templates select="//xsl:template[@name]"/>
                <xsl:apply-templates select="//xsl:template[@mode]"/>
                <xsl:apply-templates select="//doc:example"/>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="/">
        <html>
        <head><title>Specification Stylesheet Documentation</title></head>
            <body>
            <basefont size="2">
            <style>
            td {font-size: 10pt;}
            .containedDocumentation {border:inset 2px green;}
            .importTitle {background-color:navy;color:white;font-size:14pt;}
            .includeTitle {background-color:blue;color:white;font-size:14pt;}
            </style>
            <script language="JavaScript">
            function showHideImportData(id){
                var importBlock=document.all(id);
                    if (importBlock.style.display=='none'){
                        importBlock.style.display='block';
                        }
                    else {
                        importBlock.style.display='none';
                        }
                    }
            </script>
            <table width="100%">
            <tr><td bgcolor="blue" align="center"><font color="white"><b>xsl:include</b></font></td>
                <td bgcolor="navy" align="center"><font color="white"><b>xsl:import</b></font></td>
                <td bgcolor="addfff" align="center">xsl:template match</td>
                <td bgcolor="eff7ff" align="center">xsl:template name</td>
                <td bgcolor="red" align="center">xsl:variable</td>
                <td bgcolor="ff00ff" align="center">xsl:param</td>
            </tr>
            </table>
        <xsl:call-template name="displayPage">
            <xsl:with-param name="stylesheet" select="//xsl:stylesheet"/>
            <xsl:with-param name="isRootPage" select="'yes'"/>
        </xsl:call-template>
            </basefont>
            </body>
        </html>        
    </xsl:template>
    
    <xsl:template match="doc:summary">
        <h3><xsl:value-of select="doc:title"/></h3>
        <h4>File:             <xsl:value-of select="doc:filename"/></h4>
        <table width="30%">
            <tr><td>Version:</td><td><xsl:value-of select="doc:version"/></td></tr>
            <xsl:if test="doc:doctype">
                <tr><td>DTD Version:</td><td><xsl:value-of select="doc:doctype" /></td></tr>
            </xsl:if>
            <xsl:if test="doc:doctype-date">
                <tr><td>DTD Revision Date: </td><td><xsl:value-of select="doc:doctype-date" /></td></tr>
             </xsl:if>
            <tr><td>Date Created: </td>
                <td><xsl:value-of select="doc:dateCreated"/></td></tr>
            <tr><td>Date Last Modified:</td>
                <td><xsl:value-of select="doc:lastModified" /></td></tr>
            </table>
         <h4>Description</h4>
        <div><xsl:copy-of select="doc:description"/></div>
        <br/>
    </xsl:template>

    <xsl:template match="doc:attribute">
        <h4><xsl:value-of select="doc:title"/></h4>
        <div><xsl:value-of select="doc:description"/></div>
    </xsl:template>

    <xsl:template match="xsl:template[@match]"/>
    <!--xsl:template match="xsl:template[@match and @doc:public='no']"/-->

    <xsl:template match="xsl:template[@name]"/>
    
    <xsl:template match="xsl:template[@name and not(@doc:public='no')]">
        <h4><span style="background-color:#eff7ff;">Named Template: <xsl:value-of select="@name"/></span></h4>
        <div><xsl:value-of select="./@doc:description"/></div>
        <xsl:if test="./xsl:param">
            <h5>Parameters</h5>
        </xsl:if>
        <ul>
        <xsl:for-each select="xsl:param[not(@doc:private='yes')]">
            <li><b><xsl:value-of select="@name"/>: </b> <xsl:value-of select="@doc:description"/>
            <xsl:choose>
                <xsl:when test="@select">
                    <i>[default=<xsl:value-of select="@select"/>]</i>
                </xsl:when>
                <xsl:otherwise>
                    <i>[default=<xsl:value-of select="."/>]</i>
                </xsl:otherwise>
            </xsl:choose>
            </li>
        </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="xsl:template[@match and @doc:public='yes']">
        <h4><span style="background-color:#addfff;">Matched Template: <xsl:value-of select="@match"/></span></h4>
        <div><xsl:value-of select="./@doc:description"/></div>

        <xsl:if test="./xsl:param">
            <h5><span style="background-color:#ff00ff;">Parameters</span></h5>
        </xsl:if>
        <ul>
        <xsl:for-each select="xsl:param[not(@doc:private='yes')]">
            <li><b><span style="background-color:#ff00ff;"><xsl:value-of select="@name"/>:</span></b> &#160;&#160;&#160;<xsl:value-of select="@doc:description"/>
            <xsl:choose>
                <xsl:when test="@select">
                    <i>[default=<xsl:value-of select="@select"/>]</i>
                </xsl:when>
                <xsl:otherwise>
                    <i>[default=<xsl:value-of select="."/>]</i>
                </xsl:otherwise>
            </xsl:choose>
            </li>
        </xsl:for-each>
        </ul>

        <xsl:if test="xsl:variable and doc:public='yes'">
            <h5>Attributes</h5>
            <ul>
            <xsl:for-each select="xsl:variable[@doc:description]">
                <li><b><xsl:value-of select="@name"/>. </b> <xsl:value-of select="@doc:description"/>
                <xsl:if test="xsl:choose/xsl:otherwise">[<xsl:value-of select="@name"/>='<xsl:value-of select="."/>']</xsl:if>
                </li>
            </xsl:for-each>
            </ul>
        </xsl:if>
    </xsl:template>

    <xsl:template match="xsl:template[@mode and @doc:public='yes']">
        <h4><span style="background-color:#addfff;">Modal Matched Template: <xsl:value-of select="@mode"/></span></h4>
        <div><xsl:value-of select="./@doc:description"/></div>
        <xsl:if test="xsl:variable and doc:public='yes'">
            <h5>Attributes</h5>
            <ul>
            <xsl:for-each select="xsl:variable[@doc:description]">
                <li><b><xsl:value-of select="@name"/>. </b> <xsl:value-of select="@doc:description"/>
                <xsl:if test="xsl:choose/xsl:otherwise">[<xsl:value-of select="@name"/>='<xsl:value-of select="."/>']</xsl:if>
                </li>
            </xsl:for-each>
            </ul>
        </xsl:if>
    </xsl:template>

        
    <xsl:template match="doc:example">
        <h5>Example</h5>
        <pre>
        <xsl:copy-of select="*|@*|text()"/>
        </pre>
    </xsl:template>
    
    <xsl:template match="xsl:include">
        <li>
        <xsl:variable name="doc" select="document(@href)"/>
        <xsl:variable name="import_id" select="generate-id()"/>
        <div class="containedDocumentation" >
        <h1 class="includeTitle"  onclick="showHideImportData('{$import_id}');" style="cursor:hand;">
        <xsl:value-of select="@href"/>
        </h1>
        <div id="{$import_id}" style="display:none;">
        <xsl:call-template name="displayPage">
            <xsl:with-param name="stylesheet" select="$doc//xsl:stylesheet"/>
        </xsl:call-template>
        </div>
        </div>
        </li>
    </xsl:template>
    
    <xsl:template match="xsl:import">
        <li>
        <xsl:variable name="doc" select="document(@href)"/>
        <xsl:variable name="import_id" select="generate-id()"/>
        <div class="containedDocumentation" >
        <h1 class="importTitle"  onclick="showHideImportData('{$import_id}');" style="cursor:hand;">
        <xsl:value-of select="@href"/>
        </h1>
        <div id="{$import_id}" style="display:none;">
        <xsl:call-template name="displayPage">
            <xsl:with-param name="stylesheet" select="$doc//xsl:stylesheet"/>
        </xsl:call-template>
        </div>
        </div>
        </li>
    </xsl:template>

    <xsl:template name="outputDisplay" doc:public="no">
        <xsl:param name="outputNodeCnd"/>
        <xsl:param name="stylesheet"/>
        <xsl:variable name="outputNode.tf">
            <xsl:choose>
                <xsl:when test="$outputNodeCnd">
                    <output>
                        <xsl:for-each select="$outputNodeCnd/@*">
                            <xsl:attribute name="{name(.)}">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </xsl:for-each>
                    </output>
                </xsl:when>
                <xsl:otherwise> 
                    <output/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="../output">
            <h4>Output</h4>
        </xsl:if>
        <xsl:for-each select="$outputNodeCnd">
            <ul>
            <xsl:if test="not(@method)">
                <xsl:choose>
                    <xsl:when test="$stylesheet//html|$stylesheet//HTML">
                        <li><b>Method:</b> html (default)</li>
                    </xsl:when>
                    <xsl:otherwise>
                        <li><b>Method:</b> xml (default)</li>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="@method">
                <li><b>Method:</b> <xsl:value-of select="@method"/></li>
            </xsl:if>
            <xsl:if test="not(@media-type)">
                <li><b>Media-Type:</b> text/html (default)</li>        
            </xsl:if>
            <xsl:if test="@media-type">
                <li><b>Media-Type:</b> <xsl:value-of select="@media-type"/></li>
            </xsl:if>
            <xsl:if test="not(@indent)">
                <li><b>Indent:</b> No (default)</li>
            </xsl:if>
            <xsl:if test="@indent">
                <li><b>Indent:</b> <xsl:value-of select="@indent"/></li>
            </xsl:if>
            <xsl:if test="not(@version)">
                <li><b>Version:</b> <xsl:value-of select="$stylesheet/@version"/> (default)</li>
            </xsl:if>
            <xsl:if test="@version">
                <li><b>Version:</b> <xsl:value-of select="@version"/></li>
            </xsl:if>
            <xsl:if test="not(@omit-xml-declaration)">
                <li><b>XML Declaration Omitted:</b> No (default)</li>
            </xsl:if>
            <xsl:if test="@omit-xml-declaration">
                <li><b>XML Declaration Omitted:</b> <xsl:value-of select="@omit-xml-declaration"/></li>
            </xsl:if>
            <xsl:if test="not(@standalone)">
                <li><b>Stand Alone:</b> Either</li>
            </xsl:if>
            <xsl:if test="@standalone">
                <li><b>Stand Alone:</b> <xsl:value-of select="@standalone"/></li>
            </xsl:if>
            <xsl:if test="not(@encoding)">
                <li><b>Encoding:</b> UTF-16</li>
            </xsl:if>
            <xsl:if test="@encoding">
                <li><b>Encoding:</b> <xsl:value-of select="@encoding"/></li>
            </xsl:if>
            <xsl:if test="@doctype-system">
                <li><b>System Document Type:</b> <xsl:value-of select="@doctype-system"/></li>
            </xsl:if>
            <xsl:if test="@doctype-public">
                <li><b>Public Document Type:</b> <xsl:value-of select="@doctype-public"/></li>
            </xsl:if>
            <xsl:variable name="isIdentity">
                <xsl:choose>
                <xsl:when test="$stylesheet//xsl:template[@match='@*|node()' or @match='*|@*|text()' or @match='node()|@*']|$stylesheet//xsl:import[@href='identity.xsl']|xsl:include[@href='identity.xsl']">yes</xsl:when>
                <xsl:otherwise>no</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <li><b>Is Identity Template:</b> <xsl:value-of select="$isIdentity"/></li>
            <xsl:variable name="isExecutable">
                <xsl:choose>
                <xsl:when test="$stylesheet//xsl:template[@match='/']">yes</xsl:when>
                <xsl:otherwise>no <xsl:if test="$stylesheet//xsl:import|$stylesheet//xsl:import">*(though imported/included templates may be).</xsl:if>
</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <li><b>Is Stylesheet Executable:</b> <xsl:value-of select="$isExecutable"/></li>
            </ul>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="xsl:stylesheet/xsl:variable|xsl:stylesheet/xsl:param">
            <li><b><span style="background-color: red"><xsl:value-of select="@name"/>.</span> </b> <xsl:value-of select="@doc:description"/>
            <xsl:if test="@select">
            <i>[default=<xsl:value-of select="@select"/>]</i>
            </xsl:if>
            </li>
    </xsl:template>
</xsl:stylesheet>