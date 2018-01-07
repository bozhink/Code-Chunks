<xsl:stylesheet version="1.0" 
                exclude-result-prefixes="msxsl local doc" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:doc="urn:schemas-uspto-gov:document"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:local="#local-functions" 
                extension-element-prefixes="msxsl local">

<doc:summary doc:public="yes" >
    <doc:title>Component stylesheet for figures</doc:title>
    <doc:filename>figures-pap.xsl</doc:filename>
    <doc:version>1.0</doc:version>
    <doc:doctype>numerous</doc:doctype>
    <doc:doctype-date>N/A</doc:doctype-date>
    <doc:dateCreated>2001-01-26</doc:dateCreated>
    <doc:lastModified>2001-02-16</doc:lastModified>
    <doc:description>
       Template rules for embedding TIFFs from &lt;image&gt; and &lt;figure&gt; elements
       into an HTML browser.
      <pre style="font-face:arial; font-size:10pt;">
       Notes: 
       sets width &amp; height of embedded plug-in to width &amp; height         
       attributes of image if present; otherwise sets 800 X 600        
    
       preset to "best" fit; fits entire image to width &amp; height      
                                                                       
       NOTE:  width &amp; height are plug-in, not image!                  

       96 pixels per inch on Windows screens using Small Icons/fonts; 
       72 pixels per inch on Windows screens using Large Icons/fonts; 
       use 84 to allow for header and footer                          
                                                                   
       300 pixels per inch for USPTO scans           
       </pre>               
       The specification requires extension scripting to get information about the &lt;image&gt;s and &lt;artwork&gt;s.
       See "GENERAL NOTES" in README.txt.
    </doc:description>
</doc:summary>


<!--
*********************************************************************
* John Dunning: 2001-01-26                                          *
* Component file for image viewing: <artwork>, <image>, <figure>    *
*                                                                   *
* This performs evaluations to test whether the image is a .tiff    *
*   or a .jpg and handles each accordingly                          *
*                                                                   *
* Tests width of image; if smaller than 1.5 inches, displays inline *
*                                                                   *
* sets width & height of embedded plug-in to width & height         *
*   attributes of image if present; otherwise sets 800 X 600        *
*                                                                   *
*    preset to "best" fit; fits entire image to width & height      *
*                                                                   *
*    NOTE:  width & height are plug-in, not image!                  *
*                                                                   *
*    96 pixels per inch on Windows screens using Small Icons/fonts; *
*    72 pixels per inch on Windows screens using Large Icons/fonts; *
*    use 84 to allow for header and footer                          *
*                                                                   *
*    300 pixels per inch for USPTO scans                            *
*********************************************************************
-->

    <xsl:template match="artwork">
        <xsl:call-template name="tiff_embedder"/>
    </xsl:template>

    <xsl:template match="figure">
        <div class="break_before">
             <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="drawing-reference-character">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="image" name="tiff_embedder" doc:public="yes" doc:description="performs a series of tests; 1) tests whether its a TIFF or JPG; JPG is wrapped in &lt;img&gt; HTML tags, 
    TIFFs in &lt;embed&gt; HTML tags; 2) if image height is greater than 1 inch, it breaks the line;
    3) if no height/width attributes are present, sets tiff viewer to 800X600">
            <xsl:choose>
                  <xsl:when test="local:tagit(.)='1'"><!-- its a TIFF -->
                    <!-- if image is larger than 1 inch, line break_before -->
                     <xsl:if test="local:chooseDiv(.)='0'">
                       <div>
                          <embed toolbar="off" fit="best" align="top">
                             <xsl:choose>
                                <xsl:when test="@height">                                        
                                    <xsl:attribute name="height">
                                         <xsl:value-of select="local:getHeight(.)"/>
                                    </xsl:attribute>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:attribute name="height">800</xsl:attribute>
                                 </xsl:otherwise>
                              </xsl:choose>
                              <xsl:choose>
                                 <xsl:when test="@width">
                                    <xsl:attribute name="width">
                                        <xsl:value-of select="local:getWidth(.)"/>
                                     </xsl:attribute>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:attribute name="width">600</xsl:attribute>
                                 </xsl:otherwise>
                               </xsl:choose>
                                <xsl:attribute name="src">
                                     <xsl:value-of select="local:LookupEntity(.)"/>
                                </xsl:attribute>
                           </embed>
                        </div>
                    </xsl:if>
                    <!-- otherwise, image is inline (less than 1 inch high) -->
                   <xsl:if test="local:chooseDiv(.)='1'">
                        <embed toolbar="off" fit="best" align="top">
                           <xsl:choose>
                               <xsl:when test="@height">                                        
                                   <xsl:attribute name="height">
                                      <xsl:value-of select="round(local:getHeight(.))"/>
                                   </xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="height">800</xsl:attribute>
                                </xsl:otherwise>
                           </xsl:choose>
                           <xsl:choose>
                                <xsl:when test="@width">
                                    <xsl:attribute name="width">
                                      <xsl:value-of select="round(local:getWidth(.))"/>
                                     </xsl:attribute>
                                 </xsl:when>
                                 <xsl:otherwise>
                                     <xsl:attribute name="width">600</xsl:attribute>
                                 </xsl:otherwise>
                            </xsl:choose>
                                 <xsl:attribute name="src">
                                      <xsl:value-of select="local:LookupEntity(.)"/>
                                 </xsl:attribute>
                         </embed>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise><!-- otherwise, it's a .jpg, place in <img> -->
                      <img>
                         <xsl:attribute name="src">
                             <xsl:value-of select="local:LookupEntity(.)"/>
                          </xsl:attribute>
                      </img>
                  </xsl:otherwise>
             </xsl:choose>
    </xsl:template>

    <msxsl:script implements-prefix="local"><![CDATA[
    
    function LookupEntity(nodeList) {
    try {
        var myNode = nodeList.item(0);
        var ref = myNode.getAttribute("source");
        var entity = myNode.ownerDocument.doctype.entities.getNamedItem(ref);
        return entity.attributes.getNamedItem("SYSTEM").value;
        }
    catch(e) {
        return "";
        }
    }
    
    function LookupEntityType(myNode) {
    try {
        var ref = myNode.getAttribute("source");
        var entity = myNode.ownerDocument.doctype.entities.getNamedItem(ref);
        return entity.attributes.getNamedItem("NDATA").value;
        }
    catch(e) {
        return "";
        }
    }

   function tagit(nodeList) {
   try {
           var myNode = nodeList.item(0);
        if (LookupEntityType(myNode) == "jpg")
             return (0);
        else
        return (1); // "tiff"
        }
   catch(e) {
        return "";
        }
    }

   function getHeight(nodeList) {
   try {
        // @96 pixels per inch on screen
        // 300 pixels per inch for USPTO scans
        var myNode = nodeList.item(0);
        var x = myNode.getAttribute("height");
        if (x == null)
        return ("500")
         else 
           var tiffsize = myNode.attributes.getNamedItem("height").value * 84;
           return tiffsize;
       }
       catch(e) {
           return "";
           }
       }

   function getWidth(nodeList) {
   try {
           var myNode = nodeList.item(0);
        var y =   myNode.getAttribute("width")
           if (y == null)
           return ("500")
            else 
        var tiffsize =  myNode.attributes.getNamedItem("width").value * 84;
        return tiffsize;
       }
    catch(e) {
        return "";
        }
    }
        
    function chooseDiv(nodeList) {
    try {
        var myNode = nodeList.item(0);    
        if (getHeight(myNode) > 108) {
            return (0);
      }  else  {
            return (1);
          }  
       } //
    catch(e) {
        return "";
        }
    }
]]></msxsl:script>

</xsl:stylesheet>