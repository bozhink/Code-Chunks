<?xml version="1.0"?>
<!-- Id: datatypes.xml,v 1.8 2004/10/07 22:51:40 cmsmcq Exp  -->
<!DOCTYPE spec PUBLIC "-//W3C//DTD Specification V2.2//EN" "http://www.altova.com/schemas/xmlspec/schemaSpecs.dtd" [
<!ENTITY suffix "">
<!ENTITY meForTxt "datatypes">
<!ENTITY cellback '#d0d9fa'>
<!ENTITY xmlspec "http://www.w3.org/TR/2000/WD-xml-2e-20000814">
<!ENTITY xmlnsspec "http://www.w3.org/TR/1999/REC-xml-names-19990114/">
<!ENTITY xsdl "http://www.w3.org/TR/2004/REC-xmlschema-1-20041028/structures.html">
<!ENTITY primer "http://www.w3.org/TR/2004/REC-xmlschema-0-20041028/primer.html">
<!ENTITY xlink "http://www.w3.org/TR/2001/REC-xlink-20010627/">
<!ENTITY old-xlink "http://www.w3.org/TR/2000/PR-xlink-20001220/">
<!ENTITY charmod 'http://www.w3.org/TR/2001/WD-charmod-20010126/'>
<!ENTITY html4 'http://www.w3.org/TR/1999/REC-html401-19991224/'>
<!ENTITY schemaWG "<loc href='http://www.w3.org/XML/Activity#schema-wg'>W3C XML Schema Working Group</loc>">
<!ENTITY schema-language "XML Schema definition language">
<!ENTITY order "&#163;">
<!ENTITY le "&#8804;">
<!-- less than or equal to, U+2264 ISOtech -->
<!ENTITY ne "&#8800;">
<!-- not equal to, U+2260 ISOtech -->
<!ENTITY infin "&#8734;">
<!-- infinity, U+221E ISOtech -->
<!ENTITY times "&#215;">
<!-- multiplication, U+00D7 -->
<!ENTITY sect "&#xa7;">
<!ENTITY eacute "&#xe9;">
<!ATTLIST eg
text CDATA #IMPLIED
>
<!-- experimental pointer to out-of-line
                                        example text -->
<!ELEMENT propdef ANY>
<!-- best we can do without editing xml-spec -->
<!ATTLIST propdef
id ID #REQUIRED
name CDATA #REQUIRED
>
<!ELEMENT propref EMPTY>
<!ATTLIST propref
ref IDREF #REQUIRED
role (psvi) #IMPLIED
>
<!ELEMENT xpropref (#PCDATA | phrase)*>
<!ATTLIST xpropref
href CDATA #IMPLIED
role (anon | psviAnon) #IMPLIED
>
<!ELEMENT compdef (proplist)>
<!ATTLIST compdef
name CDATA #REQUIRED
ref IDREF #REQUIRED
>
<!ELEMENT compref EMPTY>
<!ATTLIST compref
ref IDREF #REQUIRED
>
<!ELEMENT proplist (propdef*)>
<!ATTLIST proplist
role (psvi) #IMPLIED
item CDATA #IMPLIED
>
<!ELEMENT reprdef (reprelt | reprcomp | p)*>
<!ELEMENT reprelt EMPTY>
<!ATTLIST reprelt
eltname NMTOKENS #REQUIRED
type NMTOKEN #IMPLIED
local NMTOKEN #IMPLIED
diff CDATA #IMPLIED
>
<!ELEMENT reprcomp (reprdep?, propmap*)>
<!ATTLIST reprcomp
ref IDREF #REQUIRED
abstract CDATA #REQUIRED
>
<!ELEMENT reprdep ANY>
<!-- best we can do without editing xml-spec -->
<!ELEMENT propmap ANY>
<!-- best we can do without editing xml-spec -->
<!ATTLIST propmap
name IDREF #REQUIRED
>
<!ELEMENT eltref EMPTY>
<!ATTLIST eltref
ref NMTOKEN #REQUIRED
inside NMTOKEN #IMPLIED
>
<!ELEMENT clauseref EMPTY>
<!ATTLIST clauseref
ref IDREF #REQUIRED
>
<!ELEMENT stale ANY>
<!ELEMENT dtref EMPTY>
<!ATTLIST dtref
ref NMTOKEN #REQUIRED
>
<!ELEMENT baseref EMPTY>
<!ELEMENT itemTyperef EMPTY>
<!ELEMENT fundamental-facets EMPTY>
<!ATTLIST graphic
map IDREF #IMPLIED
>
<!ELEMENT imagemap EMPTY>
<!ATTLIST imagemap
source CDATA #REQUIRED
id ID #REQUIRED
>
<!ENTITY v-value "<xtermref href='&xsdl;#key-vv'>actual value</xtermref>">
<!ELEMENT br EMPTY>
<!ENTITY % local.ednote.class "|br">
<!-- pvb: doesn't belong here, but I need it in the CM of <code> and this works -->
<!ELEMENT strong (#PCDATA)>
<!ENTITY % local.emph.class '|strong'>
<!ELEMENT pt (#PCDATA)>
<!ATTLIST pt
diff (chg | add | del | off) #IMPLIED
>
<!ENTITY % local.term.class '|pt'>
<!-- ht: for pre-terminal -->
<!ENTITY % local.tech.class '|pt'>
<!-- ht: for pre-terminal -->
<!ENTITY % local.p.class "|stale|facets|subtypes|
   		inverse-facets|open-issues|revisions|
   		fundamental-facets|applicable-facets|type-hierarchy">
<!ENTITY % local.termdef.class "|propdef">
<!ENTITY % local.ref.class "|propref|xpropref|eltref|compref|dtref|
   		baseref|itemTyperef">
<!ENTITY % local.illus.class "|compdef|reprdef|proplist|imagemap">
<!ENTITY % rhs.element "IGNORE">
<!ELEMENT rhs (#PCDATA | nt | xnt | com | phrase)*>
<!-- ht: allow phrase -->
<!ENTITY i-attribute "<xpropref href='http://www.w3.org/TR/xml-infoset/#infoitem.attribute'>attribute</xpropref>">
<!ENTITY i-children "<xpropref href='http://www.w3.org/TR/xml-infoset/#infoitem.element'>children</xpropref>">
<!ENTITY i-child "<xpropref href='http://www.w3.org/TR/xml-infoset/#infoitem.element'>child</xpropref>">
<!ENTITY i-attributes "<xpropref href='http://www.w3.org/TR/xml-infoset/#infoitem.element'>attributes</xpropref>">
<!ENTITY i-attrChildren "<xpropref href='http://www.w3.org/TR/xml-infoset/#infoitem.attribute'>children</xpropref>">
<!ENTITY i-value "<xpropref href='http://www.w3.org/TR/xml-infoset/#infoitem.attribute'>value</xpropref>">
<!ENTITY i-ccode "<xpropref href='http://www.w3.org/TR/xml-infoset/#infoitem.character'>character code</xpropref>">
<!ELEMENT applicable-facets EMPTY>
<!ELEMENT facets EMPTY>
<!ELEMENT subtypes EMPTY>
<!ELEMENT inverse-facets EMPTY>
<!ATTLIST inverse-facets
name CDATA #REQUIRED
>
<!ELEMENT open-issues EMPTY>
<!ELEMENT revisions EMPTY>
<!ATTLIST table
align CDATA #IMPLIED
bgcolor CDATA #IMPLIED
class CDATA #IMPLIED
>
<!ELEMENT type-hierarchy EMPTY>
<!ELEMENT font (#PCDATA)>
<!ATTLIST font
size NMTOKEN #IMPLIED
>
<!ATTLIST spec
xml:lang NMTOKEN #IMPLIED
>
<!ATTLIST td
style CDATA #IMPLIED
>
<!ATTLIST th
style CDATA #IMPLIED
>
<!ATTLIST spec
schemaProper CDATA #FIXED "./XMLSchema.xsd"
schemaDump CDATA #FIXED "./XMLSchema.xsd.dmp"
docStatus CDATA #FIXED "final"
>
]>
<?xml-stylesheet type="text/xsl" href="xmlspec.xsl"?>
<?altova_sps http://www.altova.com/sps/template/xmlspec/xmlspec.sps?>
<spec xml:lang="en" w3c-doctype="rec" status="final">
<header>
<title>XML Schema Part 2: Datatypes</title>
<version diff="add">Second Edition</version>
<w3c-designation>rec-20041028</w3c-designation>
<w3c-doctype>W3C Recommendation</w3c-doctype>
<pubdate>
<day>28</day>
<month>October</month>
<year>2004</year>
<!-- Id: datatypes.xml,v 1.8 2004/10/07 22:51:40 cmsmcq Exp  -->
</pubdate>
<publoc>
<loc href="http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/">http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/</loc>
</publoc>
<altlocs diff="chg">
<loc href="http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/datatypes.xml">XML</loc>
<loc href="http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/datatypes-with-errata.html">XHTML with visible change markup</loc>
<loc href="http://www.w3.org/2001/XMLSchema.xsd">Independent copy of the schema for schema documents</loc>
<loc href="http://www.w3.org/2001/XMLSchema-datatypes.xsd">A schema for built-in datatypes only, in a separate namespace</loc>
<loc href="http://www.w3.org/2001/XMLSchema.dtd">Independent copy of the DTD for schema documents</loc>
</altlocs>
<latestloc>
<loc href="http://www.w3.org/TR/xmlschema-2/">
		http://www.w3.org/TR/xmlschema-2/
	</loc>
</latestloc>
<prevlocs>
<loc href="http://www.w3.org/TR/2004/PER-xmlschema-2-20040318/">http://www.w3.org/TR/2004/PER-xmlschema-2-20040318/</loc>
</prevlocs>
<authlist>
<author>
<name>Paul V. Biron</name>
<affiliation>Kaiser Permanente, for Health Level Seven</affiliation>
<email href="mailto:Paul.V.Biron@kp.org">Paul.V.Biron@kp.org</email>
</author>
<author>
<name>Ashok Malhotra</name>
<affiliation>Microsoft (formerly of IBM)</affiliation>
<email href="mailto:ashokma@microsoft.com">ashokma@microsoft.com</email>
</author>
</authlist>
<errataloc href="http://www.w3.org/2004/03/xmlschema-errata"/>
<preverrataloc href="http://www.w3.org/2001/05/xmlschema-errata"/>
<translationloc href="http://www.w3.org/2003/03/Translations/byTechnology?technology=xmlschema"/>
<status>
<p>
<emph>This section describes the status of this document at the
time of its publication. Other documents may supersede this document.
<phrase diff="chg">A list of current W3C publications and the latest
revision of this technical report can be found in the <loc href="http://www.w3.org/TR/">W3C technical reports index</loc> at
http://www.w3.org/TR/.</phrase>
</emph>
</p>
<!--* Don't mark the next paragraph deleted: that would suggest
    * it was in the First Edition and has now been deleted. 
    * Instead, just delete it.  Or rather, comment it out
    * (in case we change our minds). 
    *-->
<!--* <p diff="del">This is a <xspecref
href="http://www.w3.org/2004/02/Process-20040205/tr.html#ProposedEditedRec">W3C
Proposed Edited Recommendation</xspecref>, intended to become the
first part of the Second Edition of XML Schema.  It is here made
available for review by W3C members and other interested parties. Note
that a Candidate Recommendation draft has not been deemed necessary by
the Working Group, as there are no substantial implementation issues
arising as a result of this edition, which aims only to incorporate
the published corrigenda to the first edition.</p> *-->
<!--* in next paragraph, the phrase 'or cited as a normative reference
    * from another document' should appear in parts 1 and 2 but not
    * in part 0. *-->
<p>
<phrase diff="add">This is a <xspecref href="http://www.w3.org/2004/02/Process-20040205/tr.html#RecsW3C">W3C
Recommendation</xspecref>, which forms part of the Second Edition of XML
Schema.</phrase> This document has been reviewed by W3C Members and
other interested parties and has been endorsed by the Director as a
W3C Recommendation. It is a stable document and may be used as
reference material or cited as a normative reference 
from another document. 
W3C's role in making the Recommendation is to draw attention
to the specification and to promote its widespread deployment. This
enhances the functionality and interoperability of the Web. 
</p>
<!--* next paragraph deleted vis-a-vis PER but not vis-a-vis 1E *-->
<!--* <p diff="del">Please send comments on this Proposed Edited
Recommendation to <loc
href="mailto:www-xml-schema-comments@w3.org">www-xml-schema-comments@w3.org</loc>,
including <code>2E PER</code> in the subject line, no later than 16
April 2004.</p> *-->
<!--* next paragraph deleted vis-a-vis PER but not vis-a-vis 1E *-->
<!--* <p diff="del">Publication as a Proposed Edited Recommendation does not
imply endorsement by the W3C Membership. This is a draft document and
may be updated, replaced or obsoleted by other documents at any
time. It is inappropriate to cite this document as other than work in
progress.</p> *-->
<p>
This document has been produced by the <loc href="http://www.w3.org/XML/Schema">W3C XML Schema Working Group</loc>
as part of the W3C <loc href="http://www.w3.org/XML/Activity">XML
Activity</loc>. The goals of the XML Schema language are discussed in
the <loc href="http://www.w3.org/TR/NOTE-xml-schema-req">XML Schema
Requirements</loc> document. The authors of this document are the
members of the XML Schema Working Group.  Different parts of this
specification have different editors.
</p>
<p diff="del">This version of this document incorporates some editorial changes
from earlier versions.</p>
<!--* next paragraph deleted vis-a-vis PER but not vis-a-vis 1E *-->
<!--* <p diff="del">Documentation of intellectual property possibly relevant to this
recommendation may be found at the Working Group's <loc
role="disclosure"
href="http://www.w3.org/2002/11/xml-schema-IPR-statements.html">public
IPR disclosure page</loc>.</p> *-->
<p diff="add">
This document was produced under the <loc href="http://www.w3.org/TR/2002/NOTE-patent-practice-20020124">24
January 2002 Current Patent Practice (CPP)</loc> as amended by the <loc href="http://www.w3.org/2004/02/05-pp-transition">W3C Patent Policy
Transition Procedure</loc>. The Working Group maintains a <loc role="disclosure" href="http://www.w3.org/2002/11/xml-schema-IPR-statements.html">public
list of patent disclosures</loc> relevant to this document;
that page also includes instructions for disclosing a patent. 
An individual who
has actual knowledge of a patent which the individual believes
contains Essential Claim(s) with respect to this specification should
disclose the information in accordance with <loc href="http://www.w3.org/Consortium/Patent-Policy-20040205/#sec-Disclosure">section 
6 of the W3C Patent Policy</loc>.
</p>
<p diff="del">Please report errors in this document to <loc href="mailto:www-xml-schema-comments@w3.org">www-xml-schema-comments@w3.org</loc> 
(<loc href="http://lists.w3.org/Archives/Public/www-xml-schema-comments/">archive</loc>). 
The list of known errors in this specification is available at <loc href="http://www.w3.org/2001/05/xmlschema-errata">http://www.w3.org/2001/05/xmlschema-errata</loc>. 
</p>
<p>The English version of this specification is the only normative
version. Information about translations of this document is available
at <loc href="http://www.w3.org/2001/05/xmlschema-translations">http://www.w3.org/2001/05/xmlschema-translations</loc>.</p>
<p diff="del">A list of current W3C Recommendations and other
technical documents can be found at
<loc href="http://www.w3.org/TR">http://www.w3.org/TR</loc>.</p>
<p diff="add">This second edition is <emph>not</emph> a new version,
it merely incorporates the changes dictated by the corrections to
errors found in the <loc href="http://www.w3.org/TR/2001/REC-xmlschema-2-20010502/">first
edition</loc> as agreed by the XML Schema Working Group, as a
convenience to readers.  A separate list of all such corrections is
available at <loc href="http://www.w3.org/2001/05/xmlschema-errata">http://www.w3.org/2001/05/xmlschema-errata</loc>. 
</p>
<p diff="add">The errata list for this second edition is available at <loc href="http://www.w3.org/2004/03/xmlschema-errata">http://www.w3.org/2004/03/xmlschema-errata</loc>.</p>
<p diff="add">
Please report errors in this document to <loc href="mailto:www-xml-schema-comments@w3.org">www-xml-schema-comments@w3.org</loc> 
(<loc href="http://lists.w3.org/Archives/Public/www-xml-schema-comments/">archive</loc>).
</p>
<note diff="add">
<p>Ashok Malhotra's 
affiliation has changed since the completion of
editorial work on this second edition. He is now at Oracle, and can be
contacted at <loc href="mailto:ashok.malhotra@oracle.com">&lt;ashok.malhotra@oracle.com&gt;</loc>.
</p>
</note>
</status>
<abstract>
<p>
<emph>XML Schema: Datatypes</emph> is part 2 of the specification of the XML
Schema language. It defines facilities for defining datatypes to be used
in XML Schemas as well as other XML specifications.
The datatype language, which is itself represented in
XML 1.0, provides a superset of the capabilities found in XML 1.0
document type definitions (DTDs) for specifying datatypes on elements
and attributes.
</p>
</abstract>
<langusage>
<language id="EN">English</language>
<language id="ebnf">Extended Backus-Naur Form (formal grammar)</language>
</langusage>
<revisiondesc>
<slist>
<!--
     commenting these out means only that they won't show up in the
	 stylesheet generated "Revisions from previous draft" appendix
  -->
<!-- Changes before Sept public draft commented out...
<sitem>
19990521: PVB: corrected definition of length and maxLengths facet for strings to
be in terms of <emph>characters</emph> not <emph>bytes</emph>
</sitem>
<sitem>
19990521: PVB: removed issue "other-date-representations".  We don't
want other separators, left mention of aggregate reps for dates as
an ednote.
</sitem>
<sitem>
19990521: PVB: fixed "holidays" example, "-0101" ==> "==0101"
(where == in the correction should be two hyphens, but that would
not allow us to comment out this sitem)
</sitem>
<sitem>
19990521: PVB: fixed "common date" example, lexicalRepresenation ==> lexicalRepresentation
</sitem>
<sitem>
19990521: PVB: added note that -YY-MM-DD style dates are deprecated
</sitem>
<sitem>
19990521: PVB: added termdef element around definition of subtype
</sitem>
<sitem>
19990521: PVB: removed "whose basetype is a built-in" from definition of
"user-generated" datatype
</sitem>
<sitem>
19990521: PVB: clarified that the length facet for binary datatype is
length in bytes
</sitem>
<sitem>
19990521: PVB: fixed weird spacing problems introduced by ArborText
</sitem>
<sitem>
19990521: PVB: fixed references to non-terminals in productions
</sitem>
<sitem>
19990524: AM: changed "boolean" to have a single lexical representation.
</sitem>
<sitem>
19990524: AM: added issue: "should we add a facet to restrict a binary
datatype to a user-defined format such as audio, image, etc."
</sitem>
<sitem>
19990524: AM: corrected reference to SQL standard.
</sitem>
<sitem>
19990524: AM: corrected definition of length and maximum length
facets to be a positive integer.
</sitem>
<sitem>
19990524: AM: corrected default format for integer, decimal and real.
</sitem>
<sitem>
19990524: AM: rewrote issue definition-overiding.
</sitem>
<sitem>
19990524: AM: edited Conformance section to add example of lexical
errors and fix reference to above issue.
</sitem>
<sitem>
19990601: PVB: changed date formats in examples of Section 1 to be conformant
with the date datatype
</sitem>
<sitem>
19990601: PVB: added a "for compatibility" terminology entry
</sitem>
<sitem>
19990601: PVB: added a Name datatype and redefined the XML 1.0 attribute types
in terms of it
</sitem>
<sitem>
19990601: PVB: remove "for attributes only" restriction on XML 1.0  attribute types.
Added a "for compatibility" clause for attribute values.
</sitem>
<sitem>
19990601: PVB: added language datatype
</sitem>
<sitem>
19990602: PVB: added uuid datatype
</sitem>
<sitem>
19990602: PVB: added NCName datatype
</sitem>
<sitem>
19990604: AM: changed date and time formats to allow only ISO 8601
extended format. Impacted sections on the date, time datatypes,
section 4, Appendix C.
</sitem>
<sitem>
19990604: AM: added ednote to string datatype saying we need to harmonize
with I18N character model.
</sitem>
<sitem>
19990604: PVB: added "Revisions from previous draft" appendix
</sitem>
<sitem>
19990604: PVB: moved "built-in generated" datatype definitions into the
schema for datatype definitions (instead of it being in its own appendix).
</sitem>
<sitem>
19990604: PVB: upadted the schema for datatype definitions to point to
the correct (per xmlschema-1) DTD and schema
</sitem>
<sitem>
19990623: AM: added paragraph to conformance section which begins
to be more precise about how conforming processors should behave
</sitem>
<sitem>
19990623: AM: removed confusing statement from conformance section
which said that " checking for lexical conformance is all that is
expected of an XML processor."
</sitem>
<sitem>
19990623: PVB: removed section on "Characterizing Operations" and
all references to it (or its content) in the rest of the draft.
</sitem>
<sitem>
19990623: PVB: removed uuid datatype
</sitem>
<sitem>
19990623: PVB: made NMTOKEN a primitive datatype and Name a
subtype of NMTOKEN.
</sitem>
<sitem>
19990623: PVB: corrected the basetypes of following XML-related
generated datatypes: IDREFS (from ID to IDREF), ENTITY (from ID to Name),
ENTITIES (from ID to ENTITY), NMTOKENS (from Name to NMTOKEN).
</sitem>
<sitem>
19990623: PVB: changed name of section "User-Generated Datatypes" to
the more correct "Defining Generated Datatypes".  Also added some
explanatory text to the beginning of that section which explains
that the abstract syntax there is used both for defining built-in
and user-generated datatypes.
</sitem>
<sitem>
19990623: PVB: added explanations of abstract and concrete
syntax (mostly borrowed from the structural draft) to section
"Defining Generated Datatypes".
</sitem>
<sitem>
19990623: PVB: separated references into those that are normative
and those that are non-normative
</sitem>
<sitem>
19990623: PVB: added a pointer to the draft revision of ISO 8601
in its bib entry
</sitem>
<sitem>
19990623: PVB: added "no-consensus" issues to those all sections
except "Type System" and "Built-in datatypes" stating that no WG
consensus has been reached on the section (the exclusions above
are because those sections which granted consensus status at the
Ann Arbor f2f)
</sitem>
<sitem>
19990623: PVB: cleaned up productions for numeric literals
</sitem>
<sitem>
19990624: PVB: excluded subsections 1.1 and 1.2 from the "no-consusus"
issue for section 1
</sitem>
<sitem>
19990630: PVB: removed number datatype, made real into a built-in
primitive, changed the basetype of decimal to real and the basetype
of integer to decimal.  Also added NaN, INF and -INF to the lexical
space of all numeric types.
</sitem>
<sitem>
19990630: PVB: added 2 new subtypes of integer: nonPositiveInteger
and nonNegativeInteger, each of which has 1 subtype: negativeInteger
and positiveInteger, respectively.  Added generated datatype definitions
for these to the schema for datatypes.
</sitem>
<sitem>
19990630: PVB: fixed typos in definition of IDREF and IDREFS
(was "the lexical space of ID is .." now "the lexical space of IDREF is ...")
</sitem>
<sitem>
19990630: PVB: added issue(nonNegativeInteger-literals)
</sitem>
<sitem>
19990630: PVB: added links to known subtypes in all datatype
descriptions
</sitem>
<sitem>
19990630: PVB: changed "no-consensus" issues to "no-consensus"
ednotes
</sitem>
<sitem>
19990630: PVB: changed "no-consensus" ednote for section 1 to
exclude subsection 1.3, as voted on during the telcon today
</sitem>
<sitem>
19990630: PVB: corrected several interal cross-references: from termref's
to specref's
</sitem>
<sitem>
19990630: PVB: added all previous drafts (internal as well as public WDs)
to the "Previous Versions" section.  In future public WDs only those
"previous versions" which were public WDs will display
</sitem>
<sitem>
19990630: PVB: changed "collection" to "set" in definition of "value space"
(thought this had been changed long ago, sorry)
</sitem>
<sitem>
19990708: PVB: removed section 1.5 "Organization", per WG vote on telcon
</sitem>
<sitem>
19990708: PVB: removed "no-consensus" ednote from section 1
</sitem>
<sitem>
19990709: PVB: added (stub) subsections on "Precision", "Scale" and "Encoding" to
section 2.4.2 "Constraining Facets".  All facets mentioned in all datatype
definitions in section 3 should be listed in 2.4.2. (this is not intended to address
the standing issue <xspecref href='http://www.w3.org/XML/Group/xmlschema-current/issues.html#constraining-facet-definitions'>
constraining-facet-definitions</xspecref>, but was needed for the next revision item)
</sitem>
<sitem>
19990709: PVB: added "Datatypes and Facets" appendix which consists of
several tables which attempt to show which facets apply to which datatypes
</sitem>
<sitem>
19990713: PVB: fixed bug in schema for datatypes regarding modelGroup vs.
elementType Refs in unordered modelGroup
as per
<loc href='http://lists.w3.org/Archives/Public/www-xml-schema-comments/1999AprJun/0088.html'>
http://lists.w3.org/Archives/Public/www-xml-schema-comments/1999AprJun/0088.html</loc>
</sitem>
<sitem>
19990726: AM: Changed example of user-generated datatype from
heightInInches to i4.
</sitem>
<sitem>
19990726: AM: Rewrote "Exact and Approximate".
</sitem>
<sitem>
19990812: PVB: Removed all mention of picture constraints as lexical-representations
for strings
</sitem>
<sitem>
19990819: AM: Amended Ed. Note on a URL for the datatypes namespace
referring to Dan Connolly's note "make up your own".
</sitem>
<sitem>
19990819: AM: Removed issue on NULLS, 2 occurrences.
</sitem>
<sitem>
19990819: AM: Changed Ed. Note on "Better Ref Mechs" associated with
IDREFS to "issue"..
</sitem>
<sitem>
19990819: AM: Removed issue on measurement units as WG decided to
defer to version 2.
</sitem>
<sitem>
19990919: HT: modifed abstract syntax to better reflect intent?
</sitem>
<sitem>
19990923: HT: modified schema for schemas to conform to the concrete
syntax in the latest Structures draft
</sitem>
<sitem>
19990923: PVB: added minAbsoluteValue and maxAbsoluteValue facets to
real, their intent is to allow generation of subtypes of real whose
value spaces correspond to comment float-point representations.
Added examples to section 4 to show how to generate IEEE 32-bit, etc.
</sitem>
<sitem>
19990923: PVB: replaced dateTime, date, time and timePeriod with all
new date/time related types: timeInstant, recurringInstant,
date and time.  Additionally, limited the lexical representations of each
of the new types to a single form (w/ the exception of still allowing both
left truncation and reduced [i.e., right truncated] representations).
Changed all examples which used date/time to use the new lexical representation
</sitem>
<sitem>
19990923: PVB: modified the abstract syntax, schema for datatypes and DTD
for datatypes to bring them in line with above changes.
</sitem>
<sitem>
19990924: HST: link housekeeping before publication</sitem>
<sitem>
19991020: AM: Rewrote "NOTATION".
</sitem>
<sitem>
19991020: AM: Made NMTOKEN a subtype of string.
</sitem>
<sitem>
19991020: AM: Changed lex reps for all date and time datatypes to ISO
extended format i.e. with separators.
</sitem>
<sitem>
19991020: AM: Removed issue on non-Gregorian dates.
</sitem>
<sitem>
19991020: AM: Renamed "lexical representation" facet for string to "pattern".
</sitem>
 <sitem>
19991026: AM: Added appendix discussing ISO 8601 formats.  Removed note
asking for such explanation.
</sitem>
<sitem>
1999-10-26: PVB: fixed errors in datatypes.xsd and datatypes.dtd as pointed
out by <loc href='http://lists.w3.org/Archives/Public/www-xml-schema-comments/1999JulSep/0050.html'>
Curt Arnold</loc>
</sitem>
<sitem>
1999-10-26: PVB: added period to the facets production
</sitem>
<sitem>
1999-10-26: PVB: added a note on the basetype to the definition of
datatype NMTOKEN
</sitem>
<sitem>
1999-10-26: PVB: removed NaN, INF and -INF from the lexical space
of integer and decimal
</sitem>
<sitem>
1999-11-08: PVB: removed real datatype and all references to it
</sitem>
<sitem>
1999-11-08: PVB: added inital definitions for float and double datatypes.
This initial definition is not intended to be complete, we need a more
complete description of the round-to-nearest behavior of mapping literals
into the value space (i.e., a more readable description of "best approximation"
from the Clinger paper in the non-normative references section).
</sitem>
<sitem>
1999-11-08: PVB: corrected typos in the definitions of datatypes generated
from integer to corrected identify the generated type
</sitem>
<sitem>
1999-11-08: PVB: added specref elements to all mentions of constraining facets
</sitem>
<sitem>
1999-11-08: PVB: added term elements to all mentions of a datatype name in
the definition of that datatype
</sitem>
<sitem>
1999-11-12: PVB: changed lexical space of timeInstant to be more consistent
with ISO 8601, nYnMnDTnHnMnS (minus the 'P' designator).
</sitem>
<sitem>
1999-11-12: PVB fixed productions for decimalLiteral to allow forms such as
-.12 and -23.
</sitem>
<sitem>
19991122: AM: Added some more explanation to timeInstant format.  Fixed
Appendix D to reflect changes.
</sitem>
<sitem>
19991122: AM: Added "uncountable infinite and exact" value space to 2.4.1.3
</sitem>
<sitem>
19991122: AM: Removed issue "Better Reference Mechanisms".
</sitem>
<sitem>
19991122: AM: Added "collation sequence for strings is Unicode characater number".
</sitem>
<sitem>
19991122: AM: Added min/max facets to date/time datatypes.
</sitem>
<sitem>
19991122: AM: Removed issues on URI and binary datatypes.
</sitem>
<sitem>
19991122: AM: Added value space validation to conformance section.
</sitem>
<sitem>
19991122: AM: Added values space definitions to date/time datatypes.
</sitem>
<sitem>
1999-12-08: pvb: Added QName datatype
</sitem>
<sitem>
1999-12-08: pvb: changed language to be a subtype of string
</sitem>
<sitem>
1999-12-10: pvb: many small editorial changes for consistency
</sitem>
<sitem>
1999-12-10: pvb: Added pattern facet to all date/time types (should
have been there all along)
</sitem>
<sitem>
1999-12-10: pvb: Added full list of facets and subtypes to each type
definition
</sitem>
<sitem>
1999-12-10: pvb: replaced regex appendix with a brief summary of proposed
Unicode support, complete proposal coming shortly
</sitem>
<sitem>
1999-12-10: pvb: moved some references from normative to non-normative
</sitem>
<sitem>
1999-12-10: pvb: changed concrete syntax for datatype defns to more closely
match the structures draft: in particular, to allow annotations on the
datatype element and all facet elements.
</sitem>
<sitem>
1999-12-15: pvb: added normaitive reference to RTC 2045 for def of base64
</sitem>
<sitem>
1999-12-15: pvb: many more small editorial changes, for consistency in
style and presentation
</sitem>
<sitem>
1999-12-15: pvb: corrected small errors in table in appendix C.1, Fundamental
facets
</sitem>
<sitem>
1999-12-15: pvb: filled out list of datatypes for each facet in appendix C.2,
Constraining facets
</sitem>
<sitem>
1999-12-15: expanded abstract
</sitem>
<sitem>
1999-12-15: pvb: updated description of lexical space for float/double to
include literals for +- inf, +- 0, nan.
</sitem>
<sitem>
1999-12-16: pvb: modified defns of ID, IDREF, IDREFS, ENTITY, ENTITIES
and NOTATION to match NCName instead of Name as required by the Namespaces
in XML spec
</sitem>
<sitem>
1999-12-16: pvb: fully specified value space for decimal
</sitem>
<sitem>
2000-02-08: pvb: spell check
</sitem>
<sitem>
2000-02-08: pvb: added COS's for interaction between min/max-X facets
</sitem>
<sitem>
2000-02-08: pvb: changed datatype of length, min/maxLength facets from
positiveInteger to nonNegativeInteger
</sitem>
<sitem>
2000-02-08: pvb: corrected typo in date-lexical-representaion, where a
"specific century" was noted as YY (changed to CC)
</sitem>
<sitem>
2000-02-08: pvb: changed defn of atomic from being "intrinsically indivisible"
to "regarded as indivisible by this specification"
</sitem>
<sitem>
2000-02-08: pvb: clarified defn of facet, wrt value spaces and not "concepts
or objects"
</sitem>
<sitem>
2000-02-08: pvb: merged "terminology" sections from both part 1 and part 2
</sitem>
<sitem>
2000-02-08: pvb: fixed datatype of scale facet (from pos-int to non-neg-int)
</sitem>
<sitem>
2000-02-08: pvb: added "priority feedback note" for bigNums
</sitem>
<sitem>
2000-02-09: pvb: fixed circular defn of decimal, as suggested
by DC
-->
<!--
<loc href='http://lists.w3.org/Archives/Member/w3c-xml-schema-ig/2000Jan/0365.html'>
http://lists.w3.org/Archives/Member/w3c-xml-schema-ig/2000Jan/0365.html</loc>
-->
<!--
</sitem>
<sitem>
2000-02-09: pvb: added 1 and 0 to lexical space of boolean
</sitem>
<sitem>
2000-02-09: pvb: added subsections to section 4...this may get undone when I
dump the abstract syntax, we'll see
</sitem>
<sitem>
2000-02-10: pvb: added pattern facet to all datatypes
</sitem>
<sitem>
2000-02-10: pvb: updated several incorrect values in the constraining
facets "table" in Appendix C2.
</sitem>
<sitem>
2000-02-10: pvb: changed examples to use &lt;documentation> instead
of &lt;info> as the child of &lt;annotation>
</sitem>
<sitem>
2000-02-10: pvb: added the correct built-in datatypes namespace to
section 3.1 (closes the datatypes portion of issue 78)
</sitem>
<sitem>
2000-02-10: pvb: changed examples to use &lt;simpleType> instead of
&lt;datatype>, equivalent changes to the DTD and schema will come shortly
closes the datatypes portion of issue 157)
</sitem>
<sitem>
2000-02-10 : pvb: renamed uri datatype to uriReference; clarified the
defn wrt RFC 2396; included specific mention of absolute vs. relative
uriReferences; still need to be specific about the lexical representation
(closes some parts of issue 212)
</sitem>
<sitem>
2000-02-15: pvb: added SVC to binary, which says one must give a value for
the encoding facet (i.e., a hack to get around the problem that we don't
have the concept of "required" facets) [part of the resolution to issue 81]
</sitem>
<sitem>
2000-02-15: pvb: moved ID to a primitive type (since it has validation requirements
above and beyond those provided for subtypes of string).  Also added a Note: to it
making explicit the fact that the value space is scoped to an instance document
(unlike the value space of types such as integer).  Also fixed a bug in the
definition, which referred to Name instead of NCName
[part of the resolution to issue 81]
</sitem>
<sitem>
2000-02-15: pvb: moved IDREF to a primitive type (since it has validation
requirements above and beyond those provided for subtypes of string).
Added an issue about whether this could be generated from ID.
Also added a Note: to it making explicit the fact that the value space is scoped
to an instance document (unlike the value space of types such as integer).
[part of the resolution to issue 81]
</sitem>
<sitem>
2000-02-15: pvb: moved IDREFS to a primitive type (since it has validation
requirements above and beyond those provided for subtypes of string)....this is
just a temporary home and it will become generated as list of IDREF when I get
the list stuff implemented
[part of the resolution to issue 81]
</sitem>
<sitem>
2000-02-15: pvb: moved ENTITY to a primitive type (since it has validation
requirements above and beyond those provided for subtypes of string).
Also added a Note: to it making explicit the fact that the value space is scoped
to an instance document (unlike the value space of types such as integer).
Also added a SVC that entity values must match a declared unparsed entity name.
[part of the resolution to issue 81]
</sitem>
<sitem>
2000-02-15: pvb: moved ENTITIES to a primitive type (since it has validation
requirements above and beyond those provided for subtypes of string)....this is
just a temporary home and it will become generated as list of ENTITY when I get
the list stuff implemented
[part of the resolution to issue 81]
</sitem>
<sitem>
2000-02-15: pvb: moved NOTATION to a primitive type (since it has validation
requirements above and beyond those provided for subtypes of string).
Also added a Note: to it making explicit the fact that the value space is scoped
to an instance document (unlike the value space of types such as integer).
Also added a SVC that notation values must match a declared notation name.
[part of the resolution to issue 81]
</sitem>
<sitem>
2000-02-15: pvb: updated table in appendix C1, to note that all datatypes
are exact
</sitem>
<sitem>
2000-02-16: pvb: added i4, i8, u4, u8, etc. subtypes of integer, using
editor's discretion in their naming as instructed at the berkeley f2f...changed the
first example in section 4 "Defining Generated Datatypes" to use the Sku
datatype from Part 0, instead of i4 since we now have i4 built-in
</sitem>
<sitem>
2000-02-16: pvb: removed issue: definition-overriding from the draft
</sitem>
<sitem>
2000-02-17: pvb: removed the exact vs. approximate distinction entirely
(since all our types turned out to be exact)
</sitem>
<sitem>
2000-02-17: pvb: removed all mention of aggregate datatypes.  Changed
the "atomic vs. aggregate" dichotomy to be: atomic vs. list.
[part of resolution to issue 112]
</sitem>
<sitem>
2000-02-17: pvb: clarified defns of value space and lexical space.  In
particular, moved the notion of a literal denoting a value from the defn
to LS to VS and noted that a literal is a character information item from
the info set.
</sitem>
<sitem>
2000-02-17: pvb: changed terminology of "generated" to "derived", to be
in alignment with the structures spec
[part of resolution to issue 204]
</sitem>
<sitem>
2000-02-17: pvb: removed definition of term subtype, changed all prose of the
form "for subtypes of X" to "for datatypes derived from X"
[part of resolution to issue 204]
</sitem>
<sitem>
2000-02-17: pvb: removed a para from Conformance section which mentioned
processor option of turning off validation of certain facets
</sitem>
<sitem>
2000-02-17: pvb: removed note that order-relations are not defined
</sitem>
<sitem>
2000-02-17: pvb: made IDREFS, ENTITIES and NMTOKENS derived by list from
IDREF, ENTITY and NMTOKENS respectively.
[part of resolution of issue 81]
</sitem>
<sitem>
2000-02-17: pvb: clarified what the values {hex,base64} mean for the
encoding facet
</sitem>
<sitem>
2000-02-17: pvb: added pointers from the 4 mechanisms to create a value space
to the places in the spec where those mechanisms are described
</sitem>
<sitem>
2000-02-17: pvb: all built-in generated types are now defined in the
schema for datatypes
</sitem>
<sitem>
2000-02-21: pvb: clarified list datatypes, wrt use of component type
which allows whitespace in its literals and wrt facets applicable for
deriving subtypes of a list type
</sitem>
<sitem>
2000-02-23: pvb: change defn of binary and meaning of length facet
for binary to be measured in octets, since both lexical encodings
are only defined for octet multiples.
</sitem>
<sitem>
2000-02-23: pvb: incorporated prose description of regex language
(thanx to Matt Timmermans!!!!)
</sitem>
<sitem>
2000-02-23: pvb: added appinfo's to built-in definitions in the
schema for datatypes, which are used to generate the list of
constraining facets for each built-in datatype in the html version
of the spec
</sitem>
<sitem>
2000-02-23: pvb: replaced abstract syntax with 2 new sections for
"schema components" and "xml representation" constructs, still needs
a lot of editorial work tho
</sitem>
<sitem>
2000-02-23: pvb: list of derived types for each built-in type
is now auto-generated from the builtins.xsd
</sitem>
<sitem>
2000-02-23: pvb: appendix C.2 (list of datatypes to which each
facet applies) is now auto-generated form the builtins.xsd
</sitem>
<sitem>
2000-02-24: pvb: put equality back in as a fundamental facet,
to help with the vote on today's telcon regarding key, unique
and keyref value matching.
</sitem>
<sitem>
2000-02-24: pvb: added 'datatype valid' validation constraint
</sitem>
<sitem>
2000-02-24: pvb: added stub for 'facet valid' validation constraint
</sitem>
<sitem>
2000-03-01: pvb: fixed inconsistency in specification of length related
facets for binary type: all are now specified in octets
</sitem>
<sitem>
2000-03-02: pvb: removed paragraph from section describing the ordered
facet/property which talked about the possibility of multiple order
relations on a value-space
</sitem>
<sitem>
2000-03-02: pvb: table in appendix C.1 is now auto-generated from
appinfo supplied info w/i the schema for built-ins (builtins.xsd)
</sitem>
<sitem>
2000-03-03: pvb: changed non-norm reference to SQL to be the
actual ISO bibref
</sitem>
<sitem>
2000-03-04: pvb: fixed bug in defn of regex, to allow for the
empty regex
</sitem>
<sitem>
2000-03-08: am: changed date and time datatypes completely (yet again).
</sitem>
<sitem>
2000-03-10: pvb: added separate appendix for schema for built-in types
</sitem>
<sitem>
2000-03-10: pvb: changed example for precision facet (old one didn't
apply)
</sitem>
<sitem>
2000-03-10: pvb: change case on facets and type names to be Pascal-like:
effected facets minlength and maxlength; and datatypes uri-reference,
non-positive-integer, non-negative-integer, negitive-integer,
positive-integer, unsigned-long, unsigned-int, unsigned-short,
unsigned-byte.
</sitem>
<sitem>
2000-03-10: pvb: fixed example for enumeration facet (to use
recurringDate instead of date for its basetype.
</sitem>
<sitem>
2000-03-14: am: updated date/time types (yet again): changed
recurringInstant into recurringDuration, made timeInstant
derived from recurringDuration instead of primitive, added timePeriod,
month, year, century, recurringDate, and recurringDay
</sitem>
<sitem>
2000-03-14: am: modified description of lists of atomic types
that allow whitespace in their literals so that it is clearer
</sitem>
<sitem>
2000-03-15: pvb: added text (written by Mark Reinhold) to float &amp;
double describing the "best approximation" required for mapping
from lexical to value space
</sitem>
<sitem>
2000-03-15: pvb: cleaned up description of lexical reps for numeric
types
</sitem>
<sitem>
2000-03-15: pvb: added some explanatory text to the beginning of
sections 4 and 5
</sitem>
<sitem>
2000-03-15: pvb: made it clear (in section 4.1) that a datatype's
facets consist of the facets directly specified in the defn as well
as the set inherited from its basetype
</sitem>
<sitem>
2000-03-15: pvb: cleaned up datatype-valid "validity constribution".
</sitem>
<sitem>
2000-03-15: pvb: added facet-valid "validity contributions" for each
facet in section 4 (some just stubs at this point)
</sitem>
<sitem>
2000-03-15: pvb: moved bibl for clinger1990 from non-normative to
normative, since we are now requiring his "best approximation" for
float/double
</sitem>
<sitem>
2000-03-16: am: Changed section 2.5.1.2 List Datatypes
</sitem>
<sitem>
2000-03-16: am: Changed section 5.1.2 List Datatype
</sitem>
<sitem>
2000-03-16: am: Changed section 5.2.1 Length example
</sitem>
<sitem>
2000-03-16: am: Fixed sections 5.1.13 and 5.2.14
</sitem>
<sitem>
2000-03-16: am: Changed section on lex rep for
unsignedLong, unsignedInt, unsignedShort and unsignedByte to remove
optional sign (after all, they are "unsigned").  Also fixed examples.
</sitem>
<sitem>
2000-03-16: am: Changed lex rep section for timePeriod.
</sitem>
<sitem>
2000-03-16: am: Changed section on timePeriod.
</sitem>
<sitem>
2000-03-16: am: Removed 2 ednotes from date section.
</sitem>
<sitem>
2000-03-16: am: Removed ednote from month.  Fixed description.
</sitem>
<sitem>
2000-03-16: am: Removed ednote from year.  Fixed description.
</sitem>
<sitem>
2000-03-16: am: Removed ednote from century.  Fixed description.
</sitem>
<sitem>
2000-03-16: am: Removed ednotes from recurringDate.  Fixed description.
</sitem>
<sitem>
2000-03-16: am: Removed ednotes from recurringDay.
</sitem>
<sitem>
2000-03-16: am: Added wording to 4.2.4 and 4.2.5
</sitem>
<sitem>
2000-03-16: am: Removed ednotes from section 4 sections on min/max
inclusive/exclusive.  dates and times compare chronologically.
</sitem>
<sitem>
2000-03-16: pvb: fixed several problems with the regex appx:
a) a branch is 0 or more (not 1 or more) (empty regex matches the empty
string);
b) added numeric quantifiers ({n,m}, etc.);
c) fixed bug if meaning of S*;
d) added { and } to list of metacharacters and "single character escapes";
e) noted that a "normal character" can be represented as a character
reference;
f) added syntax for identifying blocks (e.g., \p{IsBasicLatin})
</sitem>
<sitem>
2000-03-16: pvb: make QName into a primitive, with value space the
set of tuples {namespace name, localPart}.  Semantically, this is how it
should be defined, but it kind of breaks our type system: QName is now
clearly not an atomic type (it is an aggregate defined in terms of two
other existing types), which means that it shouldn't be primitive and
should be derived, but we don't have type generators...oh, well.
</sitem>
<sitem>
2000-03-16: pvb: uriReference lexical space now specified as strings
matching the URI-reference production from RFC 2396...still need to
generate a regex corresponding to that production
</sitem>
<sitem>
2000-03-17: pvb: moved all COS constraints into the appropriate
subsection of section 4 "datatype components"
</sitem>
<sitem>
2000-03-17: pvb: clarified statement in enumeration facet that it
imposes no order on the value space constructed
</sitem>
<sitem>
2000-03-17: pvb: clarified precision/scale to be a maximum number
of digits
</sitem>
<sitem>
2000-03-17: pvb: completed most of the facet-valid
"validity contributions" which began as just stubs, still a few more
to go
</sitem>
<sitem>
2000-03-17: pvb: explicitly defined the notion of an order relation
(which was mentioned, but not defined)
</sitem>
<sitem>
2000-03-17: pvb: corrected defn of string to state that the
order relation (and not the ordered property) as unicode code point
</sitem>
<sitem>
2000-03-17: pvb: clarified length, minLength and maxLength facets;
namely, that string is measured in code points (rather than the ambiguous
"character"), that binary is measured in octets of the binary data
(not the lexical/encoded data), and specified meaning of these facets
for lists (only length was specified before)
</sitem>
<sitem>
2000-03-17: pvb: added defns for "constraint on schema", "schema
representation constraint" and "validation contribution" (largely stolen
from structures) to terminology section
</sitem>
<sitem>
2000-03-17: pvb: replaced Conformance section with a subset of the
equivalent section from structures
</sitem>
<sitem>
2000-03-17: pvb: added schema representation constraints for
multiple patterns and enumerations
</sitem>
<sitem>
2000-03-17: pvb: explicitly defined order relations for
float, double, timeDuration and recurringDuration
</sitem>
<sitem>
2000-04-03: pvb: corrected NOTE on ENTITY datatype to say 'defined in a DTD'
rather than a schema
</sitem>
<sitem>
2000-04-03: pvb: fixed presentation of table in "Constraint on Schemas: applicable facets"
</sitem>
<sitem>
2000-04-03: pvb: replaced empty validity contributions on encoding, duration and
period facet components with NOTEs that they don't participate in validation
</sitem>
<sitem>
2000-04-03: pvb: removed "open issues" appendix
</sitem>
<sitem>
2000-04-03: pvb: removed all terms in the "terminology" section which weren't used...also
made all *uses* of the remaining terms into links to their definitions
</sitem>
<sitem>
2000-04-03: pvb: styled constraints on schema, etc. in tables, with the table header color
coded to indicate the type of constraint
</sitem>
<sitem>
2000-04-03: pvb: modified section on Equality, to note that equality is defined (to be
not equal) across value spaces not related via restriction.
</sitem>
<sitem>
2000-04-03: pvb: incorporated new {schema,dtd} for datatypes
</sitem>
<sitem>
2000-04-04: pvb: replaced ednotes in 5.1.2 with some simple expository text, probably will
need to be expanded on before CR
</sitem>
<sitem>
2000-04-04: pvb: rewrote description of truncated forms of timeDuration, so that
it was more explicit about what is allowed
</sitem>
<sitem>
2000-07-12: pvb: removed note from DTD/Schema for datatypes included in
Appendices A&amp;B which says they aren't normative but that they ones
included in Appednices A&amp;B are:-)
</sitem>
<sitem>
2000-07-12: pvb: added \| as a single character escape in the regex language
</sitem>
<sitem>
2000-07-12: pvb: changed all wording of the form "X is derived from Y by
fixing the value of facet Z to a" to be "X is derived from Y by
setting the value of facet Z to a", to avoid confusion (since we can't [yet]
"fix" a facet value).
</sitem>
<sitem>
2000-07-13: pvb: updated the status of this document section for internal
point release
</sitem>
<sitem>
2000-07-13: pvb: added note to section on order relations, to the effect that
just because this spec doesn't say that a type is ordered doesn't mean that
down-stream apps can't specify some order relation.
</sitem>
<sitem>
2000-07-13: pvb: modified stylesheet to make "priority feedback" issues
more prevalent
</sitem>
<sitem>
200007-13: pvb: modified markup around PFI for decimal to take advantage of
the new stylesheet template for PFIs
</sitem>
<sitem>
2000-07-13: pvb: removed the order relation from string, and hence, the
min/max facets
</sitem>
<sitem>
2000-07-13: pvb: turned the &lt;note> in decimal about wanting feedback
about arbitrary precision into an &lt;ednote role='pf'>, which displays
specially with new stylesheet
</sitem>
<sitem>
2000-07-14: pvb: fixed the stylesheet so that it put a space between
the links "built-in" and "derived" in the auto-generated "Derived types"
subsection of each type definition.
</sitem>
<sitem>
2000-07-14: pvb: created a schema for has-facet and has-property used
in the appinfo of type definitions in the schema for datatypes
</sitem>
<sitem>
2000-07-14: pvb: modified stylesheet to generate the spec from the
modified has-facet and has-property appinfo items
</sitem>
<sitem>
2000-07-15 and 2000-07-16: pvb: my allergies had me in bed all day and
couldn't get anything done
</sitem>
<sitem>
2000-07-17: pvb: almost fixed the bugs introduced by the stylesheet
modifications for has-facet and has-property.  Appendix C still contains
a few type names duplicated under some facets...I'll get that later.
</sitem>
<sitem>
2000-07-18: AM: Fixed typos caught by Susan Lesch in her note to schema-comments of May 12.
</sitem>
<sitem>
2000-07-18: AM: Changed line in date formats to say year 0 not allowed.
</sitem>
<sitem>
2000-07-18: AM: Changed value space for decimal.
</sitem>
<sitem>
2000-07-18: AM: Changed text for recurringDuration.
</sitem>
<sitem>
2000-07-18: AM: Fixed typos in "time".
</sitem>
<sitem>
2000-07-18: pvb: changed has-facet and has-property to hasFacet and hasProperty
</sitem>
<sitem>
2000-07-18: pvb: changed definition of decimal again, to give separate defs
of value space without any facet being valued, with only precision and
with only scale.  This is intended to clarify what is and is not meant by
precision and scale.  Also fixed long standing typo in the equation for
the value space of decimal: i x 10^n corrected to i x 10^-n.
</sitem>
<sitem>
2000-08-07: pvb: finally found error in stylesheet which was causing XT to
have a stackOverflow, preventing the release of this version.
</sitem>
<sitem>
2000-08-15: pvb: added a fixed property to each facet component
</sitem>
<sitem>
2000-08-15: pvb: removed redundant "if"s in many of the Validation Contributions
in section 4
</sitem>
<sitem>
2000-08-15: pvb: removed mention of string from the Validation Contributions
of the order-related facets (min/max inc/exc) in section 4.  This should have been
done in a previous draft when string became unordered.
</sitem>
<sitem>
2000-08-16: pvb: added fixed property to each facet component; added fixed
attribute to each facet element.  Possible problems with the XML repr for
pattern and enumeration still to be worked out.
</sitem>
<sitem>
2000-08-21: pvb: fixed schema dump file, so that stylesheet correctly formats
the value attribute of all facets as being required.
</sitem>
<sitem>
2000-08-21: pvb: fixed stylesheet so that "hex | base64" in the XML Rep for
encoding no longer formated as "| hex | base64"...this also fixed a long standing
bug in the stylesheet such surrounding properly formating of &lt;choice> in content
models
</sitem>
<sitem>
2000-08-22: pvb: added union types
</sitem>
<sitem>
2000-08-23: pvb: changed defn syntax to conform to union proposal, including
changes to stylesheet to get autogenerated text from datatypes.xsd to format
correctly
</sitem>
<sitem>
2000-08-24: pvb: cleaned up a few sections so that they are consistent with
the (now) 3 forms of derivation (where there used to be only 2)
</sitem>
<sitem>
2000-08-24: pvb: marked app B (DTD) as non-normative
</sitem>
<sitem>
2000-08-30: AM: added definition of canonical form as 2.4.
</sitem>
<sitem>
2000-08-30: AM: added canonical forms for all built-in datatypes.
</sitem>
<sitem>
2000-08-30: AM: changed lex space for boolean to {true, false}.
</sitem>
<sitem>
2000-08-31: AM: removed fixed property from pattern and enumeration
pending resolution of how to handle these two cases.
</sitem>
<sitem>
2000-08-31: AM: fixed syntax for examples.  Added "fixed" for 2 examples.
</sitem>
<sitem>
2000-08-31: AM: removed pattern facet from binary.
</sitem>
<sitem>
2000-08-31: AM: changed value space for timeDuration.  Some bug fixes to
Appendix D.
</sitem>

PR commented out ended here

<sitem>
2000-09-28: PVB: fixed syntax errors in example schemas for "Derivation by Union"
and "enumeration" facet.
</sitem>
<sitem>
2000-09-28: PVB: fixed typos in content models of restriction, list and union
in section "XML Representation of Datatype Definitions".  Still need to fix stylesheet
to correctly generate "List of QName" for the type of the memberTypes attribute
on union.
</sitem>
<sitem>
2000-09-28: PVB: fixed typo in section on equality, where "restriction" was left
out of the final sentence, beginning "By definition".
</sitem>
<sitem>
2000-09-28: PVB: added appropriate definitions for a list's "itemType" and
a union's "memberTypes".
</sitem>
<sitem>
2000-09-28: PVB: folded old Constraint on Schemas: length and maxLength into
the existing Constraint on Schemas: length and minLength
</sitem>
<sitem>
2000-09-28: PVB: fixed many typos as reported by Wayne Carr in post on
2000-09-17.
</sitem>
<sitem>
2000-09-29: PVB: fixed NOTATION datatype, by requiring at least one enumeration
facet and further requiring that all enumeration facets name a declared notation.
Folded the old "NOTATION declared" constraint into a new COS: "enumeration required
for NOTATION"
</sitem>
<sitem>
2000-09-29: PVB: changed SVC "encoding required" to a COS.
</sitem>
<sitem>
2000-09-29: PVB: implemented WG decision in LC-7: minimum number of
decimal digits for precision.
</sitem>
<sitem>
2000-09-29: PVB: started removing inconsistencies introduced by the presence
of list and union as derivation methods: i.e., it is no longer the case that
all derived types have a base type, it is only those types derived by
restriction that do (lists have itemType's, while unions have memberTypes).
Still have much more to clean up in this regard tho, including rework in
sections 4.1 and 5.1.
</sitem>
<sitem>
2000-09-29: PVB: updated the schema and datatypes namespaces to be consistent
with the Hawthorne votes
</sitem>
<sitem>
2000-10-02: AM: fixed value space for recurring duration.
</sitem>
<sitem>
2000-10-02: AM: added info about timeDuration to Appendix D.
</sitem>
<sitem>
2000-10-02: AM: rewrote order property for timeDuration and recurringDuration.
</sitem>
<sitem>
2000-10-02: AM: added canonical lexical forms for list and union.
</sitem>
<sitem>
2000-10-04: PVB: minor editorial fix in prose describing recurringDuration
and timeDuration
</sitem>
<sitem>
2000-10-04: PVB: fixed lexical space of NOTATION to be the set of names of
declared NOTATIONs and added the fact that NOTATION is derived from QName.
</sitem>
<sitem>
2000-10-05: PVB: added S{n} to the regex language, which should have been
there all the time (equiv to S{n,n})
</sitem>
<sitem>
2000-10-06: PVB: added whiteSpace facet, component def and XML Rep for it.
</sitem>
<sitem>
2000-10-06: PVB: changed the initial wording of CVC Datatype Valid to
say that "a string is..." instead of "a sequence of char info items is...".
Makes the spec more generally applicable.
</sitem>
<sitem>
2000-10-06: PVB: flushed out schema components and XML representation/
property mapping, to encorporate derivation by restriction, list
and union
</sitem>
<sitem>
2000-10-06: PVB: sync'd the acknowledgement sections with Part 1
</sitem>
<sitem>
2000-10-06: PVB: flushed out the schema for datatypes, such that all
datatype definitions have an id attribute, all  elements involved in
datatype definitions also now have an id attribute.  Each
built-in datatype definition has a documentation annotation that
points to the section of the spec where that datatype is described;
each element used for facets also has a documentation annotation
that points to the section of the spec where that facet is defined.
</sitem>
<sitem>
2000-10-11: PVB: fixed bug in SVC that said that union/@memberTypes and
union/child::simpleType were mutually exclusive...the corrected constraint
is simply that at least one of them must be valued.
</sitem>
<sitem>
2000-10-11: PVB: fixed the broken link on the XML Rep for union, to point
to the Datatype Definition component (there is no union component).
</sitem>
<sitem>
2000-10-16: PVB: clarified property mapping for memberTypes property
in the XML Rep of the Union Element Information Item for Datatype Definitions.
</sitem>
<sitem>
2000-10-16: PVB: fixed typo on the XML Rep of the Union Element Information Item
that incorrectly referred to a "union" schema component.
</sitem>
<sitem>
2000-10-16: PVB: fixed many broken links
</sitem>
<sitem>
2000-10-16: PVB: added xml:lang='en' to all documentation elements in
the schema for datatypes
</sitem>
<sitem>
2000-10-18: PVB: fixed typo in century which said that 20 was the lexical
for the 19th century...it is now 19 is the literal for 20th century
</sitem>
<sitem>
2000-10-18: PVB: fixed copy-paste typos in specification of min/maxLength
facet, which said just "length" in several places
</sitem>
<sitem>
2000-10-18: PVB: removed mention of character info items in the definition
of lexical space (and literal)
</sitem>
<sitem>
2000-10-18: PVB: cleared up ambiguous (many) uses of the word "may" that were
not used in the sense of the term "may" in the Terminology section...made sure
that all correct uses of "may" were linked to the definition
</sitem>
<sitem>
2000-10-18: PVB: definition of match aligned with XML 1.0 2e
</sitem>
<sitem>
2000-10-18: PVB: changed string length-related facets to be measured in
terms of XML 1.0 characters instead of code points
</sitem>
<sitem>
2000-10-18: PVB: added note to string length-related facets stating that
length may not be what some users perceive as the "string length"
</sitem>
<sitem>
2000-10-18: PVB: changed example in description of hex encoding to something
more "binary"
</sitem>
<sitem>
2000-10-18: PVB: clarified value space of string in terms of XML 1.0 characters.
</sitem>
<sitem>
2000-10-18: PVB: fixed (thought this was already done, but I guess not) Appdx
D to note that hours range form 0-23, minutes from 0-59 and seconds from 0-59 or
0-60 in the case of leap seconds.
</sitem>
<sitem>
2000-10-18: PVB: definition of language now references the "Language Identifiers"
section in XML 1.02e instead of the LanguageID production (which is gone in 2e).
</sitem>
<sitem>
2000-10-18: PVB: added a PFR requesting advice on whether future versions should
allow embedded white space in regex's.
</sitem>
<sitem>
2000-10-18: PVB: removed Cs property from regex language and added note stating
why it is the only property not allowed
</sitem>
<sitem>
2000-10-18: PVB: fixed typo in character range expansion of \w escape in
the regex language
</sitem>
<sitem>
2000-10-18: PVB: now sites XML 1.0 2e and Unicode 3 normatively, and ISO 10646
and Unicode 2 non-normatively.
</sitem>
<sitem>
2000-10-18: PVB: added note stating that conforming processors are only required
to support the Unicode char props and block names in the regex language are are
current at the time this spec goes to Rec, but that implementors are encouraged
to provide access to future revisions to Unicode.
</sitem>
<sitem>
2000-10-18: PVB: added note about possible future support for "Level 2" in
regex's
</sitem>
<sitem>
2000-10-18: PVB: changed body-temp example from fahrenheit to celsius
</sitem>
<sitem>
2000-10-18: PVB: added xml:lang='en' to all documentation annotations in
the schema for datatypes
</sitem>
<sitem>
2000-10-19: PVB: added note to the effect that recurringDuration won't meet
the needs of all calendaring/scheduling applications
</sitem>
<sitem>
2000-10-19: PVB: added PFR to recurringDuration asking for interop feedback
not just between schema processors but with other date/time systems
</sitem>
<sitem>
2000-10-19: PVB: added PFR regarding order-relation on timeDuration
</sitem>
<sitem>
2000-10-19: PVB: added note on uriReference about hex encoding and
possible "out-of-sync" problems with XMl 1.0, XPointer and CharMod.
</sitem>
<sitem>
2000-10-19: PVB: removed ednote on pattern for binary
</sitem>
<sitem>
2000-11-21: AM: added sentence on float and double special values.
</sitem>
<sitem>
2000-11-22: AM: fixed minor bugs in lexical and canonical representations of the date/time datatypes.
</sitem>
<sitem>
2000-11-27: AM: removed century and recurringDuration.  Made timeInstant,
timePeriod, recurringDate, recurringDay primitive.
</sitem>
<sitem>
2000-11-27: AM: renamed CDATA to normalizedString.
</sitem>
<sitem>
2000-11-28: AM: made timeInstant and timePeriod primitive datatypes.
Also, recurringDate and recurringDay.
</sitem>
<sitem>
2000-11-28: AM: added new sections on order relations for timeDuration and
timeInstant.  Added Appendix E on addition of timeInstant and durations.
</sitem>
<sitem>
2000-11-28: AM: changed canonical representation for decimal.
</sitem>
<sitem>
2000-11-28: AM: made all date/time datatypes primitive types.
</sitem>
<sitem>
2000-11-28: AM: changed recurringDate to gMonthDay, recurringDay to day and month to yearMonth.
</sitem>
<sitem>
2000-12-21: AM: fixed NMTOKENS, ENTITIES, IDREFS to have minLength = 1.
</sitem>
<sitem>
2000-12-21: AM: changed introductory section on order facet to discuss partial order..
</sitem>
<sitem>
2001-01-22: am: added 1 and 0 to lexical space of boolean.  Created placeholder
section for canonical representtaion for boolean.
</sitem>
<sitem>
2001-01-22: am: Changed section on facet comparison for timeDuration.
</sitem>
<sitem>
2001-01-22: am: Changed name timeDuration to duration and timeInstant to dateTime.
</sitem>
<sitem>
2001-01-22: am: Removed binary.  Replaced with hexBinary and base64Binary.
Removed encoding facet.
</sitem>
<sitem>
2001-02-16: PVB: A whole host of changes that I haven't documented yet.
</sitem>
<sitem>
2001-03-01: PVB: changed the name of uriReference to anyURI as a result
of vote at boston f2f descision
</sitem>
<sitem>
2001-03-08: PVB: moved references to unicode and ISO 10646 to the non-normative
section, since we get their content through the normative ref to XML 1.02e.
</sitem>
<sitem>
2001-03-08: PVB: correctly updated reference to the Jan 2001 CharMod draft
</sitem>
<sitem>
2001-03-08: PVB: removed all Priority Feedback Requests
</sitem>
<sitem>
2001-03-11: PVB: changed am's affiliation
</sitem>
<sitem>
2001-03-11: PVB: added the ability to make a simpleType final, thus
blocking any further derivation
</sitem>
<sitem>
2001-03-11: PVB: added the text that has always been in the schema for
datatypes regarding the unique IDs for datatypes, facets, and datatype/facet
pairs to the beginning of section 3.
</sitem>
<sitem>
2001-03-11: PVB: added language intended to clarify the why the built-in
types are defined in both the schema NS and in the built-in NS
</sitem>
<sitem>
2001-03-11: PVB: added {true,false} as the canonical rep for boolean
</sitem>
<sitem>
2001-03-11: PVB: added definition for derivation by restriction, which
makes it clear that a restriction must result in subseted value space
</sitem>
<sitem>
2001-03-11: PVB: added a SRC which rules out multiple occurances of
facets, other than pattern and enumeration
</sitem>
<sitem>
2001-03-11: PVB: removed fixed attribute from pattern and enumeration facets
</sitem>
<sitem>
2001-03-11: PVB: added note that spaces are discouraged in anyURI
</sitem>
<sitem>
2001-03-11: PVB: added note clarifying that a namespace decl must be
in scope for the lexical-to-value space mapping
</sitem>
<sitem>
2001-03-11: PVB: added "related by union" to the clause that equality
clause that says that values from unrelated types are not equal.
</sitem>
<sitem>
2001-03-11: PVB: fixed definition(s) of bounded, such that the bound
does not necessarily have to be in the value space (to account for
min/maxExclusive) and modified the definitions of min/maxExclusive to
reference the new definitions
</sitem>
<sitem>
2001-03-12: PVB: fixed typo ("although [not=>no] value space...") in
definition of cardinality
</sitem>
<sitem>
2001-03-13: PVB: changed name of decimal to number; precision to totalDigits
and scale to fractionDigits
</sitem>
<sitem>
2001-03-14: pvb: removed references to Unicode and 10646 (but kept
normative ref to the Unicode DB)
</sitem>
<sitem>
2001-03-14: pvb: changed names of day, month, year, monthDay and yearMonth
to gDay, gMonth, gYear, gMonthDay and gYearMonth; also added health warnings
that conversion to other calendar systems may not result in simple values
</sitem>
<sitem>
2001-03-14: pvb: added a note about how to get AND behavior with
patterns
</sitem>
<sitem>
2001-03-14: pvb: updated description of value/lexical space of anyURI,
including note that scheme-specific syntax checking is not part of
type validity.  Also added note that spaces are discouraged, and added
anyURI to the discussion in the section on lists of types with spaces.
</sitem>
<sitem>
2001-03-14: pvb: added health warning to string, stating that it isn't
always appropriate for text
</sitem>
<sitem>
2001-03-14: pvb: made NOTATION primitive, made the value space all QNames,
and removed the constraint that the enumeration given must be that of
the name of a notation declared in the schema.
</sitem>
<sitem>
2001-03-14: pvb: added note that AM used to work for IBM and that his
participation until now was supported by IBM
</sitem>
<sitem>
2001-03-14: pvb: removed Cs from the legal properties in the regex BNF
(it was already absent from the table of properties)
</sitem>
<sitem>
2001-03-14: pvb: removed surrogate blocks from the BlockNames table in
the regex appendix
</sitem>
<sitem>
2001-03-15: pvb: fixed one remaining problem in the defns for bounds
introduced on 2001-03-11.
</sitem>
<sitem>
2001-03-15: pvb: changed all occurances of "namespace URI" to "namespace name"
to be consistent with the latest Infoset draft
</sitem>
<sitem>
2001-03-15: pvb: renamed datatype definition component as simple type definition
component; changed itemType and memberTypes properties to "item type" and "member types"
</sitem>
<sitem>
2001-03-15: pvb: added components for all fundamental facets; moved the
prose that specified how they get their values from the simple type definition
component to each individual component.
</sitem>
<sitem>
2001-03-15: pvb: changed wording in property mapping of annoations to be
the same as that in structures
</sitem>
<sitem>
2001-03-15: pvb: changed final from a boolean to {restirction, list, union}
</sitem>
<sitem>
2001-03-15: pvb: changed pattern-valid and datatype-valid constraints
to check pattern against the lexical-space
</sitem>
<sitem>
2001-03-15: pvb: added "F restriction valid" COS's that rule out all
forms of invalid restriction for each facet F
</sitem>
<sitem>
2001-03-15: pvb: cleaned up equality, and partial and total orders
</sitem>
<sitem>
2001-03-30: pvb: changed name of number back to decimal
</sitem>
 End of commented out section -->
<sitem>
2001-04-03: pvb: added 0-9 to IsBlock production (to cover Latin1-Suppliment)
</sitem>
<sitem>
2001-04-03: pvb: fixed typos in \w (word char) multi-char escape:
\p{S} -> \p{Z} and "control" -> "other"
</sitem>
<sitem>
2001-04-03: pvb: modified the pattern facet on language in the schema
for datatypes to restrict sub-tags to no more than 8 chars, and changed
the xsd:documentation to discuss section 2.12 of XML 1.02e and RFC 1766
instead of "production 33 of XML 1.0".
</sitem>
<sitem>
2001-04-03: pvb: fixed the order relation on duration from x &lt;= y iff s+x &lt;= s+y
</sitem>
<sitem>
2001-04-03: pvb: fixed incorrect values in duration partial order table (from
&lt;= and >= to &lt;>.
</sitem>
<sitem>
2001-04-03: pvb: clarified a misleading statement in the lexical representation
for durations regarding the omitition of "lower order items".
</sitem>
<sitem>
2001-04-03: pvb: clarified COS "maxInclusive-maxExclusive" and "minInclusive and minExclusive"
to note that the prohibitions are within a single derivation step
</sitem>
<sitem>
2001-04-03: pvb: {typ,think}os in definition of restriction: missing "when" added
and "one or more facet" changed to "zero or more"
</sitem>
<sitem>
2001-04-03: pvb: added gYearMonth and gDay to the list of types for which
appendix E applies
</sitem>
<sitem>
2001-04-03: pvb: fixed incorrect comparisons in dateTime order relation algorithm
(from &lt;= to &lt; and >= to >.
</sitem>
<sitem>
2001-04-03: pvb: in COS "maxExclusive-valid-restriction", fixed 2nd clause:
{value} >= maxInclusive(parent) -> {value} > maxInclusive(parent)
</sitem>
<sitem>
2001-04-03: pvb: in COS "minExclusive-valid-restriction", fixed 1st clause:
{value} > minExclusive(parent) -> {value} &lt; minExclusive(parent)
</sitem>
<sitem>
2001-04-04: pvb: in COS "minExclusive-valid-restriction", fixed 3rd clause:
{value} &lt;= minInclusive(parent) -> {value} &lt; minInclusive(parent)
</sitem>
<sitem>
2001-04-04: pvb: in COS "length-valid-restriction", fixed:
{value} > length(parent) -> {value} != length(parent)
</sitem>
<sitem>
2001-04-04: pvb: changed antisymmetry to asymmetry in description of
properties of partial orders: a R b and b R a ==> a = b -> a R b ==> not(b R a)
</sitem>
<sitem>
2001-04-04: pvb: fixed how cardinality gets valued for atomic types...if
base is finite, then restriction is finite; else, added length, maxLength,
totalDigits and fractionDigits to the list of facets which guarantee finite.
</sitem>
<sitem>
2001-04-10: pvb: fixed typo in schema def of ENTITIES;
&lt;xs:minLength value="1" id="ENTITES.minLength"/> went to
&lt;xs:minLength value="1" id="ENTITIES.minLength"/>
</sitem>
<sitem>
2001-04-12: pvb: added canonical form for hexBinary
</sitem>
<sitem>
2001-04-23: pvb: completed first pass at "refactoring": bringing all
there is to know about any concept (e.g., a facet) into the same section,
instead of having it spread all over the spec...thus, making this spec
closer in organization to part 1.
</sitem>
<sitem>
2001-04-23: pvb: brought the stylesheet for parts 1 and 2 into alignment,
so that both parts can use the same stylesheet.
</sitem>
<sitem>
2001-04-24: pvb: fixed several occurances of &lt;xspecref> which should have
been &lt;xnt> (e.g., Name and NCName)
</sitem>
<sitem>
2001-04-24: pvb: fixed order in which derived types are listed in section 3
</sitem>
<sitem>
2001-04-25: pvb: removed dichot vs. tricot ednote
</sitem>
<sitem>
2001-04-25: pvb: clarified that optional + sign is not allowed in mantisa or
exponent of canon rep for float/double
</sitem>
<sitem>
2001-04-25: pvb: clarified that both hh:mm are required for time zones
</sitem>
<sitem>
2001-04-25: pvb: fixed bug in dateTime normalization example
</sitem>
<sitem>
2001-04-25: pvb: fixed bug in indeterminate dateTime compare example
</sitem>
<sitem>
2001-04-25: pvb: updated reference to unicode char db 3.1, as well as
the table of block names and general category values accordingly
</sitem>
<sitem>
2001-04-26: pvb: rewrote enumeration valid constraint to be less confusing
</sitem>
<sitem>
2001-04-26: pvb: corrected description of how cardinality gets valued to
account for date types
</sitem>
<sitem>
2001-04-26: pvb: corrected signs of timezones in clauses C and D of dateTime
comparison algorithm
</sitem>
<sitem>
2001-04-26: pvb: added note to ENTITY specifying value space is scoped, like the
one in ENTITIES
</sitem>
<sitem>
2001-04-26: pvb: clarified that only the seconds part of durations may specify
fractions
</sitem>
<sitem>
2001-04-26: pvb: corrected incorrect namespace name in section 3
</sitem>
<sitem>
2001-04-26: pvb: added "...(and other relevant portions of section 4)..." to
the part of conformance that references the XML Rep of simple type defns.
</sitem>
<sitem>
2001-04-26: pvb: moved equal to section 4
</sitem>
<sitem>
2001-04-26: pvb: added fact that canonical rep for midnight is 00:00:00 to
time
</sitem>
<sitem>
2001-04-26: pvb: added note to ordered and bounded that when inheriting value
from basetype, the value for primitive types is in appx C.
</sitem>
<sitem>
2001-04-26: pvb: removed {pos,neg}CharGroupND productions from regex and
redefined the charClassSub production as :== ( posCharGroup | negCharGroup) '-' charClassExpr
(and moved a few other productions around as a result)
</sitem>
<sitem>
2003-03-05: pvb: errata: added "line feed (#xA)" to the list of chars excluded from
the lexical space of normalizedString
</sitem>
<sitem>
2003-03-05: pvb: errata: corrected regex in 2e example in 2.5.1.2 and
changed all mention of "whitespace" to "space" in descriptions of the
lexical space of lists
</sitem>
<sitem>
2003-03-05: pvb: errata: removed mention of {total,fraction}Digits from description of
lexical representation of decimal
</sitem>
<sitem>
2003-03-05: pvb: errata: changed {total,fraction}Digits validation rules to talk about
"numbers expressible as ix10^-n",etc. instead of "number of digits = xxx".
</sitem>
</slist>
</revisiondesc>
</header>
<body>
<div1 id="Intro">
<head>Introduction</head>
<div2 id="purpose">
<head>Purpose</head>
<p>
The <bibref ref="XML"/> specification defines limited
facilities for applying datatypes to document content in that documents
may contain or refer to DTDs that assign types to elements and attributes.
However, document authors, including authors of traditional
<emph>documents</emph> and those transporting <emph>data</emph> in XML,
often require a higher degree of type checking to ensure robustness in
document understanding and data interchange.
</p>
<p>
The table below offers two typical examples of XML instances
in which datatypes are implicit: the instance on the left
represents a billing invoice, the instance on the
right a memo or perhaps an email message in XML.
</p>
<table class="dtdemo" border="1">
<thead>
<tr>
<th>Data oriented</th>
<th>Document oriented</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<eg><![CDATA[<invoice>
  <orderDate>1999-01-21</orderDate>
  <shipDate>1999-01-25</shipDate>
  <billingAddress>
   <name>Ashok Malhotra</name>
   <street>123 Microsoft Ave.</street>
   <city>Hawthorne</city>
   <state>NY</state>
   <zip>10532-0000</zip>
  </billingAddress>
  <voice>555-1234</voice>
  <fax>555-4321</fax>
</invoice>]]></eg>
</td>
<td>
<eg><![CDATA[<memo importance='high'
      date='1999-03-23'>
  <from>Paul V. Biron</from>
  <to>Ashok Malhotra</to>
  <subject>Latest draft</subject>
  <body>
    We need to discuss the latest
    draft <emph>immediately</emph>.
    Either email me at <email>
    mailto:paul.v.biron@kp.org</email>
    or call <phone>555-9876</phone>
  </body>
</memo>]]></eg>
</td>
</tr>
</tbody>
</table>
<p>
The invoice contains several dates and telephone numbers, the postal
abbreviation for a state
(which comes from an enumerated list of sanctioned values), and a ZIP code
(which takes a definable regular form).  The memo contains many
of the same types of information: a date, telephone number, email address
and an "importance" value (from an enumerated
list, such as "low", "medium" or "high").  Applications which process
invoices and memos need to raise exceptions if something that was
supposed to be a date or telephone number does not conform to the rules
for valid dates or telephone numbers.
</p>
<p>
In both cases, validity constraints exist on the content of the
instances that are not expressible in XML DTDs.  The limited datatyping
facilities in XML have prevented validating XML processors from supplying
the rigorous type checking required in these situations.  The result
has been that individual applications writers have had to implement type
checking in an ad hoc manner.  This specification addresses
the need of both document authors and applications writers for a robust,
extensible datatype system for XML which could be incorporated into
XML processors.  As discussed below, these datatypes could be used in other
XML-related standards as well.
</p>
</div2>
<div2 id="requirements">
<head>Requirements</head>
<p>
The <bibref ref="schema-requirements"/> document spells out
concrete requirements to be fulfilled by this specification,
which state that the XML Schema Language must:
</p>
<olist>
<item>
<p>
provide for primitive data typing, including byte, date,
integer, sequence, SQL and Java primitive datatypes, etc.;
</p>
</item>
<item>
<p>
define a type system that is adequate for import/export
from database systems (e.g., relational, object, OLAP);
</p>
</item>
<item>
<p>
distinguish requirements relating to lexical data representation
vs. those governing an underlying information set;
</p>
</item>
<item>
<p>
allow creation of user-defined datatypes, such as
datatypes that are derived from existing datatypes and which
may constrain certain of its properties (e.g., range,
precision, length, format).
</p>
</item>
</olist>
</div2>
<div2 id="scope">
<head>Scope</head>
<p>
This portion of the XML Schema Language discusses datatypes that can be
used in an XML Schema.  These datatypes can be specified for element
content that would be specified as
<xspecref href="&xmlspec;#dt-chardata">#PCDATA</xspecref> and attribute
values of <xspecref href="&xmlspec;#sec-attribute-types">various
types </xspecref> in a DTD.  It is the intention of this specification
that it be usable outside of the context of XML Schemas for a wide range
of other XML-related activities such as <bibref ref="XSL"/> and
<bibref ref="RDFSchema"/>.
</p>
</div2>
<div2 id="terminology">
<head>Terminology</head>
<p>
The terminology used to describe XML Schema Datatypes is defined in the
body of this specification. The terms defined in the following list are
used in building those definitions and in describing the actions of a
datatype processor:
</p>
<glist>
<gitem>
<label>
<termdef id="dt-compatibility" term="for compatibility">
for compatibility</termdef>
</label>
<def>
<p>
A feature of this specification included solely to ensure that schemas
which use this feature remain compatible with <bibref ref="XML"/>
</p>
</def>
</gitem>
<gitem>
<label>
<termdef id="dt-may" term="may">
<term>may</term>
</termdef>
</label>
<def>
<p>
Conforming documents and processors are permitted to but need
not behave as described.
</p>
</def>
</gitem>
<gitem>
<label>
<termdef id="dt-match" term="match">
<term>match</term>
</termdef>
</label>
<def>
<p>
(Of strings or names:) Two strings or names being compared must be
identical. Characters with multiple possible representations in ISO/IEC 10646 (e.g.
characters with both precomposed and base+diacritic forms) match only if they have
the same representation in both strings. No case folding is performed. (Of strings and
rules in the grammar:) A string matches a grammatical production if it belongs to the
language generated by that production.
</p>
</def>
</gitem>
<gitem>
<label>
<termdef id="dt-must" term="must">
<term>must</term>
</termdef>
</label>
<def>
<p>
Conforming documents and processors are required to behave as
described; otherwise they are in <termref def="dt-error">error</termref>.
</p>
</def>
</gitem>
<gitem>
<label>
<termdef id="dt-error" term="error">
<term>error</term>
</termdef>
</label>
<def>
<p>
A violation of the rules of this specification; results are undefined.
Conforming software <termref def="dt-may"/> detect and report an
<term>error</term> and <termref def="dt-may"/> recover from it.
</p>
</def>
</gitem>
</glist>
</div2>
<div2 id="constraints-and-contributions">
<head>Constraints and Contributions</head>
<p>
This specification provides three different kinds of normative
statements about schema components, their representations in XML and
their contribution to the schema-validation of information items:
</p>
<glist>
<gitem>
<label>
<termdef id="dt-cos" term="Constraint on Schemas">
<term>Constraint on Schemas</term>
</termdef>
</label>
<def>
<p>
Constraints on the schema components themselves, i.e. conditions
components <termref def="dt-must"/> satisfy to be components at all.
Largely to be found in <specref ref="datatype-components"/>.
</p>
</def>
</gitem>
<gitem>
<label>
<termdef id="dt-src" term="Schema Representation Constraint">
<term>Schema Representation Constraint</term>
</termdef>
</label>
<def>
<p>
Constraints on the representation of schema components in XML.  Some but
not all of these are expressed in <specref ref="schema"/> and
<specref ref="dtd-for-datatypeDefs"/>.
</p>
</def>
</gitem>
<gitem>
<label>
<termdef id="dt-cvc" term="Validation Rule">
<term>Validation Rule</term>
</termdef>
</label>
<def>
<p>
Constraints expressed by schema components which information
items <termref def="dt-must"/> satisfy to be schema-valid.  Largely
to be found in <specref ref="datatype-components"/>.
</p>
</def>
</gitem>
</glist>
</div2>
</div1>
<div1 id="typesystem">
<head>Type System</head>
<p>
This section describes the conceptual framework behind the type system
defined in this specification.  The framework has been influenced by the
<bibref ref="ISO11404"/> standard on language-independent datatypes as
well as the datatypes for <bibref ref="SQL"/> and for programming
languages such as Java.
</p>
<p>
The datatypes discussed in this specification are computer
representations of well known abstract concepts such as
<emph>integer</emph> and <emph>date</emph>. It is not the place of this
specification to define these abstract concepts; many other publications
provide excellent definitions.
</p>
<div2 id="datatype">
<head>Datatype</head>
<p>
<termdef id="dt-datatype" term="datatype">In this specification,
a <term>datatype</term> is a 3-tuple, consisting of
a) a set of distinct values, called its <termref def="dt-value-space"/>,
b) a set of lexical representations, called its
<termref def="dt-lexical-space"/>, and c) a set of <termref def="dt-facet"/>s
that characterize properties of the <termref def="dt-value-space"/>,
individual values or lexical items.
</termdef>
</p>
</div2>
<div2 id="value-space">
<head>Value space</head>
<p>
<termdef id="dt-value-space" term="value space">A <term>value
space</term> is the set of values for a given datatype.
Each value in the <term>value space</term> of a datatype is denoted by
one or more literals in its <termref def="dt-lexical-space"/>.
</termdef>
</p>
<p>
The <termref def="dt-value-space"/> of a given datatype can
be defined in one of the following ways:
<ulist>
<item>
<p>
defined axiomatically from fundamental notions (intensional definition)
[see <termref def="dt-primitive"/>]
</p>
</item>
<item>
<p>
enumerated outright (extensional definition)
[see <termref def="dt-enumeration"/>]
</p>
</item>
<item>
<p>
defined by restricting the <termref def="dt-value-space"/> of
an already defined datatype to a particular subset with a given set
of properties [see <termref def="dt-derived"/>]
</p>
</item>
<item>
<p>
defined as a combination of values from one or more already defined
<termref def="dt-value-space"/>(s) by a specific construction procedure
[see <termref def="dt-list"/> and <termref def="dt-union"/>]
</p>
</item>
</ulist>
</p>
<p>
<termref def="dt-value-space"/>s have certain properties.  For example,
they always have the property of <termref def="dt-cardinality"/>,
some definition of <emph>equality</emph>
and might be <termref def="dt-ordered"/>, by which individual
values within the <termref def="dt-value-space"/> can be compared to
one another.  The properties of <termref def="dt-value-space"/>s that
are recognized by this specification are defined in
<specref ref="fundamental-facets"/>.
</p>
</div2>
<div2 id="lexical-space">
<head>Lexical space</head>
<p>
In addition to its <termref def="dt-value-space"/>, each datatype also
has a lexical space.
</p>
<p>
<termdef term="lexical space" id="dt-lexical-space">A
<term>lexical space</term> is the set of valid <emph>literals</emph>
for a datatype.
</termdef>
</p>
<p>
For example, "100" and "1.0E2" are two different literals from the
<termref def="dt-lexical-space"/> of <dtref ref="float"/> which both
denote the same value. The type system defined in this specification
provides a mechanism for schema designers to control the set of values
and the corresponding set of acceptable literals of those values for
a datatype.
</p>
<note>
<p>
The literals in the <termref def="dt-lexical-space"/>s defined in this specification
have the following characteristics:
</p>
<glist>
<gitem>
<label>
Interoperability:
</label>
<def>
<p>
The number of literals for each value has been kept small; for many
datatypes there is a one-to-one mapping between literals and values.
This makes it easy to exchange the values between different systems.
In many cases, conversion from locale-dependent representations will
be required on both the originator and the recipient side, both for
computer processing and for interaction with humans.
</p>
</def>
</gitem>
<gitem>
<label>
Basic readability:
</label>
<def>
<p>
Textual, rather than binary, literals are used.
This makes hand editing, debugging, and similar activities possible.
</p>
</def>
</gitem>
<gitem>
<label>
Ease of parsing and serializing:
</label>
<def>
<p>
Where possible, literals correspond to those found in common
programming languages and libraries.
</p>
</def>
</gitem>
</glist>
</note>
<div3 id="canonical-lexical-representation">
<head>Canonical Lexical Representation</head>
<p>
While the datatypes defined in this specification have, for the most part,
a single lexical representation i.e. each value in the datatype's
<termref def="dt-value-space"/> is denoted by a single literal in its
<termref def="dt-lexical-space"/>, this is not always the case.  The
example in the previous section showed two literals for the datatype
<dtref ref="float"/> which denote the same value.  Similarly, there
<termref def="dt-may"/> be
several literals for one of the date or time datatypes that denote the
same value using different timezone indicators.
</p>
<p>
<termdef term="canonical lexical representation" id="dt-canonical-representation">A <term>canonical lexical representation</term>
is a set of literals from among the valid set of literals
for a datatype such that there is a one-to-one mapping between literals
in the <term>canonical lexical representation</term> and
values in the <termref def="dt-value-space"/>.
</termdef>
</p>
</div3>
</div2>
<div2 id="facets">
<head>Facets</head>
<p>
<termdef id="dt-facet" term="facet">A <term>facet</term> is a single
defining aspect of a <termref def="dt-value-space"/>.  Generally
speaking, each facet characterizes a <termref def="dt-value-space"/>
along independent axes or dimensions.</termdef>
</p>
<p>
The facets of a datatype serve to distinguish those aspects of
one datatype which <emph>differ</emph> from other datatypes.
Rather than being defined solely in terms of a prose description
the datatypes in this specification are defined in terms of
the <emph>synthesis</emph> of facet values which together determine the
<termref def="dt-value-space"/> and properties of the datatype.
</p>
<p>
Facets are of two types: <emph>fundamental</emph> facets that define
the datatype and <emph>non-fundamental</emph> or <emph>constraining
</emph> facets that constrain the permitted values of a datatype.
</p>
<div3 id="fundamental-facets">
<head>Fundamental facets</head>
<p>
<termdef id="dt-fundamental-facet" term="fundamental facet">
A <term>fundamental facet</term> is an abstract property which
serves to semantically characterize the values in a
<termref def="dt-value-space"/>.
</termdef>
</p>
<p>
All <term>fundamental facets</term> are fully described in
<specref ref="rf-fund-facets"/>.
</p>
</div3>
<div3 id="non-fundamental">
<head>Constraining or Non-fundamental facets</head>
<p>
<termdef id="dt-constraining-facet" term="constraining facet">A
<term>constraining facet</term> is an optional property that can be
applied to a datatype to constrain its <termref def="dt-value-space"/>.
</termdef>
</p>
<p>
Constraining the <termref def="dt-value-space"/> consequently constrains
the <termref def="dt-lexical-space"/>.  Adding
<termref def="dt-constraining-facet"/>s to a <termref def="dt-basetype"/>
is described in <specref ref="derivation-by-restriction"/>.
</p>
<p>
All <term>constraining facets</term> are fully described in
<specref ref="rf-facets"/>.
</p>
</div3>
</div2>
<div2 id="datatype-dichotomies">
<head>Datatype dichotomies</head>
<p>
It is useful to categorize the datatypes defined in this specification
along various dimensions, forming a set of characterization dichotomies.
</p>
<div3 id="atomic-vs-list">
<head>Atomic vs. list vs. union datatypes</head>
<p>
The first distinction to be made is that between
<termref def="dt-atomic"/>, <termref def="dt-list"/> and <termref def="dt-union"/>
datatypes.
</p>
<ulist>
<item>
<p>
<termdef id="dt-atomic" term="atomic">
<term>Atomic</term> datatypes
are those having values which are regarded by this specification as
being indivisible.
</termdef>
</p>
</item>
<item>
<p>
<termdef id="dt-list" term="list">
<term>List</term>
datatypes are those having values each of which consists of a
finite-length (possibly empty) sequence of values of an
<termref def="dt-atomic"/> datatype.
</termdef>
</p>
</item>
<item>
<p>
<termdef id="dt-union" term="union">
<term>Union</term>
datatypes are those whose <termref def="dt-value-space"/>s and
<termref def="dt-lexical-space"/>s are the union of
the <termref def="dt-value-space"/>s and
<termref def="dt-lexical-space"/>s of one or more other datatypes.
</termdef>
</p>
</item>
</ulist>
<p>
For example, a single token which <termref def="dt-match"/>es
<xspecref href="&xmlspec;#NT-Nmtoken">Nmtoken</xspecref> from
<bibref ref="XML"/> could be the value of an <termref def="dt-atomic"/>
datatype (<dtref ref="NMTOKEN"/>); while a sequence of such tokens
could be the value of a <termref def="dt-list"/> datatype
(<dtref ref="NMTOKENS"/>).
</p>
<div4 id="atomic">
<head>Atomic datatypes</head>
<p>
<termref def="dt-atomic"/> datatypes can be either
<termref def="dt-primitive"/> or <termref def="dt-derived"/>.  The
<termref def="dt-value-space"/> of an <termref def="dt-atomic"/> datatype
is a set of "atomic" values, which for the purposes of this specification,
are not further decomposable.  The <termref def="dt-lexical-space"/> of
an <termref def="dt-atomic"/> datatype is a set of <emph>literals</emph>
whose internal structure is specific to the datatype in question.
</p>
</div4>
<div4 id="list-datatypes">
<head>List datatypes</head>
<!-- question: are lists ordered? answer should be NO...the sequence
within a single value is ordered, but the value space is a list type
is not ordered
-->
<p>
Several type systems (such as the one described in
<bibref ref="ISO11404"/>) treat <termref def="dt-list"/> datatypes as
special cases of the more general notions of aggregate or collection
datatypes.
</p>
<p>
<termref def="dt-list"/> datatypes are always <termref def="dt-derived"/>.
The <termref def="dt-value-space"/> of a <termref def="dt-list"/>
datatype is a set of finite-length sequences of <termref def="dt-atomic"/>
values. The <termref def="dt-lexical-space"/> of a
<termref def="dt-list"/> datatype is a set of literals whose internal
structure is a <phrase diff="del">white </phrase>space<phrase diff="add">-</phrase>separated
sequence of literals of the
<termref def="dt-atomic"/> datatype of the items in the
<termref def="dt-list"/>
<phrase diff="del">
(where whitespace <termref def="dt-match"/>es
<xspecref href="&xmlspec;#NT-S">S</xspecref> in <bibref ref="XML"/>)</phrase>.
</p>
<p>
<termdef id="dt-itemType" term="itemType">
The <termref def="dt-atomic"/>
<phrase diff="add">or <termref def="dt-union"/>
</phrase>
datatype that participates in the definition of a <termref def="dt-list"/> datatype
is known as the <term>itemType</term> of that <termref def="dt-list"/> datatype.
</termdef>
</p>
<note role="example">
<eg><![CDATA[
<simpleType name='sizes'>
  <list itemType='decimal'/>
</simpleType>
]]></eg>
<eg><![CDATA[
<cerealSizes xsi:type='sizes'> 8 10.5 12 </cerealSizes>
]]></eg>
</note>
<p>
A <termref def="dt-list"/> datatype can be <termref def="dt-derived"/>
from an <termref def="dt-atomic"/> datatype whose
<termref def="dt-lexical-space"/> allows <phrase diff="del">white</phrase>space
(such as <dtref ref="string"/>
or <dtref ref="anyURI"/>)<phrase diff="add">or a
	<termref def="dt-union"/> datatype any of whose <propref ref="defn-memberTypes"/>'s
	<termref def="dt-lexical-space"/> allows <phrase diff="del">white</phrase>space</phrase>.
In such a case, regardless of the input, list items
will be separated at <phrase diff="del">white</phrase>space boundaries.
</p>
<note role="example">
<eg><![CDATA[
<simpleType name='listOfString'>
  <list itemType='string'/>
</simpleType>
]]></eg>
<eg>
&lt;someElement xsi:type='listOfString'>
this is not list item 1
this is not list item 2
this is not list item 3
&lt;/someElement>
</eg>
<p>
In the above example, the value of the <emph>someElement</emph> element
is not a <termref def="dt-list"/> of <termref def="dt-length"/> 3;
rather, it is a <termref def="dt-list"/> of <termref def="dt-length"/>
18.
</p>
</note>
<!--
     somehow need to get the <has-facets> concept for abstract lists
	 into builtin.xsd, so that the following can be auto-generated
  -->
<p>
When a datatype is <termref def="dt-derived"/> from a
<termref def="dt-list"/> datatype, the following
<termref def="dt-constraining-facet"/>s apply:
</p>
<ulist>
<item>
<p>
<termref def="dt-length"/>
</p>
</item>
<item>
<p>
<termref def="dt-maxLength"/>
</p>
</item>
<item>
<p>
<termref def="dt-minLength"/>
</p>
</item>
<item>
<p>
<termref def="dt-enumeration"/>
</p>
</item>
<item>
<p>
<termref def="dt-pattern"/>
</p>
</item>
<item>
<p>
<termref def="dt-whiteSpace"/>
</p>
</item>
</ulist>
<p>
For each of <termref def="dt-length"/>, <termref def="dt-maxLength"/>
and <termref def="dt-minLength"/>, the <emph>unit of length</emph> is
measured in number of list items.  The value of <termref def="dt-whiteSpace"/>
is fixed to the value <emph>collapse</emph>.
</p>
<p>
<phrase diff="add">
For <termref def="dt-list"/> datatypes the <termref def="dt-lexical-space"/>
<phrase diff="del">(and hence, the <termref def="dt-value-space"/>)</phrase>
is composed of <phrase diff="del">white</phrase>space<phrase diff="add">-</phrase>separated
literals of its <termref def="dt-itemType"/>.  Hence, any
<termref def="dt-pattern"/> specified when a new datatype is
<termref def="dt-derived"/> from a <termref def="dt-list"/> datatype is matched against
each literal of the <termref def="dt-list"/> datatype and
not against the literals of the datatype that serves as its
<termref def="dt-itemType"/>.
</phrase>
</p>
<note role="example" diff="add">
<eg diff="add"><![CDATA[<xs:simpleType name='myList'>
	<xs:list itemType='xs:integer'/>
</xs:simpleType>
<xs:simpleType name='myRestrictedList'>
	<xs:restriction base='myList'>
		<xs:pattern value='123 (\d+\s)*456'/>
	</xs:restriction>
</xs:simpleType>
<someElement xsi:type='myRestrictedList'>123 456</someElement>
<someElement xsi:type='myRestrictedList'>123 987 456</someElement>
<someElement xsi:type='myRestrictedList'>123 987 567 456</someElement>
]]></eg>
</note>
<p>
The <dtref ref="canonical-lexical-representation"/> for the
<termref def="dt-list"/> datatype is defined as the lexical form in which
each item in the <termref def="dt-list"/> has the canonical lexical
representation of its  <termref def="dt-itemType"/>.
</p>
</div4>
<div4 id="union-datatypes">
<head>Union datatypes</head>
<p>
The <termref def="dt-value-space"/> and <termref def="dt-lexical-space"/>
of a <termref def="dt-union"/> datatype are the union of the
<termref def="dt-value-space"/>s and <termref def="dt-lexical-space"/>s of
its <termref def="dt-memberTypes"/>.
<termref def="dt-union"/> datatypes are always <termref def="dt-derived"/>.
Currently, there are no <termref def="dt-built-in"/>&nbsp;<termref def="dt-union"/>
datatypes.
</p>
<note role="example">
<p>
A prototypical example of a <termref def="dt-union"/> type is the
<xspecref href="&xsdl;#p-max_occurs">maxOccurs attribute</xspecref> on the
<xspecref href="&xsdl;#element-element">element element</xspecref>
in XML Schema itself: it is a union of nonNegativeInteger
and an enumeration with the single member, the string "unbounded", as shown below.
</p>
<eg><![CDATA[
  <attributeGroup name="occurs">
    <attribute name="minOccurs" type="nonNegativeInteger"]]><phrase diff="add">use="optional"</phrase><![CDATA[ default="1"/>
    <attribute name="maxOccurs"]]><phrase diff="add">use="optional" default="1"</phrase><![CDATA[>
      <simpleType>
        <union>
          <simpleType>
            <restriction base='nonNegativeInteger'/>
          </simpleType>
          <simpleType>
            <restriction base='string'>
              <enumeration value='unbounded'/>
            </restriction>
          </simpleType>
        </union>
      </simpleType>
    </attribute>
  </attributeGroup>
]]></eg>
</note>
<p>
Any number (greater than 1) of <termref def="dt-atomic"/> or <termref def="dt-list"/>
<termref def="dt-datatype"/>s can participate in a <termref def="dt-union"/> type.
</p>
<p>
<termdef id="dt-memberTypes" term="memberTypes">
The datatypes that participate in the
definition of a <termref def="dt-union"/> datatype are known as the
<term>memberTypes</term> of that <termref def="dt-union"/> datatype.
</termdef>
</p>
<p>
The order in which the <termref def="dt-memberTypes"/> are specified in the
definition (that is, the order of the &lt;simpleType> children of the &lt;union>
element, or the order of the <dtref ref="QName"/>s in the <emph>memberTypes</emph>
attribute) is significant.
During validation, an element or attribute's value is validated against the
<termref def="dt-memberTypes"/> in the order in which they appear in the
definition until a match is found.  The evaluation order can be overridden
with the use of <xspecref href="&xsdl;#xsi_type">xsi:type</xspecref>.
</p>
<note>
<p>
For example, given the definition below, the first instance of the &lt;size> element
validates correctly as an <specref ref="integer"/>, the second and third as
<specref ref="string"/>.
</p>
<eg><![CDATA[
  <xsd:element name='size'>
    <xsd:simpleType>
      <xsd:union>
        <xsd:simpleType>
          <xsd:restriction base='integer'/>
        </xsd:simpleType>
        <xsd:simpleType>
          <xsd:restriction base='string'/>
        </xsd:simpleType>
      </xsd:union>
    </xsd:simpleType>
  </xsd:element>
]]></eg>
<eg><![CDATA[
  <size>1</size>
  <size>large</size>
  <size xsi:type='xsd:string'>1</size>
]]></eg>
</note>
<p> The <dtref ref="canonical-lexical-representation"/> for a
<termref def="dt-union"/> datatype is defined as the lexical form in which
the values have the canonical lexical representation
of the appropriate  <termref def="dt-memberTypes"/>.</p>
<note>
<p>
A datatype which is <termref def="dt-atomic"/> in this specification
need not be an "atomic" datatype in any programming language used to
implement this specification.  Likewise, a datatype which is a
<termref def="dt-list"/> in this specification need not be a "list"
datatype in any programming language used to implement this specification.
Furthermore, a datatype which is a <termref def="dt-union"/> in this
specification need not be a "union" datatype in any programming
language used to implement this specification.
</p>
</note>
</div4>
</div3>
<div3 id="primitive-vs-derived">
<head>Primitive vs. derived datatypes</head>
<p>
Next, we distinguish between <termref def="dt-primitive"/> and
<termref def="dt-derived"/> datatypes.
</p>
<ulist>
<item>
<p>
<termdef id="dt-primitive" term="primitive">
<term>Primitive</term>
datatypes are those that are not defined in terms of other datatypes;
they exist <emph>ab initio</emph>.
</termdef>
</p>
</item>
<item>
<p>
<termdef id="dt-derived" term="derived">
<term>Derived</term>
datatypes are those that are defined in terms of other datatypes.
</termdef>
</p>
</item>
</ulist>
<p>
For example, in this specification, <dtref ref="float"/> is a well-defined
mathematical
<!-- find example other than float -->
concept that cannot be defined in terms of other datatypes, while
a <dtref ref="integer"/> is a special case of the more general datatype
<dtref ref="decimal"/>.
</p>
<p>
<termdef id="dt-anySimpleType" term="anySimpleType" role="local">
<phrase diff="add">
The simple ur-type definition is a special restriction of the
<xtermref href="&xsdl;#key-urType">ur-type definition</xtermref>
whose name is <term>anySimpleType</term> in the XML Schema namespace.
<term>anySimpleType</term> can be
considered as the <termref def="dt-basetype"/> of all <termref def="dt-primitive"/>
datatypes.
<term>anySimpleType</term> is considered to have an unconstrained lexical space and a
<termref def="dt-value-space"/> consisting of the union of the
<termref def="dt-value-space"/>s of all the
<termref def="dt-primitive"/>
datatypes and the set of all lists of all members of the
<termref def="dt-value-space"/>s of all the
<termref def="dt-primitive"/> datatypes.
</phrase>
<phrase diff="del">
There exists a conceptual datatype, whose name is <term>anySimpleType</term>,
that is the simple version of the
<xtermref href="&xsdl;#key-urType">ur-type definition</xtermref> from
<bibref ref="structural-schemas"/>.
<term>anySimpleType</term> can be
considered as the <termref def="dt-basetype"/> of all <termref def="dt-primitive"/>
types.  The <termref def="dt-value-space"/> of <term>anySimpleType</term>
can be considered to be the <termref def="dt-union"/> of the
<termref def="dt-value-space"/>s of all <termref def="dt-primitive"/> datatypes.
</phrase>
</termdef>
</p>
<p>
The datatypes defined by this specification fall into both
the <termref def="dt-primitive"/> and <termref def="dt-derived"/>
categories.  It is felt that a judiciously chosen set of
<termref def="dt-primitive"/> datatypes will serve the widest
possible audience by providing a set of convenient datatypes that
can be used as is, as well as providing a rich enough base from
which the variety of datatypes needed by schema designers can be
<termref def="dt-derived"/>.
</p>
<p>
In the example above, <dtref ref="integer"/> is <termref def="dt-derived"/>
from <dtref ref="decimal"/>.
</p>
<note>
<p>
A datatype which is <termref def="dt-primitive"/> in this specification
need not be a "primitive" datatype in any programming language used to
implement this specification.  Likewise, a datatype which is
<termref def="dt-derived"/> in this specification need not be a
"derived" datatype in any programming language used to implement
this specification.
</p>
</note>
<p>
As described in more detail in <specref ref="xr-defn"/>,
each <termref def="dt-user-derived"/> datatype <termref def="dt-must"/>
be defined in terms of another datatype in one of three ways: 1) by assigning
<termref def="dt-constraining-facet"/>s which serve to <emph>restrict</emph> the
<termref def="dt-value-space"/> of the <termref def="dt-user-derived"/>
datatype to a subset of that of the <termref def="dt-basetype"/>; 2) by creating
a <termref def="dt-list"/> datatype whose <termref def="dt-value-space"/>
consists of finite-length sequences of values of its
<termref def="dt-itemType"/>; or 3) by creating a <termref def="dt-union"/>
datatype whose <termref def="dt-value-space"/> consists of the union of the
<phrase diff="del">
<termref def="dt-value-space"/>
</phrase>
<phrase diff="add">
<termref def="dt-value-space"/>s of</phrase> its <termref def="dt-memberTypes"/>.
</p>
<div4 id="restriction">
<head>Derived by restriction</head>
<p>
<!-- add the exception for pattern -->
<termdef id="dt-restriction" term="restriction">A datatype is said to be
<termref def="dt-derived"/> by <term>restriction</term> from another datatype
when values for zero or more <termref def="dt-constraining-facet"/>s are specified
that serve to constrain its <termref def="dt-value-space"/> and/or its
<termref def="dt-lexical-space"/> to a subset of those of its
<termref def="dt-basetype"/>.
</termdef>
</p>
<p>
<termdef id="dt-basetype" term="base type">Every
datatype that is <termref def="dt-derived"/> by <term>restriction</term>
is defined in terms of an existing datatype, referred to as its
<term>base type</term>. <term>base type</term>s can be either
<termref def="dt-primitive"/> or <termref def="dt-derived"/>.
</termdef>
</p>
</div4>
<div4 id="list">
<head>Derived by list</head>
<p>
A <termref def="dt-list"/> datatype can be <termref def="dt-derived"/>
from another datatype (its <termref def="dt-itemType"/>) by creating
a <termref def="dt-value-space"/> that consists of a finite-length sequence
of values of its <termref def="dt-itemType"/>.
</p>
</div4>
<div4 id="union">
<head>Derived by union</head>
<p>
One datatype can be <termref def="dt-derived"/> from one or more
datatypes by <termref def="dt-union"/>ing their <termref def="dt-value-space"/>s
and, consequently, their <termref def="dt-lexical-space"/>s.
</p>
</div4>
</div3>
<div3 id="built-in-vs-user-derived">
<head>Built-in vs. user-derived datatypes</head>
<ulist>
<item>
<p>
<termdef id="dt-built-in" term="built-in">
<term>Built-in</term>
datatypes are those which are defined in this specification,
and can be either <termref def="dt-primitive"/> or
<termref def="dt-derived"/>;
</termdef>
</p>
</item>
<item>
<p>
<termdef id="dt-user-derived" term="user-derived">
<term>User-derived</term> datatypes are those <termref def="dt-derived"/>
datatypes that are defined by individual schema designers.
</termdef>
</p>
</item>
</ulist>
<p>
Conceptually there is no difference between the
<termref def="dt-built-in"/>&nbsp;<termref def="dt-derived"/> datatypes
included in this specification and the <termref def="dt-user-derived"/>
datatypes which will be created by individual schema designers.
The <termref def="dt-built-in"/>&nbsp;<termref def="dt-derived"/> datatypes
are those which are believed to be so common that if they were not
defined in this specification many schema designers would end up
"reinventing" them.  Furthermore, including these
<termref def="dt-derived"/> datatypes in this specification serves to
demonstrate the mechanics and utility of the datatype generation
facilities of this specification.
</p>
<note>
<p>
A datatype which is <termref def="dt-built-in"/> in this specification
need not be a "built-in" datatype in any programming language used
to implement this specification.  Likewise, a datatype which is
<termref def="dt-user-derived"/> in this specification need not
be a "user-derived" datatype in any programming language used to
implement this specification.
</p>
</note>
</div3>
</div2>
</div1>
<div1 id="built-in-datatypes">
<head>Built-in datatypes</head>
<graphic source="type-hierarchy.gif" alt="Diagram of built-in type hierarchy" map="typeImage"/>
<!--
	thanx to Asir S Vedamuthu for creating this image map
  -->
<imagemap source="image-map.html" id="typeImage"/>
<p>
      Each built-in datatype in this specification (both
      <termref def="dt-primitive"/> and
      <termref def="dt-derived"/>) can be uniquely addressed via a
      URI Reference constructed as follows:
</p>
<olist>
<item>
<p>the base URI is the URI of the XML Schema namespace</p>
</item>
<item>
<p>the fragment identifier is the name of the datatype</p>
</item>
</olist>
<p>
      For example, to address the <dtref ref="int"/> datatype, the URI is:
</p>
<ulist>
<item>
<p>
<code>http://www.w3.org/2001/XMLSchema#int</code>
</p>
</item>
</ulist>
<p>
      Additionally, each facet definition element can be uniquely
      addressed via a URI constructed as follows:
</p>
<olist>
<item>
<p>the base URI is the URI of the XML Schema namespace</p>
</item>
<item>
<p>the fragment identifier is the name of the facet</p>
</item>
</olist>
<p>
      For example, to address the maxInclusive facet, the URI is:
</p>
<ulist>
<item>
<p>
<code>http://www.w3.org/2001/XMLSchema#maxInclusive</code>
</p>
</item>
</ulist>
<p>
      Additionally, each facet usage in a built-in datatype definition
      can be uniquely addressed via a URI constructed as follows:
</p>
<olist>
<item>
<p>the base URI is the URI of the XML Schema namespace</p>
</item>
<item>
<p>the fragment identifier is the name of the datatype, followed
	by a period (".") followed by the name of the facet</p>
</item>
</olist>
<p>
      For example, to address the usage of the maxInclusive facet in
      the definition of int, the URI is:
</p>
<ulist>
<item>
<p>
<code>http://www.w3.org/2001/XMLSchema#int.maxInclusive</code>
</p>
</item>
</ulist>
<div2 id="namespaces">
<head>Namespace considerations</head>
<p>
The <termref def="dt-built-in"/> datatypes defined by this specification
are designed to be used with the &schema-language; as well as other
XML specifications.
To facilitate usage within the &schema-language;, the <termref def="dt-built-in"/>
datatypes in this specification have the namespace name:
</p>
<ulist>
<item>
<p>http://www.w3.org/2001/XMLSchema</p>
</item>
</ulist>
<p>
To facilitate usage in specifications other than the &schema-language;,
such as those that do not want to know anything about aspects of the
&schema-language; other than the datatypes, each <termref def="dt-built-in"/>
datatype is also defined in the namespace whose URI is:
</p>
<ulist>
<item>
<p>http://www.w3.org/2001/XMLSchema-datatypes</p>
</item>
</ulist>
<p>
This applies to both
<termref def="dt-built-in"/>&nbsp;<termref def="dt-primitive"/> and
<termref def="dt-built-in"/>&nbsp;<termref def="dt-derived"/> datatypes.
</p>
<p>
Each <termref def="dt-user-derived"/> datatype is also associated with a
unique namespace.  However, <termref def="dt-user-derived"/> datatypes
do not come from the namespace defined by this specification; rather,
they come from the namespace of the schema in which they are defined
(see <xspecref href="&xsdl;#declare-schema">XML Representation of
Schemas</xspecref> in <bibref ref="structural-schemas"/>).
</p>
</div2>
<div2 id="built-in-primitive-datatypes">
<head>Primitive datatypes</head>
<p>
The <termref def="dt-primitive"/> datatypes defined by this specification
are described below.  For each datatype, the
<termref def="dt-value-space"/> and <termref def="dt-lexical-space"/>
are defined, <termref def="dt-constraining-facet"/>s which apply
to the datatype are listed and any datatypes <termref def="dt-derived"/>
from this datatype are specified.
</p>
<p>
<termref def="dt-primitive"/> datatypes can only be added by revisions
to this specification.
</p>
<div3 id="string">
<head>string</head>
<p>
<termdef id="dt-string" term="string" role="local">The <term>string</term> datatype
represents character strings in XML.  The <termref def="dt-value-space"/>
of <term>string</term> is the set of finite-length sequences of
<xtermref href="&xmlspec;#dt-character">character</xtermref>s (as defined in
<bibref ref="XML"/>) that <termref def="dt-match"/> the
<xnt href="&xmlspec;#NT-Char">Char</xnt> production from <bibref ref="XML"/>.
A <xtermref href="&xmlspec;#dt-character">character</xtermref> is an atomic unit of
communication; it is not further specified except to note that every
<xtermref href="&xmlspec;#dt-character">character</xtermref> has a corresponding
Universal Character Set code point, which is an integer.
</termdef>
</p>
<note>
<p>
Many human languages have writing systems that require
child elements for control of aspects such as bidirectional formating or
ruby annotation (see <bibref ref="ruby"/> and Section 8.2.4
<xspecref href="&html4;struct/dirlang.html#h-8.2.4">Overriding the
bidirectional algorithm: the BDO element</xspecref> of <bibref ref="html4"/>).
Thus, <term>string</term>, as a simple type that can contain only
characters but not child elements, is often not suitable for representing text.
In such situations, a complex type that allows mixed content should be considered.
For more information, see Section 5.5
<xspecref href="http://www.w3.org/TR/2001/REC-xmlschema-0-20010502/#textType">Any Element, Any Attribute</xspecref>
of <bibref ref="schema-primer"/>.
</p>
</note>
<note>
<p>
As noted in <compref ref="dc-ordered"/>, the fact that this specification does
not specify an <termref def="dt-order-relation"/> for <termref def="dt-string"/>
does not preclude other applications from treating strings as being ordered.
</p>
</note>
<div4 id="string-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="string-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="boolean">
<head>boolean</head>
<p>
<termdef id="dt-boolean" term="boolean" role="local">
<term>boolean</term> has the
<termref def="dt-value-space"/> required to support the mathematical
concept of binary-valued logic: {true, false}.</termdef>
</p>
<div4 id="boolean-lexical-representation">
<head>Lexical representation</head>
<p>
An instance of a datatype that is defined as <termref def="dt-boolean"/>
can have the following legal literals {true, false, 1, 0}.
</p>
</div4>
<div4 id="boolean-canonical-representation">
<head>Canonical representation</head>
<p>
The canonical representation for <term>boolean</term> is the set of
literals {true, false}.
</p>
</div4>
<div4 id="boolean-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="decimal">
<head>decimal</head>
<p>
<termdef id="dt-decimal" term="decimal" role="local">
<term>decimal</term>
represents <phrase diff="add">a subset of the real numbers, which can be represented by decimal numerals</phrase>
<phrase diff="del">arbitrary precision decimal numbers</phrase>.
The <termref def="dt-value-space"/> of <term>decimal</term>
is the set of <phrase diff="add">
numbers that can be obtained by multiplying an integer by a non-positive
power of ten, i.e., expressible as <emph role="eq">i &times; 10^-n</emph>
where <emph role="eq">i</emph> and <emph role="eq">n</emph> are integers
and <emph role="eq">n >= 0</emph>
</phrase>
<phrase diff="del">the values
<emph role="eq">i &times; 10^-n</emph>, where <emph role="eq">i</emph>
and <emph role="eq">n</emph> are integers such that
<emph role="eq">n >= 0</emph>
</phrase>.
<phrase diff="add">Precision is not reflected in this value space;
the number 2.0 is not distinct from the number 2.00.</phrase>
The <termref def="dt-order-relation"/> on <term>decimal</term>
is <phrase diff="add">the order relation on real numbers, restricted
to this subset</phrase>
<phrase diff="del">: <emph role="eq">x &lt; y
iff y - x</emph> is positive</phrase>.
</termdef>
</p>
<p>
<phrase diff="del">
<termdef id="dt-decimal-with-totalDigits" term="decimal-with-totalDigits" role="local">
The <termref def="dt-value-space"/> of types derived from <term>decimal</term>
with a value for <termref def="dt-totalDigits"/> of <emph role="eq">p</emph>
is the set of values <emph role="eq">i &times; 10^-n</emph>, where
<emph role="eq">n</emph> and <emph role="eq">i</emph> are integers such that
<emph role="eq">p >= n >= 0</emph> and the number of significant decimal digits
in <emph role="eq">i</emph> is less than or equal to <emph role="eq">p</emph>.
</termdef>
</phrase>
</p>
<p>
<phrase diff="del">
<termdef id="dt-decimal-with-fractionDigits" term="decimal-with-fractionDigits" role="local">
The <termref def="dt-value-space"/> of types derived from <term>decimal</term>
with a value for <termref def="dt-fractionDigits"/> of <emph role="eq">s</emph>
is the set of values <emph role="eq">i &times; 10^-n</emph>, where
<emph role="eq">i</emph> and <emph role="eq">n</emph> are integers such
that <emph role="eq">0 &lt;= n &lt;= s</emph>.
</termdef>
</phrase>
</p>
<note>
<p>
All <termref def="dt-minimally-conforming"/> processors <termref def="dt-must"/>
support decimal numbers with a minimum of 18 decimal digits (i.e., with a
<termref def="dt-totalDigits"/> of 18).  However,
<termref def="dt-minimally-conforming"/> processors <termref def="dt-may"/>
set an application-defined limit on the maximum number of decimal digits
they are prepared to support, in which case that application-defined
maximum number <termref def="dt-must"/> be clearly documented.
</p>
</note>
<div4 id="decimal-lexical-representation">
<head>Lexical representation</head>
<p>
<term>decimal</term> has a lexical representation
consisting of a finite-length sequence of decimal digits (#x30-#x39) separated
by a period as a decimal indicator.
<phrase diff="del">
If <termref def="dt-totalDigits"/> is
specified, the number of digits must be less than or equal to
<termref def="dt-totalDigits"/>.
If <termref def="dt-fractionDigits"/> is specified, the
number of digits following the decimal point must be less than or equal to
the <termref def="dt-fractionDigits"/>.
</phrase>
An optional leading sign is allowed.
If the sign is omitted, "+" is assumed.  Leading and trailing zeroes are optional.
If the fractional part is zero, the period and following zero(es) can
be omitted.
For example: <code>-1.23, 12678967.543233, +100000.00, 210</code>.
</p>
</div4>
<div4 id="decimal-canonical-representation">
<head>Canonical representation</head>
<p>
The canonical representation for <term>decimal</term> is defined by
prohibiting certain options from the
<specref ref="decimal-lexical-representation"/>.  Specifically, the preceding
optional "+" sign is prohibited.  The decimal point is required. Leading and
trailing zeroes are prohibited subject to the following: there must be at least
one digit to the right and to the left of the decimal point which may be a zero.
</p>
</div4>
<div4 id="decimal-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="decimal-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="float">
<head>float</head>
<p>
<termdef id="dt-float" term="float" role="local">
<term>float</term>
<phrase diff="add">is patterned after</phrase>
<phrase diff="del">corresponds to</phrase> the IEEE single-precision 32-bit floating point type
<bibref ref="ieee754"/>.  The basic <termref def="dt-value-space"/> of
<term>float</term> consists of the values
<emph role="eq">m &times; 2^e</emph>, where <emph role="eq">m</emph>
is an integer whose absolute value is less than
<emph role="eq">2^24</emph>, and <emph role="eq">e</emph> is an integer
between -149 and 104, inclusive.  In addition to the basic
<termref def="dt-value-space"/> described above, the
<termref def="dt-value-space"/> of <term>float</term> also contains the
following
<phrase diff="add">three</phrase>
<emph>special values</emph>:
<phrase diff="del">positive and negative zero,</phrase>
positive and negative infinity and not-a-number
<phrase diff="add">(NaN)</phrase>.
The <termref def="dt-order-relation"/> on <term>float</term>
is: <emph role="eq">x &lt; y iff y - x</emph> is positive
<phrase diff="add">for x and y in the value space</phrase>.
<phrase diff="add">Positive infinity is greater than all other non-NaN values.
NaN equals itself but is <termref def="dt-incomparable"/> with (neither greater than nor less than)
any other value in the <termref def="dt-value-space"/>.</phrase>
<phrase diff="del">
Positive zero is greater than negative zero. Not-a-number equals itself and is
greater than all float values including positive infinity.</phrase>
</termdef>
</p>
<note>
<p>
<phrase diff="add">
"Equality" in this Recommendation is defined to be "identity" (i.e., values that
are identical in the <termref def="dt-value-space"/> are equal and vice versa).
Identity must be used for the few operations that are defined in this Recommendation.
Applications using any of the datatypes defined in this Recommendation may use different
definitions of equality for computational purposes; <bibref ref="ieee754"/>-based computation systems
are examples. Nothing in this Recommendation should be construed as requiring that
such applications use identity as their equality relationship when computing.
</phrase>
</p>
<p>
<phrase diff="add">
Any value <termref def="dt-incomparable"/> with the value used for the four bounding facets
(<termref def="dt-minInclusive"/>, <termref def="dt-maxInclusive"/>,
<termref def="dt-minExclusive"/>, and <termref def="dt-maxExclusive"/>) will be
excluded from the resulting restricted <termref def="dt-value-space"/>. In particular,
when "NaN" is used as a facet value for a bounding facet, since no other
<term>float</term> values are <termref def="dt-comparable"/> with it, the result is a <termref def="dt-value-space"/>
either having NaN as its only member (the inclusive cases) or that is empty
(the exclusive cases). If any other value is used for a bounding facet,
NaN will be excluded from the resulting restricted <termref def="dt-value-space"/>;
to add NaN back in requires union with the NaN-only space.
</phrase>
</p>
<p>
<phrase diff="add">
This datatype differs from that of <bibref ref="ieee754"/> in that there is only one
NaN and only one zero. This makes the equality and ordering of values in the data
space differ from that of <bibref ref="ieee754"/> only in that for schema purposes NaN = NaN.
</phrase>
</p>
</note>
<p>
A literal in the <termref def="dt-lexical-space"/> representing a
decimal number <emph role="eq">d</emph> maps to the normalized value
in the <termref def="dt-value-space"/> of <term>float</term> that is
closest to <emph role="eq">d</emph> in the sense defined by
<bibref ref="clinger1990"/>; if <emph role="eq">d</emph> is
exactly halfway between two such values then the even value is chosen.
</p>
<div4 id="float-lexical-representation">
<head>Lexical representation</head>
<p>
<term>float</term> values have a lexical representation
consisting of a mantissa followed, optionally, by the character
"E" or "e", followed by an exponent.  The exponent <termref def="dt-must"/>
be an <dtref ref="integer"/>. The mantissa must be a  <dtref ref="decimal"/> number. The representations
for exponent and mantissa must follow the lexical rules for
<dtref ref="integer"/> and <dtref ref="decimal"/>.  If the "E" or "e" and
the following exponent are omitted, an exponent value of 0 is assumed.
</p>
<p>
The <emph>special values</emph>
<phrase diff="del">positive and negative zero,</phrase>
positive
and negative infinity and not-a-number have lexical representations
<phrase diff="del">
<code>0</code>, <code>-0</code>,</phrase>
<code>INF</code>, <code>-INF</code> and
<code>NaN</code>, respectively.
<phrase diff="add">
Lexical representations for zero may take a positive or negative sign.
</phrase>
</p>
<p>
For example, <code>-1E4, 1267.43233E12, 12.78e-2, 12</code>
<phrase diff="add">
<code>, -0, 0</code>
</phrase>
and <code>INF</code> are all legal literals for <term>float</term>.
</p>
</div4>
<div4 id="float-canonical-representation">
<head>Canonical representation</head>
<p>
The canonical representation for <term>float</term> is defined by
prohibiting certain options from the
<specref ref="float-lexical-representation"/>.  Specifically, the exponent
must be indicated by "E".  Leading zeroes and the preceding optional "+" sign
are prohibited in the exponent.
<phrase diff="add">
If the exponent is zero, it must be indicated by "E0".
</phrase>
For the mantissa, the preceding optional "+" sign is prohibited
and the decimal point is required.
<phrase diff="del">
For the exponent, the preceding optional "+" sign is prohibited.
</phrase>
Leading and trailing zeroes are prohibited subject to the following:
number representations must
be normalized such that there is a single digit
<phrase diff="add">which is non-zero</phrase>
to the left of the decimal point and at least a single digit to the
right of the decimal point
<phrase diff="add">
unless the value being represented is zero. The canonical
representation for zero is 0.0E0</phrase>.
</p>
</div4>
<div4 id="float-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="double">
<head>double</head>
<p>
<termdef id="dt-double" term="double" role="local">The <term>double</term>
datatype
<phrase diff="add">is patterned after the</phrase>
<phrase diff="del">corresponds to</phrase>
IEEE double-precision 64-bit floating point
type <bibref ref="ieee754"/>.  The basic <termref def="dt-value-space"/>
of <term>double</term> consists of the values
<emph role="eq">m &times; 2^e</emph>, where <emph role="eq">m</emph>
is an integer whose absolute value is less than
<emph role="eq">2^53</emph>, and <emph role="eq">e</emph> is an
integer between -1075 and 970, inclusive.  In addition to the basic
<termref def="dt-value-space"/> described above, the
<termref def="dt-value-space"/> of <term>double</term> also contains
the following
<phrase diff="add">three</phrase>
<emph>special values</emph>:
<phrase diff="del">positive and negative zero,</phrase>
positive and negative infinity and not-a-number
<phrase diff="add">(NaN)</phrase>.
The <termref def="dt-order-relation"/> on <term>double</term>
is: <emph role="eq">x &lt; y iff y - x</emph> is positive
<phrase diff="add">for x and y in the value space</phrase>.
<phrase diff="add">Positive infinity is greater than all other non-NaN values.
NaN equals itself but is <termref def="dt-incomparable"/> with (neither greater than nor less than)
any other value in the <termref def="dt-value-space"/>.</phrase>
<phrase diff="del">
Positive zero is greater than negative zero. Not-a-number equals itself and is
greater than all float values including positive infinity.</phrase>
</termdef>
</p>
<note>
<p>
<phrase diff="add">
"Equality" in this Recommendation is defined to be "identity" (i.e., values that
are identical in the <termref def="dt-value-space"/> are equal and vice versa).
Identity must be used for the few operations that are defined in this Recommendation.
Applications using any of the datatypes defined in this Recommendation may use different
definitions of equality for computational purposes; <bibref ref="ieee754"/>-based computation systems
are examples. Nothing in this Recommendation should be construed as requiring that
such applications use identity as their equality relationship when computing.
</phrase>
</p>
<p>
<phrase diff="add">
Any value <termref def="dt-incomparable"/> with the value used for the four bounding facets
(<termref def="dt-minInclusive"/>, <termref def="dt-maxInclusive"/>,
<termref def="dt-minExclusive"/>, and <termref def="dt-maxExclusive"/>) will be
excluded from the resulting restricted <termref def="dt-value-space"/>. In particular,
when "NaN" is used as a facet value for a bounding facet, since no other
<term>double</term> values are <termref def="dt-comparable"/> with it, the result is a <termref def="dt-value-space"/>
either having NaN as its only member (the inclusive cases) or that is empty
(the exclusive cases). If any other value is used for a bounding facet,
NaN will be excluded from the resulting restricted <termref def="dt-value-space"/>;
to add NaN back in requires union with the NaN-only space.
</phrase>
</p>
<p>
<phrase diff="add">
This datatype differs from that of <bibref ref="ieee754"/> in that there is only one
NaN and only one zero. This makes the equality and ordering of values in the data
space differ from that of <bibref ref="ieee754"/> only in that for schema purposes NaN = NaN.
</phrase>
</p>
</note>
<p>
A literal in the <termref def="dt-lexical-space"/> representing a
decimal number <emph role="eq">d</emph> maps to the normalized value
in the <termref def="dt-value-space"/> of <term>double</term> that is
closest to <emph role="eq">d</emph>; if <emph role="eq">d</emph> is
exactly halfway between two such values then the even value is chosen.
This is the <emph>best approximation</emph> of <emph role="eq">d</emph>
(<bibref ref="clinger1990"/>, <bibref ref="gay1990"/>), which is more
accurate than the mapping required by <bibref ref="ieee754"/>.
</p>
<div4 id="double-lexical-representation">
<head>Lexical representation</head>
<p>
<term>double</term> values have a lexical representation
consisting of a mantissa followed, optionally, by the character "E" or
"e", followed by an exponent.  The exponent <termref def="dt-must"/> be
an integer.  The mantissa must be a decimal number. The representations
for exponent and mantissa must follow the lexical rules for
<dtref ref="integer"/> and <dtref ref="decimal"/>.  If the "E" or "e"
and the following exponent are omitted, an exponent value of 0 is assumed.
</p>
<p>
The <emph>special values</emph>
<phrase diff="del">positive and negative zero,</phrase>
positive
and negative infinity and not-a-number have lexical representations
<phrase diff="del">
<code>0</code>, <code>-0</code>,</phrase>
<code>INF</code>, <code>-INF</code> and
<code>NaN</code>, respectively.
<phrase diff="add">
Lexical representations for zero may take a positive or negative sign.
</phrase>
</p>
<p>
For example, <code>-1E4, 1267.43233E12, 12.78e-2, 12</code>
<phrase diff="add">
<code>, -0, 0</code>
</phrase>
and <code>INF</code>
are all legal literals for <term>double</term>.
</p>
</div4>
<div4 id="double-canonical-representation">
<head>Canonical representation</head>
<p>
The canonical representation for <term>double</term> is defined by
prohibiting certain options from the
<specref ref="double-lexical-representation"/>.  Specifically, the exponent
must be indicated by "E".  Leading zeroes and the preceding optional "+" sign
are prohibited in the exponent.
<phrase diff="add">
If the exponent is zero, it must be indicated by "E0".
</phrase>
For the mantissa, the preceding optional "+" sign is prohibited
and the decimal point is required.
<phrase diff="del">
For the exponent, the preceding optional "+" sign is prohibited.
</phrase>
Leading and trailing zeroes are prohibited subject to the following:
number representations must
be normalized such that there is a single digit
<phrase diff="add">which is non-zero</phrase>
to the left of the decimal point and at least a single digit to the
right of the decimal point
<phrase diff="add">
unless the value being represented is zero. The canonical
representation for zero is 0.0E0</phrase>.
</p>
</div4>
<div4 id="double-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="duration">
<head>duration</head>
<p>
<termdef id="dt-duration" term="duration" role="local">
<term>duration</term> represents a duration of time.
The <termref def="dt-value-space"/> of <term>duration</term> is
a six-dimensional space where the coordinates
designate the Gregorian year, month, day, hour, minute, and second components defined in
&sect; 5.5.3.2 of <bibref ref="ISO8601"/>,
respectively.  These components are ordered
in their significance by their order of appearance i.e. as year, month, day,
hour, minute, and second.
</termdef>
</p>
<note id="year-sec-conformance" diff="add">
<p>
All <termref def="dt-minimally-conforming"/> processors <termref def="dt-must"/>
support year values with a minimum of 4 digits (i.e., <code>YYYY</code>) and a minimum fractional second precision of milliseconds or three decimal digits (i.e. <code>s.sss</code>).  However,
<termref def="dt-minimally-conforming"/> processors <termref def="dt-may"/>
set an application-defined limit on the maximum number of digits
they are prepared to support in these two cases, in which case that application-defined
maximum number <termref def="dt-must"/> be clearly documented.
</p>
</note>
<div4 id="duration-lexical-repr">
<head>Lexical representation</head>
<p>
The lexical representation for <term>duration</term> is the
<bibref ref="ISO8601"/> extended format P<emph>n</emph>Y<emph>n</emph>
M<emph>n</emph>DT<emph>n</emph>H <emph>n</emph>M<emph>n</emph>S, where
<emph>n</emph>Y represents the number of years, <emph>n</emph>M the
number of months, <emph>n</emph>D the number of days, 'T' is the
date/time separator, <emph>n</emph>H the number of hours,
<emph>n</emph>M the number of minutes and <emph>n</emph>S the
number of seconds.  The number of seconds can include decimal digits
to arbitrary precision.</p>
<p>
The values of the
Year, Month, Day, Hour and Minutes components are not restricted but
allow an arbitrary
<phrase diff="add">unsigned</phrase> integer<phrase diff="add">, i.e., an integer that
conforms to the pattern <code>[0-9]+</code>.</phrase>.
Similarly, the value of the Seconds component
allows an arbitrary <phrase diff="add">unsigned</phrase> decimal.
<phrase diff="add">Following <bibref ref="ISO8601"/>, at least one digit must
follow the decimal point if it appears.  That is, the value of the Seconds component
must conform to the pattern <code>[0-9]+(\.[0-9]+)?</code>.</phrase>
Thus, the lexical representation of
<term>duration</term> does not follow the alternative
format of &sect; 5.5.3.2.1 of <bibref ref="ISO8601"/>.</p>
<p>
An optional preceding minus sign ('-') is
allowed, to indicate a negative duration.  If the sign is omitted a
positive duration is indicated. See also <specref ref="isoformats"/>.
</p>
<p>
For example, to indicate a duration of 1 year, 2 months, 3 days, 10
hours, and 30 minutes, one would write: <code>P1Y2M3DT10H30M</code>.
One could also indicate a duration of minus 120 days as:
<code>-P120D</code>.
</p>
<p>
Reduced precision and truncated representations of this format are allowed
provided they conform to the following:
</p>
<ulist>
<item>
<p>
If the number of years, months, days, hours, minutes, or seconds in any
expression equals zero, the number and its corresponding designator <termref def="dt-may"/>
be omitted.  However, at least one number and its designator <termref def="dt-must"/>
be present.
</p>
</item>
<item>
<p>
The seconds part <termref def="dt-may"/> have a decimal fraction.
</p>
</item>
<!-- INTERIOR FIELDS DISALLOWED FOR TIME INSTANT NOT DURATION
<item>If a field is omitted either all fields to its left or to its right
must be omitted i.e. interior fields cannot be omitted.</item>  -->
<item>
<p>
The designator 'T' <phrase diff="add">must</phrase>
<phrase diff="del">shall</phrase>
be absent if <phrase diff="add">and only if</phrase> all of the time items are absent.
The designator 'P' must always be present.
</p>
</item>
</ulist>
<p>
For example, P1347Y, P1347M and P1Y2MT2H are all allowed;
P0Y1347M and P0Y1347M0D are allowed. P-1347M is not allowed although
-P1347M is allowed.  P1Y2MT is not allowed.
</p>
</div4>
<div4 id="duration-order">
<head>Order relation on duration</head>
<p>
In general, the <termref def="dt-order-relation"/> on <term>duration</term>
is a partial order since there is no determinate relationship between certain
durations such as one month (P1M) and 30 days (P30D).
The <termref def="dt-order-relation"/>
of two <term>duration</term> values <emph role="eq">x</emph> and
<emph role="eq">y</emph> is <emph role="eq">x &lt; y iff s+x &lt; s+y</emph>
for each qualified <dtref ref="dateTime"/>
<emph role="eq"> s</emph>
in the list below.  These values for <emph>s</emph> cause the greatest deviations in the addition of
dateTimes and durations.  Addition of durations to time instants is defined
in <specref ref="adding-durations-to-dateTimes"/>.
<ulist>
<item>
<p>1696-09-01T00:00:00Z</p>
</item>
<item>
<p>1697-02-01T00:00:00Z</p>
</item>
<item>
<p>1903-03-01T00:00:00Z</p>
</item>
<item>
<p>1903-07-01T00:00:00Z</p>
</item>
</ulist>
</p>
<p>
The following table shows the strongest relationship that can be determined
between example durations. The symbol &lt;&gt; means that the order relation is
indeterminate.  Note that because of leap-seconds, a seconds field can vary
from 59 to 60. However, because of the way that addition is defined in
<specref ref="adding-durations-to-dateTimes"/>, they are still totally ordered.
</p>
<table border="1" cellspacing="0" cellpadding="4">
<tbody>
<tr>
<th>&nbsp;</th>
<th colspan="7" style="background-color:#FFFF99">Relation</th>
</tr>
<tr>
<td style="background-color:#FFFF99">P<strong>1Y</strong>
</td>
<td>&gt; P<strong>364D</strong>
</td>
<td>&lt;&gt; P<strong>365D</strong>
</td>
<td colspan="3">&nbsp;</td>
<td>&lt;&gt; P<strong>366D</strong>
</td>
<td>&lt; P<strong>367D</strong>
</td>
</tr>
<tr>
<td style="background-color:#FFFF99">P<strong>1M</strong>
</td>
<td>&gt; P<strong>27D</strong>
</td>
<td>&lt;&gt; P<strong>28D</strong>
</td>
<td colspan="2">&lt;&gt; P<strong>29D</strong>
</td>
<td>&lt;&gt; P<strong>30D</strong>
</td>
<td>&lt;&gt; P<strong>31D</strong>
</td>
<td>&lt; P<strong>32D</strong>
</td>
</tr>
<tr>
<td style="background-color:#FFFF99">P<strong>5M</strong>
</td>
<td>&gt; P<strong>149D</strong>
</td>
<td>&lt;&gt; P<strong>150D</strong>
</td>
<td>&lt;&gt; P<strong>151D</strong>
</td>
<td colspan="2">&lt;&gt; P<strong>152D</strong>
</td>
<td>&lt;&gt; P<strong>153D</strong>
</td>
<td>&lt; P<strong>154D</strong>
</td>
</tr>
</tbody>
</table>
<p>
Implementations are free to optimize the computation of the ordering relationship. For example, the following table can be used to
compare durations of a small number of months against days.
</p>
<table border="1" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<th align="center">&nbsp;</th>
<th align="center" style="background-color: #FFFF99">Months</th>
<th align="center" style="background-color: #FFFF99">1</th>
<th align="center" style="background-color: #FFFF99">2</th>
<th align="center" style="background-color: #FFFF99">3</th>
<th align="center" style="background-color: #FFFF99">4</th>
<th align="center" style="background-color: #FFFF99">5</th>
<th align="center" style="background-color: #FFFF99">6</th>
<th align="center" style="background-color: #FFFF99">7</th>
<th align="center" style="background-color: #FFFF99">8</th>
<th align="center" style="background-color: #FFFF99">9</th>
<th align="center" style="background-color: #FFFF99">10</th>
<th align="center" style="background-color: #FFFF99">11</th>
<th align="center" style="background-color: #FFFF99">12</th>
<th align="center" style="background-color: #FFFF99">13</th>
<th align="center" style="background-color: #FFFF99">...</th>
</tr>
<tr>
<th align="center" rowspan="2" style="background-color: #FFFF99">Days</th>
<th align="center" style="background-color: #FFFF99">Minimum</th>
<td align="center">28</td>
<td align="center">59</td>
<td align="center">89</td>
<td align="center">120</td>
<td align="center">150</td>
<td align="center">181</td>
<td align="center">212</td>
<td align="center">242</td>
<td align="center">273</td>
<td align="center">303</td>
<td align="center">334</td>
<td align="center">365</td>
<td align="center">393</td>
<td align="center">...</td>
</tr>
<tr>
<th align="center" style="background-color: #FFFF99">Maximum</th>
<td align="center">31</td>
<td align="center">62</td>
<td align="center">92</td>
<td align="center">123</td>
<td align="center">153</td>
<td align="center">184</td>
<td align="center">215</td>
<td align="center">245</td>
<td align="center">276</td>
<td align="center">306</td>
<td align="center">337</td>
<td align="center">366</td>
<td align="center">397</td>
<td align="center">...</td>
</tr>
</tbody>
</table>
</div4>
<div4 id="facet-comparison-for-durations">
<head>Facet Comparison for durations</head>
<p>In comparing <term>duration</term>
values with <compref ref="dc-minInclusive"/>,  <compref ref="dc-minExclusive"/>,
<compref ref="dc-maxInclusive"/> and <compref ref="dc-maxExclusive"/> facet values
indeterminate comparisons should be considered as "false".
</p>
</div4>
<div4 id="total-order-durations">
<head>Totally ordered durations</head>
<p>
Certain derived datatypes of durations can be guaranteed have a total order. For
this, they must have fields from only one row in the list below and the time zone
must either be required or prohibited.
</p>
<ulist>
<item>
<p>year, month</p>
</item>
<item>
<p>day, hour, minute, second</p>
</item>
</ulist>
<p>
For example, a datatype could be defined to correspond to the
<bibref ref="SQL"/> datatype Year-Month interval that required a four digit
year field and a two digit month field but required all other fields to be unspecified.  This datatype could be defined as below and would have a total order.
</p>
<eg><![CDATA[<simpleType name='SQL-Year-Month-Interval'>
    <restriction base='duration'>
      <pattern value='P\p{Nd}{4}Y\p{Nd}{2}M'/>
    </restriction>
</simpleType>]]></eg>
</div4>
<div4 id="duration-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="dateTime">
<head>dateTime</head>
<p diff="chg">
<termdef id="dt-dateTime" term="dateTime" role="local">
<term>dateTime</term> values may be viewed as objects with integer-valued
year, month, day, hour and minute properties, a decimal-valued second property,
and a boolean timezoned property.
Each such object also has one decimal-valued
method or computed property, timeOnTimeline, whose value is always a decimal
number; the values are dimensioned in seconds, the integer 0 is
0001-01-01T00:00:00 and the value of timeOnTimeline for other <term>dateTime</term>
values is computed using the Gregorian algorithm as modified for leap-seconds.
The timeOnTimeline values form two related "timelines", one for timezoned
values and one for non-timezoned values.
Each timeline is a copy of the <termref def="dt-value-space"/> of <dtref ref="decimal"/>,
with integers given units of seconds.
</termdef>
</p>
<p diff="chg">
The <termref def="dt-value-space"/> of
<term>dateTime</term> is closely related to the dates and times described in ISO 8601.
For clarity, the text above specifies a particular origin point for the
timeline.
It should be noted, however, that schema processors need not expose the
timeOnTimeline value to schema users, and there is no requirement that a
timeline-based implementation use the particular origin described here in
its internal representation.
Other interpretations of the <termref def="dt-value-space"/> which lead to the
same results (i.e., are isomorphic) are of course acceptable.
</p>
<p diff="chg">
All timezoned times are Coordinated Universal Time (UTC, sometimes called
"Greenwich Mean Time"). Other timezones indicated in lexical representations
are converted to UTC during conversion of literals to values.
"Local" or untimezoned times are presumed to be the time in the timezone of some
unspecified locality as prescribed by the appropriate legal authority;
currently there are no legally prescribed timezones which are durations
whose magnitude is greater than 14 hours. The value of each numeric-valued property
(other than timeOnTimeline) is limited to the maximum value within the interval
determined by the next-higher property. For example, the day value can never be 32,
and cannot even be 29 for month 02 and year 2002 (February 2002).
</p>
<note id="year-zero" diff="chg">
<p>The date and time datatypes described in this recommendation were inspired
by <bibref ref="ISO8601"/>.  '0001' is the lexical representation of the year 1 of the Common Era
(1
CE, sometimes written "AD 1" or "1 AD").  There is no year 0, and '0000' is not a valid lexical representation. '-0001' is the lexical representation of the year 1 Before
Common Era (1 BCE, sometimes written "1 BC").</p>
<p>Those using this (1.0) version of this Recommendation to
represent negative years should be aware that the interpretation of lexical
representations beginning with a <code>'-'</code> is likely to change in
subsequent versions.</p>
<p>
<bibref ref="ISO8601"/>
makes no mention of the year 0; in <bibref ref="ISO8601-1998"/>
the form '0000' was disallowed and this recommendation disallows it as well.
However, <bibref ref="ISO8601-2000"/>, which became available just as we were completing version
1.0, allows the form '0000', representing the year 1 BCE.  A number of external commentators
have also suggested that '0000' be
allowed, as the lexical representation for 1 BCE, which is the normal usage in
astronomical contexts.  
 It is the intention of the XML Schema
        Working Group to allow '0000' as a lexical representation in the
        <term>dateTime</term>, <term>date</term>, <term>gYear</term>, and
<term>gYearMonth</term> datatypes in a subsequent version
        of this Recommendation. '0000' will be the lexical representation of 1
BCE (which is a leap year), '-0001' will become the lexical representation of 2
BCE (not 1 BCE as in this (1.0) version), '-0002' of 3 BCE, etc.
</p>
</note>
<note diff="add">
<p>See the conformance note in <specref ref="year-sec-conformance"/> which
applies to this datatype as well.</p>
</note>
<div4 id="dateTime-lexical-representation" diff="chg">
<head>Lexical representation</head>
<p>
The <termref def="dt-lexical-space"/> of <term>dateTime</term> consists of
finite-length sequences of characters of the form:
<code>'-'? yyyy '-' mm '-' dd 'T' hh ':' mm ':' ss ('.' s+)? (zzzzzz)?</code>,
where 









</p>
<ulist>
<item>
<p>'-'? <emph>yyyy</emph> is a four-or-more digit optionally negative-signed
numeral that represents the year; if more than four digits, leading zeros
are prohibited, and '0000' is prohibited (see the Note above <specref ref="year-zero"/>; also note that a plus sign is <strong>not</strong> permitted);</p>
</item>
<item>
<p>the remaining '-'s are separators between parts of the date portion;</p>
</item>
<item>
<p>the first <emph>mm</emph> is a two-digit numeral that represents the month;</p>
</item>
<item>
<p>
<emph>dd</emph> is a two-digit numeral that represents the day;</p>
</item>
<item>
<p>'T' is a separator indicating that time-of-day follows;</p>
</item>
<item>
<p>
<emph>hh</emph> is a two-digit numeral that represents the hour; '24' is permitted if the
minutes and seconds represented are zero, and the <term>dateTime</term> value so
represented is the first instant of the following day (the hour property of a
<term>dateTime</term> object in the <termref def="dt-value-space"/> cannot have
a value greater than 23);</p>
</item>
<item>
<p>':' is a separator between parts of the time-of-day portion;</p>
</item>
<item>
<p>the second <emph>mm</emph> is a two-digit numeral that represents the minute;</p>
</item>
<item>
<p>
<emph>ss</emph> is a two-integer-digit numeral that represents the
whole seconds;</p>
</item>
<item>
<p>'.' <emph>s+</emph> (if present) represents the
fractional seconds;</p>
</item>
<item>
<p>
<emph>zzzzzz</emph> (if present) represents the timezone (as described below).</p>
</item>
</ulist>
<p>
For example, 2002-10-10T12:00:00-05:00 (noon on 10 October 2002, Central Daylight
Savings Time as well as Eastern Standard Time in the U.S.) is 2002-10-10T17:00:00Z,
five hours later than 2002-10-10T12:00:00Z.
</p>
<p>
For further guidance on arithmetic with <term>dateTime</term>s and durations,
see <specref ref="adding-durations-to-dateTimes"/>
<!--Appendix E-->.
</p>
</div4>
<div4 id="dateTime-canonical-representation" diff="chg">
<head>Canonical representation</head>
<p>
Except for trailing fractional zero digits in the seconds representation,
'24:00:00' time representations, and timezone (for timezoned values), the mapping
from literals to values is one-to-one. Where there is more than
one possible representation, the canonical representation is as follows:

 <ulist>
<item>
<p>The 2-digit numeral representing the hour must not be '<code>24</code>';</p>
</item>
<item>
<p>The fractional second string, if present, must not end in '<code>0</code>';</p>
</item>
<item>
<p>for timezoned values, the timezone must be
represented with '<code>Z</code>'
(All timezoned <term>dateTime</term> values are UTC.).</p>
</item>
</ulist>
</p>
</div4>
<div4 id="dateTime-timezones" diff="add">
<head>Timezones</head>
<p>
Timezones are durations with (integer-valued) hour and minute properties
(with the hour magnitude limited to at most 14, and the minute magnitude
limited to at most 59, except that if the hour magnitude is 14, the minute
value must be 0); they may be both positive or both negative.
</p>
<p>
The lexical representation of a timezone is a string of the form:
<code>(('+' | '-') hh ':' mm) | 'Z'</code>,
where</p>
<ulist>
<item>
<p>
<emph>hh</emph> is a two-digit numeral (with leading zeros as required) that
represents the hours,</p>
</item>
<item>
<p>
<emph>mm</emph> is a two-digit numeral that represents the minutes,</p>
</item>
<item>
<p>'+' indicates a nonnegative duration,</p>
</item>
<item>
<p>'-' indicates a nonpositive duration.</p>
</item>
</ulist>
<p>The mapping so defined is one-to-one, except that '+00:00', '-00:00', and 'Z'
all represent the same zero-length duration timezone, UTC; 'Z' is its canonical
representation.</p>
<p>
When a timezone is added to a UTC <term>dateTime</term>, the result is the date
and time "in that timezone".  For example, 2002-10-10T12:00:00+05:00 is
2002-10-10T07:00:00Z and 2002-10-10T00:00:00+05:00 is 2002-10-09T19:00:00Z.
</p>
</div4>
<!-- end new stuff -->
<div4 id="dateTime-order">
<head>Order relation on dateTime</head>
<p diff="add">
<term>dateTime</term> value objects on either timeline are totally ordered by their timeOnTimeline
values; between the two timelines, <term>dateTime</term> value objects are ordered by their
timeOnTimeline values when their timeOnTimeline values differ by more than
fourteen hours, with those whose difference is a duration of 14 hours or less
being <termref def="dt-incomparable"/>.
</p>
<p>
In general, the <termref def="dt-order-relation"/> on <term>dateTime</term>
is a partial order since there is no determinate relationship between certain
instants. For example, there is no determinate
ordering between
(a)
2000-01-20T12:00:00 and (b) 2000-01-20T12:00:00<strong>Z</strong>. Based on
timezones currently in use, (c) could vary from 2000-01-20T12:00:00+12:00 to
2000-01-20T12:00:00-13:00. It is, however, possible for this range to expand or
contract in the future, based on local laws. Because of this, the following
definition uses a somewhat broader range of indeterminate values: +14:00..-14:00.</p>
<p>The following definition uses the notation S[year] to represent the year
field of S, S[month] to represent the month field, and so on. The notation (Q
&amp; &quot;-14:00&quot;) means adding the timezone -14:00 to Q, where Q did not
already have a timezone. <emph>This is a logical explanation of the process. Actual
implementations are free to optimize as long as they produce the same results.</emph>
</p>
<p>
The ordering between two <term>dateTime</term>s P and Q is defined by the following
algorithm:
</p>
<p>A.Normalize P and Q. That is, if there is a timezone present, but
  it is not Z, convert it to Z using the addition operation defined in
  <specref ref="adding-durations-to-dateTimes"/>
</p>
<ulist>
<item>
<p>Thus 2000-03-04T23:00:00+03:00 normalizes to 2000-03-04T20:00:00Z</p>
</item>
</ulist>
<p>B. If P and Q either both have a time zone or both do not have a time
   zone, compare P and Q field by field from the year field down to the
   second field, and return a result as soon as it can be determined. That is:</p>
<olist>
<item>
<p>For each i in {year, month, day, hour, minute, second}
      <olist>
<item>
<p>If P[i] and Q[i] are both not specified, continue to the next i</p>
</item>
<item>
<p>If P[i] is not specified and Q[i] is, or vice versa, stop and return
          P &lt;&gt; Q</p>
</item>
<item>
<p>If P[i] &lt; Q[i], stop and return P &lt; Q</p>
</item>
<item>
<p>If P[i] &gt; Q[i], stop and return P &gt; Q</p>
</item>
</olist>
</p>
</item>
<item>
<p>Stop and return P = Q</p>
</item>
</olist>
<p>C.Otherwise, if P contains a time zone and Q does not, compare
  as follows:
 </p>
<olist>
<item>
<p>P &lt; Q if P &lt; (Q with time zone +14:00)</p>
</item>
<item>
<p>P > Q if P > (Q with time zone -14:00)</p>
</item>
<item>
<p>P &lt;> Q otherwise, that is, if (Q with time zone +14:00) &lt; P &lt; (Q with time zone -14:00)</p>
</item>
</olist>
<p>D. Otherwise, if P does not contain a time zone and Q does, compare
  as follows:</p>
<olist>
<item>
<p> P &lt; Q if (P with time zone -14:00) &lt; Q.</p>
</item>
<item>
<p> P &gt; Q if (P with time zone +14:00) &gt; Q.</p>
</item>
<item>
<p> P &lt;> Q otherwise, that is, if (P with time zone +14:00) &lt; Q &lt; (P with time zone -14:00)</p>
</item>
</olist>
<p>Examples:</p>
<table border="1" cellspacing="0" cellpadding="4">
<tbody>
<tr>
<th align="center" style="background-color: #FFFF99">Determinate</th>
<th align="center" style="background-color: #FFFF99">Indeterminate</th>
</tr>
<tr>
<td align="center">2000-01-15T00:00:00 <strong>&lt;</strong> 2000-02-15T00:00:00</td>
<td align="center">2000-01-01T12:00:00 <strong>&lt;&gt;</strong>
          1999-12-31T23:00:00Z</td>
</tr>
<tr>
<td align="center">2000-01-15T12:00:00 <strong>&lt;</strong> 2000-01-16T12:00:00Z</td>
<td align="center">2000-01-16T12:00:00 <strong>&lt;&gt;</strong>
          2000-01-16T12:00:00Z</td>
</tr>
<tr>
<td align="center">&nbsp;</td>
<td align="center">2000-01-16T00:00:00 <strong>&lt;&gt;</strong> 2000-01-16T12:00:00Z</td>
</tr>
</tbody>
</table>
</div4>
<div4 id="totally-ordered-instants">
<head>Totally ordered dateTimes</head>
<p>Certain derived types from <term>dateTime</term>
can be guaranteed have a total order. To
do so, they must require that a specific set of fields are always specified, and
that remaining fields (if any) are always unspecified. For example, the date
datatype without time zone is defined to contain exactly year, month, and day.
Thus dates without time zone have a total order among themselves.</p>
</div4>
<div4 id="dateTime-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="time">
<head>time</head>
<p>
<termdef id="dt-time" term="time" role="local">
<term>time</term>
represents an instant of time that recurs every day.  The
<termref def="dt-value-space"/> of <term>time</term> is the space
of <emph>time of day</emph> values as defined in &sect; 5.3 of
<bibref ref="ISO8601"/>.  Specifically, it is a set of zero-duration daily
time instances.</termdef>
</p>
<p>
Since the lexical representation allows an optional time zone
indicator, <term>time</term> values are partially ordered because it may
not be able to determine the order of two values one of which has a
time zone and the other does not.  The order relation on
<term>time</term> values is the
<specref ref="dateTime-order"/> using an arbitrary date. See also
<specref ref="adding-durations-to-dateTimes"/>.  Pairs of <term>time</term> values with or without time zone indicators are totally ordered.
</p>
<note diff="add">
<p>See the conformance note in <specref ref="year-sec-conformance"/> which
applies to the seconds part of this datatype as well.</p>
</note>
<div4 id="time-lexical-repr">
<head>Lexical representation</head>
<p>
The lexical representation for <term>time</term> is the left
truncated lexical representation for <dtref ref="dateTime"/>:
hh:mm:ss.sss with optional following time zone indicator.  For example,
to indicate 1:20 pm for Eastern Standard Time which is 5 hours behind
Coordinated Universal Time (UTC), one would write: 13:20:00-05:00. See also
<specref ref="isoformats"/>.
</p>
</div4>
<div4 id="time-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>time</term> is defined
by prohibiting certain options from the
<specref ref="time-lexical-repr"/>.  Specifically, either the time zone must
be omitted or, if present,  the time zone must be Coordinated Universal
Time (UTC) indicated by a "Z".
Additionally, the canonical representation for midnight is 00:00:00.
</p>
</div4>
<div4 id="time-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="date" diff="chg">
<head>date</head>
<p>
<termdef id="dt-date" term="date" role="local">
The <termref def="dt-value-space"/> of <term>date</term>
consists of top-open intervals of exactly one day in length on the timelines of
<dtref ref="dateTime"/>, beginning on the beginning moment of each day (in
each timezone), i.e. '00:00:00', up to but not including '24:00:00' (which is
identical with '00:00:00' of the next day).  For nontimezoned values, the top-open
intervals disjointly cover the nontimezoned timeline, one per day.  For timezoned
values, the intervals begin at every minute and therefore overlap.
</termdef>
</p>
<p>
A "date object" is an object with year, month, and day properties just like those
of <dtref ref="dateTime"/> objects, plus an optional <emph>timezone-valued</emph>
timezone property. (As with values of <dtref ref="dateTime"/> timezones are a
special case of durations.)
Just as a <dtref ref="dateTime"/> object corresponds to a point on one of the
timelines, a <term>date</term> object corresponds to an interval on one
of the two timelines as just described.
</p>
<p>
Timezoned <term>date</term> values track the starting moment of their day, as
determined by their timezone; said timezone is generally recoverable for
canonical representations.
<termdef id="recoverable-timezone" term="recoverable timezone" role="local">
The <term>recoverable timezone</term> is that duration which
is the result of subtracting the first moment (or any moment) of the timezoned
<term>date</term> from the first moment (or the corresponding moment) UTC on the
same <term>date</term>.</termdef>
<termref def="recoverable-timezone"/>s are
always durations between '+12:00' and '-11:59'.  This "timezone normalization"
(which follows automatically from the definition of the <term>date</term>
<termref def="dt-value-space"/>) is explained more in
<specref ref="date-lexical-representation"/>.
</p>
<p>
For example: the first moment of 2002-10-10+13:00 is 2002-10-10T00:00:00+13,
which is 2002-10-09T11:00:00Z, which is also the first moment of 2002-10-09-11:00.
Therefore 2002-10-10+13:00 is 2002-10-09-11:00; <emph>they are the same interval</emph>.
</p>
<note>
<p>
For most timezones, either the first moment or last moment of the day (a
<dtref ref="dateTime"/> value, always UTC) will have a <term>date</term> portion
different from that of the <term>date</term> itself!
However, noon of that <term>date</term> (the midpoint of the interval) in that
(normalized) timezone will always have the same <term>date</term> portion as the
<term>date</term> itself, even when that noon point in time is normalized to
UTC.  For example, 2002-10-10-05:00 begins during 2002-10-09Z and 2002-10-10+05:00
ends during 2002-10-11Z, but noon of both 2002-10-10-05:00 and 2002-10-10+05:00
falls in the interval which is 2002-10-10Z.
</p>
</note>
<note diff="add">
<p>See the conformance note in <specref ref="year-sec-conformance"/> which
applies to the year part of this datatype as well.</p>
</note>
<div4 id="date-lexical-representation">
<head>Lexical representation</head>
<p>
For the following discussion, let the "date portion" of a <dtref ref="dateTime"/>
or <term>date</term> object be an object similar to a <dtref ref="dateTime"/> or
<term>date</term> object, with similar year, month, and day properties, but no
others, having the same value for these properties as the original
<dtref ref="dateTime"/> or <term>date</term> object.
</p>
<p>
The <termref def="dt-lexical-space"/> of <term>date</term> consists of finite-length
sequences of characters of the form:
<code>'-'? yyyy '-' mm '-' dd zzzzzz?</code>
where the <term>date</term> and optional timezone are represented exactly the
same way as they are for <dtref ref="dateTime"/>.  The first moment of the
interval is that represented by:
<code>'-' yyyy '-' mm '-' dd 'T00:00:00' zzzzzz?</code>
and the least upper bound of the interval is the timeline point represented
(noncanonically) by:
<code>'-' yyyy '-' mm '-' dd 'T24:00:00' zzzzzz?</code>.
</p>
<note>
<p>
The <termref def="recoverable-timezone"/> of a <term>date</term> will always be
a duration between '+12:00' and '11:59'.  Timezone lexical representations, as
explained for <dtref ref="dateTime"/>, can range from '+14:00' to '-14:00'.
The result is that literals of <term>date</term>s with very large or very
negative timezones will map to a "normalized" <term>date</term> value with a
<termref def="recoverable-timezone"/> different from that represented in the original
representation, and a matching difference of +/- 1 day in the <term>date</term> itself.
</p>
</note>
</div4>
<div4 id="date-canonical-representation">
<head>Canonical representation</head>
<p>
Given a member of the <term>date</term>
<termref def="dt-value-space"/>, the
<term>date</term> portion of the canonical representation (the entire representation
for nontimezoned values, and all but the timezone representation for timezoned values)
is always the <term>date</term> portion of the <dtref ref="dateTime"/> canonical
representation of the interval midpoint (the <dtref ref="dateTime"/> representation,
truncated on the right to eliminate 'T' and all following characters).
For timezoned values, append the canonical representation of the <termref def="recoverable-timezone"/>.
</p>
</div4>
</div3>
<div3 id="gYearMonth">
<head>gYearMonth</head>
<p>
<termdef id="dt-gYearMonth" term="gYearMonth" role="local">
<term>gYearMonth</term> represents a
specific gregorian month in a specific gregorian year.  The
<termref def="dt-value-space"/> of <term>gYearMonth</term>
is the set of Gregorian calendar months as defined in &sect; 5.2.1 of
<bibref ref="ISO8601"/>.  Specifically, it is a set of one-month long,
non-periodic instances
e.g. 1999-10 to represent the whole month of 1999-10, independent of
how many days this month has.
</termdef>
</p>
<p>
Since the lexical representation allows an optional time zone
indicator, <term>gYearMonth</term> values are partially ordered because it may
not be possible to unequivocally determine the order of two values one of
which has a time zone and the other does not.  If <term>gYearMonth</term>
values are considered as periods of time, the order relation on
<term>gYearMonth</term> values is the order relation on their starting instants.
This is discussed in <specref ref="dateTime-order"/>.  See also
<specref ref="adding-durations-to-dateTimes"/>.  Pairs of <term>gYearMonth</term>
values with or without time zone indicators are totally ordered.
</p>
<note>
<p>
Because month/year combinations in one calendar only rarely correspond
to month/year combinations in other calendars, values of this type
are not, in general, convertible to simple values corresponding to month/year
combinations in other calendars.  This type should therefore be used with caution
in contexts where conversion to other calendars is desired.
</p>
</note>
<note diff="add">
<p>See the conformance note in <specref ref="year-sec-conformance"/> which
applies to the year part of this datatype as well.</p>
</note>
<div4 id="gYearMonth-lexical-repr">
<head>Lexical representation</head>
<p>
The lexical representation for <term>gYearMonth</term> is the reduced
(right truncated) lexical representation for <dtref ref="dateTime"/>:
CCYY-MM.  No left truncation is allowed.  An optional following time
zone qualifier is allowed.  To accommodate year values outside the range from 0001 to 9999, additional digits
can be added to the left of this representation and a preceding "-" sign is allowed.
</p>
<p>
For example, to indicate the month of May 1999, one would write: 1999-05.
See also <specref ref="isoformats"/>.
</p>
</div4>
<div4 id="gYearMonth-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="gYear">
<head>gYear</head>
<p>
<termdef id="dt-gYear" term="gYear" role="local">
<term>gYear</term> represents a
gregorian calendar year.  The <termref def="dt-value-space"/> of
<term>gYear</term> is the set of Gregorian calendar years as defined in
&sect; 5.2.1 of <bibref ref="ISO8601"/>. Specifically, it is a set of one-year
long, non-periodic instances
e.g. lexical 1999 to represent the whole year 1999, independent of
how many months and days this year has.
</termdef>
</p>
<p>
Since the lexical representation allows an optional time zone
indicator, <term>gYear</term> values are partially ordered because it may
not be possible to unequivocally determine the order of two values one of which has a
time zone and the other does not.  If
<term>gYear</term> values are considered as periods of time, the order relation
on <term>gYear</term> values is the order relation on their starting instants.
This is discussed in <specref ref="dateTime-order"/>.  See also
<specref ref="adding-durations-to-dateTimes"/>.  Pairs of <term>gYear</term> values with or without time zone indicators are totally ordered.
</p>
<note>
<p>
Because years in one calendar only rarely correspond to years
in other calendars, values of this type
are not, in general, convertible to simple values corresponding to years
in other calendars.  This type should therefore be used with caution
in contexts where conversion to other calendars is desired.
</p>
</note>
<note diff="add">
<p>See the conformance note in <specref ref="year-sec-conformance"/> which
applies to the year part of this datatype as well.</p>
</note>
<div4 id="gYear-lexical-repr">
<head>Lexical representation</head>
<p>
The lexical representation for <term>gYear</term> is the reduced (right
truncated) lexical representation for <dtref ref="dateTime"/>: CCYY.
No left truncation is allowed.  An optional following time
zone qualifier is allowed as for <dtref ref="dateTime"/>.   To
accommodate year values outside the range from 0001 to 9999, additional
digits can be added to the left of this representation and a preceding
"-" sign is allowed.
</p>
<p>
For example, to indicate 1999, one would write: 1999.
See also <specref ref="isoformats"/>.
</p>
</div4>
<div4 id="gYear-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="gMonthDay">
<head>gMonthDay</head>
<p>
<termdef id="dt-gMonthDay" term="gMonthDay" role="local">
<term>gMonthDay</term> is a gregorian date that recurs, specifically a day of
the year such as the third of May.  Arbitrary recurring dates are not
supported by this datatype.  The <termref def="dt-value-space"/> of
<term>gMonthDay</term> is the set of <emph>calendar
dates</emph>, as defined in &sect; 3 of <bibref ref="ISO8601"/>.  Specifically,
it is a set of one-day long, annually periodic instances.
</termdef>
</p>
<p>
Since the lexical representation allows an optional time zone
indicator, <term>gMonthDay</term> values are partially ordered because it may
not be possible to unequivocally determine the order of two values one of which has a
time zone and the other does not.  If
<term>gMonthDay</term> values are considered as periods of time,
<phrase diff="add">in an arbitrary leap year,</phrase> the order relation
on <term>gMonthDay</term> values is the order relation on their starting instants.
This is discussed in <specref ref="dateTime-order"/>.  See also
<specref ref="adding-durations-to-dateTimes"/>.  Pairs of <term>gMonthDay</term> values with or without time zone indicators are totally ordered.
</p>
<note>
<p>
Because day/month combinations in one calendar only rarely correspond
to day/month combinations in other calendars, values of this type do not,
in general, have any straightforward or intuitive representation
in terms of most other calendars. This type should therefore be
used with caution in contexts where conversion to other calendars
is desired.
</p>
</note>
<div4 id="gMonthDay-lexical-repr">
<head>Lexical representation</head>
<p>
The lexical representation for <term>gMonthDay</term> is the left
truncated lexical representation for <dtref ref="date"/>: --MM-DD.
An optional following time
zone qualifier is allowed as for <dtref ref="date"/>.
No preceding sign is allowed.  No other formats are allowed. See also <specref ref="isoformats"/>.
</p>
<p>This datatype can be used to represent a specific day in a month.
To say, for example, that my birthday occurs on the 14th of September ever year.
</p>
</div4>
<div4 id="gMonthDay-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="gDay">
<head>gDay</head>
<p>
<termdef id="dt-gDay" term="gDay" role="local">
<term>gDay</term> is a gregorian day that recurs, specifically a day
of the month such as the 5th of the month.  Arbitrary recurring days
are not supported by this datatype.  The <termref def="dt-value-space"/>
of <term>gDay</term> is the space of a set of <emph>calendar
dates</emph> as defined in &sect; 3 of <bibref ref="ISO8601"/>.  Specifically,
it is a set of one-day long, monthly periodic instances.
</termdef>
</p>
<p>
This datatype can be used to represent a specific day of the month.
To say, for example, that I get my paycheck on the 15th of each month.
</p>
<p>
Since the lexical representation allows an optional time zone
indicator, <term>gDay</term> values are partially ordered because it may
not be possible to unequivocally determine the order of two values one of
which has a time zone and the other does not.  If
<term>gDay</term> values are considered as periods of time,
<phrase diff="add">in an arbitrary month that has 31 days,</phrase>
the order relation
on <term>gDay</term> values is the order relation on their starting instants.
This is discussed in <specref ref="dateTime-order"/>.  See also
<specref ref="adding-durations-to-dateTimes"/>.  Pairs of <term>gDay</term>
values with or without time zone indicators are totally ordered.
</p>
<note>
<p>
Because days in one calendar only rarely correspond
to days in other calendars, values of this type do not,
in general, have any straightforward or intuitive representation
in terms of most other calendars. This type should therefore be
used with caution in contexts where conversion to other calendars
is desired.
</p>
</note>
<div4 id="gDay-lexical-repr">
<head>Lexical representation</head>
<p>
The lexical representation for <term>gDay</term> is the left
truncated lexical representation for <dtref ref="date"/>: ---DD .
An optional following time
zone qualifier is allowed as for <dtref ref="date"/>.  No preceding sign is
allowed. No other formats are allowed.  See also <specref ref="isoformats"/>.
</p>
</div4>
<div4 id="gDay-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="gMonth">
<head>gMonth</head>
<p>
<termdef id="dt-gMonth" term="gMonth" role="local">
<term>gMonth</term> is a gregorian month that recurs every year.
The <termref def="dt-value-space"/>
of <term>gMonth</term> is the space of a set of <emph>calendar
months</emph> as defined in &sect; 3 of <bibref ref="ISO8601"/>.  Specifically,
it is a set of one-month long, yearly periodic instances.
</termdef>
</p>
<p>
This datatype can be used to represent a specific month.
To say, for example, that Thanksgiving falls in the month of November.
</p>
<p>
Since the lexical representation allows an optional time zone
indicator, <term>gMonth</term> values are partially ordered because it may
not be possible to unequivocally determine the order of two values one of which has a
time zone and the other does not.  If
<term>gMonth</term> values are considered as periods of time, the order relation
on <term>gMonth</term> is the order relation on their starting instants.
This is discussed in <specref ref="dateTime-order"/>.  See also
<specref ref="adding-durations-to-dateTimes"/>.  Pairs of <term>gMonth</term>
values with or without time zone indicators are totally ordered.
</p>
<note>
<p>
Because months in one calendar only rarely correspond
to months in other calendars, values of this type do not,
in general, have any straightforward or intuitive representation
in terms of most other calendars. This type should therefore be
used with caution in contexts where conversion to other calendars
is desired.
</p>
</note>
<div4 id="gMonth-lexical-repr">
<head>Lexical representation</head>
<p>
The lexical representation for <term>gMonth</term> is the left
and right truncated lexical representation for <dtref ref="date"/>: --MM<phrase diff="del">--</phrase>.
An optional following time
zone qualifier is allowed as for <dtref ref="date"/>.  No preceding sign is
allowed. No other formats are allowed.  See also <specref ref="isoformats"/>.
</p>
</div4>
<div4 id="gMonth-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="hexBinary">
<head>hexBinary</head>
<p>
<termdef id="dt-hexBinary" term="hexBinary" role="local">
<term>hexBinary</term> represents
arbitrary hex-encoded binary data.  The <termref def="dt-value-space"/> of
<term>hexBinary</term> is the set of finite-length sequences of binary
octets.
</termdef>
</p>
<div4 id="hexBinary-lexical-representation">
<head>Lexical Representation</head>
<p>
<term>hexBinary</term> has a lexical representation where
each binary octet is encoded as a character tuple, consisting of two
hexadecimal digits ([0-9a-fA-F]) representing the octet code. For example,
"0FB7" is a <emph>hex</emph> encoding for the 16-bit integer 4023
(whose binary representation is 111110110111).
</p>
</div4>
<div4 id="hexBinary-canonical-repr">
<head>Canonical <phrase diff="add">Representation</phrase>
<phrase diff="del">Rrepresentation</phrase>
</head>
<p>
The canonical representation for <term>hexBinary</term> is defined
by prohibiting certain options from the
<specref ref="hexBinary-lexical-representation"/>.  Specifically, the lower case
hexadecimal digits ([a-f]) are not allowed.
</p>
</div4>
<div4 id="hexBinary-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="base64Binary">
<head>base64Binary</head>
<p>
<termdef id="dt-base64Binary" term="base64Binary" role="local">
<term>base64Binary</term>
represents Base64-encoded arbitrary binary data.  The <termref def="dt-value-space"/> of
<term>base64Binary</term> is the set of finite-length sequences of binary
octets. For <term>base64Binary</term> data the
entire binary stream is encoded using the Base64
<phrase diff="del">Content-Transfer-Encoding defined in Section 6.8 of</phrase>
<phrase diff="add">Alphabet in</phrase>
<bibref ref="RFC2045"/>.
</termdef>
</p>
<p diff="add">
The lexical forms of <term>base64Binary</term> values are limited to the 65 characters
of the Base64 Alphabet defined in <bibref ref="RFC2045"/>, i.e., <code>a-z</code>,
<code>A-Z</code>, <code>0-9</code>, the plus sign (+), the forward slash (/) and the
equal sign (=), together with the characters defined in <bibref ref="XML"/> as white space.
No other characters are allowed.
</p>
<p diff="add">
For compatibility with older mail gateways, <bibref ref="RFC2045"/> suggests that
base64 data should have lines limited to at most 76 characters in length.  This
line-length limitation is not mandated in the lexical forms of <term>base64Binary</term>
data and must not be enforced by XML Schema processors.
</p>
<p diff="add">
The lexical space of <term>base64Binary</term> is given by the following grammar
(the notation is that used in <bibref ref="XML"/>); legal lexical forms must match
the <term>Base64Binary</term> production.
</p>
<p diff="add">
<code>Base64Binary&nbsp;&nbsp;::=&nbsp;&nbsp;((B64S B64S B64S B64S)*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((B64S B64S B64S B64) |<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(B64S B64S B16S '=') |<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(B64S B04S '=' #x20? '=')))?<br/>
<br/>B64S &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::= B64 #x20?<br/>
<br/>
B16S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::= B16 #x20?<br/>
<br/>
B04S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::= B04 #x20?</code>
<code>
<br/>
<br/>
B04&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::=&nbsp;&nbsp;[AQgw]<br/>
B16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::=&nbsp;&nbsp;[AEIMQUYcgkosw048]<br/>
B64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::=&nbsp;&nbsp;[A-Za-z0-9+/]
</code>
</p>
<p diff="add">
Note that this grammar requires the number of non-whitespace characters in the lexical
form to be a multiple of four, and for equals signs to appear only at the end of the
lexical form; strings which do not meet these constraints are not legal lexical forms
of <term>base64Binary</term> because they cannot successfully be decoded by base64
decoders.
</p>
<note diff="add">
<p>The above definition of the lexical space is more restrictive than that
given in <bibref ref="RFC2045"/> as regards whitespace -- this is not an issue
in practice.  Any string compatible with the RFC can occur in
	    an element or attribute validated by this type, because the <termref def="dt-whiteSpace"/> facet of this type is fixed
to <pt>collapse</pt>, which means that all leading and trailing whitespace
will be stripped, and all internal whitespace collapsed to single space
characters, <emph>before</emph> the above grammar is enforced.</p>
</note>
<p diff="add">
The canonical lexical form of a <term>base64Binary</term> data value is the base64
encoding of the value which matches the Canonical-base64Binary production in the following
grammar:
</p>
<p diff="add">
<code>Canonical-base64Binary&nbsp;&nbsp;::=&nbsp;&nbsp;(B64
B64 B64 B64)*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((B64 B64 B16 '=') | (B64 B04 '=='))?</code>
</p>
<note diff="add">
<p>For some values the canonical form defined above does not conform to
<bibref ref="RFC2045"/>, which requires
breaking with linefeeds at appropriate intervals.</p>
</note>
<p diff="add">
The length of a <term>base64Binary</term> value is the number of octets it contains.
This may be calculated from the lexical form by removing whitespace and padding characters
and performing the calculation shown in the pseudo-code below:
</p>
<p diff="add">
<code>
lex2&nbsp;&nbsp;&nbsp;&nbsp;:=&nbsp;killwhitespace(lexform)&nbsp;&nbsp;&nbsp;&nbsp;-- remove whitespace characters<br/>
lex3&nbsp;&nbsp;&nbsp;&nbsp;:=&nbsp;strip_equals(lex2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- strip padding characters at end<br/>
length&nbsp;&nbsp;:=&nbsp;floor (length(lex3) * 3 / 4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- calculate length
</code>
</p>
<p diff="add">
Note on encoding: <bibref ref="RFC2045"/> explicitly references US-ASCII encoding.  However,
decoding of <term>base64Binary</term> data in an XML entity is to be performed on the
Unicode characters obtained after character encoding processing as specified by
<bibref ref="XML"/>
</p>
<div4 id="base64Binary-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="anyURI">
<head>anyURI</head>
<p>
<termdef id="dt-anyURI" term="anyURI" role="local">
<term>anyURI</term> represents a Uniform Resource Identifier Reference
(URI).  An <term>anyURI</term> value can be absolute or relative, and may
have an optional fragment identifier (i.e., it may be a URI Reference).  This
type should be used to specify the intention that the value fulfills
the role of a URI as defined by <bibref ref="RFC2396"/>, as amended by
<bibref ref="RFC2732"/>.
</termdef>
</p>
<p>
The mapping from <term>anyURI</term> values to URIs is as
<phrase diff="add">defined by the URI reference escaping procedure</phrase>
defined in
Section 5.4 <xspecref href="&xlink;#link-locators">Locator Attribute</xspecref>
of <bibref ref="XLink"/> (see also Section 8
<xspecref href="&charmod;#sec-URIs">Character Encoding in URI References</xspecref>
of <bibref ref="CharMod"/>).  This means
that a wide range of internationalized resource identifiers can be specified
when an <term>anyURI</term> is called for, and still be understood as
URIs per <bibref ref="RFC2396"/>, as amended by <bibref ref="RFC2732"/>,
where appropriate to identify resources.
</p>
<note diff="add">
<p>
Section 5.4 <xspecref href="&xlink;#link-locators">Locator Attribute</xspecref>
of <bibref ref="XLink"/> requires that relative URI references be absolutized
as defined in <bibref ref="XBase"/> before use.  This is an XLink-specific
requirement and is not appropriate for XML Schema, since neither the
<termref def="dt-lexical-space"/> nor the <termref def="dt-value-space"/>
of the <dtref ref="anyURI"/> type are restricted to absolute URIs.  Accordingly
absolutization must not be performed by schema processors as part of schema
validation.
</p>
</note>
<note>
<p>
Each URI scheme imposes specialized syntax rules for URIs in
that scheme, including restrictions on the syntax of allowed
<phrase diff="add">fragment</phrase>
<phrase diff="del">fragement</phrase>
identifiers. Because it is
impractical for processors to check that a value is a
context-appropriate URI reference, this specification follows the
lead of <bibref ref="RFC2396"/> (as amended by <bibref ref="RFC2732"/>)
in this matter: such rules and restrictions are not part of type validity
and are not checked by <termref def="dt-minimally-conforming"/> processors.
Thus in practice the above definition imposes only very modest obligations
on <termref def="dt-minimally-conforming"/> processors.
</p>
</note>
<div4 id="anyURI-lexical-representation">
<head>Lexical representation</head>
<p>
The <termref def="dt-lexical-space"/> of <term>anyURI</term> is
finite-length character sequences which, when the algorithm defined in
Section 5.4 of <bibref ref="XLink"/> is applied to them, result in strings
which are legal URIs according to <bibref ref="RFC2396"/>, as amended by
<bibref ref="RFC2732"/>.
</p>
<note>
<p>
Spaces are, in principle, allowed in the <termref def="dt-lexical-space"/>
of <term>anyURI</term>, however, their use is highly discouraged
(unless they are encoded by %20).
</p>
</note>
</div4>
<div4 id="anyURI-facets">
<head>Constraining facets</head>
<facets/>
<!--
<p>
<phrase diff='add'>
The use of <termref def="dt-length"/>, <termref def="dt-minLength"/> and
<termref def="dt-maxLength"/>
on datatypes <termref def='dt-derived'/> from <dtref ref='anyURI'/> is
deprecated.  Future versions of this specification may
remove these facets for this datatype.
</phrase>
</p>
-->
</div4>
</div3>
<div3 id="QName">
<head>QName</head>
<p>
<termdef id="dt-QName" term="QName" role="local">
<term>QName</term> represents
<xspecref href="&xmlnsspec;#dt-qname">XML qualified names</xspecref>.
The <termref def="dt-value-space"/> of <term>QName</term> is the set of
tuples {<xspecref href="&xmlnsspec;#dt-NSName">namespace name</xspecref>,
<xspecref href="&xmlnsspec;#dt-localname">local part</xspecref>},
where <xspecref href="&xmlnsspec;#dt-NSName">namespace name</xspecref>
is an <dtref ref="anyURI"/>
and <xspecref href="&xmlnsspec;#dt-localname">local part</xspecref> is
an <dtref ref="NCName"/>.

The <termref def="dt-lexical-space"/> of <term>QName</term> is the set
of strings that <termref def="dt-match"/> the <xspecref href="&xmlnsspec;#NT-QName">
QName</xspecref> production of <bibref ref="XMLNS"/>.
</termdef>
</p>
<note>
<p>
The mapping between literals in the <termref def="dt-lexical-space"/> and
values in the <termref def="dt-value-space"/> of <term>QName</term> requires
a namespace declaration to be in scope for the context in which <term>QName</term>
is used.
</p>
</note>
<div4 id="QName-facets">
<head>Constraining facets</head>
<facets/>
<p>
<phrase diff="add">
The use of <termref def="dt-length"/>, <termref def="dt-minLength"/> and
<termref def="dt-maxLength"/>
on datatypes <termref def="dt-derived"/> from <dtref ref="QName"/> is
deprecated.  Future versions of this specification may
remove these facets for this datatype.
</phrase>
</p>
</div4>
</div3>
<div3 id="NOTATION">
<head>NOTATION</head>
<p>
<termdef id="dt-NOTATION" term="NOTATION" role="local">
<term>NOTATION</term>
represents the <xnt href="&xmlspec;#NT-NotationType">NOTATION</xnt> attribute
type from <bibref ref="XML"/>. The <termref def="dt-value-space"/>
of <term>NOTATION</term> is the set of <dtref ref="QName"/>s
<phrase diff="add">of notations declared in the current schema</phrase>.
The <termref def="dt-lexical-space"/> of <term>NOTATION</term> is the set
of all names of <xspecref href="&xsdl;#declare-notation">notations</xspecref>
declared in the current schema (<phrase diff="add">in the form of <dtref ref="QName"/>s</phrase>).
</termdef>
</p>
<constraintnote type="cos" id="enumeration-required-notation">
<head>enumeration facet value required for NOTATION</head>
<p>
It is an <termref def="dt-error"/> for <term>NOTATION</term>
to be used directly in a schema.  Only datatypes that are
<termref def="dt-derived"/> from <term>NOTATION</term> by
specifying a value for <termref def="dt-enumeration"/> can be used
in a schema.
</p>
</constraintnote>
<p>
For compatibility (see <specref ref="terminology"/>) <term>NOTATION</term>
should be used only on attributes
<phrase diff="add">and should only be used in schemas with no
target namespace</phrase>.
</p>
<div4 id="NOTATION-facets">
<head>Constraining facets</head>
<facets/>
<p>
<phrase diff="add">
The use of <termref def="dt-length"/>, <termref def="dt-minLength"/> and <termref def="dt-maxLength"/>
on datatypes <termref def="dt-derived"/> from <dtref ref="NOTATION"/> is
deprecated.  Future versions of this specification may
remove these facets for this datatype.
</phrase>
</p>
</div4>
</div3>
</div2>
<div2 id="built-in-derived">
<head>Derived datatypes</head>
<p>
This section gives conceptual definitions for all
<termref def="dt-built-in"/>&nbsp;<termref def="dt-derived"/> datatypes
defined by this specification. The XML representation used to define
<termref def="dt-derived"/> datatypes (whether
<termref def="dt-built-in"/> or <termref def="dt-user-derived"/>) is
given in section <specref ref="xr-defn"/> and the complete
definitions of the <termref def="dt-built-in"/>&nbsp;
<termref def="dt-derived"/> datatypes are provided in Appendix A
<specref ref="schema"/>.
</p>
<div3 id="normalizedString">
<head>normalizedString</head>
<p>
<termdef id="dt-normalizedString" term="normalizedString" role="local">
<term>normalizedString</term>
represents white space normalized strings.
The <termref def="dt-value-space"/> of <term>normalizedString</term> is the
set of strings that do not
contain the carriage return (#xD), line feed (#xA) nor tab (#x9) characters.
The <termref def="dt-lexical-space"/> of <term>normalizedString</term> is the
set of strings that do not
contain the carriage return (#xD),
<phrase diff="add">line feed (#xA)</phrase>
nor tab (#x9) characters.
The <termref def="dt-basetype"/> of <term>normalizedString</term> is <baseref/>.
</termdef>
</p>
<div4 id="normalizedString-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="normalizedString-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="token">
<head>token</head>
<p>
<termdef id="dt-token" term="token" role="local">
<term>token</term>
represents tokenized strings.
The <termref def="dt-value-space"/> of <term>token</term> is the
set of strings that do not
contain the
<phrase diff="add">carriage return (#xD),</phrase>
line feed (#xA) nor tab (#x9) characters, that have no
leading or trailing spaces (#x20) and that have no internal sequences
of two or more spaces.
The <termref def="dt-lexical-space"/> of <term>token</term> is the
set of strings that do not contain the
<phrase diff="add">carriage return (#xD),</phrase>
line feed (#xA) nor tab (#x9) characters, that have no
leading or trailing spaces (#x20) and that have no internal sequences
of two or more spaces.
The <termref def="dt-basetype"/> of <term>token</term> is <baseref/>.
</termdef>
</p>
<div4 id="token-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="token-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="language">
<head>language</head>
<p>
<termdef id="dt-language" term="language" role="local">
<term>language</term>
represents natural language identifiers as defined by
<phrase diff="add">by <bibref ref="RFC3066"/>
</phrase>
<phrase diff="del">
<bibref ref="RFC1766"/>
</phrase>.
The <termref def="dt-value-space"/> of <term>language</term> is the
set of all strings that are valid language identifiers as defined
<phrase diff="add">
<bibref ref="RFC3066"/>
</phrase>
<phrase diff="del">in the
<xspecref href="&xmlspec;#sec-lang-tag">language identification</xspecref>
section of <bibref ref="XML"/>
</phrase>.
The <termref def="dt-lexical-space"/> of
<term>language</term> is the set of all strings that
<phrase diff="add">conform to the pattern <code>[a-zA-Z]{1,8}(-[a-zA-Z0-9]{1,8})*</code>
</phrase>
<phrase diff="del">are valid language identifiers as defined in the
<xspecref href="&xmlspec;#sec-lang-tag">language identification</xspecref>
section of <bibref ref="XML"/>
</phrase>.
The <termref def="dt-basetype"/> of <term>language</term> is <baseref/>.
</termdef>
</p>
<div4 id="language-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="NMTOKEN">
<head>NMTOKEN</head>
<p>
<termdef id="dt-NMTOKEN" term="NMTOKEN" role="local">
<term>NMTOKEN</term> represents
the <xnt href="&xmlspec;#NT-TokenizedType">NMTOKEN attribute type</xnt>
from <bibref ref="XML"/>. The <termref def="dt-value-space"/> of
<term>NMTOKEN</term> is the set of tokens that <termref def="dt-match"/>
the <xnt href="&xmlspec;#NT-Nmtoken">Nmtoken</xnt> production in
<bibref ref="XML"/>. The <termref def="dt-lexical-space"/> of
<term>NMTOKEN</term> is the set of strings that <termref def="dt-match"/>
the <xnt href="&xmlspec;#NT-Nmtoken">Nmtoken</xnt> production in
<bibref ref="XML"/>.  The <termref def="dt-basetype"/> of
<term>NMTOKEN</term> is <baseref/>.
</termdef>
</p>
<p>
For compatibility (see <specref ref="terminology"/>) <term>NMTOKEN</term>
should be used only on attributes.
</p>
<div4 id="NMTOKEN-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="NMTOKEN-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="NMTOKENS">
<head>NMTOKENS</head>
<p>
<termdef id="dt-NMTOKENS" term="NMTOKENS" role="local">
<term>NMTOKENS</term>
represents the <xnt href="&xmlspec;#NT-TokenizedType">NMTOKENS attribute
type</xnt> from <bibref ref="XML"/>. The <termref def="dt-value-space"/>
of <term>NMTOKENS</term> is the set of finite, non-zero-length sequences of
<termref def="dt-NMTOKEN"/>s.  The <termref def="dt-lexical-space"/>
of <term>NMTOKENS</term> is the set of <phrase diff="del">white
</phrase>space<phrase diff="add">-</phrase>separated lists of tokens,
of which each token is in the <termref def="dt-lexical-space"/> of
<dtref ref="NMTOKEN"/>.  The <termref def="dt-itemType"/> of
<term>NMTOKENS</term> is <itemTyperef/>.
</termdef>
</p>
<p>
For compatibility (see <specref ref="terminology"/>)
<term>NMTOKENS</term> should be used only on attributes.
</p>
<div4 id="NMTOKENS-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="Name">
<head>Name</head>
<p>
<termdef id="dt-Name" term="Name" role="local">
<term>Name</term>
represents <xspecref href="&xmlspec;#dt-name">XML Names</xspecref>.
The <termref def="dt-value-space"/> of <term>Name</term> is
the set of all strings which <termref def="dt-match"/> the
<xnt href="&xmlspec;#NT-Name">Name</xnt> production of
<bibref ref="XML"/>.  The <termref def="dt-lexical-space"/> of
<term>Name</term> is the set of all strings which <termref def="dt-match"/>
the <xnt href="&xmlspec;#NT-Name">Name</xnt> production of
<bibref ref="XML"/>. The <termref def="dt-basetype"/> of <term>Name</term>
is <baseref/>.
</termdef>
</p>
<div4 id="Name-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="Name-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="NCName">
<head>NCName</head>
<p>
<termdef id="dt-NCName" term="NCName" role="local">
<term>NCName</term> represents XML
"non-colonized" Names.  The <termref def="dt-value-space"/> of
<term>NCName</term> is the set of all strings which <termref def="dt-match"/>
the <xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production of
<bibref ref="XMLNS"/>.  The <termref def="dt-lexical-space"/> of
<term>NCName</term> is the set of all strings which <termref def="dt-match"/>
the <xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production of
<bibref ref="XMLNS"/>.  The <termref def="dt-basetype"/> of
<term>NCName</term> is <baseref/>.
</termdef>
</p>
<div4 id="NCName-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="NCName-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="ID">
<head>ID</head>
<p>
<termdef id="dt-ID" term="ID" role="local">
<term>ID</term> represents the
<xnt href="&xmlspec;#NT-TokenizedType">ID attribute type</xnt> from
<bibref ref="XML"/>.  The <termref def="dt-value-space"/> of
<term>ID</term> is the set of all strings that <termref def="dt-match"/>
the <xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production in
<bibref ref="XMLNS"/>.  The
<termref def="dt-lexical-space"/> of <term>ID</term> is the set of all
strings that <termref def="dt-match"/> the
<xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production in
<bibref ref="XMLNS"/>.
The <termref def="dt-basetype"/> of <term>ID</term> is <baseref/>.
</termdef>
</p>
<p>
For compatibility (see <specref ref="terminology"/>)
<term>ID</term> should be used only on attributes.
</p>
<div4 id="ID-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="IDREF">
<head>IDREF</head>
<p>
<termdef id="dt-IDREF" term="IDREF" role="local">
<term>IDREF</term> represents the
<xnt href="&xmlspec;#NT-TokenizedType">IDREF attribute type</xnt> from
<bibref ref="XML"/>.  The <termref def="dt-value-space"/> of
<term>IDREF</term> is the set of all strings that <termref def="dt-match"/>
the <xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production in
<bibref ref="XMLNS"/>.  The
<termref def="dt-lexical-space"/> of <term>IDREF</term> is the set of
strings that <termref def="dt-match"/> the
<xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production in
<bibref ref="XMLNS"/>.
The <termref def="dt-basetype"/> of <term>IDREF</term> is <baseref/>.
</termdef>
</p>
<p>
For compatibility (see <specref ref="terminology"/>) this datatype
should be used only on attributes.
</p>
<div4 id="IDREF-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="IDREF-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="IDREFS">
<head>IDREFS</head>
<p>
<termdef id="dt-IDREFS" term="IDREFS" role="local">
<term>IDREFS</term> represents the
<xnt href="&xmlspec;#NT-TokenizedType">IDREFS attribute type</xnt> from
<bibref ref="XML"/>.  The <termref def="dt-value-space"/> of
<term>IDREFS</term> is the set of finite, non-zero-length sequences of
<dtref ref="IDREF"/>s.
The <termref def="dt-lexical-space"/> of <term>IDREFS</term> is the
set of <phrase diff="del">white </phrase>space<phrase diff="add">-</phrase>separated lists of tokens, of which each token is in the
<termref def="dt-lexical-space"/> of <dtref ref="IDREF"/>.
The <termref def="dt-itemType"/> of <term>IDREFS</term> is
<itemTyperef/>.
</termdef>
</p>
<p>
For compatibility (see <specref ref="terminology"/>) <term>IDREFS</term>
should be used only on attributes.
</p>
<div4 id="IDREFS-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="ENTITY">
<head>ENTITY</head>
<p>
<termdef id="dt-ENTITY" term="ENTITY" role="local">
<term>ENTITY</term> represents the
<xnt href="&xmlspec;#NT-TokenizedType">ENTITY</xnt> attribute type from
<bibref ref="XML"/>.  The <termref def="dt-value-space"/> of
<term>ENTITY</term> is the set of all strings that <termref def="dt-match"/>
the <xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production in
<bibref ref="XMLNS"/> and have been declared as an
<xspecref href="&xmlspec;#dt-unparsed">unparsed entity</xspecref> in
a <xspecref href="&xmlspec;#dt-doctype">document type definition</xspecref>.
The <termref def="dt-lexical-space"/> of <term>ENTITY</term> is the set
of all strings that <termref def="dt-match"/> the
<xnt href="&xmlnsspec;#NT-NCName">NCName</xnt> production in
<bibref ref="XMLNS"/>.
The <termref def="dt-basetype"/> of <term>ENTITY</term> is <baseref/>.
</termdef>
</p>
<note>
<p>
The <termref def="dt-value-space"/> of <term>ENTITY</term> is scoped
to a specific instance document.
</p>
</note>
<p>
For compatibility (see <specref ref="terminology"/>) <term>ENTITY</term>
should be used only on attributes.
</p>
<div4 id="ENTITY-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="ENTITY-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="ENTITIES">
<head>ENTITIES</head>
<p>
<termdef id="dt-ENTITIES" term="ENTITIES" role="local">
<term>ENTITIES</term>
represents the <xnt href="&xmlspec;#NT-TokenizedType">ENTITIES attribute
type</xnt> from <bibref ref="XML"/>. The <termref def="dt-value-space"/>
of <term>ENTITIES</term> is the set of finite, non-zero-length sequences of
<termref def="dt-ENTITY"/>s that have been declared as
<xspecref href="&xmlspec;#dt-unparsed">unparsed entities</xspecref>
in a <xspecref href="&xmlspec;#dt-doctype">document type definition</xspecref>.
The <termref def="dt-lexical-space"/> of <term>ENTITIES</term> is the
set of <phrase diff="del">white </phrase>space<phrase diff="add">-</phrase>separated lists of tokens, of which each token is in the
<termref def="dt-lexical-space"/> of <dtref ref="ENTITY"/>.
The <termref def="dt-itemType"/> of <term>ENTITIES</term> is
<itemTyperef/>.
</termdef>
</p>
<note>
<p>
The <termref def="dt-value-space"/> of <term>ENTITIES</term> is scoped
to a specific instance document.
</p>
</note>
<p>
For compatibility (see <specref ref="terminology"/>) <term>ENTITIES</term>
should be used only on attributes.
</p>
<div4 id="ENTITIES-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="integer">
<head>integer</head>
<p>
<termdef id="dt-integer" term="integer" role="local">
<term>integer</term> is
<termref def="dt-derived"/> from <dtref ref="decimal"/> by fixing the
value of <termref def="dt-fractionDigits"/> to be 0<phrase diff="add">and
disallowing the trailing decimal point</phrase>.
This results in the standard
mathematical concept of the integer numbers. The
<termref def="dt-value-space"/> of <term>integer</term> is the infinite
set {...,-2,-1,0,1,2,...}.  The <termref def="dt-basetype"/> of
<term>integer</term> is <baseref/>.
</termdef>
</p>
<div4 id="integer-lexical-representation">
<head>Lexical representation</head>
<p>
<term>integer</term> has a lexical representation consisting of a finite-length sequence
of decimal digits (#x30-#x39) with an optional leading sign.  If the sign is omitted,
"+" is assumed.  For example: -1, 0, 12678967543233, +100000.
</p>
</div4>
<div4 id="integer-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>integer</term> is defined
by prohibiting certain options from the
<specref ref="integer-lexical-representation"/>.  Specifically, the preceding optional "+" sign is prohibited and leading zeroes are prohibited.
</p>
</div4>
<div4 id="integer-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="integer-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="nonPositiveInteger">
<head>nonPositiveInteger</head>
<p>
<termdef id="dt-nonPositiveInteger" term="nonPositiveInteger" role="local">
<term>nonPositiveInteger</term> is <termref def="dt-derived"/> from
<dtref ref="integer"/> by setting the value of
<termref def="dt-maxInclusive"/> to be 0.  This results in the
standard mathematical concept of the non-positive integers.
The <termref def="dt-value-space"/> of <term>nonPositiveInteger</term>
is the infinite set {...,-2,-1,0}.  The <termref def="dt-basetype"/>
of <term>nonPositiveInteger</term> is <baseref/>.
</termdef>
</p>
<div4 id="nonPositiveInteger-lexical-representation">
<head>Lexical representation</head>
<p>
<term>nonPositiveInteger</term> has a lexical representation consisting of
<phrase diff="add">an optional preceding sign</phrase>
<phrase diff="del">a negative sign ("-")</phrase>
followed by a finite-length sequence of decimal digits (#x30-#x39).
<phrase diff="del">If the sequence of digits consists of all
zeros then the sign is optional.</phrase>
<phrase diff="add">The sign may be "+" or may be omitted only for
lexical forms denoting zero; in all other lexical forms, the negative
sign ("-") must be present.</phrase>
For example: -1, 0, -12678967543233, -100000.
</p>
</div4>
<div4 id="nonPositiveInteger-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>nonPositiveInteger</term> is defined
by prohibiting certain options from the
<specref ref="nonPositiveInteger-lexical-representation"/>.
<phrase diff="del">Specifically, the
negative sign ("-") is required with the token "0" and leading</phrase>
<phrase diff="add">In the canonical form for zero, the sign must be
omitted.  Leading</phrase> zeroes are prohibited.
</p>
</div4>
<div4 id="nonPositiveInteger-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="nonPositiveInteger-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="negativeInteger">
<head>negativeInteger</head>
<p>
<termdef id="dt-negativeInteger" term="negativeInteger" role="local">
<term>negativeInteger</term> is <termref def="dt-derived"/> from
<dtref ref="nonPositiveInteger"/> by setting the value of
<termref def="dt-maxInclusive"/> to be -1.  This results in the
standard mathematical concept of the negative integers.  The
<termref def="dt-value-space"/> of <term>negativeInteger</term>
is the infinite set {...,-2,-1}.  The <termref def="dt-basetype"/>
of <term>negativeInteger</term>  is <baseref/>.
</termdef>
</p>
<div4 id="negativeInteger-lexical-representation">
<head>Lexical representation</head>
<p>
<term>negativeInteger</term> has a lexical representation consisting of
a negative sign ("-") followed by a finite-length
sequence of decimal digits (#x30-#x39).  For example: -1, -12678967543233, -100000.
</p>
</div4>
<div4 id="negativeInteger-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>negativeInteger</term> is defined
by prohibiting certain options from the
<specref ref="negativeInteger-lexical-representation"/>.  Specifically,  leading zeroes are prohibited.
</p>
</div4>
<div4 id="negativeInteger-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="long">
<head>long</head>
<p>
<termdef id="dt-long" term="long" role="local">
<term>long</term> is
<termref def="dt-derived"/> from <dtref ref="integer"/> by setting the
value of <termref def="dt-maxInclusive"/> to be 9223372036854775807
and <termref def="dt-minInclusive"/> to be -9223372036854775808.
The <termref def="dt-basetype"/> of <term>long</term> is
<baseref/>.
</termdef>
</p>
<div4 id="long-lexical-representation">
<head>Lexical representation</head>
<p>
<term>long</term> has a lexical representation consisting
of an optional sign followed by a finite-length
sequence of decimal digits (#x30-#x39).  If the sign is omitted, "+" is assumed.
For example: -1, 0,
12678967543233, +100000.
</p>
</div4>
<div4 id="long-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>long</term> is defined
by prohibiting certain options from the
<specref ref="long-lexical-representation"/>.  Specifically, the
the optional "+" sign is prohibited and leading zeroes are prohibited.
</p>
</div4>
<div4 id="long-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="long-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="int">
<head>int</head>
<p>
<termdef id="dt-int" term="int" role="local">
<term>int</term>
is <termref def="dt-derived"/> from <dtref ref="long"/> by setting the
value of <termref def="dt-maxInclusive"/> to be 2147483647 and
<termref def="dt-minInclusive"/> to be -2147483648.  The
<termref def="dt-basetype"/> of <term>int</term> is <baseref/>.
</termdef>
</p>
<div4 id="int-lexical-representation">
<head>Lexical representation</head>
<p>
<term>int</term> has a lexical representation consisting
of an optional sign followed by a finite-length
sequence of decimal digits (#x30-#x39).  If the sign is omitted, "+" is assumed.
For example: -1, 0,
126789675, +100000.
</p>
</div4>
<div4 id="int-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>int</term> is defined
by prohibiting certain options from the
<specref ref="int-lexical-representation"/>.  Specifically, the
the optional "+" sign is prohibited and leading zeroes are prohibited.
</p>
</div4>
<div4 id="int-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="int-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="short">
<head>short</head>
<p>
<termdef id="dt-short" term="short" role="local">
<term>short</term> is
<termref def="dt-derived"/> from <dtref ref="int"/> by setting the
value of <termref def="dt-maxInclusive"/> to be 32767 and
<termref def="dt-minInclusive"/> to be -32768.  The
<termref def="dt-basetype"/> of <term>short</term> is
<baseref/>.
</termdef>
</p>
<div4 id="short-lexical-representation">
<head>Lexical representation</head>
<p>
<term>short</term> has a lexical representation consisting
of an optional sign followed by a finite-length sequence of decimal
digits (#x30-#x39).  If the sign is omitted, "+" is assumed.
For example: -1, 0, 12678, +10000.
</p>
</div4>
<div4 id="short-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>short</term> is defined
by prohibiting certain options from the
<specref ref="short-lexical-representation"/>.  Specifically, the
the optional "+" sign is prohibited and leading zeroes are prohibited.
</p>
</div4>
<div4 id="short-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="short-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="byte">
<head>byte</head>
<p>
<termdef id="dt-byte" term="byte" role="local">
<term>byte</term>
is <termref def="dt-derived"/> from <dtref ref="short"/>
by setting the value of <termref def="dt-maxInclusive"/> to be 127
and <termref def="dt-minInclusive"/> to be -128.
The <termref def="dt-basetype"/> of <term>byte</term> is
<baseref/>.
</termdef>
</p>
<div4 id="byte-lexical-representation">
<head>Lexical representation</head>
<p>
<term>byte</term> has a lexical representation consisting
of an optional sign followed by a finite-length
sequence of decimal digits (#x30-#x39).  If the sign is omitted, "+" is assumed.
For example: -1, 0,
126, +100.
</p>
</div4>
<div4 id="byte-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>byte</term> is defined
by prohibiting certain options from the
<specref ref="byte-lexical-representation"/>.  Specifically, the
the optional "+" sign is prohibited and leading zeroes are prohibited.
</p>
</div4>
<div4 id="byte-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="nonNegativeInteger">
<head>nonNegativeInteger</head>
<p>
<termdef id="dt-nonNegativeInteger" term="nonNegativeInteger" role="local">
<term>nonNegativeInteger</term> is <termref def="dt-derived"/> from
<dtref ref="integer"/> by setting the value of
<termref def="dt-minInclusive"/> to be 0.  This results in the
standard mathematical concept of the non-negative integers. The
<termref def="dt-value-space"/> of <term>nonNegativeInteger</term>
is the infinite set {0,1,2,...}.  The <termref def="dt-basetype"/> of
<term>nonNegativeInteger</term> is <baseref/>.
</termdef>
</p>
<div4 id="nonNegativeInteger-lexical-representation">
<head>Lexical representation</head>
<p>
<term>nonNegativeInteger</term> has a lexical representation consisting of
an optional sign followed by a finite-length
sequence of decimal digits (#x30-#x39).  If the sign is omitted,
<phrase diff="add">the positive sign ("+")</phrase>
<phrase diff="del">"+"</phrase> is assumed.
<phrase diff="add">If the sign is present, it must be "+" except for lexical forms
denoting zero, which may be preceded by a positive ("+") or a negative ("-") sign.</phrase>
For example:
1, 0, 12678967543233, +100000.
</p>
</div4>
<div4 id="nonNegativeInteger-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>nonNegativeInteger</term> is defined
by prohibiting certain options from the
<specref ref="nonNegativeInteger-lexical-representation"/>.  Specifically, the
the optional "+" sign is prohibited and leading zeroes are prohibited.
</p>
</div4>
<div4 id="nonNegativeInteger-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="nonNegativeInteger-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="unsignedLong">
<head>unsignedLong</head>
<p>
<termdef id="dt-unsignedLong" term="unsignedLong" role="local">
<term>unsignedLong</term> is <termref def="dt-derived"/> from
<dtref ref="nonNegativeInteger"/> by setting the value of
<termref def="dt-maxInclusive"/> to be 18446744073709551615.
The <termref def="dt-basetype"/> of <term>unsignedLong</term> is
<baseref/>.
</termdef>
</p>
<div4 id="unsignedLong-lexical-representation">
<head>Lexical representation</head>
<p>
<term>unsignedLong</term> has a lexical representation consisting
of a finite-length sequence of decimal digits (#x30-#x39).
For example: 0,
12678967543233, 100000.
</p>
</div4>
<div4 id="unsignedLong-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>unsignedLong</term> is defined
by prohibiting certain options from the
<specref ref="unsignedLong-lexical-representation"/>.  Specifically,
leading zeroes are prohibited.
</p>
</div4>
<div4 id="unsignedLong-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="unsignedLong-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="unsignedInt">
<head>unsignedInt</head>
<p>
<termdef id="dt-unsignedInt" term="unsignedInt" role="local">
<term>unsignedInt</term> is <termref def="dt-derived"/> from
<dtref ref="unsignedLong"/> by setting the value of
<termref def="dt-maxInclusive"/> to be 4294967295.  The
<termref def="dt-basetype"/> of <term>unsignedInt</term> is
<baseref/>.
</termdef>
</p>
<div4 id="unsignedInt-lexical-representation">
<head>Lexical representation</head>
<p>
<term>unsignedInt</term> has a lexical representation consisting
of a finite-length
sequence of decimal digits (#x30-#x39).  For example: 0,
1267896754, 100000.
</p>
</div4>
<div4 id="unsignedInt-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>unsignedInt</term> is defined
by prohibiting certain options from the
<specref ref="unsignedInt-lexical-representation"/>.  Specifically,
leading zeroes are prohibited.
</p>
</div4>
<div4 id="unsignedInt-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="unsignedInt-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="unsignedShort">
<head>unsignedShort</head>
<p>
<termdef id="dt-unsignedShort" term="unsignedShort" role="local">
<term>unsignedShort</term> is <termref def="dt-derived"/> from
<dtref ref="unsignedInt"/> by setting the value of
<termref def="dt-maxInclusive"/> to be 65535.  The
<termref def="dt-basetype"/> of <term>unsignedShort</term> is
<baseref/>.
</termdef>
</p>
<div4 id="unsignedShort-lexical-representation">
<head>Lexical representation</head>
<p>
<term>unsignedShort</term>  has a lexical representation consisting
of a finite-length
sequence of decimal digits (#x30-#x39).
For example: 0,
12678, 10000.
</p>
</div4>
<div4 id="unsignedShort-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>unsignedShort</term> is defined
by prohibiting certain options from the
<specref ref="unsignedShort-lexical-representation"/>.  Specifically, the
leading zeroes are prohibited.
</p>
</div4>
<div4 id="unsingedShort-facets">
<head>Constraining facets</head>
<facets/>
</div4>
<div4 id="unsignedShort-derived-types">
<head>Derived datatypes</head>
<subtypes/>
</div4>
</div3>
<div3 id="unsignedByte">
<head>unsignedByte</head>
<p>
<termdef id="dt-unsignedByte" term="unsignedByte" role="local">
<term>unsignedByte</term> is <termref def="dt-derived"/> from
<dtref ref="unsignedShort"/> by setting the value of
<termref def="dt-maxInclusive"/> to be 255. The
<termref def="dt-basetype"/> of <term>unsignedByte</term> is
<baseref/>.
</termdef>
</p>
<div4 id="unsignedByte-lexical-representation">
<head>Lexical representation</head>
<p>
<term>unsignedByte</term>  has a lexical representation consisting
of a finite-length
sequence of decimal digits (#x30-#x39).
For example: 0,
126, 100.
</p>
</div4>
<div4 id="unsignedByte-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>unsignedByte</term> is defined
by prohibiting certain options from the
<specref ref="unsignedByte-lexical-representation"/>.  Specifically,
leading zeroes are prohibited.
</p>
</div4>
<div4 id="unisngedByte-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
<div3 id="positiveInteger">
<head>positiveInteger</head>
<p>
<termdef id="dt-positiveInteger" term="positiveInteger" role="local">
<term>positiveInteger</term> is <termref def="dt-derived"/> from
<dtref ref="nonNegativeInteger"/> by setting the value of
<termref def="dt-minInclusive"/> to be 1. This results in the standard
mathematical concept of the positive integer numbers.
The <termref def="dt-value-space"/> of <term>positiveInteger</term>
is the infinite set {1,2,...}.  The <termref def="dt-basetype"/> of
<term>positiveInteger</term> is <baseref/>.
</termdef>
</p>
<div4 id="positiveInteger-lexical-representation">
<head>Lexical representation</head>
<p>
<term>positiveInteger</term> has a lexical representation consisting
of an optional positive sign ("+") followed by a finite-length
sequence of decimal digits (#x30-#x39).
For example: 1, 12678967543233, +100000.
</p>
</div4>
<div4 id="positiveInteger-canonical-repr">
<head>Canonical representation</head>
<p>
The canonical representation for <term>positiveInteger</term> is defined
by prohibiting certain options from the
<specref ref="positiveInteger-lexical-representation"/>.  Specifically, the
optional "+" sign is prohibited and leading zeroes are prohibited.
</p>
</div4>
<div4 id="positiveInteger-facets">
<head>Constraining facets</head>
<facets/>
</div4>
</div3>
</div2>
</div1>
<div1 id="datatype-components">
<head>Datatype components</head>
<p>
The following sections provide full details on the properties and
significance of each kind of schema component involved in datatype
definitions. For each property, the kinds of values it is allowed to have is
specified.  Any property not identified as optional is required to
be present; optional properties which are not present have
<xspecref href="&xsdl;#key-null">absent</xspecref> as their value.
Any property identified as a having a set, subset or <termref def="dt-list"/>
value may have an empty value unless this is explicitly ruled out: this is
not the same as <xspecref href="&xsdl;#key-null">absent</xspecref>.
Any property value identified as a superset or a subset of some set may
be equal to that set, unless a proper superset or subset is explicitly
called for.
</p>
<p>
For more information on the notion of datatype (schema) components,
see <xspecref href="&xsdl;#components">Schema Component Details</xspecref>
of <bibref ref="structural-schemas"/>.
</p>
<div2 id="rf-defn">
<head>Simple Type Definition</head>
<p>
Simple Type definitions provide for:
</p>
<ulist>
<item>
<p>
Establishing the <termref def="dt-value-space"/> and <termref def="dt-lexical-space"/>
of a datatype, through
the combined set of <termref def="dt-constraining-facet"/>s specified
in the definition;
</p>
</item>
<item>
<p>
Attaching a unique name (actually a <dtref ref="QName"/>) to the
<termref def="dt-value-space"/> and <termref def="dt-lexical-space"/>.
</p>
</item>
</ulist>
<div3 id="dc-defn">
<head>The Simple Type Definition Schema Component</head>
<p>
The Simple Type Definition schema component has the following properties:
</p>
<compdef name="Simple Type Definition" ref="datatype">
<proplist>
<propdef id="defn-name" name="name">
Optional.  An NCName as defined by
<bibref ref="XMLNS"/>.
</propdef>
<propdef id="defn-target-namespace" name="target namespace">
Either <xspecref href="&xsdl;#key-null">absent</xspecref> or a
namespace name, as defined in <bibref ref="XMLNS"/>.
</propdef>
<propdef id="defn-variety" name="variety">
One of {<pt>atomic</pt>, <pt>list</pt>, <pt>union</pt>}. Depending on the
value of <propref ref="defn-variety"/>, further properties are defined as follows:
<glist>
<gitem>
<label>atomic</label>
<def>
<proplist>
<propdef id="defn-primitive" name="primitive type definition">
A <termref def="dt-built-in"/>&nbsp;<termref def="dt-primitive"/>
datatype definition<phrase diff="del"> (or the <xtermref href="&xsdl;#simple-ur-type-itself">
simple ur-type definition</xtermref>
</phrase>).
</propdef>
</proplist>
</def>
</gitem>
<gitem>
<label>list</label>
<def>
<proplist>
<propdef id="defn-itemType" name="item type definition">
An <termref def="dt-atomic"/> or <termref def="dt-union"/> simple type definition.
</propdef>
</proplist>
</def>
</gitem>
<gitem>
<label>union</label>
<def>
<proplist>
<propdef id="defn-memberTypes" name="member type definitions">
A non-empty sequence of simple type definitions.
</propdef>
</proplist>
</def>
</gitem>
</glist>
</propdef>
<propdef id="defn-facets" name="facets">
A possibly empty set of <specref ref="facets"/>.
</propdef>
<propdef id="defn-fund-facets" name="fundamental facets">
A set of <specref ref="fundamental-facets"/>
</propdef>
<propdef id="defn-basetype" name="base type definition">
If the datatype has been <termref def="dt-derived"/> by
<termref def="dt-restriction"/> then the <compref ref="dc-defn"/> component
from which it is <termref def="dt-derived"/>, otherwise
the <specref ref="anySimpleType-component"/>.
</propdef>
<propdef id="defn-final" name="final">
A  subset of <emph>{restriction, list, union}</emph>.
</propdef>
<propdef id="defn-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
Datatypes are identified by their <propref ref="defn-name"/>
and <propref ref="defn-target-namespace"/>.  Except
for anonymous datatypes (those with no <propref ref="defn-name"/>),
datatype definitions <termref def="dt-must"/> be uniquely identified
within a schema.
</p>
<p>
If <propref ref="defn-variety"/> is <termref def="dt-atomic"/>
then the <termref def="dt-value-space"/> of the datatype defined will
be a subset of the <termref def="dt-value-space"/> of
<propref ref="defn-basetype"/> (which is a subset of the
<termref def="dt-value-space"/> of <propref ref="defn-primitive"/>).
If <propref ref="defn-variety"/> is <termref def="dt-list"/>
then the <termref def="dt-value-space"/> of the datatype defined will
be the set of finite-length sequence of values from the
<termref def="dt-value-space"/> of <propref ref="defn-itemType"/>.
If <propref ref="defn-variety"/> is <termref def="dt-union"/> then the
<termref def="dt-value-space"/> of the datatype defined will be the
union of the <termref def="dt-value-space"/>s of each datatype in
<propref ref="defn-memberTypes"/>.
</p>
<p>
If <propref ref="defn-variety"/> is <termref def="dt-atomic"/>
then the <propref ref="defn-variety"/> of <propref ref="defn-basetype"/>
must be <termref def="dt-atomic"/>.
If <propref ref="defn-variety"/> is <termref def="dt-list"/>
then the <propref ref="defn-variety"/> of <propref ref="defn-itemType"/>
must be either <termref def="dt-atomic"/> or <termref def="dt-union"/>.
If <propref ref="defn-variety"/> is <termref def="dt-union"/>
then
<propref ref="defn-memberTypes"/> must be a list of datatype definitions.
</p>
<p>
The value of <propref ref="defn-facets"/> consists of the set of
<termref def="dt-facet"/>s specified directly in the datatype definition
unioned with the possibly empty set of <propref ref="defn-facets"/> of
<propref ref="defn-basetype"/>.
</p>
<p>
The value of <propref ref="defn-fund-facets"/> consists of the set of
<termref def="dt-fundamental-facet"/>s and their values.
</p>
<p>
If <propref ref="defn-final"/> is the empty set then the type can be used
in deriving other types; the explicit values <emph>restriction</emph>,
<emph>list</emph> and <emph>union</emph> prevent further derivations
by <termref def="dt-restriction"/>, <termref def="dt-list"/> and
<termref def="dt-union"/> respectively.
</p>
</div3>
<div3 id="xr-defn">
<head>XML Representation of Simple Type Definition Schema Components</head>
<p>
The XML representation for a <compref ref="dc-defn"/> schema component
is a <eltref ref="simpleType"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="simpleType"/>
<reprcomp abstract="Datatype Definition" ref="dc-defn">
<propmap name="defn-name">
The &v-value; of the <code>name</code>&nbsp;&i-attribute;, if present,
otherwise <xtermref href="&xsdl;#key-null">null</xtermref>
</propmap>
<propmap name="defn-final">
A set corresponding to the &v-value; of the
<code>final</code> &i-attribute;, if present, otherwise
<phrase diff="del">of</phrase> the &v-value; of the
<code>finalDefault</code> &i-attribute; <phrase diff="add">of</phrase> the ancestor
<xtermref href="&xsdl;#element-schema">schema</xtermref>
element information item, if present, otherwise the empty string, as follows:
   <glist>
<gitem>
<label>the empty string</label>
<def>
<p>the empty set;</p>
</def>
</gitem>
<gitem>
<label>
<code>#all</code>
</label>
<def>
<p>
<emph>{restriction, list, union}</emph>;</p>
</def>
</gitem>
<gitem>
<label>
<emph>otherwise</emph>
</label>
<def>
<p>a set with members drawn from the set above, each being present or
absent depending on whether the string contains an equivalently named
space-delimited substring.</p>
<note>
<p>Although the <code>finalDefault</code> &i-attribute; of
       <xtermref href="&xsdl;#element-schema">schema</xtermref> may include
       values other than
       <pt>restriction</pt>, <pt>list</pt> or <pt>union</pt>, those values
       are ignored in the determination of <propref ref="defn-final"/>
</p>
</note>
</def>
</gitem>
</glist>
</propmap>
<propmap name="defn-target-namespace">
The &v-value; of the <code>targetNamespace</code> &i-attribute;
of the parent <code>schema</code> element information item.
</propmap>
<propmap name="defn-annotation">
The annotation corresponding to the <eltref ref="annotation"/>
element information item in the &i-children;, if present, otherwise
<xspecref href="&xsdl;#key-null">null</xspecref>
</propmap>
</reprcomp>
</reprdef>
<p>
A <termref def="dt-derived"/> datatype can be <termref def="dt-derived"/>
from a <termref def="dt-primitive"/> datatype or another
<termref def="dt-derived"/> datatype by one of three means:
by <emph>restriction</emph>, by <emph>list</emph> or by <emph>union</emph>.
</p>
<div4 id="derivation-by-restriction">
<head>Derivation by restriction</head>
<reprdef>
<reprelt eltname="restriction"/>
<reprcomp abstract="Simple Type Definition" ref="dc-defn">
<propmap name="defn-variety">
The &v-value; of <propref ref="defn-variety"/> of <propref ref="defn-basetype"/>
</propmap>
<propmap name="defn-facets">
The union of the set of <specref ref="facets"/> components
resolved to by the facet &i-children; merged with <propref ref="defn-facets"/>
from <propref ref="defn-basetype"/>, subject to the Facet Restriction Valid
constraints specified in <specref ref="facets"/>.
</propmap>
<propmap name="defn-basetype">
The <compref ref="dc-defn"/> component resolved to by the &v-value; of the
<code>base</code> &i-attribute; or the <eltref ref="simpleType"/> &i-children;,
whichever is present.
</propmap>
</reprcomp>
</reprdef>
<note role="example">
<p>
An electronic commerce schema might define a datatype called
<emph>Sku</emph> (the barcode number that appears on products) from the
<termref def="dt-built-in"/> datatype <dtref ref="string"/> by
supplying a value for the <termref def="dt-pattern"/> facet.
</p>
<eg><![CDATA[<simpleType name='Sku'>
    <restriction base='string'>
      <pattern value='\d{3}-[A-Z]{2}'/>
    </restriction>
</simpleType>]]></eg>
<p>
In this case, <emph>Sku</emph> is the name of the new
<termref def="dt-user-derived"/> datatype, <dtref ref="string"/> is
its <termref def="dt-basetype"/> and <termref def="dt-pattern"/>
is the facet.
</p>
</note>
</div4>
<div4 id="derivation-by-list">
<head>Derivation by list</head>
<reprdef>
<reprelt eltname="list"/>
<reprcomp abstract="Simple Type Definition" ref="dc-defn">
<propmap name="defn-variety">
list
</propmap>
<propmap name="defn-itemType">
The <compref ref="dc-defn"/> component resolved to by the &v-value; of the
<code>itemType</code> &i-attribute;
or the <eltref ref="simpleType"/> &i-children;,
whichever is present.
</propmap>
</reprcomp>
</reprdef>
<p>
A <termref def="dt-list"/> datatype must be <termref def="dt-derived"/>
from an <termref def="dt-atomic"/> or a <termref def="dt-union"/> datatype,
known as the
<termref def="dt-itemType"/> of the <termref def="dt-list"/> datatype.
This yields a datatype whose <termref def="dt-value-space"/> is composed of
finite-length sequences of values from the <termref def="dt-value-space"/> of the
<termref def="dt-itemType"/> and whose <termref def="dt-lexical-space"/> is
composed of <phrase diff="del">white </phrase>space<phrase diff="add">-</phrase>separated lists of literals of the
<termref def="dt-itemType"/>.
</p>
<note role="example">
<p>
A system might want to store lists of floating point values.
</p>
<eg><![CDATA[<simpleType name='listOfFloat'>
  <list itemType='float'/>
</simpleType>
]]></eg>
<p>
In this case, <emph>listOfFloat</emph> is the name of the new
<termref def="dt-user-derived"/> datatype, <dtref ref="float"/> is its
<termref def="dt-itemType"/> and <termref def="dt-list"/> is the
derivation method.
</p>
</note>
<p>
As mentioned in <specref ref="list-datatypes"/>,
when a datatype is <termref def="dt-derived"/> from a
<termref def="dt-list"/> datatype, the following
<termref def="dt-constraining-facet"/>s can be used:
</p>
<ulist>
<item>
<p>
<termref def="dt-length"/>
</p>
</item>
<item>
<p>
<termref def="dt-maxLength"/>
</p>
</item>
<item>
<p>
<termref def="dt-minLength"/>
</p>
</item>
<item>
<p>
<termref def="dt-enumeration"/>
</p>
</item>
<item>
<p>
<termref def="dt-pattern"/>
</p>
</item>
<item>
<p>
<termref def="dt-whiteSpace"/>
</p>
</item>
</ulist>
<p>
regardless of the <termref def="dt-constraining-facet"/>s that are applicable
to the <termref def="dt-atomic"/> datatype that serves as the
<termref def="dt-itemType"/> of the <termref def="dt-list"/>.
</p>
<p>
For each of <termref def="dt-length"/>, <termref def="dt-maxLength"/>
and <termref def="dt-minLength"/>, the
<emph>unit of length</emph> is measured in number of list items.
The value of <termref def="dt-whiteSpace"/>
is fixed to the value <emph>collapse</emph>.</p>
</div4>
<div4 id="derivation-by-union">
<head>Derivation by union</head>
<reprdef>
<reprelt eltname="union"/>
<reprcomp abstract="Simple Type Definition" ref="dc-defn">
<propmap name="defn-variety">
union
</propmap>
<propmap name="defn-memberTypes">
The sequence of <compref ref="dc-defn"/> components resolved to by the
items in the &v-value; of the
<code>memberTypes</code> &i-attribute;, if any,
in order, followed by the <compref ref="dc-defn"/> components resolved to by the
<eltref ref="simpleType"/> &i-children;, if any, in order.
If <propref ref="defn-variety"/> is <emph>union</emph> for
any <compref ref="dc-defn"/> components resolved to above, then
the <phrase diff="del">that </phrase>
<compref ref="dc-defn"/> is replaced by its
<propref ref="defn-memberTypes"/>.
</propmap>
</reprcomp>
</reprdef>
<p>
A <termref def="dt-union"/> datatype can be <termref def="dt-derived"/>
from one or more <termref def="dt-atomic"/>, <termref def="dt-list"/> or
other <termref def="dt-union"/> datatypes, known as the <termref def="dt-memberTypes"/>
of that <termref def="dt-union"/> datatype.
</p>
<note role="example">
<p>
As an example, taken from a typical display oriented text markup language,
one might want to express font sizes as an integer between 8 and 72, or with
one of the tokens "small", "medium" or "large".  The <termref def="dt-union"/>
type definition below would accomplish that.
</p>
<eg><![CDATA[
<xsd:attribute name="size">
  <xsd:simpleType>
    <xsd:union>
      <xsd:simpleType>
        <xsd:restriction base="xsd:positiveInteger">
          <xsd:minInclusive value="8"/>
          <xsd:maxInclusive value="72"/>
        </xsd:restriction>
      </xsd:simpleType>
      <xsd:simpleType>
        <xsd:restriction base="xsd:NMTOKEN">
          <xsd:enumeration value="small"/>
          <xsd:enumeration value="medium"/>
          <xsd:enumeration value="large"/>
        </xsd:restriction>
      </xsd:simpleType>
    </xsd:union>
  </xsd:simpleType>
</xsd:attribute>
]]></eg>
<eg><![CDATA[
<p>
<font size='large'>A header</font>
</p>
<p>
<font size='12'>this is a test</font>
</p>
]]></eg>
</note>
<p>
As mentioned in <specref ref="union-datatypes"/>,
when a datatype is <termref def="dt-derived"/> from a
<termref def="dt-union"/> datatype, the only following
<termref def="dt-constraining-facet"/>s can be used:
</p>
<ulist>
<item>
<p>
<termref def="dt-pattern"/>
</p>
</item>
<item>
<p>
<termref def="dt-enumeration"/>
</p>
</item>
</ulist>
<p>
regardless of the <termref def="dt-constraining-facet"/>s that are
applicable to the datatypes that participate in the <termref def="dt-union"/>
</p>
</div4>
</div3>
<div3 id="defn-rep-constr">
<head>Constraints on XML Representation of Simple Type Definition</head>
<constraintnote type="src" id="src-single-facet-value">
<head>Single Facet Value</head>
<p>
Unless otherwise specifically allowed by this specification
(<specref ref="src-multiple-patterns"/> and
<specref ref="src-multiple-enumerations"/>) any given
<termref def="dt-constraining-facet"/> can only be specifed once within
a single derivation step.
</p>
</constraintnote>
<constraintnote type="src" id="src-list-itemType-or-simpleType">
<head>itemType attribute or simpleType child</head>
<p>
Either the <code>itemType</code> &i-attribute; or the
<eltref ref="simpleType"/> &i-child; of the <eltref ref="list"/> element
must be present, but not both.
</p>
</constraintnote>
<constraintnote type="src" id="src-restriction-base-or-simpleType">
<head>base attribute or simpleType child</head>
<p>
Either the <code>base</code> &i-attribute; or the
<code>simpleType</code> &i-child; of the <eltref ref="restriction"/>
element must be present, but not both.
</p>
</constraintnote>
<constraintnote type="src" id="src-union-memberTypes-or-simpleTypes">
<head>memberTypes attribute or simpleType children</head>
<p>
Either the <code>memberTypes</code> &i-attribute; of the <eltref ref="union"/>
element must be non-empty or
there must be at least one <code>simpleType</code> &i-child;.
</p>
</constraintnote>
</div3>
<div3 id="defn-validation-rules">
<head>Simple Type Definition Validation Rules</head>
<constraintnote type="cvc" id="cvc-facet-valid">
<head>Facet Valid</head>
<p>
A value in a <termref def="dt-value-space"/> is facet-valid with
respect to a <termref def="dt-constraining-facet"/> component if:
</p>
<olist>
<item>
<p>
the value is facet-valid with respect to the particular
<termref def="dt-constraining-facet"/> as specified below.
</p>
</item>
</olist>
</constraintnote>
<constraintnote type="cvc" id="cvc-datatype-valid">
<head>Datatype Valid</head>
<p>
A string is datatype-valid with respect to a datatype definition if:
</p>
<olist>
<item>
<p>
		it <termref def="dt-match"/>es a literal in the
		<termref def="dt-lexical-space"/> of the datatype, determined as follows:
		</p>
<olist>
<item>
<p>
				if <termref def="dt-pattern"/> is a member of <propref ref="defn-facets"/>,
				then the string must be <specref ref="cvc-pattern-valid"/>;
				</p>
</item>
<item>
<p>
				if <termref def="dt-pattern"/> is not a member of <propref ref="defn-facets"/>,
				then
				</p>
<olist>
<item>
<p>
						if <propref ref="defn-variety"/> is <termref def="dt-atomic"/> then
						the string must <termref def="dt-match"/> a literal in the
						<termref def="dt-lexical-space"/> of <propref ref="defn-basetype"/>
</p>
</item>
<item>
<p>
						if <propref ref="defn-variety"/> is <termref def="dt-list"/> then the string must
be a sequence of <phrase diff="del">white </phrase>space<phrase diff="add">-</phrase>separated tokens, each of which <termref def="dt-match"/>es a literal in the <termref def="dt-lexical-space"/>
of <propref ref="defn-itemType"/>
</p>
</item>
<item>
<p>
						if <propref ref="defn-variety"/> is <termref def="dt-union"/> then
						the string must <termref def="dt-match"/> a literal in the
						<termref def="dt-lexical-space"/> of at least one member of
						<propref ref="defn-memberTypes"/>
</p>
</item>
</olist>
</item>
</olist>
</item>
<item>
<p>
		the value denoted by the literal <termref def="dt-match"/>ed in the previous step
		is a member of the <termref def="dt-value-space"/> of the datatype, as determined
		by it being <specref ref="cvc-facet-valid"/>
		with respect to each member of <propref ref="defn-facets"/> (except
		for <termref def="dt-pattern"/>).
		</p>
</item>
</olist>
</constraintnote>
</div3>
<div3 id="defn-coss">
<head>Constraints on Simple Type Definition Schema Components</head>
<constraintnote type="cos" id="cos-applicable-facets">
<head>applicable facets</head>
<p>
The <termref def="dt-constraining-facet"/>s which are allowed
to be members of <propref ref="defn-facets"/> are dependent on
<propref ref="defn-basetype"/> as specified in the following table:
</p>
<applicable-facets/>
</constraintnote>
<constraintnote type="cos" id="cos-list-of-atomic">
<head>list of atomic</head>
<p>
If <propref ref="defn-variety"/> is <termref def="dt-list"/>, then
the <propref ref="defn-variety"/> of <propref ref="defn-itemType"/>
&nbsp;<termref def="dt-must"/> be <termref def="dt-atomic"/> or
<termref def="dt-union"/>.
</p>
</constraintnote>
<constraintnote type="cos" id="cos-no-circular-unions">
<head>no circular unions</head>
<p>
If <propref ref="defn-variety"/> is <termref def="dt-union"/>,
then
it is an <termref def="dt-error"/> if
<propref ref="defn-name"/> and <propref ref="defn-target-namespace"/>
&nbsp;<termref def="dt-match"/>&nbsp;<propref ref="defn-name"/>
and <propref ref="defn-target-namespace"/> of any member of
<propref ref="defn-memberTypes"/>.
</p>
</constraintnote>
</div3>
<div3 id="anySimpleType-component">
<head>Simple Type Definition for anySimpleType</head>
<p>
There is a simple type definition nearly equivalent to the simple version
of the <xtermref href="&xsdl;#key-urType">ur-type definition</xtermref> present
in every schema by definition.  It has the following properties:
</p>
<compdef name="anySimpleType" ref="dt-anySimpleType">
<proplist>
<propdef id="anySimpleType-name" name="name">
anySimpleType
</propdef>
<propdef id="anySimpleType-target_namespace" name="target namespace">
http://www.w3.org/2001/XMLSchema
</propdef>
<propdef id="anySimpleType-basetype" name="basetype definition">
<xtermref href="&xsdl;#ur-type-itself">the ur-type definition</xtermref>
</propdef>
<propdef id="anySimpleType-final" name="final">
the empty set
</propdef>
<propdef id="anySimpleType-variety" name="variety">
<xtermref href="&xsdl;#key-null">absent</xtermref>
</propdef>
</proplist>
</compdef>
</div3>
</div2>
<div2 id="rf-fund-facets">
<head>Fundamental Facets</head>
<div3 id="equal">
<head>equal</head>
<p>
Every <termref def="dt-value-space"/> supports the notion of equality,
with the following rules:
</p>
<ulist>
<item>
<p>
for any <emph role="eq">a</emph> and <emph role="eq">b</emph> in
the <termref def="dt-value-space"/>,
either <emph role="eq">a</emph> is equal to <emph role="eq">b</emph>,
denoted <emph role="eq">a = b</emph>, or <emph role="eq">a</emph>
is not equal to <emph role="eq">b</emph>, denoted <emph role="eq">a != b</emph>
</p>
</item>
<item>
<p>
there is no pair <emph role="eq">a</emph> and <emph role="eq">b</emph>
from the <termref def="dt-value-space"/> such that both
<emph role="eq">a = b</emph> and <emph role="eq">a != b</emph>
</p>
</item>
<item>
<p>
for all <emph role="eq">a</emph> in the <termref def="dt-value-space"/>,
<emph role="eq">a = a</emph>
</p>
</item>
<item>
<p>
for any <emph role="eq">a</emph> and <emph role="eq">b</emph>
in the <termref def="dt-value-space"/>,
<emph role="eq">a = b</emph> if and only if <emph role="eq">b = a</emph>
</p>
</item>
<item>
<p>
for any <emph role="eq">a</emph>, <emph role="eq">b</emph> and
<emph role="eq">c</emph> in the <termref def="dt-value-space"/>,
if <emph role="eq">a = b</emph> and
<emph role="eq">b = c</emph>, then <emph role="eq">a = c</emph>
</p>
</item>
<item>
<p>
for any <emph role="eq">a</emph> and <emph role="eq">b</emph>
in the <termref def="dt-value-space"/>
if <emph role="eq">a = b</emph>, then <emph role="eq">a</emph>
and <emph role="eq">b</emph> cannot be distinguished
(i.e., equality is identity)
</p>
</item>
<item>
<p>
<phrase diff="add">the <termref def="dt-value-space"/>s of all
<termref def="dt-primitive"/> datatypes are disjoint (they do not
share any values)
</phrase>
</p>
</item>
</ulist>
<p>
<phrase diff="del">
Note that a consequence of the above is that, given <termref def="dt-value-space"/>
&nbsp;<emph role="eq">A</emph> and <termref def="dt-value-space"/>
&nbsp;<emph role="eq">B</emph> where <emph role="eq">A</emph> and
<emph role="eq">B</emph> are not related by <termref def="dt-restriction"/>
or <termref def="dt-union"/>,
for every pair of values <emph role="eq">a</emph> from
<emph role="eq">A</emph> and <emph role="eq">b</emph> from
<emph role="eq">B</emph>, <emph role="eq">a != b</emph>.
</phrase>
</p>
<p>
On every datatype, the operation Equal is defined in terms of the equality
property of the <termref def="dt-value-space"/>: for any values
<emph role="eq">a, b</emph> drawn from the
<termref def="dt-value-space"/>, <emph role="eq">Equal(a,b)</emph> is
true if <emph role="eq">a = b</emph>, and false otherwise.
</p>
<p diff="add">
Note that in consequence of the above:
</p>
<ulist diff="add">
<item>
<p>given <termref def="dt-value-space"/>&nbsp;<emph role="eq">A</emph> and
<termref def="dt-value-space"/>&nbsp;<emph role="eq">B</emph> where
<emph role="eq">A</emph> and <emph role="eq">B</emph> are disjoint,
every pair of values <emph role="eq">a</emph> from <emph role="eq">A</emph>
and <emph role="eq">b</emph> from <emph role="eq">B</emph>,
<emph role="eq">a != b</emph>
</p>
</item>
<item>
<p>
two values which are members of the <termref def="dt-value-space"/>
of the same <termref def="dt-primitive"/> datatype may always be
compared with each other
</p>
</item>
<item>
<p>
if a datatype <emph role="eq">T</emph> is
<termref def="dt-derived"/> by <termref def="dt-union"/> from
<termref def="dt-memberTypes"/>&nbsp;<emph role="eq">A, B, ...</emph>
then the <termref def="dt-value-space"/> of <emph role="eq">T</emph> is the
union of <termref def="dt-value-space"/>s of its
<termref def="dt-memberTypes"/>&nbsp;<emph role="eq">A, B, ...</emph>.
Some values in the <termref def="dt-value-space"/> of
<emph role="eq">T</emph> are also values in the
<termref def="dt-value-space"/> of <emph role="eq">A</emph>.
Other values in the <termref def="dt-value-space"/> of
<emph role="eq">T</emph> will be values in the
<termref def="dt-value-space"/> of <emph role="eq">B</emph> and so on.
Values in the <termref def="dt-value-space"/> of <emph role="eq">T</emph>
which are also in the <termref def="dt-value-space"/> of
<emph role="eq">A</emph> can be compared with other values in the
<termref def="dt-value-space"/> of <emph role="eq">A</emph> according
to the above rules.  Similarly for values of type
<emph role="eq">T</emph> and <emph role="eq">B</emph> and all the other
<termref def="dt-memberTypes"/>.
</p>
</item>
<item>
<p>
if a datatype <emph role="eq">T'</emph> is <termref def="dt-derived"/>
by <termref def="dt-restriction"/> from an atomic datatype <emph role="eq">T</emph>
then the <termref def="dt-value-space"/> of <emph role="eq">T'</emph> is
a subset of the <termref def="dt-value-space"/> of <emph role="eq">T</emph>.
Values in the <termref def="dt-value-space"/>s of
<emph role="eq">T</emph> and <emph role="eq">T'</emph> can be compared
according to the above rules
</p>
</item>
<item>
<p>
if datatypes <emph role="eq">T'</emph> and <emph role="eq">T''</emph> are
<termref def="dt-derived"/> by <termref def="dt-restriction"/> from a
common atomic ancestor <emph role="eq">T</emph> then the
<termref def="dt-value-space"/>s of <emph role="eq">T'</emph> and
<emph role="eq">T''</emph> may overlap. Values in the
<termref def="dt-value-space"/>s
of <emph role="eq">T'</emph> and <emph role="eq">T''</emph> can be
compared according to the above rules
</p>
</item>
</ulist>
<note>
<p>
There is no schema component corresponding to the <term>equal</term>
<termref def="dt-fundamental-facet"/>.
</p>
</note>
</div3>
<div3 id="rf-ordered">
<head>ordered</head>
<p>
<termdef id="dt-order-relation" term="order-relation">An
<term>order relation</term> on a <termref def="dt-value-space"/>
is a mathematical relation that imposes a
<termref def="dt-total-order"/> or a <termref def="dt-partial-order"/> on the
members of the <termref def="dt-value-space"/>.
</termdef>
</p>
<p>
<termdef id="dt-ordered" term="ordered">A
<termref def="dt-value-space"/>, and hence a datatype, is said to be
<term>ordered</term> if there exists an
<termref def="dt-order-relation"/> defined for that
<termref def="dt-value-space"/>.
</termdef>
</p>
<p>
<termdef id="dt-partial-order" term="partial order">
A <term>partial order</term> is an <termref def="dt-order-relation"/>
that is <term>irreflexive</term>, <term>asymmetric</term> and
<term>transitive</term>.
</termdef>
</p>
<p>
A <termref def="dt-partial-order"/> has the following properties:
</p>
<ulist>
<item>
<p>
<!--
a R a
-->
for no <emph role="eq">a</emph> in the <termref def="dt-value-space"/>,
<emph role="eq">a &lt; a</emph>
(irreflexivity)
</p>
</item>
<item>
<p>
<!--
a R b implies not(b R a)
-->
for all <emph role="eq">a</emph> and <emph role="eq">b</emph>
in the <termref def="dt-value-space"/>,
<emph role="eq">a &lt; b</emph>
implies not(<emph role="eq">b &lt; a</emph>)
(asymmetry)
</p>
</item>
<item>
<p>
<!--
a R b and b R c implies a R c
-->
for all <emph role="eq">a</emph>, <emph role="eq">b</emph>
and <emph role="eq">c</emph>  in the <termref def="dt-value-space"/>,
<emph role="eq">a &lt; b</emph> and <emph role="eq">b &lt; c</emph>
implies <emph role="eq">a &lt; c</emph>
(transitivity)
</p>
</item>
<!--
Toys R Us
-->
<!--
<p>
for all <emph role='eq'>Toys</emph> and <emph role='eq'>Us</emph>
 in the <termref def='dt-value-space'/>,
<emph role='eq'>Toys &lt; Us</emph>
(jeffreyity)
</p>
</item>
-->
</ulist>
<p>
The notation <emph role="eq">a &lt;> b</emph> is used to indicate the
case when <emph role="eq">a != b</emph> and neither
<emph role="eq">a &lt; b</emph> nor <emph role="eq">b &lt; a</emph>.
<phrase diff="add">
For any values <emph role="eq">a</emph> and <emph role="eq">b</emph>
from different <termref def="dt-primitive"/>&nbsp;<termref def="dt-value-space"/>s,
<emph role="eq">a &lt;> b</emph>.
</phrase>
</p>
<p diff="add">
<termdef id="dt-incomparable" term="incomparable">When  <emph role="eq">a &lt;> b</emph>, <emph role="eq">a</emph> and <emph role="eq">b</emph> are <term>incomparable</term>,</termdef>
<termdef id="dt-comparable" term="comparable">otherwise they are <term>comparable</term>.</termdef>
</p>
<p>
<termdef id="dt-total-order" term="total order">
A <term>total order</term> is an <termref def="dt-partial-order"/>
such that for no <emph role="eq">a</emph> and <emph role="eq">b</emph>
is it the case that <emph role="eq">a &lt;> b</emph>.
</termdef>
</p>
<p>
A <termref def="dt-total-order"/> has all of the properties specified
above for <termref def="dt-partial-order"/>, plus
the following property:
</p>
<ulist>
<item>
<!--
a R b or b R a
-->
<p>
for all <emph role="eq">a</emph> and <emph role="eq">b</emph>
 in the <termref def="dt-value-space"/>,
either <emph role="eq">a &lt; b</emph> or <emph role="eq">b &lt; a</emph>
or <emph role="eq">a = b</emph>
</p>
</item>
</ulist>
<note>
<p>
The fact that this specification does not define an
<termref def="dt-order-relation"/> for some datatype does not
mean that some other application cannot treat that datatype as
being ordered by imposing its own order relation.
</p>
</note>
<p>
<termref def="dt-ordered"/> provides for:
</p>
<ulist>
<item>
<p>
indicating whether an <termref def="dt-order-relation"/> is
defined on a <termref def="dt-value-space"/>, and if so,
whether that <termref def="dt-order-relation"/> is
a <termref def="dt-partial-order"/> or a <termref def="dt-total-order"/>
</p>
</item>
</ulist>
<div4 id="dc-ordered">
<head>The ordered Schema Component</head>
<compdef name="ordered" ref="dt-ordered">
<proplist>
<propdef id="ordered-value" name="value">
One of <emph>{false, partial, total}</emph>.
</propdef>
</proplist>
</compdef>
<p>
<propref ref="ordered-value"/> depends on <propref ref="defn-variety"/>,
<propref ref="defn-facets"/> and <propref ref="defn-memberTypes"/>
in the <compref ref="dc-defn"/> component in which a
<termref def="dt-ordered"/> component appears as a member of
<propref ref="defn-fund-facets"/>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-atomic"/>,
<propref ref="ordered-value"/> is inherited from
<propref ref="ordered-value"/> of <propref ref="defn-basetype"/>.
For all <termref def="dt-primitive"/> types <propref ref="numeric-value"/>
is as specified	in the table in <specref ref="app-fundamental-facets"/>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-list"/>,
<propref ref="ordered-value"/> is <emph>false</emph>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-union"/>,
<phrase diff="del">
if all members of <propref ref="defn-memberTypes"/> do not share
a common ancestor then <propref ref="ordered-value"/> is <emph>false</emph>;
if <propref ref="ordered-value"/> is <emph>total</emph>
for every member of <propref ref="defn-memberTypes"/>
then <propref ref="ordered-value"/> is <emph>total</emph>;
else if <propref ref="ordered-value"/> is <emph>partial</emph>
for any member of <propref ref="defn-memberTypes"/> then
<propref ref="ordered-value"/> is <emph>partial</emph>; else
else <propref ref="ordered-value"/> is <emph>false</emph>.
</phrase>
<propref ref="ordered-value"/> is <emph>partial</emph> unless one of the
following:
</p>
<ulist diff="add">
<item>
<p>
If every member of <propref ref="defn-memberTypes"/> is derived from
a common ancestor other than the simple ur-type, then <propref ref="ordered-value"/>
is the same as that ancestor's <term>ordered</term> facet
</p>
</item>
<item>
<p>
If every member of <propref ref="defn-memberTypes"/> has a
<propref ref="ordered-value"/> of <emph>false</emph> for the <term>ordered</term>
facet, then <propref ref="ordered-value"/> is <emph>false</emph>
</p>
</item>
</ulist>
</div4>
</div3>
<div3 id="rf-bounded">
<head>bounded</head>
<p>
<termdef id="dt-inclusive-upper-bound" term="inclusive upper bound">
A value <emph role="eq">u</emph> in an <termref def="dt-ordered"/>
&nbsp;<termref def="dt-value-space"/>&nbsp;<emph role="eq">U</emph>
is said to be an <term>inclusive upper bound</term> of a
<termref def="dt-value-space"/>&nbsp;<emph role="eq">V</emph>
(where <emph role="eq">V</emph> is a subset of <emph role="eq">U</emph>)
if for all <emph role="eq">v</emph> in <emph role="eq">V</emph>,
<emph role="eq">u</emph> >= <emph role="eq">v</emph>.
</termdef>
</p>
<p>
<termdef id="dt-exclusive-upper-bound" term="exclusive upper bound">
A value <emph role="eq">u</emph> in an <termref def="dt-ordered"/>
&nbsp;<termref def="dt-value-space"/>&nbsp;<emph role="eq">U</emph>
is said to be an <term>exclusive upper bound</term> of a
<termref def="dt-value-space"/>&nbsp;<emph role="eq">V</emph>
(where <emph role="eq">V</emph> is a subset of <emph role="eq">U</emph>)
if for all <emph role="eq">v</emph> in <emph role="eq">V</emph>,
<emph role="eq">u</emph> > <emph role="eq">v</emph>.
</termdef>
</p>
<p>
<termdef id="dt-inclusive-lower-bound" term="inclusive lower bound">
A value <emph role="eq">l</emph> in an <termref def="dt-ordered"/>
&nbsp;<termref def="dt-value-space"/>&nbsp;<emph role="eq">L</emph>
is said to be an <term>inclusive lower bound</term> of a
<termref def="dt-value-space"/>&nbsp;<emph role="eq">V</emph>
(where <emph role="eq">V</emph> is a subset of <emph role="eq">L</emph>)
if for all <emph role="eq">v</emph> in <emph role="eq">V</emph>,
<emph role="eq">l</emph> &lt;= <emph role="eq">v</emph>.
</termdef>
</p>
<p>
<termdef id="dt-exclusive-lower-bound" term="exclusive lower bound">
A value <emph role="eq">l</emph> in an <termref def="dt-ordered"/>
&nbsp;<termref def="dt-value-space"/>&nbsp;<emph role="eq">L</emph>
is said to be an <term>exclusive lower bound</term> of a
<termref def="dt-value-space"/>&nbsp;<emph role="eq">V</emph>
(where <emph role="eq">V</emph> is a subset of <emph role="eq">L</emph>)
if for all <emph role="eq">v</emph> in <emph role="eq">V</emph>,
<emph role="eq">l</emph> &lt; <emph role="eq">v</emph>.
</termdef>
</p>
<p>
<termdef id="dt-bounded" term="bounded">A datatype is <term>bounded</term>
if its <termref def="dt-value-space"/> has either an
<termref def="dt-inclusive-upper-bound"/> or an <termref def="dt-exclusive-upper-bound"/>
and either an <termref def="dt-inclusive-lower-bound"/>
<phrase diff="add">or</phrase>
<phrase diff="del">and</phrase> an
<termref def="dt-exclusive-lower-bound"/>.
</termdef>
</p>
<p>
<termref def="dt-bounded"/> provides for:
</p>
<ulist>
<item>
<p>
indicating whether a <termref def="dt-value-space"/> is
<termref def="dt-bounded"/>
</p>
</item>
</ulist>
<div4 id="dc-bounded">
<head>The bounded Schema Component</head>
<compdef name="bounded" ref="dt-bounded">
<proplist>
<propdef id="bounded-value" name="value">
A <dtref ref="boolean"/>.
</propdef>
</proplist>
</compdef>
<p>
<propref ref="bounded-value"/> depends on <propref ref="defn-variety"/>,
<propref ref="defn-facets"/> and <propref ref="defn-memberTypes"/>
in the <compref ref="dc-defn"/> component in which a
<termref def="dt-bounded"/> component appears as a member of
<propref ref="defn-fund-facets"/>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-atomic"/>,
if one of <termref def="dt-minInclusive"/> or <termref def="dt-minExclusive"/>
and one of <termref def="dt-maxInclusive"/> or <termref def="dt-maxExclusive"/>
are among <propref ref="defn-facets"/>&nbsp;, then
<propref ref="bounded-value"/> is <emph>true</emph>; else
<propref ref="bounded-value"/> is <emph>false</emph>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-list"/>,
if <termref def="dt-length"/> or both of
<termref def="dt-minLength"/> and <termref def="dt-maxLength"/>
are among <propref ref="defn-facets"/>, then
<propref ref="bounded-value"/> is <emph>true</emph>; else
<propref ref="bounded-value"/> is <emph>false</emph>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-union"/>,
if <propref ref="bounded-value"/> is <emph>true</emph>
for every member of <propref ref="defn-memberTypes"/>
and all members of <propref ref="defn-memberTypes"/> share a common
ancestor, then <propref ref="bounded-value"/> is <emph>true</emph>;
else <propref ref="bounded-value"/> is <emph>false</emph>.
</p>
</div4>
</div3>
<div3 id="rf-cardinality">
<head>cardinality</head>
<p>
<termdef id="dt-cardinality" term="cardinality">Every
<termref def="dt-value-space"/> has associated with it the concept of
<term>cardinality</term>.  Some <termref def="dt-value-space"/>s
are finite, some are countably infinite while still others could
conceivably be uncountably infinite (although no <termref def="dt-value-space"/>
defined by this specification is uncountable infinite). A datatype is
said to have the cardinality of its
<termref def="dt-value-space"/>.
</termdef>
</p>
<p>
It
is sometimes useful to categorize <termref def="dt-value-space"/>s
(and hence, datatypes) as to their cardinality.  There are two
significant cases:
</p>
<ulist>
<item>
<p>
<termref def="dt-value-space"/>s that are finite
</p>
</item>
<item>
<p>
<termref def="dt-value-space"/>s that are countably infinite
</p>
</item>
</ulist>
<p>
<termref def="dt-cardinality"/> provides for:
</p>
<ulist>
<item>
<p>
indicating whether the <termref def="dt-cardinality"/>
of a <termref def="dt-value-space"/> is
<emph>finite</emph> or <emph>countably infinite</emph>
</p>
</item>
</ulist>
<div4 id="dc-cardinality">
<head>The cardinality Schema Component</head>
<compdef name="cardinality" ref="dt-cardinality">
<proplist>
<propdef id="cardinality-value" name="value">
One of <emph>{finite, countably infinite}</emph>.
</propdef>
</proplist>
</compdef>
<p>
<propref ref="cardinality-value"/> depends on <propref ref="defn-variety"/>,
<propref ref="defn-facets"/> and <propref ref="defn-memberTypes"/>
in the <compref ref="dc-defn"/> component in which a
<termref def="dt-cardinality"/> component appears as a member of
<propref ref="defn-fund-facets"/>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-atomic"/> and
<propref ref="cardinality-value"/> of <propref ref="defn-basetype"/>
is <emph>finite</emph>, then <propref ref="cardinality-value"/> is
<emph>finite</emph>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-atomic"/> and
<propref ref="cardinality-value"/> of <propref ref="defn-basetype"/>
is <emph>countably infinite</emph> and <strong>either</strong> of the following
conditions are true, then <propref ref="cardinality-value"/> is
<emph>finite</emph>; else <propref ref="cardinality-value"/>
is <emph>countably infinite</emph>:
</p>
<olist role="orval">
<item>
<p>
one of <termref def="dt-length"/>, <termref def="dt-maxLength"/>,
<termref def="dt-totalDigits"/> is among <propref ref="defn-facets"/>,
</p>
</item>
<item>
<p>
<strong>all</strong> of the following are true:
</p>
<olist role="and">
<item>
<p>
one of <termref def="dt-minInclusive"/> or
<termref def="dt-minExclusive"/>
is among <propref ref="defn-facets"/>
</p>
</item>
<item>
<p>
one of <termref def="dt-maxInclusive"/> or
<termref def="dt-maxExclusive"/>
is among <propref ref="defn-facets"/>
</p>
</item>
<item>
<p>
<strong>either</strong> of the following are true:
</p>
<olist role="orval">
<item>
<p>
<termref def="dt-fractionDigits"/> is among <propref ref="defn-facets"/>
</p>
</item>
<item>
<p>
<propref ref="defn-basetype"/> is one of <dtref ref="date"/>,
<dtref ref="gYearMonth"/>, <dtref ref="gYear"/>, <dtref ref="gMonthDay"/>,
<dtref ref="gDay"/> or <dtref ref="gMonth"/> or any type <termref def="dt-derived"/>
from them
</p>
</item>
</olist>
</item>
</olist>
</item>
</olist>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-list"/>,
if <termref def="dt-length"/> or both of
<termref def="dt-minLength"/> and <termref def="dt-maxLength"/>
are among <propref ref="defn-facets"/>, then
<propref ref="cardinality-value"/> is <emph>finite</emph>; else
<propref ref="cardinality-value"/> is <emph>countably infinite</emph>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-union"/>,
if <propref ref="cardinality-value"/> is <emph>finite</emph>
for every member of <propref ref="defn-memberTypes"/>, then
<propref ref="cardinality-value"/> is <emph>finite</emph>;
else <propref ref="cardinality-value"/> is <emph>countably infinite</emph>.
</p>
</div4>
</div3>
<div3 id="rf-numeric">
<head>numeric</head>
<p>
<termdef id="dt-numeric" term="numeric">A datatype is said to be
<term>numeric</term> if its values are conceptually quantities (in some
mathematical number system).
</termdef>
</p>
<p>
<termdef id="dt-non-numeric" term="non-numeric">A datatype whose values
are not <termref def="dt-numeric"/> is said to be
<term>non-numeric</term>.
</termdef>
</p>
<p>
<termref def="dt-numeric"/> provides for:
</p>
<ulist>
<item>
<p>
indicating whether a <termref def="dt-value-space"/> is
<termref def="dt-numeric"/>
</p>
</item>
</ulist>
<div4 id="dc-numeric">
<head>The numeric Schema Component</head>
<compdef name="numeric" ref="dt-numeric">
<proplist>
<propdef id="numeric-value" name="value">
A <dtref ref="boolean"/>
</propdef>
</proplist>
</compdef>
<p>
<propref ref="numeric-value"/> depends on <propref ref="defn-variety"/>,
<propref ref="defn-facets"/>, <propref ref="defn-basetype"/> and
<propref ref="defn-memberTypes"/> in the <compref ref="dc-defn"/> component
in which a <termref def="dt-cardinality"/> component appears as a member of
<propref ref="defn-fund-facets"/>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-atomic"/>,
<propref ref="numeric-value"/> is inherited from
<propref ref="numeric-value"/> of <propref ref="defn-basetype"/>.
For all <termref def="dt-primitive"/> types <propref ref="numeric-value"/>
is as specified	in the table in <specref ref="app-fundamental-facets"/>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-list"/>,
<propref ref="numeric-value"/> is <emph>false</emph>.
</p>
<p>
When <propref ref="defn-variety"/> is <termref def="dt-union"/>,
if <propref ref="numeric-value"/> is <emph>true</emph>
for every member of <propref ref="defn-memberTypes"/>, then
<propref ref="numeric-value"/> is <emph>true</emph>;
else <propref ref="numeric-value"/> is <emph>false</emph>.
</p>
</div4>
</div3>
</div2>
<div2 id="rf-facets">
<head>Constraining Facets</head>
<div3 id="rf-length">
<head>length</head>
<p>
<termdef id="dt-length" term="length" role="local">
<term>length</term> is the number
of <emph>units of length</emph>, where <emph>units of length</emph>
varies depending on the type that is being <termref def="dt-derived"/> from.
The value of
<term>length</term>&nbsp;<termref def="dt-must"/> be a
<dtref ref="nonNegativeInteger"/>.
</termdef>
</p>
<p>
For <dtref ref="string"/> and datatypes <termref def="dt-derived"/> from <dtref ref="string"/>,
<term>length</term> is measured in units of <xtermref href="&xmlspec;#dt-character">
character</xtermref>s as defined in <bibref ref="XML"/>.
For <dtref ref="anyURI"/>, <term>length</term> is measured in units of
characters (as for <dtref ref="string"/>).
For <dtref ref="hexBinary"/> and <dtref ref="base64Binary"/> and datatypes <termref def="dt-derived"/> from them,
<term>length</term> is measured in octets (8 bits) of binary data.
For datatypes <termref def="dt-derived"/> by <termref def="dt-list"/>,
<term>length</term> is measured in number of list items.
</p>
<note>
<p>
For <dtref ref="string"/> and datatypes <termref def="dt-derived"/> from <dtref ref="string"/>,
<term>length</term> will not always coincide with "string length" as perceived
by some users or with the number of storage units in some digital representation.
Therefore, care should be taken when specifying a value for <term>length</term>
and in attempting to infer storage requirements from a given value for
<term>length</term>.
</p>
</note>
<p>
<termref def="dt-length"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/>
to values with a specific number of <emph>units of length</emph>,
where <emph>units of length</emph>
varies depending on <propref ref="defn-basetype"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype to represent product codes which must be
exactly 8 characters in length.  By fixing the value of the
<term>length</term> facet we ensure that types derived from productCode can
change or set the values of other facets, such as <term>pattern</term>, but
cannot change the length.
</p>
<eg><![CDATA[<simpleType name='productCode'>
   <restriction base='string'>
     <length value='8' fixed='true'/>
   </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-length">
<head>The length Schema Component</head>
<compdef name="length" ref="dt-length">
<proplist>
<propdef id="length-value" name="value">
A <dtref ref="nonNegativeInteger"/>.
</propdef>
<propdef id="length-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="length-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="length-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-length"/> other than <propref ref="length-value"/>.
</p>
</div4>
<div4 id="xr-length">
<head>XML Representation of length Schema Components</head>
<p>
The XML representation for a <compref ref="dc-length"/> schema
component is a <eltref ref="length"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="length"/>
<reprcomp abstract="length" ref="dc-fractionDigits">
<propmap name="length-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="length-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="length-validation-rules">
<head>length Validation Rules</head>
<constraintnote type="cvc" id="cvc-length-valid">
<head>Length Valid</head>
<p>
A value in a <termref def="dt-value-space"/> is facet-valid with
respect to <termref def="dt-length"/>, determined as follows:
</p>
<olist>
<item>
<p>
if the <propref ref="defn-variety"/> is <termref def="dt-atomic"/> then
<olist>
<item>
<p>
if <propref ref="defn-primitive"/> is <dtref ref="string"/>
<phrase diff="add"> or <dtref ref="anyURI"/>
</phrase>, then the
length of the value, as measured in <xtermref href="&xmlspec;#dt-character">
character</xtermref>s
<termref def="dt-must"/> be equal to <propref ref="length-value"/>;
</p>
</item>
<item>
<p>
if <propref ref="defn-primitive"/> is <dtref ref="hexBinary"/> or <dtref ref="base64Binary"/>, then the
length of the value, as measured in octets of the binary data,
<termref def="dt-must"/> be equal to <propref ref="length-value"/>;
</p>
</item>
<item>
<p>
<phrase diff="add">
if <propref ref="defn-primitive"/> is <dtref ref="QName"/> or <dtref ref="NOTATION"/>, then
any <propref ref="length-value"/> is facet-valid.</phrase>
</p>
</item>
</olist>
</p>
</item>
<item>
<p>
if the <propref ref="defn-variety"/> is <termref def="dt-list"/>,
then the length of the value, as measured
in list items, <termref def="dt-must"/> be equal to <propref ref="length-value"/>
</p>
</item>
</olist>
</constraintnote>
<p>
<phrase diff="add">
The use of <termref def="dt-length"/>
on datatypes <termref def="dt-derived"/> from <dtref ref="QName"/> and <dtref ref="NOTATION"/>
is deprecated.  Future versions of this
specification may remove this facet for these datatypes.
</phrase>
</p>
</div4>
<div4 id="length-coss">
<head>Constraints on length Schema Components</head>
<constraintnote type="cos" id="length-minLength-maxLength">
<head>length and minLength or maxLength</head>
<p diff="del">
It is an <termref def="dt-error"/> for both
<compref ref="dc-length"/> and either of
<compref ref="dc-minLength"/> or <compref ref="dc-maxLength"/>
to be members of <propref ref="defn-facets"/>.</p>
<p diff="add">If <compref ref="dc-length"/> is a member of <propref ref="defn-facets"/> then
  <olist>
<item>
<p>It is an error for <compref ref="dc-minLength"/> to be a member of
<propref ref="defn-facets"/> unless
     <olist>
<item>
<p>the <propref ref="minLength-value"/> of <compref ref="dc-minLength"/> &lt;= the <propref ref="length-value"/> of <compref ref="dc-length"/> and</p>
</item>
<item>
<p>there is type definition from which this one is derived by
         one or more restriction steps in which <compref ref="dc-minLength"/> has the same
         <propref ref="minLength-value"/> and <compref ref="dc-length"/> is not specified.</p>
</item>
</olist>
</p>
</item>
<item>
<p>It is an error for <compref ref="dc-maxLength"/> to be a member of
<propref ref="defn-facets"/> unless
     <olist>
<item>
<p>the <propref ref="length-value"/> of <compref ref="dc-length"/> &lt;= the <propref ref="maxLength-value"/> of <compref ref="dc-maxLength"/> and</p>
</item>
<item>
<p>there is type definition from which this one is derived by
         one or more restriction steps in which <compref ref="dc-maxLength"/> has the same
         <propref ref="maxLength-value"/> and <compref ref="dc-length"/> is not specified.</p>
</item>
</olist>
</p>
</item>
</olist>
</p>
</constraintnote>
<constraintnote type="cos" id="length-valid-restriction">
<head>length valid restriction</head>
<p>
It is an <termref def="dt-error"/> if <compref ref="dc-length"/>
is among the members of <propref ref="defn-facets"/> of
<propref ref="defn-basetype"/> and <propref ref="length-value"/> is
not equal to the <propref ref="length-value"/> of the parent
<compref ref="dc-length"/>.
</p>
</constraintnote>
</div4>
</div3>
<div3 id="rf-minLength">
<head>minLength</head>
<p>
<termdef id="dt-minLength" term="minLength" role="local">
<term>minLength</term> is
the minimum number of <emph>units of length</emph>, where
<emph>units of length</emph> varies depending on the type that is being
<termref def="dt-derived"/> from.
The value of <term>minLength</term>
&nbsp;<termref def="dt-must"/> be a <dtref ref="nonNegativeInteger"/>.
</termdef>
</p>
<p>
For <dtref ref="string"/> and datatypes <termref def="dt-derived"/> from <dtref ref="string"/>,
<term>minLength</term> is measured in units of <xtermref href="&xmlspec;#dt-character">
character</xtermref>s as defined in <bibref ref="XML"/>.
For <dtref ref="hexBinary"/> and <dtref ref="base64Binary"/> and datatypes <termref def="dt-derived"/> from them,
<term>minLength</term> is measured in octets (8 bits) of binary data.
For datatypes <termref def="dt-derived"/> by <termref def="dt-list"/>,
<term>minLength</term> is measured in number of list items.
</p>
<note>
<p>
For <dtref ref="string"/> and datatypes <termref def="dt-derived"/> from <dtref ref="string"/>,
<term>minLength</term> will not always coincide with "string length" as perceived
by some users or with the number of storage units in some digital representation.
Therefore, care should be taken when specifying a value for <term>minLength</term>
and in attempting to infer storage requirements from a given value for
<term>minLength</term>.
</p>
</note>
<p>
<termref def="dt-minLength"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/>
to values with at least a specific number of <emph>units of length</emph>,
where <emph>units of length</emph>
varies depending on <propref ref="defn-basetype"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which requires strings to have at least one character (i.e.,
the empty string is not in the <termref def="dt-value-space"/>
of this datatype).
</p>
<eg><![CDATA[<simpleType name='non-empty-string'>
  <restriction base='string'>
    <minLength value='1'/>
  </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-minLength">
<head>The minLength Schema Component</head>
<compdef name="minLength" ref="dt-minLength">
<proplist>
<propdef id="minLength-value" name="value">
A <dtref ref="nonNegativeInteger"/>.
</propdef>
<propdef id="minLength-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="minLength-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="minLength-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-minLength"/> other than <propref ref="minLength-value"/>.
</p>
</div4>
<div4 id="xr-minLength">
<head>XML Representation of minLength Schema Component</head>
<p>
The XML representation for a <compref ref="dc-minLength"/> schema
component is a <eltref ref="minLength"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="minLength"/>
<reprcomp abstract="minLength" ref="dc-fractionDigits">
<propmap name="minLength-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="minLength-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="minLength-validation-rules">
<head>minLength Validation Rules</head>
<constraintnote type="cvc" id="cvc-minLength-valid">
<head>minLength Valid</head>
<p>
A value in a <termref def="dt-value-space"/> is facet-valid with
respect to <termref def="dt-minLength"/>, determined as follows:
</p>
<olist>
<item>
<p>
if the <propref ref="defn-variety"/> is <termref def="dt-atomic"/> then
<olist>
<item>
<p>
if <propref ref="defn-primitive"/> is <dtref ref="string"/>
<phrase diff="add"> or
<dtref ref="anyURI"/>
</phrase>, then the
length of the value, as measured in<xtermref href="&xmlspec;#dt-character">
character</xtermref>s
<termref def="dt-must"/> be greater than or equal to
<propref ref="minLength-value"/>;
</p>
</item>
<item>
<p>
if <propref ref="defn-primitive"/> is <dtref ref="hexBinary"/> or <dtref ref="base64Binary"/>, then the
length of the value, as measured in octets of the binary data,
<termref def="dt-must"/> be greater than or equal to
<propref ref="minLength-value"/>;
</p>
</item>
<item>
<p>
<phrase diff="add">
if <propref ref="defn-primitive"/> is <dtref ref="QName"/> or <dtref ref="NOTATION"/>, then
any <propref ref="minLength-value"/> is facet-valid.</phrase>
</p>
</item>
</olist>
</p>
</item>
<item>
<p>
if the <propref ref="defn-variety"/> is <termref def="dt-list"/>,
then the length of the value, as measured
in list items, <termref def="dt-must"/> be greater than or equal
to <propref ref="minLength-value"/>
</p>
</item>
</olist>
</constraintnote>
<p>
<phrase diff="add">
The use of <termref def="dt-minLength"/>
on datatypes <termref def="dt-derived"/> from <dtref ref="QName"/> and <dtref ref="NOTATION"/>
is deprecated.  Future versions of this
specification may remove this facet for these datatypes.
</phrase>
</p>
</div4>
<div4 id="minLength-coss">
<head>Constraints on minLength Schema Components</head>
<constraintnote type="cos" id="minLength-less-than-equal-to-maxLength">
<head>minLength &lt;= maxLength</head>
<p>
If both <compref ref="dc-minLength"/> and <compref ref="dc-maxLength"/>
are members of <propref ref="defn-facets"/>, then the
<propref ref="minLength-value"/> of <compref ref="dc-minLength"/>
&nbsp;<termref def="dt-must"/> be less than or equal to the
<propref ref="maxLength-value"/> of <compref ref="dc-maxLength"/>.
</p>
</constraintnote>
<constraintnote type="cos" id="minLength-valid-restriction">
<head>minLength valid restriction</head>
<p>
It is an <termref def="dt-error"/> if <compref ref="dc-minLength"/>
is among the members of <propref ref="defn-facets"/> of
<propref ref="defn-basetype"/> and <propref ref="minLength-value"/> is
less than the <propref ref="minLength-value"/> of the parent
<compref ref="dc-minLength"/>.
</p>
</constraintnote>
</div4>
</div3>
<div3 id="rf-maxLength">
<head>maxLength</head>
<p>
<termdef id="dt-maxLength" term="maxLength" role="local">
<term>maxLength</term> is
the maximum number of <emph>units of length</emph>, where
<emph>units of length</emph> varies
depending on the type that is being <termref def="dt-derived"/> from.
The value of <term>maxLength</term>
&nbsp;<termref def="dt-must"/> be a <dtref ref="nonNegativeInteger"/>.
</termdef>
</p>
<p>
For <dtref ref="string"/> and datatypes <termref def="dt-derived"/> from <dtref ref="string"/>,
<term>maxLength</term> is measured in units of <xtermref href="&xmlspec;#dt-character">
character</xtermref>s as defined in <bibref ref="XML"/>.
For <dtref ref="hexBinary"/> and <dtref ref="base64Binary"/> and datatypes <termref def="dt-derived"/> from them,
<term>maxLength</term> is measured in octets (8 bits) of binary data.
For datatypes <termref def="dt-derived"/> by <termref def="dt-list"/>,
<term>maxLength</term> is measured in number of list items.
</p>
<note>
<p>
For <dtref ref="string"/> and datatypes <termref def="dt-derived"/> from <dtref ref="string"/>,
<term>maxLength</term> will not always coincide with "string length" as perceived
by some users or with the number of storage units in some digital representation.
Therefore, care should be taken when specifying a value for <term>maxLength</term>
and in attempting to infer storage requirements from a given value for
<term>maxLength</term>.
</p>
</note>
<p>
<termref def="dt-maxLength"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/>
to values with at most a specific number of <emph>units of length</emph>,
where <emph>units of length</emph>
varies depending on <propref ref="defn-basetype"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which might be used to accept form input with an upper limit
to the number of characters that are acceptable.
</p>
<eg><![CDATA[<simpleType name='form-input'>
  <restriction base='string'>
    <maxLength value='50'/>
  </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-maxLength">
<head>The maxLength Schema Component</head>
<compdef name="maxLength" ref="dt-maxLength">
<proplist>
<propdef id="maxLength-value" name="value">
A <dtref ref="nonNegativeInteger"/>.
</propdef>
<propdef id="maxLength-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="maxLength-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="maxLength-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-maxLength"/> other than <propref ref="maxLength-value"/>.
</p>
</div4>
<div4 id="xr-maxLength">
<head>XML Representation of maxLength Schema Components</head>
<p>
The XML representation for a <compref ref="dc-maxLength"/> schema
component is a <eltref ref="maxLength"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="maxLength"/>
<reprcomp abstract="maxLength" ref="dc-fractionDigits">
<propmap name="maxLength-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="maxLength-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="maxLength-validation-rules">
<head>maxLength Validation Rules</head>
<constraintnote type="cvc" id="cvc-maxLength-valid">
<head>maxLength Valid</head>
<p>
A value in a <termref def="dt-value-space"/> is facet-valid with
respect to <termref def="dt-maxLength"/>, determined as follows:
</p>
<olist>
<item>
<p>
if the <propref ref="defn-variety"/> is <termref def="dt-atomic"/> then
<olist>
<item>
<p>
if <propref ref="defn-primitive"/> is <dtref ref="string"/>
<phrase diff="add"> or
<dtref ref="anyURI"/>
</phrase>, then the
length of the value, as measured in <xtermref href="&xmlspec;#dt-character">
character</xtermref>s
<termref def="dt-must"/> be less than or equal to
<propref ref="maxLength-value"/>;
</p>
</item>
<item>
<p>
if <propref ref="defn-primitive"/> is <dtref ref="hexBinary"/> or <dtref ref="base64Binary"/>, then the
length of the value, as measured in octets of the binary data,
<termref def="dt-must"/> be less than or equal to <propref ref="maxLength-value"/>;
</p>
</item>
<item>
<p>
<phrase diff="add">
if <propref ref="defn-primitive"/> is <dtref ref="QName"/> or <dtref ref="NOTATION"/>, then
any <propref ref="maxLength-value"/> is facet-valid.</phrase>
</p>
</item>
</olist>
</p>
</item>
<item>
<p>
if the <propref ref="defn-variety"/> is <termref def="dt-list"/>,
then the length of the value, as measured
in list items, <termref def="dt-must"/> be less than or equal to
<propref ref="maxLength-value"/>
</p>
</item>
</olist>
</constraintnote>
<p>
<phrase diff="add">
The use of <termref def="dt-maxLength"/>
on datatypes <termref def="dt-derived"/> from <dtref ref="QName"/> and <dtref ref="NOTATION"/>
is deprecated.  Future versions of this
specification may remove this facet for these datatypes.
</phrase>
</p>
</div4>
<div4 id="maxLength-coss">
<head>Constraints on maxLength Schema Components</head>
<constraintnote type="cos" id="maxLength-valid-restriction">
<head>maxLength valid restriction</head>
<p>
It is an <termref def="dt-error"/> if <compref ref="dc-maxLength"/>
is among the members of <propref ref="defn-facets"/> of
<propref ref="defn-basetype"/> and <propref ref="maxLength-value"/> is
greater than the <propref ref="maxLength-value"/> of the parent
<compref ref="dc-maxLength"/>.
</p>
</constraintnote>
</div4>
</div3>
<div3 id="rf-pattern">
<head>pattern</head>
<p>
<termdef id="dt-pattern" term="pattern" role="local">
<term>pattern</term> is a constraint on the
<termref def="dt-value-space"/> of a datatype which is achieved by
constraining the <termref def="dt-lexical-space"/> to literals
which match a specific pattern.  The value of <term>pattern</term>
&nbsp;<termref def="dt-must"/> be a <termref def="dt-regex"/>.
</termdef>
</p>
<p>
<termref def="dt-pattern"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/>
to values that are denoted by literals which match a specific
<termref def="dt-regex"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which is a better representation of postal codes in the
United States, by limiting strings to those which are matched by
a specific <termref def="dt-regex"/>.
</p>
<eg><![CDATA[<simpleType name='better-us-zipcode'>
  <restriction base='string'>
    <pattern value='[0-9]{5}(-[0-9]{4})?'/>
  </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-pattern">
<head>The pattern Schema Component</head>
<compdef name="pattern" ref="dt-pattern">
<proplist>
<propdef id="pattern-value" name="value">
A <termref def="dt-regex"/>.
</propdef>
<propdef id="pattern-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
</div4>
<div4 id="xr-pattern">
<head>XML Representation of pattern Schema Components</head>
<p>
The XML representation for a <compref ref="dc-pattern"/> schema
component is a <eltref ref="pattern"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="pattern"/>
<reprcomp abstract="pattern" ref="dc-fractionDigits">
<reprdep>
<propref ref="pattern-value"/>&nbsp;<termref def="dt-must"/> be a valid
<termref def="dt-regex"/>.
</reprdep>
<propmap name="pattern-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="pattern-rep-constr">
<head>Constraints on XML Representation of pattern</head>
<constraintnote type="src" id="src-multiple-patterns">
<head>Multiple patterns</head>
<p>
If multiple <eltref ref="pattern"/> element information items appear as
&i-children; of a <eltref ref="simpleType"/>, the &i-value;s should
be combined as if they appeared in a single
<termref def="dt-regex"/> as separate
<termref def="dt-branch"/>es.
</p>
</constraintnote>
<note>
<p>
It is a consequence of the schema representation constraint
<specref ref="src-multiple-patterns"/> and of the rules for
<termref def="dt-restriction"/> that <termref def="dt-pattern"/>
facets specified on the <emph>same</emph> step in a type
derivation are <strong>OR</strong>ed together, while <termref def="dt-pattern"/>
facets specified on <emph>different</emph> steps of a type derivation
are <strong>AND</strong>ed together.
</p>
<p>
Thus, to impose two <termref def="dt-pattern"/> constraints simultaneously,
schema authors may either write a single <termref def="dt-pattern"/> which
expresses the intersection of the two <termref def="dt-pattern"/>s they wish to
impose, or define each <termref def="dt-pattern"/> on a separate type derivation
step.
</p>
</note>
</div4>
<div4 id="pattern-validation-rules">
<head>pattern Validation Rules</head>
<constraintnote type="cvc" id="cvc-pattern-valid">
<head>pattern valid</head>
<p>
A literal in a <termref def="dt-lexical-space"/> is facet-valid with
respect to <termref def="dt-pattern"/> if:
</p>
<olist>
<item>
<p>
the literal is among the set of character sequences denoted by
the <termref def="dt-regex"/> specified in <propref ref="pattern-value"/>.
</p>
</item>
</olist>
</constraintnote>
</div4>
</div3>
<div3 id="rf-enumeration">
<head>enumeration</head>
<p>
<termdef id="dt-enumeration" term="enumeration" role="local">
<term>enumeration</term> constrains the <termref def="dt-value-space"/>
to a specified set of values.
</termdef>
</p>
<p>
<term>enumeration</term> does not impose an order relation on the
<termref def="dt-value-space"/> it creates; the value of the
<termref def="dt-ordered"/> property of the <termref def="dt-derived"/>
datatype remains that of the datatype from which it is
<termref def="dt-derived"/>.
</p>
<p>
<termref def="dt-enumeration"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/>
to a specified set of values.
</p>
</item>
</ulist>
<note role="example">
<p>
The following example is a datatype definition for a
<termref def="dt-user-derived"/> datatype which limits the values
of dates to the three US holidays enumerated. This datatype
definition would appear in a schema authored by an "end-user" and
shows how to define a datatype by enumerating the values in its
<termref def="dt-value-space"/>.  The enumerated values must be
type-valid literals for the <termref def="dt-basetype"/>.
</p>
<eg><![CDATA[<simpleType name='holidays'>
    <annotation>
        <documentation>some US holidays</documentation>
    </annotation>
    <restriction base='gMonthDay'>
      <enumeration value='--01-01'>
        <annotation>
            <documentation>New Year's day</documentation>
        </annotation>
      </enumeration>
      <enumeration value='--07-04'>
        <annotation>
            <documentation>4th of July</documentation>
        </annotation>
      </enumeration>
      <enumeration value='--12-25'>
        <annotation>
            <documentation>Christmas</documentation>
        </annotation>
      </enumeration>
    </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-enumeration">
<head>The enumeration Schema Component</head>
<compdef name="enumeration" ref="dt-enumeration">
<proplist>
<propdef id="enumeration-value" name="value">
A set of values from the <termref def="dt-value-space"/> of the
<propref ref="defn-basetype"/>.
</propdef>
<propdef id="enumeration-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
</div4>
<div4 id="xr-enumeration">
<head>XML Representation of enumeration Schema Components</head>
<p>
The XML representation for an <compref ref="dc-enumeration"/> schema
component is an <eltref ref="enumeration"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="enumeration"/>
<reprcomp abstract="enumeration" ref="dc-enumeration">
<reprdep>
<propref ref="enumeration-value"/>&nbsp;<termref def="dt-must"/> be
in the <termref def="dt-value-space"/> of <propref ref="defn-basetype"/>.
</reprdep>
<propmap name="enumeration-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="enumeration-rep-constr">
<head>Constraints on XML Representation of enumeration</head>
<constraintnote type="src" id="src-multiple-enumerations">
<head>Multiple enumerations</head>
<p>
If multiple <eltref ref="enumeration"/> element information items appear
as &i-children; of a <eltref ref="simpleType"/> the
<propref ref="enumeration-value"/> of the <compref ref="dc-enumeration"/>
component should be the set of all such &i-value;s.
</p>
</constraintnote>
</div4>
<div4 id="enumeration-validation-rules">
<head>enumeration Validation Rules</head>
<constraintnote type="cvc" id="cvc-enumeration-valid">
<head>enumeration valid</head>
<p>
A value in a <termref def="dt-value-space"/> is facet-valid with
respect to <termref def="dt-enumeration"/> if
the value is one of the values specified in
<propref ref="enumeration-value"/>
</p>
</constraintnote>
</div4>
<div4 id="enumeration-coss">
<head>Constraints on enumeration Schema Components</head>
<constraintnote type="cos" id="enumeration-valid-restriction">
<head>enumeration valid restriction</head>
<p>
It is an <termref def="dt-error"/> if any member of <propref ref="enumeration-value"/> is not in the <termref def="dt-value-space"/>
of <propref ref="defn-basetype"/>.
</p>
</constraintnote>
</div4>
</div3>
<div3 id="rf-whiteSpace">
<head>whiteSpace</head>
<p>
<termdef id="dt-whiteSpace" term="whiteSpace" role="local">
<term>whiteSpace</term> constrains the <termref def="dt-value-space"/>
of types <termref def="dt-derived"/> from <dtref ref="string"/> such that
the various behaviors
specified in <xspecref href="&xmlspec;#AVNormalize">Attribute Value Normalization</xspecref>
in <bibref ref="XML"/> are realized.  The value of
<term>whiteSpace</term> must be one of {preserve, replace, collapse}.
</termdef>
</p>
<glist>
<gitem>
<label>preserve</label>
<def>
<p>
No normalization is done, the value is not changed (this is the
behavior required  by <bibref ref="XML"/> for element content)
</p>
</def>
</gitem>
<gitem>
<label>replace</label>
<def>
<p>
All occurrences of #x9 (tab), #xA (line feed) and #xD (carriage return)
are replaced with #x20 (space)
</p>
</def>
</gitem>
<gitem>
<label>collapse</label>
<def>
<p>
After the processing implied by <term>replace</term>, contiguous
sequences of #x20's are collapsed to a single #x20, and leading and
trailing #x20's are removed.
</p>
</def>
</gitem>
</glist>
<note>
<p>
The notation #xA used here (and elsewhere in this specification) represents
the Universal Character Set (UCS) code point <code>hexadecimal A</code> (line feed), which is denoted by
U+000A.  This notation is to be distinguished from <code>&amp;#xA;</code>,
which is the XML <xnt href="&xmlspec;#NT-CharRef">character reference</xnt>
to that same UCS code point.
</p>
</note>
<p>
<term>whiteSpace</term> is applicable to all <termref def="dt-atomic"/> and
<termref def="dt-list"/> datatypes.  For all <termref def="dt-atomic"/>
datatypes other than <dtref ref="string"/> (and types <termref def="dt-derived"/>
by <termref def="dt-restriction"/> from it) the value of <term>whiteSpace</term> is
<code>collapse</code> and cannot be changed by a schema author; for
<dtref ref="string"/> the value of <term>whiteSpace</term> is
<code>preserve</code>; for any type <termref def="dt-derived"/> by
<termref def="dt-restriction"/> from
<dtref ref="string"/> the value of <term>whiteSpace</term> can
be any of the three legal values.  For all datatypes
<termref def="dt-derived"/> by <termref def="dt-list"/> the
value of <term>whiteSpace</term> is <code>collapse</code> and cannot
be changed by a schema author.  For all datatypes
<termref def="dt-derived"/> by <termref def="dt-union"/>
&nbsp;<term>whiteSpace</term> does not apply directly; however, the
normalization behavior of <termref def="dt-union"/> types is controlled by
the value of <term>whiteSpace</term> on that one of the
<termref def="dt-memberTypes"/> against which the <termref def="dt-union"/>
is successfully validated.
</p>
<note>
<p>
For more information on <term>whiteSpace</term>, see the
discussion on white space normalization in
<xspecref href="&xsdl;#components">Schema Component Details</xspecref>
in <bibref ref="structural-schemas"/>.
</p>
</note>
<p>
<termref def="dt-whiteSpace"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/> according to
the white space normalization rules.
</p>
</item>
</ulist>
<note role="example">
<p>
The following example is the datatype definition for
the <dtref ref="token"/>&nbsp;<termref def="dt-built-in"/>&nbsp;
<termref def="dt-derived"/>
datatype.
</p>
<eg><![CDATA[<simpleType name='token'>
    <restriction base='normalizedString'>
      <whiteSpace value='collapse'/>
    </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-whiteSpace">
<head>The whiteSpace Schema Component</head>
<compdef name="whiteSpace" ref="dt-whiteSpace">
<proplist>
<propdef id="whiteSpace-value" name="value">
One of <code>{preserve, replace, collapse}</code>.
</propdef>
<propdef id="whiteSpace-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="whiteSpace-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="whiteSpace-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-whiteSpace"/> other than <propref ref="whiteSpace-value"/>.
</p>
</div4>
<div4 id="xr-whiteSpace">
<head>XML Representation of whiteSpace Schema Components</head>
<p>
The XML representation for a <compref ref="dc-whiteSpace"/> schema
component is a <eltref ref="whiteSpace"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="whiteSpace"/>
<reprcomp abstract="whiteSpace" ref="dc-whiteSpace">
<propmap name="whiteSpace-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="whiteSpace-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="whiteSpace-validation-rules">
<head>whiteSpace Validation Rules</head>
<note>
<p>
There are no <termref def="dt-cvc"/>s associated <termref def="dt-whiteSpace"/>.
For more information, see the
discussion on white space normalization in
<xspecref href="&xsdl;#components">Schema Component Details</xspecref>
in <bibref ref="structural-schemas"/>.
</p>
</note>
</div4>
<div4 id="whiteSpace-coss">
<head>Constraints on whiteSpace Schema Components</head>
<constraintnote type="cos" id="whiteSpace-valid-restriction">
<head>whiteSpace valid restriction</head>
<p>
It is an <termref def="dt-error"/> if <compref ref="dc-whiteSpace"/>
is among the members of <propref ref="defn-facets"/> of
<propref ref="defn-basetype"/> and any of the following conditions is
true:
</p>
<olist>
<item>
<p>
<propref ref="whiteSpace-value"/> is <emph>replace</emph> or <emph>preserve</emph>
and the <propref ref="whiteSpace-value"/> of the parent
<compref ref="dc-whiteSpace"/> is <emph>collapse</emph>
</p>
</item>
<item>
<p>
<propref ref="whiteSpace-value"/> is <emph>preserve</emph>
and the <propref ref="whiteSpace-value"/> of the parent
<compref ref="dc-whiteSpace"/> is <emph>replace</emph>
</p>
</item>
</olist>
</constraintnote>
</div4>
</div3>
<div3 id="rf-maxInclusive">
<head>maxInclusive</head>
<p>
<termdef id="dt-maxInclusive" term="maxInclusive" role="local">
<term>maxInclusive</term> is the <termref def="dt-inclusive-upper-bound"/>
of the <termref def="dt-value-space"/> for a datatype with the
<termref def="dt-ordered"/> property.  The value of
<term>maxInclusive</term>&nbsp;<termref def="dt-must"/> be
in the <termref def="dt-value-space"/> of the
<termref def="dt-basetype"/>.
</termdef>
</p>
<p>
<termref def="dt-maxInclusive"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/> to values
with a specific <termref def="dt-inclusive-upper-bound"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which limits values to integers less than or equal to
100, using <termref def="dt-maxInclusive"/>.
</p>
<eg><![CDATA[<simpleType name='one-hundred-or-less'>
  <restriction base='integer'>
    <maxInclusive value='100'/>
  </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-maxInclusive">
<head>The maxInclusive Schema Component</head>
<compdef name="maxInclusive" ref="dt-maxInclusive">
<proplist>
<propdef id="maxInclusive-value" name="value">
A value from the <termref def="dt-value-space"/> of the
<propref ref="defn-basetype"/>.
</propdef>
<propdef id="maxInclusive-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="maxInclusive-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="maxInclusive-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-maxInclusive"/> other than <propref ref="maxInclusive-value"/>.
</p>
</div4>
<div4 id="xr-maxInclusive">
<head>XML Representation of maxInclusive Schema Components</head>
<p>
The XML representation for a <compref ref="dc-maxInclusive"/> schema
component is a <eltref ref="maxInclusive"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="maxInclusive"/>
<reprcomp abstract="maxInclusive" ref="dt-maxInclusive">
<reprdep>
<propref ref="maxInclusive-value"/>&nbsp;<termref def="dt-must"/> be
in the <termref def="dt-value-space"/> of <propref ref="defn-basetype"/>.
</reprdep>
<propmap name="maxInclusive-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="maxInclusive-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="maxInclusive-validation-rules">
<head>maxInclusive Validation Rules</head>
<constraintnote type="cvc" id="cvc-maxInclusive-valid">
<head>maxInclusive Valid</head>
<p>
A value in an <termref def="dt-ordered"/>&nbsp;<termref def="dt-value-space"/>
is facet-valid with respect to <termref def="dt-maxInclusive"/>, determined as
follows:
</p>
<olist>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>true</emph>, then the value
<termref def="dt-must"/> be numerically less than or
equal to <propref ref="maxInclusive-value"/>;
</p>
</item>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>false</emph> (i.e.,
<propref ref="defn-basetype"/> is one of the date and time related
datatypes), then the value <termref def="dt-must"/> be chronologically
less than or equal to <propref ref="maxInclusive-value"/>;
</p>
</item>
</olist>
</constraintnote>
</div4>
<div4 id="maxInclusive-coss">
<head>Constraints on maxInclusive Schema Components</head>
<constraintnote type="cos" id="minInclusive-less-than-equal-to-maxInclusive">
<head>minInclusive &lt;= maxInclusive</head>
<p>
It is an <termref def="dt-error"/> for the value specified for
<termref def="dt-minInclusive"/> to be greater than the value
specified for <termref def="dt-maxInclusive"/> for the same datatype.
</p>
</constraintnote>
<constraintnote type="cos" id="maxInclusive-valid-restriction">
<head>maxInclusive valid restriction</head>
<p>
It is an <termref def="dt-error"/> if any of the following conditions
is true:
</p>
<olist>
<item>
<p>
<compref ref="dc-maxInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxInclusive-value"/> is
greater than the <propref ref="maxInclusive-value"/> of the parent
<compref ref="dc-maxInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-maxExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxInclusive-value"/> is
greater than or equal to the <propref ref="maxExclusive-value"/> of the parent
<compref ref="dc-maxExclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-minInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxInclusive-value"/> is
less than the <propref ref="minInclusive-value"/> of the parent
<compref ref="dc-minInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-minExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxInclusive-value"/> is
less than or equal to the <propref ref="minExclusive-value"/> of the parent
<compref ref="dc-minExclusive"/>
</p>
</item>
</olist>
</constraintnote>
</div4>
</div3>
<div3 id="rf-maxExclusive">
<head>maxExclusive</head>
<p>
<termdef id="dt-maxExclusive" term="maxExclusive" role="local">
<term>maxExclusive</term> is the <termref def="dt-exclusive-upper-bound"/>
of the <termref def="dt-value-space"/> for a datatype with the
<termref def="dt-ordered"/> property.  The value of <term>maxExclusive</term>
&nbsp;<termref def="dt-must"/> be in the <termref def="dt-value-space"/> of the
<termref def="dt-basetype"/>
<phrase diff="add"> or be equal to <propref ref="maxExclusive-value"/> in
<propref ref="defn-basetype"/>
</phrase>.
</termdef>
</p>
<p>
<termref def="dt-maxExclusive"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/> to values
with a specific <termref def="dt-exclusive-upper-bound"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which limits values to integers less than or equal to
100, using <termref def="dt-maxExclusive"/>.
</p>
<eg><![CDATA[<simpleType name='less-than-one-hundred-and-one'>
  <restriction base='integer'>
    <maxExclusive value='101'/>
  </restriction>
</simpleType>]]></eg>
<p>
Note that the
<termref def="dt-value-space"/> of this datatype is identical to
the previous one (named 'one-hundred-or-less').
</p>
</note>
<div4 id="dc-maxExclusive">
<head>The maxExclusive Schema Component</head>
<compdef name="maxExclusive" ref="dt-maxExclusive">
<proplist>
<propdef id="maxExclusive-value" name="value">
A value from the <termref def="dt-value-space"/> of the
<propref ref="defn-basetype"/>.
</propdef>
<propdef id="maxExclusive-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="maxExclusive-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="maxExclusive-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-maxExclusive"/> other than <propref ref="maxExclusive-value"/>.
</p>
</div4>
<div4 id="xr-maxExclusive">
<head>XML Representation of maxExclusive Schema Components</head>
<p>
The XML representation for a <compref ref="dc-maxExclusive"/> schema
component is a <eltref ref="maxExclusive"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="maxExclusive"/>
<reprcomp abstract="maxExclusive" ref="dt-maxExclusive">
<reprdep>
<propref ref="maxExclusive-value"/>&nbsp;<termref def="dt-must"/> be
in the <termref def="dt-value-space"/> of <propref ref="defn-basetype"/>.
</reprdep>
<propmap name="maxExclusive-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="maxExclusive-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="maxExclusive-validation-rules">
<head>maxExclusive Validation Rules</head>
<constraintnote type="cvc" id="cvc-maxExclusive-valid">
<head>maxExclusive Valid</head>
<p>
A value in an <termref def="dt-ordered"/>&nbsp;<termref def="dt-value-space"/>
is facet-valid with respect to <termref def="dt-maxExclusive"/>, determined
as follows:
</p>
<olist>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>true</emph>, then the
value <termref def="dt-must"/> be numerically less than
<propref ref="maxExclusive-value"/>;
</p>
</item>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>false</emph> (i.e.,
<propref ref="defn-basetype"/> is one of the date and time related
datatypes), then the value <termref def="dt-must"/> be chronologically
less than <propref ref="maxExclusive-value"/>;
</p>
</item>
</olist>
</constraintnote>
</div4>
<div4 id="maxExclusive-coss">
<head>Constraints on maxExclusive Schema Components</head>
<constraintnote type="cos" id="maxInclusive-maxExclusive">
<head>maxInclusive and maxExclusive</head>
<p>
It is an <termref def="dt-error"/> for both
<termref def="dt-maxInclusive"/> and <termref def="dt-maxExclusive"/>
to be specified in the same derivation step of a datatype definition.
</p>
</constraintnote>
<constraintnote type="cos" id="minExclusive-less-than-equal-to-maxExclusive">
<head>minExclusive &lt;= maxExclusive</head>
<p>
It is an <termref def="dt-error"/> for the value specified for
<termref def="dt-minExclusive"/> to be greater than the value
specified for <termref def="dt-maxExclusive"/> for the same datatype.
</p>
</constraintnote>
<constraintnote type="cos" id="maxExclusive-valid-restriction">
<head>maxExclusive valid restriction</head>
<p>
It is an <termref def="dt-error"/> if any of the following conditions
is true:
</p>
<olist>
<item>
<p>
<compref ref="dc-maxExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxExclusive-value"/> is
greater than the <propref ref="maxExclusive-value"/> of the parent
<compref ref="dc-maxExclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-maxInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxExclusive-value"/> is
greater than the <propref ref="maxInclusive-value"/> of the parent
<compref ref="dc-maxInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-minInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxExclusive-value"/> is
less than or equal to the <propref ref="minInclusive-value"/> of the parent
<compref ref="dc-minInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-minExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxExclusive-value"/> is
less than or equal to the <propref ref="minExclusive-value"/> of the parent
<compref ref="dc-minExclusive"/>
</p>
</item>
</olist>
</constraintnote>
</div4>
</div3>
<div3 id="rf-minExclusive">
<head>minExclusive</head>
<p>
<termdef id="dt-minExclusive" term="minExclusive" role="local">
<term>minExclusive</term> is the <termref def="dt-exclusive-lower-bound"/>
of the <termref def="dt-value-space"/> for a datatype with the
<termref def="dt-ordered"/> property.
The value of <term>minExclusive</term>&nbsp;<termref def="dt-must"/>
be in the <termref def="dt-value-space"/> of the
<termref def="dt-basetype"/>
<phrase diff="add"> or be equal to <propref ref="minExclusive-value"/> in
<propref ref="defn-basetype"/>
</phrase>.
</termdef>
</p>
<p>
<termref def="dt-minExclusive"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/> to values
with a specific <termref def="dt-exclusive-lower-bound"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which limits values to integers greater than or equal to
100, using <termref def="dt-minExclusive"/>.
</p>
<eg><![CDATA[<simpleType name='more-than-ninety-nine'>
  <restriction base='integer'>
    <minExclusive value='99'/>
  </restriction>
</simpleType>]]></eg>
<p>
Note that the
<termref def="dt-value-space"/> of this datatype is identical to
the previous one (named 'one-hundred-or-more').
</p>
</note>
<div4 id="dc-minExclusive">
<head>The minExclusive Schema Component</head>
<compdef name="minExclusive" ref="dt-minExclusive">
<proplist>
<propdef id="minExclusive-value" name="value">
A value from the <termref def="dt-value-space"/> of the
<propref ref="defn-basetype"/>.
</propdef>
<propdef id="minExclusive-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="minExclusive-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="minExclusive-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-minExclusive"/> other than <propref ref="minExclusive-value"/>.
</p>
</div4>
<div4 id="xr-minExclusive">
<head>XML Representation of minExclusive Schema Components</head>
<p>
The XML representation for a <compref ref="dc-minExclusive"/> schema
component is a <eltref ref="minExclusive"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="minExclusive"/>
<reprcomp abstract="minExclusive" ref="dt-minExclusive">
<reprdep>
<propref ref="minExclusive-value"/>&nbsp;<termref def="dt-must"/> be
in the <termref def="dt-value-space"/> of <propref ref="defn-basetype"/>.
</reprdep>
<propmap name="minExclusive-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="minExclusive-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="minExclusive-validation-rules">
<head>minExclusive Validation Rules</head>
<constraintnote type="cvc" id="cvc-minExclusive-valid">
<head>minExclusive Valid</head>
<p>
A value in an <termref def="dt-ordered"/>&nbsp;<termref def="dt-value-space"/>
is facet-valid with respect to <termref def="dt-minExclusive"/> if:
</p>
<olist>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>true</emph>, then the
value <termref def="dt-must"/> be numerically greater than
<propref ref="minExclusive-value"/>;
</p>
</item>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>false</emph> (i.e.,
<propref ref="defn-basetype"/> is one of the date and time related
datatypes), then the value <termref def="dt-must"/> be chronologically
greater than <propref ref="minExclusive-value"/>;
</p>
</item>
</olist>
</constraintnote>
</div4>
<div4 id="minExclusive-coss">
<head>Constraints on minExclusive Schema Components</head>
<constraintnote type="cos" id="minInclusive-minExclusive">
<head>minInclusive and minExclusive</head>
<p>
It is an <termref def="dt-error"/> for both
<termref def="dt-minInclusive"/> and <termref def="dt-minExclusive"/>
to be specified for the same datatype.
</p>
</constraintnote>
<constraintnote type="cos" id="minExclusive-less-than-maxInclusive">
<head>minExclusive &lt; maxInclusive</head>
<p>
It is an <termref def="dt-error"/> for the value specified for
<termref def="dt-minExclusive"/> to be greater than or equal to the value
specified for <termref def="dt-maxInclusive"/> for the same datatype.
</p>
</constraintnote>
<constraintnote type="cos" id="minExclusive-valid-restriction">
<head>minExclusive valid restriction</head>
<p>
It is an <termref def="dt-error"/> if any of the following conditions
is true:
</p>
<olist>
<item>
<p>
<compref ref="dc-minExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="minExclusive-value"/> is
less than the <propref ref="minExclusive-value"/> of the parent
<compref ref="dc-minExclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-maxInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="minExclusive-value"/> is
greater the <propref ref="maxInclusive-value"/> of the parent
<compref ref="dc-maxInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-minInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="minExclusive-value"/> is
less than the <propref ref="minInclusive-value"/> of the parent
<compref ref="dc-minInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-maxExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="maxExclusive-value"/> is
greater than or equal to the <propref ref="maxExclusive-value"/> of the parent
<compref ref="dc-maxExclusive"/>
</p>
</item>
</olist>
</constraintnote>
</div4>
</div3>
<div3 id="rf-minInclusive">
<head>minInclusive</head>
<p>
<termdef id="dt-minInclusive" term="minInclusive" role="local">
<term>minInclusive</term> is the <termref def="dt-inclusive-lower-bound"/>
of the <termref def="dt-value-space"/> for a datatype with the
<termref def="dt-ordered"/> property.  The value of
<term>minInclusive</term>
&nbsp;<termref def="dt-must"/> be in the <termref def="dt-value-space"/> of the
<termref def="dt-basetype"/>.
</termdef>
</p>
<p>
<termref def="dt-minInclusive"/> provides for:
</p>
<ulist>
<item>
<p>
Constraining a <termref def="dt-value-space"/> to values
with a specific <termref def="dt-inclusive-lower-bound"/>.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which limits values to integers greater than or equal to
100, using <termref def="dt-minInclusive"/>.
</p>
<eg><![CDATA[<simpleType name='one-hundred-or-more'>
  <restriction base='integer'>
    <minInclusive value='100'/>
  </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-minInclusive">
<head>The minInclusive Schema Component</head>
<compdef name="minInclusive" ref="dt-minInclusive">
<proplist>
<propdef id="minInclusive-value" name="value">
A value from the <termref def="dt-value-space"/> of the
<propref ref="defn-basetype"/>.
</propdef>
<propdef id="minInclusive-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="minInclusive-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="minInclusive-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-minInclusive"/> other than <propref ref="minInclusive-value"/>.
</p>
</div4>
<div4 id="xr-minInclusive">
<head>XML Representation of minInclusive Schema Components</head>
<p>
The XML representation for a <compref ref="dc-minInclusive"/> schema
component is a <eltref ref="minInclusive"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="minInclusive"/>
<reprcomp abstract="minInclusive" ref="dt-minInclusive">
<reprdep>
<propref ref="minInclusive-value"/>&nbsp;<termref def="dt-must"/> be
in the <termref def="dt-value-space"/> of <propref ref="defn-basetype"/>.
</reprdep>
<propmap name="minInclusive-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="minInclusive-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="minInclusive-validation-rules">
<head>minInclusive Validation Rules</head>
<constraintnote type="cvc" id="cvc-minInclusive-valid">
<head>minInclusive Valid</head>
<p>
A value in an <termref def="dt-ordered"/>&nbsp;<termref def="dt-value-space"/>
is facet-valid with respect to <termref def="dt-minInclusive"/> if:
</p>
<olist>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>true</emph>, then the
value <termref def="dt-must"/> be numerically greater than or equal to
<propref ref="minInclusive-value"/>;
</p>
</item>
<item>
<p>
if the <termref def="dt-numeric"/> property in
<propref ref="defn-fund-facets"/> is <emph>false</emph> (i.e.,
<propref ref="defn-basetype"/> is one of the date and time related
datatypes), then the value <termref def="dt-must"/> be chronologically
greater than or equal to <propref ref="minInclusive-value"/>;
</p>
</item>
</olist>
</constraintnote>
</div4>
<div4 id="minInclusive-coss">
<head>Constraints on minInclusive Schema Components</head>
<constraintnote type="cos" id="minInclusive-less-than-maxExclusive">
<head>minInclusive &lt; maxExclusive</head>
<p>
It is an <termref def="dt-error"/> for the value specified for
<termref def="dt-minInclusive"/> to be greater than or equal to the value
specified for <termref def="dt-maxExclusive"/> for the same datatype.
</p>
</constraintnote>
<constraintnote type="cos" id="minInclusive-valid-restriction">
<head>minInclusive valid restriction</head>
<p>
It is an <termref def="dt-error"/> if any of the following conditions
is true:
</p>
<olist>
<item>
<p>
<compref ref="dc-minInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="minInclusive-value"/> is
less than the <propref ref="minInclusive-value"/> of the parent
<compref ref="dc-minInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-maxInclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="minInclusive-value"/> is
greater the <propref ref="maxInclusive-value"/> of the parent
<compref ref="dc-maxInclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-minExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="minInclusive-value"/> is
less than or equal to the <propref ref="minExclusive-value"/> of the parent
<compref ref="dc-minExclusive"/>
</p>
</item>
<item>
<p>
<compref ref="dc-maxExclusive"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="minInclusive-value"/> is
greater than or equal to the <propref ref="maxExclusive-value"/> of the parent
<compref ref="dc-maxExclusive"/>
</p>
</item>
</olist>
</constraintnote>
</div4>
</div3>
<div3 id="rf-totalDigits">
<head>totalDigits</head>
<p>
<termdef id="dt-totalDigits" term="totalDigits" role="local">
<term>totalDigits</term>
<phrase diff="add">controls the maximum number of values in
the <termref def="dt-value-space"/>
</phrase>
<phrase diff="del">
is the maximum number of digits in values
</phrase>
of datatypes <termref def="dt-derived"/> from <dtref ref="decimal"/>
<phrase diff="add">,
by restricting it to numbers that are expressible as
<emph role="eq">i &times; 10^-n</emph> where <emph role="eq">i</emph>
and <emph role="eq">n</emph> are integers such that
<emph role="eq">|i| &lt; 10^totalDigits</emph> and
<emph role="eq">0 &lt;= n &lt;= totalDigits</emph>
</phrase>.
The value of
<term>totalDigits</term>&nbsp;<termref def="dt-must"/> be a
<dtref ref="positiveInteger"/>.
</termdef>
</p>
<p>
<phrase diff="add">
The term <term>totalDigits</term> is chosen to reflect the fact that it
restricts the <termref def="dt-value-space"/> to those values that can
be represented lexically using at most <emph role="eq">totalDigits</emph>
digits. Note that it does not restrict the <termref def="dt-lexical-space"/>
directly; a lexical representation that adds
additional leading zero digits or trailing fractional zero digits is
still permitted.
</phrase>
</p>
<p diff="del">
<termref def="dt-totalDigits"/> provides for:
</p>
<ulist diff="del">
<item>
<p>
Constraining a <termref def="dt-value-space"/> to values
with a specific maximum number of decimal digits (#x30-#x39).
</p>
</item>
</ulist>
<note role="example" diff="del">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which could be used to represent monetary amounts, such as
in a financial management application which does not have figures
of $1M or more and only allows whole cents. This definition would appear
in a schema authored by an "end-user" and shows how to define a datatype by
specifying facet values which constrain the range of the
<termref def="dt-basetype"/> in a manner specific to the
<termref def="dt-basetype"/> (different than specifying max/min values
as before).
</p>
<eg><![CDATA[<simpleType name='amount'>
  <restriction base='decimal'>
    <totalDigits value='8'/>
    <fractionDigits value='2' fixed='true'/>
  </restriction>
</simpleType>]]></eg>
</note>
<div4 id="dc-totalDigits">
<head>The totalDigits Schema Component</head>
<compdef name="totalDigits" ref="dt-totalDigits">
<proplist>
<propdef id="totalDigits-value" name="value">
A <dtref ref="positiveInteger"/>.
</propdef>
<propdef id="totalDigits-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="totalDigits-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="totalDigits-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-totalDigits"/> other than
<propref ref="totalDigits-value"/>.
</p>
</div4>
<div4 id="xr-totalDigits">
<head>XML Representation of totalDigits Schema Components</head>
<p>
The XML representation for a <compref ref="dc-totalDigits"/> schema
component is a <eltref ref="totalDigits"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="totalDigits"/>
<reprcomp abstract="totalDigits" ref="dc-totalDigits">
<propmap name="totalDigits-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="totalDigits-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="totalDigits-validation-rules">
<head>totalDigits Validation Rules</head>
<constraintnote type="cvc" id="cvc-totalDigits-valid">
<head>totalDigits Valid</head>
<p>
A value in a <termref def="dt-value-space"/> is facet-valid with
respect to <termref def="dt-totalDigits"/> if:
</p>
<olist>
<item>
<p>
<phrase diff="add">
that value is expressible as <emph role="eq">i &times; 10^-n</emph> where
<emph role="eq">i</emph> and <emph role="eq">n</emph> are integers such that
<emph role="eq">|i| &lt; 10^<propref ref="totalDigits-value"/>
</emph> and
<emph role="eq">0 &lt;= n &lt;= <propref ref="totalDigits-value"/>
</emph>.
</phrase>
<phrase diff="del">
the number of decimal digits in the value is less than or equal to
<propref ref="totalDigits-value"/>;
</phrase>
</p>
</item>
</olist>
</constraintnote>
</div4>
<div4 id="totalDigits-coss">
<head>Constraints on totalDigits Schema Components</head>
<constraintnote type="cos" id="totalDigits-valid-restriction">
<head>totalDigits valid restriction</head>
<p>
It is an <termref def="dt-error"/> if
<compref ref="dc-totalDigits"/> is among the members of
<propref ref="defn-facets"/> of <propref ref="defn-basetype"/>
and <propref ref="totalDigits-value"/> is
greater than the <propref ref="totalDigits-value"/> of the parent
<compref ref="dc-totalDigits"/>
</p>
</constraintnote>
</div4>
</div3>
<div3 id="rf-fractionDigits">
<head>fractionDigits</head>
<p>
<termdef id="dt-fractionDigits" term="fractionDigits" role="local">
<term>fractionDigits</term>
<phrase diff="add">controls the size of the minimum difference
between values</phrase>
<phrase diff="del">
is the maximum number of digits in the fractional part
of values</phrase>
in the <termref def="dt-value-space"/> of datatypes <termref def="dt-derived"/>
from <term>decimal</term>
<phrase diff="add">,
by restricting the <termref def="dt-value-space"/> to numbers that are
expressible as <emph role="eq">i &times; 10^-n</emph> where
<emph role="eq">i</emph> and <emph role="eq">n</emph>
are integers and <emph role="eq">0 &lt;= n &lt;= fractionDigits</emph>
</phrase>.
The value of <term>fractionDigits</term>&nbsp;<termref def="dt-must"/>
be a <dtref ref="nonNegativeInteger"/>.
</termdef>
<!-- note: I added "-del" to the id below so in 2e so that the old
termdef would be ID distinquishable from the new one
<termdef id="dt-fractionDigits-del" term="fractionDigits" role='local' diff='del'>
<term>fractionDigits</term>
of datatypes <termref def="dt-derived"/> from
<dtref ref='decimal'/>. The value of <term>fractionDigits</term>
&nbsp;<termref def="dt-must"/> be a <dtref ref="nonNegativeInteger"/> .
</termdef>
 -->
</p>
<p>
<phrase diff="add">
The term <term>fractionDigits</term> is chosen to reflect the fact that it
restricts the <termref def="dt-value-space"/> to those values that can be
represented lexically using at most <emph role="eq">fractionDigits</emph>
to the right of the decimal point. Note that it does not restrict the
<termref def="dt-lexical-space"/> directly; a
non-<termref def="dt-canonical-representation"/> that adds additional
leading zero digits or trailing fractional zero digits is still permitted.
</phrase>
</p>
<p diff="del">
<termref def="dt-fractionDigits"/> provides for:
</p>
<ulist diff="del">
<item>
<p>
Constraining a <termref def="dt-value-space"/> to values
with a specific maximum number of decimal digits in the fractional
part.
</p>
</item>
</ulist>
<note role="example">
<p>
The following is the definition of a <termref def="dt-user-derived"/>
datatype which could be used to represent the magnitude
of a person's body temperature on the Celsius scale.
This definition would appear in a schema authored by an "end-user"
and shows how to define a datatype by specifying facet values which
constrain the range of the <termref def="dt-basetype"/>.
</p>
<eg><![CDATA[<simpleType name='celsiusBodyTemp'>
  <restriction base='decimal'>
    <totalDigits value='4'/>
    <fractionDigits value='1'/>
    <minInclusive value='36.4'/>
    <maxInclusive value='40.5'/>
  </restriction>
</simpleType>
]]></eg>
</note>
<div4 id="dc-fractionDigits">
<head>The fractionDigits Schema Component</head>
<compdef name="fractionDigits" ref="dt-fractionDigits">
<proplist>
<propdef id="fractionDigits-value" name="value">
A <dtref ref="nonNegativeInteger"/>.
</propdef>
<propdef id="fractionDigits-fixed" name="fixed">
A <dtref ref="boolean"/>.
</propdef>
<propdef id="fractionDigits-annotation" name="annotation">
Optional.  An <xspecref href="&xsdl;#Annotation">annotation</xspecref>.
</propdef>
</proplist>
</compdef>
<p>
If <propref ref="fractionDigits-fixed"/> is <emph>true</emph>, then types for which
the current type is the <propref ref="defn-basetype"/> cannot specify a
value for <compref ref="dc-fractionDigits"/> other than
<propref ref="fractionDigits-value"/>.
</p>
</div4>
<div4 id="xr-fractionDigits">
<head>XML Representation of fractionDigits Schema Components</head>
<p>
The XML representation for a <compref ref="dc-fractionDigits"/> schema
component is a <eltref ref="fractionDigits"/> element information item. The
correspondences between the properties of the information item and
properties of the component are as follows:
</p>
<reprdef>
<reprelt eltname="fractionDigits"/>
<reprcomp abstract="fractionDigits" ref="dc-fractionDigits">
<propmap name="fractionDigits-value">
The &v-value; of the <code>value</code> &i-attribute;
</propmap>
<propmap name="fractionDigits-fixed">
The &v-value; of the <code>fixed</code> &i-attribute;, if present, otherwise false
</propmap>
<propmap name="defn-annotation">
The annotations corresponding to all the <eltref ref="annotation"/>
element information items in the &i-children;, if any.
</propmap>
</reprcomp>
</reprdef>
</div4>
<div4 id="fractionDigits-validation-rules">
<head>fractionDigits Validation Rules</head>
<constraintnote type="cvc" id="cvc-fractionDigits-valid">
<head>fractionDigits Valid</head>
<p>
A value in a <termref def="dt-value-space"/> is facet-valid with
respect to <termref def="dt-fractionDigits"/> if:
</p>
<olist>
<item>
<p>
<phrase diff="add">
that value is expressible as <emph role="eq">i &times; 10^-n</emph> where
<emph role="eq">i</emph> and <emph role="eq">n</emph>
are integers and <emph role="eq">0 &lt;= n &lt;= <propref ref="fractionDigits-value"/>
</emph>.
</phrase>
<phrase diff="del">
the number of decimal digits in the fractional part of the
value is less than or equal to <propref ref="fractionDigits-value"/>;
</phrase>
</p>
</item>
</olist>
</constraintnote>
</div4>
<div4 id="fractionDigits-coss">
<head>Constraints on fractionDigits Schema Components</head>
<constraintnote type="cos" id="fractionDigits-totalDigits">
<head>fractionDigits less than or equal to totalDigits</head>
<p>
It is an <termref def="dt-error"/> for <termref def="dt-fractionDigits"/> to
be greater than <termref def="dt-totalDigits"/>.
</p>
</constraintnote>
<constraintnote type="cos" id="fractionDigits-valid-restriction" diff="add">
<head>fractionDigits valid restriction</head>
<p>
It is an <termref def="dt-error"/> if <termref def="dt-fractionDigits"/>
is among the members of <propref ref="defn-facets"/> of <propref ref="defn-basetype"/> and
<propref ref="fractionDigits-value"/> is greater than the <propref ref="fractionDigits-value"/> of the parent
<termref def="dt-fractionDigits"/>.
</p>
</constraintnote>
</div4>
</div3>
</div2>
</div1>
<div1 id="conformance">
<head>Conformance</head>
<p>
This specification describes two levels of conformance for
datatype processors.  The first is
required of all processors.  Support for the other will depend on the
application environments for which the processor is intended.
</p>
<p>
<termdef id="dt-minimally-conforming" term="minimally conforming">
<term>Minimally conforming</term> processors <termref def="dt-must"/>
completely and correctly implement the <termref def="dt-cos"/> and
<termref def="dt-cvc"/>
.
</termdef>
</p>
<p>
<termdef id="dt-interchange" term="conformance to the XML Representation
of Schemas">
Processors which accept schemas in the form of XML documents as described
in <specref ref="xr-defn"/> (and other relevant portions of
<specref ref="datatype-components"/>) are additionally said to provide
<term>conformance to the XML Representation of Schemas</term>,
and <termref def="dt-must"/>, when processing schema documents, completely and
correctly implement all
<termref def="dt-src"/>s
in this specification, and <termref def="dt-must"/> adhere exactly to the
specifications in <specref ref="xr-defn"/>  (and other relevant portions of
<specref ref="datatype-components"/>) for mapping
the contents of such
documents to <xtermref href="&xsdl;#key-component">schema components</xtermref>
for use in validation.
</termdef>
</p>
<note>
<p>
By separating the conformance requirements relating to the concrete
syntax of XML schema documents, this specification admits processors
which validate using schemas stored in optimized binary representations,
dynamically created schemas represented as programming language data
structures, or implementations in which particular schemas are compiled
into executable code such as C or Java.  Such processors can be said to
be <termref def="dt-minimally-conforming">minimally conforming</termref>
but not necessarily in <termref def="dt-interchange">conformance to
the XML Representation of Schemas</termref>.
</p>
</note>
</div1>
</body>
<back>
<div1 id="schema">
<head>Schema for Datatype Definitions (normative)</head>
<eg xml:space="preserve" text="./&meForTxt;.xsd.txt"/>
</div1>
<div1 id="dtd-for-datatypeDefs">
<head>DTD for Datatype Definitions (non-normative)</head>
<eg xml:space="preserve" text="./&meForTxt;.dtd.txt"/>
</div1>
<div1>
<head>Datatypes and Facets</head>
<div2 id="app-fundamental-facets">
<head>Fundamental Facets</head>
<p>
The following table shows the values of the fundamental facets
for each <termref def="dt-built-in"/> datatype.
</p>
<fundamental-facets/>
</div2>
</div1>
<div1 id="isoformats">
<head>ISO 8601 Date and Time Formats</head>
<div2 id="formatdetails">
<head>ISO 8601 Conventions</head>
<p>
The <termref def="dt-primitive"/> datatypes
<dtref ref="duration"/>, <dtref ref="dateTime"/>, <dtref ref="time"/>,
<dtref ref="date"/>, <dtref ref="gYearMonth"/>,  <dtref ref="gMonthDay"/>,
<dtref ref="gDay"/>, <dtref ref="gMonth"/> and <dtref ref="gYear"/>
use lexical formats inspired by
<bibref ref="ISO8601"/>.
<phrase diff="add">Following <bibref ref="ISO8601"/>, the lexical forms of
these datatypes can include only the characters #20 through #7F.</phrase>
This appendix provides more detail on the ISO
formats and discusses some deviations from them for the datatypes
defined in this specification.
</p>
<p>
<bibref ref="ISO8601"/> "specifies the representation of dates in the
proleptic Gregorian calendar and times and representations of periods of time".
The proleptic Gregorian calendar includes dates prior to 1582 (the year it came
into use as an ecclesiastical calendar).
It should be pointed out that the datatypes described in this
specification do not cover all the types of data covered by
<bibref ref="ISO8601"/>, nor do they support all the lexical
representations for those types of data.
</p>
<p>
<bibref ref="ISO8601"/> lexical formats are described using "pictures"
in which characters are used in place of <phrase diff="add">decimal</phrase> digits.
<phrase diff="add">The allowed decimal digits are (#x30-#x39).</phrase>
For the primitive datatypes
<dtref ref="dateTime"/>, <dtref ref="time"/>,
<dtref ref="date"/>, <dtref ref="gYearMonth"/>,  <dtref ref="gMonthDay"/>,
<dtref ref="gDay"/>, <dtref ref="gMonth"/> and <dtref ref="gYear"/>.
these characters have the following meanings:
</p>
<ulist>
<item>
<p>
C -- represents a digit used in the thousands and hundreds components,
the "century" component, of the time element "year". Legal values are
from 0 to 9.
</p>
</item>
<item>
<p>
Y -- represents a digit used in the tens and units components of the time
element "year".  Legal values are from 0 to 9.
</p>
</item>
<item>
<p>
M -- represents a digit used in the time element "month".  The two
digits in a MM format can have values from 1 to 12.
</p>
</item>
<item>
<p>
D -- represents a digit used in the time element "day". The two digits
in a DD format can have values from 1 to 28 if the month value equals 2,
1 to 29 if the month value equals 2 and the year is a leap year, 1 to 30
if the month value equals 4, 6, 9 or 11, and 1 to 31 if the month value
equals 1, 3, 5, 7, 8, 10 or 12.
</p>
</item>
<item>
<p>
h -- represents a digit used in the time element "hour". The two digits
in a hh format can have values from 0 to
<phrase diff="add">24</phrase>
<phrase diff="del">23</phrase>.
<phrase diff="add">
If the value of the hour element is 24 then the values of the minutes
element and the seconds element must be 00 and 00.
</phrase>
</p>
</item>
<item>
<p>
m -- represents a digit used in the time element "minute". The two digits
in a mm format can have values from 0 to 59.
</p>
</item>
<item>
<p>
s -- represents a digit used in the time element "second".  The two
digits in a ss format can have values from 0 to 60.  In the formats
described in this specification the whole number of seconds <termref def="dt-may"/>
be followed by decimal seconds to an arbitrary level of precision.
This is represented in the picture by "ss.sss".  A value of 60 or more is
allowed only in the case of leap seconds.  </p>
<p>Strictly speaking, a value of
60 or more is not sensible unless the month and day could
represent March 31, June 30, September 30, or December 31 <emph>in UTC</emph>.
Because the leap second is added or subtracted as the last second of the day
in UTC time, the long (or short) minute could occur at other times in local
time.  In cases where the leap second is used with an inappropriate month
and day it, and any fractional seconds, should considered as added or
subtracted from the following minute.
</p>
</item>
</ulist>
<p>
For all the information items indicated by the above characters, leading
zeros are required where indicated.
</p>
<p>
In addition to the above, certain characters are used as designators
and appear as themselves in lexical formats.
</p>
<ulist>
<item>
<p>
T -- is used as time designator to indicate the start of the
representation of the time of day in <dtref ref="dateTime"/>.
</p>
</item>
<item>
<p>
Z -- is used as time-zone designator, immediately (without a space)
following a data element expressing the time of day in Coordinated
Universal Time (UTC) in
<dtref ref="dateTime"/>, <dtref ref="time"/>,
<dtref ref="date"/>, <dtref ref="gYearMonth"/>,  <dtref ref="gMonthDay"/>,
<dtref ref="gDay"/>, <dtref ref="gMonth"/>, and <dtref ref="gYear"/>.
</p>
</item>
</ulist>
<p>In the lexical format for <dtref ref="duration"/> the following
characters are also used as designators and appear as themselves in
lexical formats:</p>
<ulist>
<item>
<p>P -- is used as the time duration designator, preceding a data element
representing a given duration of time.</p>
</item>
<item>
<p>Y -- follows the number of years in a time duration.</p>
</item>
<item>
<p>M -- follows the number of months or minutes in a time duration.</p>
</item>
<item>
<p>D -- follows the number of days in a time duration.</p>
</item>
<item>
<p>H -- follows the number of hours in a time duration.</p>
</item>
<item>
<p>S -- follows the number of seconds in a time duration.</p>
</item>
</ulist>
<p>
The values of the
Year, Month, Day, Hour and Minutes components are not restricted but
allow an arbitrary integer.  Similarly, the value of the Seconds component
allows an arbitrary decimal.  Thus, the lexical format for
<dtref ref="duration"/> and datatypes derived from it
does not follow the alternative
format of &sect; 5.5.3.2.1 of <bibref ref="ISO8601"/>.</p>
</div2>
<div2 id="truncatedformats">
<head>Truncated and Reduced Formats</head>
<p>
<bibref ref="ISO8601"/> supports a variety of "truncated" formats in
which some of the characters on the left of specific formats, for example,
the
century, can be omitted.
Truncated formats are, in
general, not permitted for the datatypes defined in this specification
with three exceptions.  The <dtref ref="time"/> datatype uses
a truncated format for <dtref ref="dateTime"/>
which represents an instant of time that recurs every day.
Similarly, the <dtref ref="gMonthDay"/> and <dtref ref="gDay"/>
datatypes use left-truncated formats for <dtref ref="date"/>.
The datatype <dtref ref="gMonth"/> uses a right and left truncated format for
<dtref ref="date"/>.
</p>
<p>
<bibref ref="ISO8601"/> also supports a variety of "reduced" or right-truncated
formats in which some of the characters to the right of specific formats,
such as the
time specification, can be omitted.  Right truncated formats are also, in
general,
not permitted for the datatypes defined in this specification
with the following exceptions:
right-truncated representations of <dtref ref="dateTime"/> are used as
lexical representations for <dtref ref="date"/>,  <dtref ref="gMonth"/>,
<dtref ref="gYear"/>.
</p>
</div2>
<div2 id="deviantformats">
<head>Deviations from ISO 8601 Formats</head>
<div3 id="signallowed">
<head>Sign Allowed</head>
<p>
An optional minus sign is allowed immediately preceding, without a space,
the lexical representations for <dtref ref="duration"/>, <dtref ref="dateTime"/>,
<dtref ref="date"/>, <phrase diff="add">
<dtref ref="gYearMonth"/>
</phrase>
<phrase diff="del">
<dtref ref="gMonth"/>
</phrase>, <dtref ref="gYear"/>.
</p>
</div3>
<div3 id="noYearZero">
<head>No Year Zero</head>
<p>
The year "0000" is an illegal year value.
</p>
</div3>
<div3 id="morethan9999years">
<head>More Than 9999 Years</head>
<p>
To accommodate year values greater than 9999, more than four digits are
allowed in the year representations of <dtref ref="dateTime"/>,
<dtref ref="date"/>, <dtref ref="gYearMonth"/>, and <dtref ref="gYear"/>.
This follows
<bibref ref="ISO8601-2000"/>.
</p>
</div3>
<div3 id="timeZonePermited" diff="add">
<head>Time zone permitted</head>
<p>
The lexical representations for the datatypes <dtref ref="date"/>,
<dtref ref="gYearMonth"/>, <dtref ref="gMonthDay"/>, <dtref ref="gDay"/>,
<dtref ref="gMonth"/> and <dtref ref="gYear"/> permit an optional
trailing time zone specificiation.
</p>
</div3>
</div2>
</div1>
<div1 id="adding-durations-to-dateTimes">
<head>Adding durations to dateTimes</head>
<p>
Given a <dtref ref="dateTime"/> S and a <dtref ref="duration"/> D, this
appendix specifies how to compute a <dtref ref="dateTime"/> E where E is the
end of the time period with start S and duration D i.e. E = S + D.  Such
computations are used, for example, to determine whether a <dtref ref="dateTime"/>
is within a specific time period. This appendix also addresses the addition of
<dtref ref="duration"/>s to the datatypes <dtref ref="date"/>,
<dtref ref="gYearMonth"/>, <dtref ref="gYear"/>, <dtref ref="gDay"/> and
<dtref ref="gMonth"/>, which can be viewed as a set of <dtref ref="dateTime"/>s.
In such cases, the addition is made to the first or starting
<dtref ref="dateTime"/> in the set.
</p>
<p>
<emph>This is a logical explanation of the process.
Actual implementations are free to optimize as long as they produce the same
results. </emph> The calculation uses the notation S[year] to represent the year
field of S, S[month] to represent the month field, and so on. It also depends on
the following functions:</p>
<ulist>
<item>
<p>
     	fQuotient(a, b) = the greatest integer less than or equal to a/b
          <ulist>
<item>
<p>fQuotient(-1,3) = -1</p>
</item>
<item>
<p>fQuotient(0,3)...fQuotient(2,3) = 0</p>
</item>
<item>
<p>fQuotient(3,3) = 1</p>
</item>
<item>
<p>fQuotient(3.123,3) = 1</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
     	modulo(a, b) = a - fQuotient(a,b)*b
          <ulist>
<item>
<p>modulo(-1,3) = 2</p>
</item>
<item>
<p>modulo(0,3)...modulo(2,3) = 0...2</p>
</item>
<item>
<p>modulo(3,3) = 0</p>
</item>
<item>
<p>modulo(3.123,3) = 0.123</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
     	fQuotient(a, low, high) = fQuotient(a - low, high - low)
          <ulist>
<item>
<p>fQuotient(0, 1, 13) = -1</p>
</item>
<item>
<p>fQuotient(1, 1, 13) ... fQuotient(12, 1, 13) = 0</p>
</item>
<item>
<p>fQuotient(13, 1, 13) = 1</p>
</item>
<item>
<p>fQuotient(13.123, 1, 13) = 1</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
     	modulo(a, low, high) = modulo(a - low, high - low) + low
          <ulist>
<item>
<p>modulo(0, 1, 13) = 12</p>
</item>
<item>
<p>modulo(1, 1, 13) ...  modulo(12, 1, 13) = 1...12 </p>
</item>
<item>
<p>modulo(13, 1, 13) = 1</p>
</item>
<item>
<p>modulo(13.123, 1, 13) = 1.123</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
     	maximumDayInMonthFor(yearValue, monthValue) =
          <ulist>
<item>
<p>M := modulo(monthValue, 1, 13)</p>
</item>
<item>
<p>Y := yearValue + fQuotient(monthValue, 1, 13)</p>
</item>
<item>
<p>Return a value based on M and Y:</p>
</item>
</ulist>
</p>
</item>
</ulist>
<p/>
<table border="1">
<tbody>
<tr>
<td style="background-color:#FFFF99">
<strong>31</strong>
</td>
<td colspan="2">M = January, March, May, July, August, October, or
          December</td>
</tr>
<tr>
<td style="background-color:#FFFF99">
<strong>30</strong>
</td>
<td colspan="2">M = April, June, September, or November</td>
</tr>
<tr>
<td style="background-color:#FFFF99">
<strong>29</strong>
</td>
<td>M = February AND (modulo(Y, 400) = 0 OR
          (modulo(Y, 100) != 0) AND modulo(Y, 4) = 0)</td>
</tr>
<tr>
<td style="background-color:#FFFF99">
<strong>28</strong>
</td>
<td>Otherwise</td>
</tr>
</tbody>
</table>
<p/>
<div2>
<head>Algorithm</head>
<p>
Essentially, this calculation is equivalent to separating D into &lt;year,month&gt;
and &lt;day,hour,minute,second&gt; fields. The &lt;year,month&gt; is added to S.
If the day is out of range, it is <emph>pinned</emph> to be within range. Thus April
31 turns into April 30. Then the &lt;day,hour,minute,second&gt; is added. This
latter addition can cause the year and month to change.
</p>
<p>
Leap seconds are handled by the computation by treating them as overflows.
Essentially, a value of 60
seconds in S is treated as if it were a duration of 60 seconds added to S
(with a zero seconds field). All calculations
thereafter use 60 seconds per minute.
</p>
<p>
Thus the addition of either PT1M or PT60S to any dateTime will always
produce the same result. This is a special definition of addition which
is designed to match common practice, and -- most importantly -- be stable
over time.
</p>
<p>
A definition that attempted to take leap-seconds into account would need to
be constantly updated, and could not predict the results of future
implementation's additions. The decision to introduce a leap second in UTC
is the responsibility of the <bibref ref="IERS"/>. They make periodic
announcements as to when
leap seconds are to be added, but this is not known more than a year in
advance. For more information on leap seconds, see <bibref ref="USNavy"/>.
</p>
<p>
The following is the precise specification. These steps must be followed in
the same order. If a field in D is not specified, it is treated as if it were
zero. If a field in S is not specified, it is treated in the calculation as if
it were the minimum allowed value in that field, however, after the calculation
is concluded, the corresponding field in E is removed (set to unspecified).
</p>
<ulist>
<item>
<p>
<emph>Months (may be modified additionally below)</emph>
<ulist>
<item>
<p>temp := S[month] + D[month]</p>
</item>
<item>
<p>E[month] := modulo(temp, 1, 13)</p>
</item>
<item>
<p>carry := fQuotient(temp, 1, 13)</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<emph>Years (may be modified additionally below)</emph>
<ulist>
<item>
<p>E[year] := S[year] + D[year] + carry</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<emph>Zone</emph>
<ulist>
<item>
<p>E[zone] := S[zone]</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<emph>Seconds</emph>
<ulist>
<item>
<p>temp := S[second] + D[second]</p>
</item>
<item>
<p>E[second] := modulo(temp, 60)</p>
</item>
<item>
<p>carry := fQuotient(temp, 60)</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<emph>Minutes</emph>
<ulist>
<item>
<p>temp := S[minute] + D[minute] + carry</p>
</item>
<item>
<p>E[minute] := modulo(temp, 60)</p>
</item>
<item>
<p>carry := fQuotient(temp, 60)</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<emph>Hours</emph>
<ulist>
<item>
<p>temp := S[hour] + D[hour] + carry</p>
</item>
<item>
<p>E[hour] := modulo(temp, 24)</p>
</item>
<item>
<p>carry := fQuotient(temp, 24)</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<emph>Days</emph>
<ulist>
<item>
<p>if S[day] &gt; maximumDayInMonthFor(E[year], E[month])
        <ulist>
<item>
<p>tempDays := maximumDayInMonthFor(E[year], E[month])</p>
</item>
</ulist>
</p>
</item>
<item>
<p>else if S[day] &lt; 1
        <ulist>
<item>
<p>tempDays := 1</p>
</item>
</ulist>
</p>
</item>
<item>
<p>else
        <ulist>
<item>
<p>tempDays := S[day]</p>
</item>
</ulist>
</p>
</item>
<item>
<p>E[day] := tempDays + D[day] + carry</p>
</item>
<item>
<p>
<term>START LOOP</term>
<ulist>
<item>
<p>
<term>IF </term>E[day] &lt; 1
            <ulist>
<item>
<p>E[day] := E[day] + maximumDayInMonthFor(E[year], E[month] - 1)</p>
</item>
<item>
<p>carry := -1</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<term>ELSE IF </term>E[day] &gt; maximumDayInMonthFor(E[year], E[month])
            <ulist>
<item>
<p>E[day] := E[day] - maximumDayInMonthFor(E[year], E[month])</p>
</item>
<item>
<p>carry := 1</p>
</item>
</ulist>
</p>
</item>
<item>
<p>
<term>ELSE EXIT LOOP</term>
</p>
</item>
<item>
<p>temp := E[month] + carry</p>
</item>
<item>
<p>E[month] := modulo(temp, 1, 13)</p>
</item>
<item>
<p>E[year] := E[year] + fQuotient(temp, 1, 13)</p>
</item>
<item>
<p>
<term>GOTO START LOOP</term>
</p>
</item>
</ulist>
</p>
</item>
</ulist>
</p>
</item>
</ulist>
<p>
<emph>Examples:</emph>
</p>
<table border="1" cellspacing="0" cellpadding="4">
<tbody>
<tr>
<th align="center" style="background-color: #FFFF99">dateTime</th>
<th align="center" style="background-color: #FFFF99">duration</th>
<th align="center" style="background-color: #FFFF99">result</th>
</tr>
<tr>
<td align="center">2000-01-12T12:13:14Z</td>
<td align="center">P1Y3M5DT7H10M3.3S</td>
<td align="center">2001-04-17T19:23:17.3Z</td>
</tr>
<tr>
<td align="center">2000-01</td>
<td align="center">-P3M</td>
<td align="center">1999-10</td>
</tr>
<tr>
<td align="center">2000-01-12</td>
<td align="center">PT33H</td>
<td align="center">2000-01-13</td>
</tr>
</tbody>
</table>
</div2>
<div2 id="adding-durations-to-instants-commutativity-associativity">
<head>Commutativity and Associativity</head>
<p>
Time durations are added by simply adding each of their fields, respectively,
without overflow.
</p>
<p>
The order of addition of durations to instants <emph>is</emph> significant.
For example, there are cases where:
</p>
<p>((dateTime + duration1) + duration2) != ((dateTime +
duration2) + duration1)</p>
<p>
<emph>Example:</emph>
</p>
<p>(2000-03-30 + P1D) + P1M = 2000-03-31 + P1M = 200<phrase diff="add">0</phrase>
<phrase diff="del">1</phrase>-<strong>04-30</strong>
</p>
<p>(2000-03-30 + P1M) + P1D = 2000-04-30 + P1D = 2000-<strong>05-01</strong>
</p>
</div2>
</div1>
<div1 id="regexs">
<head>Regular Expressions</head>
<p>
A <termref def="dt-regex"/>&nbsp;<emph>R</emph> is a sequence of
characters that denote a <strong>set of strings</strong>&nbsp; <emph>L(R)</emph>.
When used to constrain a <termref def="dt-lexical-space"/>, a
<term>regular expression</term>&nbsp; <emph>R</emph> asserts that only strings
in <emph>L(R)</emph> are valid literals for values of that type.
</p>
<note diff="add" role="forceNote">
<p>
Unlike some popular regular expression languages (including those
    defined by Perl and standard Unix utilities), the regular
    expression language defined here implicitly anchors all regular
    expressions at the head and tail, as the most common use of
    regular expressions in <termref def="dt-pattern"/> is to match entire literals.
For example, a datatype <termref def="dt-derived"/> from <dtref ref="string"/> such
that all values must begin with the character <code>A</code> (#x41) and end with the character
<code>Z</code> (#x5a) would be defined as follows:
</p>
<eg xml:space="preserve">&lt;simpleType name='myString'>
 &lt;restriction base='string'>
  &lt;pattern value='A.*Z'/>
 &lt;/restriction>
&lt;/simpleType></eg>
<p>
In regular expression languages that are not implicitly anchored at the head and tail,
it is customary to write the equivalent regular expression as:
</p>
<p>
&nbsp;&nbsp;&nbsp;<code>^A.*Z$</code>
</p>
<p>
where "^" anchors the pattern at the head and "$" anchors at the tail.
</p>
<p>In those rare cases where an unanchored match is desired, including
<code>.*</code> at the beginning and ending of the regular expression will
achieve the desired results. For example, a datatype <termref def="dt-derived"/> from string such that all values must contain at least 3 consecutive <code>A</code> (<code>#x41</code>) characters somewhere within the value could be defined as follows:</p>
<eg xml:space="preserve">&lt;simpleType name='myString'>
 &lt;restriction base='string'>
  &lt;pattern value='.*AAA.*'/>
 &lt;/restriction>
&lt;/simpleType></eg>
</note>
<p>
<termdef id="dt-regex" term="regular expression">A
<term>regular expression</term> is composed from zero or more
<termref def="dt-branch"/>es, separated by <code>|</code> characters.
</termdef>
</p>
<scrap>
<head>Regular Expression</head>
<prod id="regex">
<lhs id="nt-regExp">regExp</lhs>
<rhs>
<nt def="nt-branch">branch</nt>
			( '|' <nt def="nt-branch">branch</nt> )*
		</rhs>
</prod>
</scrap>
<p/>
<table border="1">
<col width="50%"/>
<col width="50%"/>
<thead>
<tr>
<th>
For all <termref def="dt-branch"/>es <emph>S</emph>, and for all
<termref def="dt-regex"/>s <emph>T</emph>, valid
<termref def="dt-regex"/>s <emph>R</emph> are:
</th>
<th>
Denoting the set of strings <emph>L(R)</emph> containing:
</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">(empty string)</td>
<td align="center">the set containing just the empty string
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>
</td>
<td align="center">all strings in <emph>L(S)</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>|<emph>T</emph>
</td>
<td align="center">all strings in <emph>L(S)</emph> and
  all strings in <emph>L(T)</emph>
</td>
</tr>
</tbody>
</table>
<p>
<termdef id="dt-branch" term="branch" role="local">
A <term>branch</term> consists
of zero or more <termref def="dt-piece"/>s, concatenated together.
</termdef>
</p>
<scrap>
<head>Branch</head>
<prod id="branch">
<lhs id="nt-branch">branch</lhs>
<rhs>
<nt def="nt-piece"/>*</rhs>
</prod>
</scrap>
<p/>
<table border="1">
<col width="50%"/>
<col width="50%"/>
<thead>
<tr>
<th>
For all <termref def="dt-piece"/>s <emph>S</emph>, and for all
<termref def="dt-branch"/>es <emph>T</emph>, valid
<termref def="dt-branch"/>es <emph>R</emph> are:
</th>
<th>
Denoting the set of strings <emph>L(R)</emph> containing:
</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<emph>S</emph>
</td>
<td align="center">all strings in <emph>L(S)</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>
<emph>T</emph>
</td>
<td align="center">all strings <emph>st</emph> with <emph>s</emph> in
  <emph>L(S)</emph> and <emph>t</emph> in <emph>L(T)</emph>
</td>
</tr>
</tbody>
</table>
<p>
<termdef id="dt-piece" term="piece" role="local">
A <term>piece</term> is an
<termref def="dt-atom"/>, possibly followed by a
<termref def="dt-quantifier"/>.
</termdef>
</p>
<scrap>
<head>Piece</head>
<prod id="piece">
<lhs id="nt-piece">piece</lhs>
<rhs>
<nt def="nt-atom"/>&nbsp;<nt def="nt-quantifier"/>?</rhs>
</prod>
</scrap>
<p/>
<table border="1">
<col width="50%"/>
<col width="50%"/>
<thead>
<tr>
<th>
For all <termref def="dt-atom"/>s <emph>S</emph> and non-negative
integers <emph role="eq">n</emph>, <emph role="eq">m</emph> such that
<emph role="eq">n &lt;= m</emph>, valid <termref def="dt-piece"/>s
<emph>R</emph> are:
</th>
<th>
Denoting the set of strings <emph>L(R)</emph> containing:
</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<emph>S</emph>
</td>
<td align="center">all strings in <emph>L(S)</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>?</td>
<td align="center">the empty string, and all strings in
  <emph>L(S)</emph>.</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>*</td>
<td align="center">
  All strings in <emph>L(S?)</emph> and all strings <emph>st</emph>
  with <emph>s</emph> in <emph>L(S*)</emph>
  and <emph>t</emph> in <emph>L(S)</emph>. <emph>( all concatenations
  of zero or more strings from L(S) )</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>+</td>
<td align="center">
  All strings <emph>st</emph> with <emph>s</emph> in <emph>L(S)</emph>
  and <emph>t</emph> in <emph>L(S*)</emph>.  <emph>( all concatenations
  of one or more strings from L(S) )</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>{n,m}</td>
<td align="center">
  All strings <emph>st</emph> with <emph>s</emph> in <emph>L(S)</emph>
  and <emph>t</emph> in <emph>L(S{n-1,m-1})</emph>.  <emph>( All
sequences of at least n, and at most m, strings from L(S) )</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>{n}</td>
<td align="center">
  All strings in <emph>L(S{n,n})</emph>.  <emph>( All
sequences of exactly n strings from L(S) )</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>{n,}</td>
<td align="center">
  All strings in L(S{n}S*)  <emph>( All
sequences of at least n, strings from L(S) )</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>{0,m}</td>
<td align="center">
  All strings <emph>st</emph> with <emph>s</emph> in <emph>L(S?)</emph>
  and <emph>t</emph> in <emph>L(S{0,m-1})</emph>.  <emph>( All
sequences of at most m, strings from L(S) )</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>S</emph>{0,0}</td>
<td align="center">
  The set containing only the empty string
  </td>
</tr>
</tbody>
</table>
<note>
<p>
The regular expression language in the Perl Programming Language
<bibref ref="Perl"/> does not include a quantifier of the form
<code>S{,m}</code>, since it is logically equivalent to <code>S{0,m}</code>.
We have, therefore, left this logical possibility out of the regular
expression language defined by this specification.
<phrase diff="del">We welcome further input from implementors and
schema authors on this issue.</phrase>
</p>
</note>
<p>
<termdef id="dt-quantifier" term="quantifier" role="local">
A <term>quantifier</term>
is one of <code>?</code>, <code>*</code>, <code>+</code>,
<code>{n,m}</code> or <code>{n,}</code>, which have the meanings
defined in the table above.
</termdef>
</p>
<scrap>
<head>Quanitifer</head>
<prod id="quant">
<lhs id="nt-quantifier">quantifier</lhs>
<rhs>[?*+] | ( '{' <nt def="nt-quantity"/> '}' )</rhs>
</prod>
<prod id="quantity">
<lhs id="nt-quantity">quantity</lhs>
<rhs>
<nt def="nt-quantRange"/> |
			<nt def="nt-quantMin"/> | <nt def="nt-QuantExact"/>
</rhs>
</prod>
<prod id="quantRange">
<lhs id="nt-quantRange">quantRange</lhs>
<rhs>
<nt def="nt-QuantExact"/> ',' <nt def="nt-QuantExact"/>
</rhs>
</prod>
<prod id="quantMin">
<lhs id="nt-quantMin">quantMin</lhs>
<rhs>
<nt def="nt-QuantExact"/> ','</rhs>
</prod>
<prod id="quantExact">
<lhs id="nt-QuantExact">QuantExact</lhs>
<rhs>[0-9]+</rhs>
</prod>
</scrap>
<p>
<termdef id="dt-atom" term="atom" role="local">
An <term>atom</term> is either a
<termref def="dt-normalc"/>, a <termref def="dt-charclass"/>, or
a parenthesized <termref def="dt-regex"/>.</termdef>
</p>
<scrap>
<head>Atom</head>
<prod id="atom">
<lhs id="nt-atom">atom</lhs>
<rhs>
<nt def="nt-Char"/> |
			<nt def="nt-charClass"/> | ( '('
			<nt def="nt-regExp"/> ')' )</rhs>
</prod>
</scrap>
<p/>
<table border="1">
<col width="50%"/>
<col width="50%"/>
<thead>
<tr>
<th>
For all <termref def="dt-normalc"/>s <emph>c</emph>,
<termref def="dt-charclass"/>es <emph>C</emph>, and
<termref def="dt-regex"/>s <emph>S</emph>, valid
<termref def="dt-atom"/>s <emph>R</emph> are:
</th>
<th>
Denoting the set of strings <emph>L(R)</emph> containing:
</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<emph>c</emph>
</td>
<td align="center">the single string consisting only of <emph>c</emph>
</td>
</tr>
<tr>
<td align="center">
<emph>C</emph>
</td>
<td align="center">all strings in <emph>L(C)</emph>
</td>
</tr>
<tr>
<td align="center">(<emph>S</emph>)</td>
<td align="center">all strings in <emph>L(S)</emph>
</td>
</tr>
</tbody>
</table>
<p>
<termdef id="dt-metac" term="metacharacter" role="local">
A <term>metacharacter</term>
is either <code>.</code>, <code>\</code>, <code>?</code>,
<code>*</code>, <code>+</code>, <code>{</code>, <code>}</code>
<code>(</code>, <code>)</code>, <code>[</code> or <code>]</code>.
These characters have special meanings in <termref def="dt-regex"/>s,
but can be escaped to form <termref def="dt-atom"/>s that denote the
sets of strings containing only themselves, i.e., an escaped
<termref def="dt-metac"/> behaves like a <termref def="dt-normalc"/>.
</termdef>
</p>
<p>
<termdef id="dt-normalc" term="normal character" role="local">
A
<term>normal character</term> is any XML character that is not a
metacharacter.  In <termref def="dt-regex"/>s, a normal character is an
atom that denotes the singleton set of strings containing only itself.
</termdef>
</p>
<scrap>
<head>Normal Character</head>
<prod id="char">
<lhs id="nt-Char">Char</lhs>
<rhs>[^.\?*+()|#x5B#x5D]</rhs>
</prod>
</scrap>
<p>
Note that a <termref def="dt-normalc"/> can be represented either as
itself, or with a <xspecref href="&xmlspec;#dt-charref">character
reference</xspecref>.
</p>
<div2 id="charcter-classes">
<head>Character Classes</head>
<p>
<termdef id="dt-charclass" term="character class" role="local">
A
<term>character class</term> is an <termref def="dt-atom"/>
&nbsp;<emph>R</emph> that identifies a <strong>set of characters</strong>
&nbsp;<emph>C(R)</emph>.  The set of strings <emph>L(R)</emph> denoted by a
character class <emph>R</emph> contains one single-character string
"<emph>c</emph>" for each character <emph>c</emph> in <emph>C(R)</emph>.
</termdef>
</p>
<scrap>
<head>Character Class</head>
<prod id="charClass">
<lhs id="nt-charClass">charClass</lhs>
<rhs>
<nt def="nt-charClassEsc"/> |
			<nt def="nt-charClassExpr"/>
<phrase diff="add">|
			<nt def="nt-WildcardEsc"/>
</phrase>
</rhs>
</prod>
</scrap>
<p>
A character class is either a <termref def="dt-cces"/> or a
<termref def="dt-charexpr"/>.
</p>
<p>
<termdef id="dt-charexpr" term="character class expression" role="local">
A
<term>character class expression</term> is a <termref def="dt-chargroup"/> surrounded
by <code>[</code> and <code>]</code> characters.  For all character
groups <emph>G</emph>, [<emph>G</emph>] is a valid <term>character class
expression</term>, identifying the set of characters
<emph>C</emph>([<emph>G</emph>]) = <emph>C</emph>(<emph>G</emph>).
</termdef>
</p>
<scrap>
<head>Character Class Expression</head>
<prod id="charClassExpr">
<lhs id="nt-charClassExpr">charClassExpr</lhs>
<rhs>'[' <nt def="nt-charGroup"/> ']'</rhs>
</prod>
</scrap>
<p>
<termdef id="dt-chargroup" term="character group" role="local">
A
<term>character group</term> is either a <termref def="dt-poschargroup"/>,
a <termref def="dt-negchargroup"/>, or a <termref def="dt-subchargroup"/>.
</termdef>
</p>
<scrap>
<head>Character Group</head>
<prod id="chargroup">
<lhs id="nt-charGroup">charGroup</lhs>
<rhs>
<nt def="nt-posCharGroup"/> |
			<nt def="nt-negCharGroup"/> |
			<nt def="nt-charClassSub"/>
</rhs>
</prod>
</scrap>
<p>
<termdef id="dt-poschargroup" term="positive character group" role="local">
A <term>positive character group</term> consists of one or more
<termref def="dt-charrange"/>s or <termref def="dt-cces"/>s, concatenated
together.  A <term>positive character group</term> identifies the set of
characters containing all of the characters in all of the sets identified
by its constituent ranges or escapes.
</termdef>
</p>
<scrap>
<head>Positive Character Group</head>
<prod id="poschargroup">
<lhs id="nt-posCharGroup">posCharGroup</lhs>
<rhs>
			(
			<nt def="nt-charRange"/> | <nt def="nt-charClassEsc"/>
			)+
		</rhs>
</prod>
</scrap>
<p/>
<table border="1">
<col width="50%"/>
<col width="50%"/>
<thead>
<tr>
<th>
For all <termref def="dt-charrange"/>s <emph>R</emph>, all
<termref def="dt-cces"/>s <emph>E</emph>, and all
<termref def="dt-poschargroup"/>s <emph>P</emph>, valid
<termref def="dt-poschargroup"/>s <emph>G</emph> are:
</th>
<th>
Identifying the set of characters <emph>C(G)</emph> containing:
</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<emph>R</emph>
</td>
<td align="center">all characters in <emph>C(R)</emph>.</td>
</tr>
<tr>
<td align="center">
<emph>E</emph>
</td>
<td align="center">all characters in <emph>C(E)</emph>.</td>
</tr>
<tr>
<td align="center">
<emph>RP</emph>
</td>
<td align="center">all characters in <emph>C(R)</emph> and all
  characters in <emph>C(P)</emph>.</td>
</tr>
<tr>
<td align="center">
<emph>EP</emph>
</td>
<td align="center">all characters in <emph>C(E)</emph> and all
  characters in <emph>C(P)</emph>.</td>
</tr>
</tbody>
</table>
<p>
<termdef id="dt-negchargroup" term="negative character group" role="local">
A <term>negative character group</term> is a
<termref def="dt-poschargroup"/> preceded by the <code>^</code> character.
For all <termref def="dt-poschargroup"/>s <emph>P</emph>, ^<emph>P</emph>
is a valid <term>negative character group</term>, and <emph>C(^P)</emph>
contains all XML characters that are <emph>not</emph> in <emph>C(P)</emph>.
</termdef>
</p>
<scrap>
<head>Negative Character Group</head>
<prod id="negchargroup">
<lhs id="nt-negCharGroup">negCharGroup</lhs>
<rhs>'^' <nt def="nt-posCharGroup"/>
</rhs>
</prod>
</scrap>
<p>
<termdef id="dt-subchargroup" term="character class subtraction" role="local">
A
<term>character class subtraction</term> is a <termref def="dt-charexpr"/>
subtracted from a <termref def="dt-poschargroup"/> or
<termref def="dt-negchargroup"/>, using the <code>-</code> character.
</termdef>
</p>
<scrap>
<head>Character Class Subtraction</head>
<prod id="charclasssub">
<lhs id="nt-charClassSub">charClassSub</lhs>
<rhs>
			( <nt def="nt-posCharGroup"/> |
				<nt def="nt-negCharGroup"/> ) '-'
			<nt def="nt-charClassExpr"/>
</rhs>
</prod>
</scrap>
<p>
For any <termref def="dt-poschargroup"/> or
<termref def="dt-negchargroup"/>&nbsp;<emph>G</emph>, and any
<termref def="dt-charexpr"/>&nbsp;<emph>C</emph>, <emph>G-C</emph> is a valid
<termref def="dt-subchargroup"/>, identifying the set of all characters in
<emph>C(G)</emph> that are not also in <emph>C(C)</emph>.
</p>
<p>
<termdef id="dt-charrange" term="character range" role="local">
A
<term>character range</term>&nbsp;<emph>R</emph> identifies a set of
characters <emph>C(R)</emph> containing all XML characters with UCS
code points in a specified range.
</termdef>
</p>
<scrap>
<head>Character Range</head>
<prod id="charrange">
<lhs id="nt-charRange">charRange</lhs>
<rhs>
<!-- pvb
	possible bug in xmlspec.xsl because the deletion marks
	at the end of <rhs> are not showing up in the rendered version

	as of 2003-02-21 I don't think the above comment still holds
  -->
<nt def="nt-seRange"/> |
<!--* 			<phrase diff="add"><nt def="nt-XmlChar"/></phrase> *-->
<!--* 			<phrase diff="del"><nt def="nt-XmlCharRef"/> | *-->
<!--* 			<nt def="nt-XmlCharIncDash"/></phrase>         *-->
<phrase diff="del">
<nt def="nt-XmlCharRef"/> | </phrase>
<nt def="nt-XmlCharIncDash"/>
</rhs>
</prod>
<prod id="serange">
<lhs id="nt-seRange">seRange</lhs>
<rhs>
<nt def="nt-charOrEsc"/> '-' <nt def="nt-charOrEsc"/>
</rhs>
</prod>
<prod id="xmlcharref" diff="del">
<lhs id="nt-XmlCharRef">XmlCharRef</lhs>
<rhs>( '&amp;#' [0-9]+ ';' ) | (' &amp;#x' [0-9a-fA-F]+ ';' )</rhs>
</prod>
<prod id="charoresc">
<lhs id="nt-charOrEsc">charOrEsc</lhs>
<rhs>
<nt def="nt-XmlChar"/> | <nt def="nt-SingleCharEsc"/>
</rhs>
</prod>
<prod id="xmlchar">
<lhs id="nt-XmlChar">XmlChar</lhs>
<rhs>[^\#x2D#x5B#x5D]</rhs>
</prod>
<!-- pvb
	possible bug in xmlspec.xsl because the deletion "down arrows"
	don't show up in the rendered version by simply adding the
	diff='del' to <prod>, but the coloring and strikethru do

	as of 2003-02-21 I don't think the above comment still holds
  -->
<!--* suppress the 'diff="del"' as part of E2-66.  MSM 2004-07-01 

	<prod id="XmlCharIncDash" diff="del">
		<lhs id="nt-XmlCharIncDash">XmlCharIncDash</lhs>
		<rhs>[^\#x5B#x5D]</rhs>
	</prod>
*-->
<prod id="XmlCharIncDash">
<lhs id="nt-XmlCharIncDash">XmlCharIncDash</lhs>
<rhs>[^\#x5B#x5D]</rhs>
</prod>
</scrap>
<p>
A single XML character is a <termref def="dt-charrange"/> that identifies
the set of characters containing only itself.  All XML characters are valid
character ranges, except as follows:
</p>
<ulist>
<item>
<p>
The <code>[</code>, <code>]</code>, <code>-</code> and <code>\</code> characters are not
valid character ranges;
</p>
</item>
<item>
<p>
The <code>^</code> character is only valid at the beginning of a
<termref def="dt-poschargroup"/> if it is part of a
<termref def="dt-negchargroup"/>
</p>
</item>
<item>
<p>
<!--* <phrase diff="del"> *-->
The <code>-</code> character is a valid character range only at the beginning
or end of a <termref def="dt-poschargroup"/>.
<!--* </phrase> *-->
</p>
</item>
</ulist>
<note>
<p>
<phrase diff="add">The grammar for <termref def="dt-charrange"/> as
given above is ambiguous, but the second and third bullets above
together remove the ambiguity.</phrase>
</p>
</note>
<p>
A <termref def="dt-charrange"/>&nbsp;<termref def="dt-may"/> also be written
in the form <emph>s-e</emph>, identifying the set that contains all XML characters
with UCS code points greater than or equal to the code point
of <emph>s</emph>, but not greater than the code point of <emph>e</emph>.
</p>
<p>
<emph>s-e</emph> is a valid character range iff:
</p>
<ulist>
<item>
<p>
<emph>s</emph> is a <termref def="dt-cces1"/>, or an XML character;
</p>
</item>
<item>
<p>
<emph>s</emph> is not <code>\</code>
</p>
</item>
<item>
<p>
If s is the first character in a <termref def="dt-charexpr"/>, then
<emph>s</emph> is not <code>^</code>
</p>
</item>
<item>
<p>
<emph>e</emph> is a <termref def="dt-cces1"/>, or an XML character;
</p>
</item>
<item>
<p>
<emph>e</emph> is not <code>\</code> or <code>[</code>; and
</p>
</item>
<item>
<p>
The code point of <emph>e</emph> is greater than or equal to the code
point of <emph>s</emph>;
</p>
</item>
</ulist>
<note>
<p>
The code point of a <termref def="dt-cces1"/> is the code point of the
single character in the set of characters that it identifies.
</p>
</note>
<div3 id="cces">
<head>Character Class Escapes</head>
<p>
<termdef id="dt-cces" term="character class escape" role="local">
A <term>character class escape</term> is a short sequence of characters
that identifies predefined character class.  The valid character
class escapes are the <termref def="dt-cces1"/>s, the
<termref def="dt-ccesN"/>s, and the <termref def="dt-ccescat"/>s (including
the <termref def="dt-ccesblock"/>s).
</termdef>
</p>
<scrap>
<head>Character Class Escape</head>
<prod id="charclassesc">
<lhs id="nt-charClassEsc">charClassEsc</lhs>
<rhs>
			(
			<nt def="nt-SingleCharEsc"/> |
			<nt def="nt-MultiCharEsc"/> |
			<nt def="nt-catEsc"/> |
			<nt def="nt-complEsc"/>
			)
		</rhs>
</prod>
</scrap>
<p>
<termdef id="dt-cces1" term="single character escape" role="local">
A
<term>single character escape</term> identifies a set containing a only
one character -- usually because that character is difficult or
impossible to write directly into a <termref def="dt-regex"/>.
</termdef>
</p>
<scrap>
<head>Single Character Escape</head>
<prod id="singlecharesc">
<lhs id="nt-SingleCharEsc">SingleCharEsc</lhs>
<rhs>'\' [nrt\|.?*+(){}#x2D#x5B#x5D#x5E]</rhs>
</prod>
</scrap>
<p/>
<table border="1">
<col width="50%"/>
<col width="50%"/>
<thead>
<tr>
<th>
The valid <termref def="dt-cces1"/>s are:
</th>
<th>
Identifying the set of characters <emph>C(R)</emph> containing:
</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<code>\n</code>
</td>
<td align="center">the newline character (#xA)</td>
</tr>
<tr>
<td align="center">
<code>\r</code>
</td>
<td align="center">the return character (#xD)</td>
</tr>
<tr>
<td align="center">
<code>\t</code>
</td>
<td align="center">the tab character (#x9)</td>
</tr>
<tr>
<td align="center">
<code>\\</code>
</td>
<td align="center">\</td>
</tr>
<tr>
<td align="center">
<code>\|</code>
</td>
<td align="center">|</td>
</tr>
<tr>
<td align="center">
<code>\.</code>
</td>
<td align="center">.</td>
</tr>
<tr>
<td align="center">
<code>\-</code>
</td>
<td align="center">-</td>
</tr>
<tr>
<td align="center">
<code>\^</code>
</td>
<td align="center">^</td>
</tr>
<tr>
<td align="center">
<code>\?</code>
</td>
<td align="center">?</td>
</tr>
<tr>
<td align="center">
<code>\*</code>
</td>
<td align="center">*</td>
</tr>
<tr>
<td align="center">
<code>\+</code>
</td>
<td align="center">+</td>
</tr>
<tr>
<td align="center">
<code>\{</code>
</td>
<td align="center">{</td>
</tr>
<tr>
<td align="center">
<code>\}</code>
</td>
<td align="center">}</td>
</tr>
<tr>
<td align="center">
<code>\(</code>
</td>
<td align="center">(</td>
</tr>
<tr>
<td align="center">
<code>\)</code>
</td>
<td align="center">)</td>
</tr>
<tr>
<td align="center">
<code>\[</code>
</td>
<td align="center">[</td>
</tr>
<tr>
<td align="center">
<code>\]</code>
</td>
<td align="center">]</td>
</tr>
</tbody>
</table>
<p>
<termdef id="dt-ccescat" term="category escape" role="local">
<bibref ref="UnicodeDB"/> specifies a number of possible
values for the "General Category" property
and provides mappings from code points to specific character properties.
The set containing all characters that have property <code>X</code>,
can be identified with a <term>category escape</term>
<code>\p{X}</code>.
The complement of this set is specified with the
<term>category escape</term>
<code>\P{X}</code>.
(<code>[\P{X}]</code> = <code>[^\p{X}]</code>).
</termdef>
</p>
<scrap>
<head>Category Escape</head>
<prod id="catesc">
<lhs id="nt-catEsc">catEsc</lhs>
<rhs>'\p{' <nt def="nt-charProp"/> '}'</rhs>
</prod>
<prod id="complesc">
<lhs id="nt-complEsc">complEsc</lhs>
<rhs>'\P{' <nt def="nt-charProp"/> '}'</rhs>
</prod>
<prod id="charprop">
<lhs id="nt-charProp">charProp</lhs>
<rhs>
<nt def="nt-IsCategory"/> | <nt def="nt-IsBlock"/>
</rhs>
</prod>
</scrap>
<note>
<p>
<bibref ref="UnicodeDB"/> is subject to future revision.  For example, the
mapping from code points to character properties might be updated.
All <termref def="dt-minimally-conforming"/> processors <termref def="dt-must"/>
support the character properties defined in the version of <bibref ref="UnicodeDB"/>
that is current at the time this specification became a W3C
Recommendation.  However, implementors are encouraged to support the
character properties defined in any future version.
</p>
</note>
<p>
The following table specifies the recognized values of the
"General Category" property.
</p>
<table border="1" align="center">
<tbody>
<tr>
<th>Category</th>
<th>Property</th>
<th>Meaning</th>
</tr>
<tr>
<td rowspan="6">Letters</td>
<td align="center">L</td>
<td>All Letters</td>
</tr>
<tr>
<td align="center">Lu</td>
<td>uppercase</td>
</tr>
<tr>
<td align="center">Ll</td>
<td>lowercase</td>
</tr>
<tr>
<td align="center">Lt</td>
<td>titlecase</td>
</tr>
<tr>
<td align="center">Lm</td>
<td>modifier</td>
</tr>
<tr>
<td align="center">Lo</td>
<td>other</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td rowspan="4">Marks</td>
<td align="center">M</td>
<td>All Marks</td>
</tr>
<tr>
<td align="center">Mn</td>
<td>nonspacing</td>
</tr>
<tr>
<td align="center">Mc</td>
<td>spacing combining</td>
</tr>
<tr>
<td align="center">Me</td>
<td>enclosing</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td rowspan="4">Numbers</td>
<td align="center">N</td>
<td>All Numbers</td>
</tr>
<tr>
<td align="center">Nd</td>
<td>decimal digit</td>
</tr>
<tr>
<td align="center">Nl</td>
<td>letter</td>
</tr>
<tr>
<td align="center">No</td>
<td>other</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td rowspan="8">Punctuation</td>
<td align="center">P</td>
<td>All Punctuation</td>
</tr>
<tr>
<td align="center">Pc</td>
<td>connector</td>
</tr>
<tr>
<td align="center">Pd</td>
<td>dash</td>
</tr>
<tr>
<td align="center">Ps</td>
<td>open</td>
</tr>
<tr>
<td align="center">Pe</td>
<td>close</td>
</tr>
<tr>
<td align="center">Pi</td>
<td>initial quote
			(may behave like Ps or Pe depending on usage)</td>
</tr>
<tr>
<td align="center">Pf</td>
<td>final quote
			(may behave like Ps or Pe depending on usage)</td>
</tr>
<tr>
<td align="center">Po</td>
<td>other</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td rowspan="4">Separators</td>
<td align="center">Z</td>
<td>All Separators</td>
</tr>
<tr>
<td align="center">Zs</td>
<td>space</td>
</tr>
<tr>
<td align="center">Zl</td>
<td>line</td>
</tr>
<tr>
<td align="center">Zp</td>
<td>paragraph</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td rowspan="5">Symbols</td>
<td align="center">S</td>
<td>All Symbols</td>
</tr>
<tr>
<td align="center">Sm</td>
<td>math</td>
</tr>
<tr>
<td align="center">Sc</td>
<td>currency</td>
</tr>
<tr>
<td align="center">Sk</td>
<td>modifier</td>
</tr>
<tr>
<td align="center">So</td>
<td>other</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td rowspan="6">Other</td>
<td align="center">C</td>
<td>All Others</td>
</tr>
<tr>
<td align="center">Cc</td>
<td>control</td>
</tr>
<tr>
<td align="center">Cf</td>
<td>format</td>
</tr>
<!--
	<tr>
		<td align="center">Cs</td>
		<td>Surrogate</td>
	</tr>
	  -->
<tr>
<td align="center">Co</td>
<td>private use</td>
</tr>
<tr>
<td align="center">Cn</td>
<td>not assigned</td>
</tr>
</tbody>
</table>
<scrap>
<head>Categories</head>
<prod id="cats">
<lhs id="nt-IsCategory">IsCategory</lhs>
<rhs>
<nt def="nt-Letters"/> |
			<nt def="nt-Marks"/> |
			<nt def="nt-Numbers"/> |
			<nt def="nt-Punctuation"/> |
			<nt def="nt-Separators"/> |
			<nt def="nt-Symbols"/> |
			<nt def="nt-Others"/>
</rhs>
</prod>
<prod id="lets">
<lhs id="nt-Letters">Letters</lhs>
<rhs>'L' [ultmo]?</rhs>
</prod>
<prod id="marks">
<lhs id="nt-Marks">Marks</lhs>
<rhs>'M' [nce]?</rhs>
</prod>
<prod id="nums">
<lhs id="nt-Numbers">Numbers</lhs>
<rhs>'N' [dlo]?</rhs>
</prod>
<prod id="punc">
<lhs id="nt-Punctuation">Punctuation</lhs>
<rhs>'P' [cdseifo]?</rhs>
</prod>
<prod id="seps">
<lhs id="nt-Separators">Separators</lhs>
<rhs>'Z' [slp]?</rhs>
</prod>
<prod id="syms">
<lhs id="nt-Symbols">Symbols</lhs>
<rhs>'S' [mcko]?</rhs>
</prod>
<prod id="others">
<lhs id="nt-Others">Others</lhs>
<rhs>'C' [cfon]?</rhs>
</prod>
</scrap>
<note>
<p>
The properties mentioned above exclude the <code>Cs</code> property.
The <code>Cs</code> property identifies "surrogate" characters, which do not
occur at the level of the "character abstraction" that XML instance documents
operate on.
</p>
</note>
<p>
<termdef id="dt-ccesblock" term="block escape" role="local">
<bibref ref="UnicodeDB"/> groups code points into a number of blocks
such as Basic Latin (i.e., ASCII), Latin-1 Supplement, Hangul Jamo,
CJK Compatibility, etc.
The set containing all characters that have block name <code>X</code>
(with all white space stripped out),
can be identified with a <term>block escape</term>
<code>\p{IsX}</code>.
The complement of this set is specified with the
<term>block escape</term>
<code>\P{IsX}</code>.
(<code>[\P{IsX}]</code> = <code>[^\p{IsX}]</code>).
</termdef>
</p>
<scrap>
<head>Block Escape</head>
<prod id="blockesc">
<lhs id="nt-IsBlock">IsBlock</lhs>
<rhs>'Is' [a-zA-Z0-9#x2D]+</rhs>
</prod>
</scrap>
<p>
The following table specifies the recognized block names (for more
information, see the "Blocks.txt" file in <bibref ref="UnicodeDB"/>).
</p>
<table border="1" align="center" cellpadding="5">
<tbody>
<tr>
<th>Start Code</th>
<th>End Code</th>
<th>Block Name</th>
<th>&nbsp;</th>
<th>Start Code</th>
<th>End Code</th>
<th>Block Name</th>
</tr>
<tr>
<td>#x0000</td>
<td>#x007F</td>
<td>BasicLatin</td>
<td>&nbsp;</td>
<td>#x0080</td>
<td>#x00FF</td>
<td>Latin-1Supplement</td>
</tr>
<tr>
<td>#x0100</td>
<td>#x017F</td>
<td>LatinExtended-A</td>
<td>&nbsp;</td>
<td>#x0180</td>
<td>#x024F</td>
<td>LatinExtended-B</td>
</tr>
<tr>
<td>#x0250</td>
<td>#x02AF</td>
<td>IPAExtensions</td>
<td>&nbsp;</td>
<td>#x02B0</td>
<td>#x02FF</td>
<td>SpacingModifierLetters</td>
</tr>
<tr>
<td>#x0300</td>
<td>#x036F</td>
<td>CombiningDiacriticalMarks</td>
<td>&nbsp;</td>
<td>#x0370</td>
<td>#x03FF</td>
<td>Greek</td>
</tr>
<tr>
<td>#x0400</td>
<td>#x04FF</td>
<td>Cyrillic</td>
<td>&nbsp;</td>
<td>#x0530</td>
<td>#x058F</td>
<td>Armenian</td>
</tr>
<tr>
<td>#x0590</td>
<td>#x05FF</td>
<td>Hebrew</td>
<td>&nbsp;</td>
<td>#x0600</td>
<td>#x06FF</td>
<td>Arabic</td>
</tr>
<tr>
<td>#x0700</td>
<td>#x074F</td>
<td>Syriac</td>
<td>&nbsp;</td>
<td>#x0780</td>
<td>#x07BF</td>
<td>Thaana</td>
</tr>
<tr>
<td>#x0900</td>
<td>#x097F</td>
<td>Devanagari</td>
<td>&nbsp;</td>
<td>#x0980</td>
<td>#x09FF</td>
<td>Bengali</td>
</tr>
<tr>
<td>#x0A00</td>
<td>#x0A7F</td>
<td>Gurmukhi</td>
<td>&nbsp;</td>
<td>#x0A80</td>
<td>#x0AFF</td>
<td>Gujarati</td>
</tr>
<tr>
<td>#x0B00</td>
<td>#x0B7F</td>
<td>Oriya</td>
<td>&nbsp;</td>
<td>#x0B80</td>
<td>#x0BFF</td>
<td>Tamil</td>
</tr>
<tr>
<td>#x0C00</td>
<td>#x0C7F</td>
<td>Telugu</td>
<td>&nbsp;</td>
<td>#x0C80</td>
<td>#x0CFF</td>
<td>Kannada</td>
</tr>
<tr>
<td>#x0D00</td>
<td>#x0D7F</td>
<td>Malayalam</td>
<td>&nbsp;</td>
<td>#x0D80</td>
<td>#x0DFF</td>
<td>Sinhala</td>
</tr>
<tr>
<td>#x0E00</td>
<td>#x0E7F</td>
<td>Thai</td>
<td>&nbsp;</td>
<td>#x0E80</td>
<td>#x0EFF</td>
<td>Lao</td>
</tr>
<tr>
<td>#x0F00</td>
<td>#x0FFF</td>
<td>Tibetan</td>
<td>&nbsp;</td>
<td>#x1000</td>
<td>#x109F</td>
<td>Myanmar</td>
</tr>
<tr>
<td>#x10A0</td>
<td>#x10FF</td>
<td>Georgian</td>
<td>&nbsp;</td>
<td>#x1100</td>
<td>#x11FF</td>
<td>HangulJamo</td>
</tr>
<tr>
<td>#x1200</td>
<td>#x137F</td>
<td>Ethiopic</td>
<td>&nbsp;</td>
<td>#x13A0</td>
<td>#x13FF</td>
<td>Cherokee</td>
</tr>
<tr>
<td>#x1400</td>
<td>#x167F</td>
<td>UnifiedCanadianAboriginalSyllabics</td>
<td>&nbsp;</td>
<td>#x1680</td>
<td>#x169F</td>
<td>Ogham</td>
</tr>
<tr>
<td>#x16A0</td>
<td>#x16FF</td>
<td>Runic</td>
<td>&nbsp;</td>
<td>#x1780</td>
<td>#x17FF</td>
<td>Khmer</td>
</tr>
<tr>
<td>#x1800</td>
<td>#x18AF</td>
<td>Mongolian</td>
<td>&nbsp;</td>
<td>#x1E00</td>
<td>#x1EFF</td>
<td>LatinExtendedAdditional</td>
</tr>
<tr>
<td>#x1F00</td>
<td>#x1FFF</td>
<td>GreekExtended</td>
<td>&nbsp;</td>
<td>#x2000</td>
<td>#x206F</td>
<td>GeneralPunctuation</td>
</tr>
<tr>
<td>#x2070</td>
<td>#x209F</td>
<td>SuperscriptsandSubscripts</td>
<td>&nbsp;</td>
<td>#x20A0</td>
<td>#x20CF</td>
<td>CurrencySymbols</td>
</tr>
<tr>
<td>#x20D0</td>
<td>#x20FF</td>
<td>CombiningMarksforSymbols</td>
<td>&nbsp;</td>
<td>#x2100</td>
<td>#x214F</td>
<td>LetterlikeSymbols</td>
</tr>
<tr>
<td>#x2150</td>
<td>#x218F</td>
<td>NumberForms</td>
<td>&nbsp;</td>
<td>#x2190</td>
<td>#x21FF</td>
<td>Arrows</td>
</tr>
<tr>
<td>#x2200</td>
<td>#x22FF</td>
<td>MathematicalOperators</td>
<td>&nbsp;</td>
<td>#x2300</td>
<td>#x23FF</td>
<td>MiscellaneousTechnical</td>
</tr>
<tr>
<td>#x2400</td>
<td>#x243F</td>
<td>ControlPictures</td>
<td>&nbsp;</td>
<td>#x2440</td>
<td>#x245F</td>
<td>OpticalCharacterRecognition</td>
</tr>
<tr>
<td>#x2460</td>
<td>#x24FF</td>
<td>EnclosedAlphanumerics</td>
<td>&nbsp;</td>
<td>#x2500</td>
<td>#x257F</td>
<td>BoxDrawing</td>
</tr>
<tr>
<td>#x2580</td>
<td>#x259F</td>
<td>BlockElements</td>
<td>&nbsp;</td>
<td>#x25A0</td>
<td>#x25FF</td>
<td>GeometricShapes</td>
</tr>
<tr>
<td>#x2600</td>
<td>#x26FF</td>
<td>MiscellaneousSymbols</td>
<td>&nbsp;</td>
<td>#x2700</td>
<td>#x27BF</td>
<td>Dingbats</td>
</tr>
<tr>
<td>#x2800</td>
<td>#x28FF</td>
<td>BraillePatterns</td>
<td>&nbsp;</td>
<td>#x2E80</td>
<td>#x2EFF</td>
<td>CJKRadicalsSupplement</td>
</tr>
<tr>
<td>#x2F00</td>
<td>#x2FDF</td>
<td>KangxiRadicals</td>
<td>&nbsp;</td>
<td>#x2FF0</td>
<td>#x2FFF</td>
<td>IdeographicDescriptionCharacters</td>
</tr>
<tr>
<td>#x3000</td>
<td>#x303F</td>
<td>CJKSymbolsandPunctuation</td>
<td>&nbsp;</td>
<td>#x3040</td>
<td>#x309F</td>
<td>Hiragana</td>
</tr>
<tr>
<td>#x30A0</td>
<td>#x30FF</td>
<td>Katakana</td>
<td>&nbsp;</td>
<td>#x3100</td>
<td>#x312F</td>
<td>Bopomofo</td>
</tr>
<tr>
<td>#x3130</td>
<td>#x318F</td>
<td>HangulCompatibilityJamo</td>
<td>&nbsp;</td>
<td>#x3190</td>
<td>#x319F</td>
<td>Kanbun</td>
</tr>
<tr>
<td>#x31A0</td>
<td>#x31BF</td>
<td>BopomofoExtended</td>
<td>&nbsp;</td>
<td>#x3200</td>
<td>#x32FF</td>
<td>EnclosedCJKLettersandMonths</td>
</tr>
<tr>
<td>#x3300</td>
<td>#x33FF</td>
<td>CJKCompatibility</td>
<td>&nbsp;</td>
<td>#x3400</td>
<td>#x4DB5</td>
<td>CJKUnifiedIdeographsExtensionA</td>
</tr>
<tr>
<td>#x4E00</td>
<td>#x9FFF</td>
<td>CJKUnifiedIdeographs</td>
<td>&nbsp;</td>
<td>#xA000</td>
<td>#xA48F</td>
<td>YiSyllables</td>
</tr>
<tr>
<td>#xA490</td>
<td>#xA4CF</td>
<td>YiRadicals</td>
<td>&nbsp;</td>
<td>#xAC00</td>
<td>#xD7A3</td>
<td>HangulSyllables</td>
</tr>
<tr>
<td>
<phrase diff="del">#xD800</phrase>
</td>
<td>
<phrase diff="del">#xDB7F</phrase>
</td>
<td>
<phrase diff="del">HighSurrogates</phrase>
</td>
<td>&nbsp;</td>
<td>
<phrase diff="del">#xDB80</phrase>
</td>
<td>
<phrase diff="del">#xDBFF</phrase>
</td>
<td>
<phrase diff="del">HighPrivateUseSurrogates</phrase>
</td>
</tr>
<tr>
<td>
<phrase diff="del">#xDC00</phrase>
</td>
<td>
<phrase diff="del">#xDFFF</phrase>
</td>
<td>
<phrase diff="del">LowSurrogates</phrase>
</td>
<td>&nbsp;</td>
<td>#xE000</td>
<td>#xF8FF</td>
<td>PrivateUse</td>
</tr>
<tr>
<td>#xF900</td>
<td>#xFAFF</td>
<td>CJKCompatibilityIdeographs</td>
<td>&nbsp;</td>
<td>#xFB00</td>
<td>#xFB4F</td>
<td>AlphabeticPresentationForms</td>
</tr>
<tr>
<td>#xFB50</td>
<td>#xFDFF</td>
<td>ArabicPresentationForms-A</td>
<td>&nbsp;</td>
<td>#xFE20</td>
<td>#xFE2F</td>
<td>CombiningHalfMarks</td>
</tr>
<tr>
<td>#xFE30</td>
<td>#xFE4F</td>
<td>CJKCompatibilityForms</td>
<td>&nbsp;</td>
<td>#xFE50</td>
<td>#xFE6F</td>
<td>SmallFormVariants</td>
</tr>
<tr>
<td>#xFE70</td>
<td>#xFEFE</td>
<td>ArabicPresentationForms-B</td>
<td>&nbsp;</td>
<td>#xFEFF</td>
<td>#xFEFF</td>
<td>Specials</td>
</tr>
<tr>
<td>#xFF00</td>
<td>#xFFEF</td>
<td>HalfwidthandFullwidthForms</td>
<td>&nbsp;</td>
<td>#xFFF0</td>
<td>#xFFFD</td>
<td>Specials</td>
</tr>
</tbody>
</table>
<note>
<p>
<phrase diff="add">
The blocks mentioned above exclude the <code>HighSurrogates</code>,
<code>LowSurrogates</code> and <code>HighPrivateUseSurrogates</code> blocks.
These blocks identify "surrogate" characters, which do not
occur at the level of the "character abstraction" that XML instance documents
operate on.
</phrase>
</p>
</note>
<note>
<p>
<bibref ref="UnicodeDB"/> is subject to future revision.
For example, the
grouping of code points into blocks might be updated.
All <termref def="dt-minimally-conforming"/> processors <termref def="dt-must"/>
support the blocks defined in the version of <bibref ref="UnicodeDB"/>
that is current at the time this specification became a W3C
Recommendation.  However, implementors are encouraged to support the
blocks defined in any future version of the Unicode Standard.
</p>
</note>
<p>
For example, the <termref def="dt-ccesblock"/> for identifying the
ASCII characters is <code>\p{IsBasicLatin}</code>.
</p>
<p>
<termdef id="dt-ccesN" term="multi-character escape" role="local">
A
<term>multi-character escape</term> provides a simple way to identify
a commonly used set of characters:
</termdef>
</p>
<scrap>
<head>Multi-Character Escape</head>
<prod id="multicharesc">
<lhs id="nt-MultiCharEsc">MultiCharEsc</lhs>
<!--
		<rhs diff='del'>'.' | ('\' [sSiIcCdDwW])</rhs>
		<rhs diff='add'>'\' [sSiIcCdDwW]</rhs>
  -->
<rhs>
<phrase diff="del">'.' | (</phrase>'\' [sSiIcCdDwW]<phrase diff="del">)</phrase>
</rhs>
</prod>
<prod id="wildcardesc" diff="add">
<lhs id="nt-WildcardEsc">WildcardEsc</lhs>
<rhs>'.'</rhs>
</prod>
</scrap>
<p/>
<table border="1" align="center" cellpadding="5">
<col width="33%"/>
<col width="33%"/>
<col width="33%"/>
<thead>
<tr>
<th>Character sequence</th>
<!--<th>Name</th>-->
<th>Equivalent <termref def="dt-charclass"/>
</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">.</td>
<!--		<td>&nbsp;</td>-->
<td align="center">[^\n\r]</td>
</tr>
<tr>
<td align="center">\s</td>
<!--		<td>white space</td>-->
<td align="center">[#x20\t\n\r]</td>
</tr>
<tr>
<td align="center">\S</td>
<!--		<td>&nbsp;</td>-->
<td align="center">[^\s]</td>
</tr>
<tr>
<td align="center">\i</td>
<!--		<td>XML initial Name character</td>-->
<td align="center">
<!--[\p{Ll}\p{Lu}\p{Lo}\p{Lt}\p{Nl}_:]
		<br/>
		(i.e.,
		-->the set of initial name characters, those
		<termref def="dt-match"/>ed by
		<xspecref href="&xmlspec;#NT-Letter">Letter</xspecref> | '_' | ':'</td>
</tr>
<tr>
<td align="center">\I</td>
<!--		<td>&nbsp;</td>-->
<td align="center">[^\i]</td>
</tr>
<tr>
<td align="center">\c</td>
<!--		<td>XML Name character</td>-->
<td align="center">
<!--
		[\i\p{Nd}\p{Mc}\p{Me}\p{Mn}\p{Lm}.#x00B7#x0387-]
		<br/>
		(i.e.,
		-->
		the set of name characters, those
		<termref def="dt-match"/>ed by
		<xspecref href="&xmlspec;#NT-NameChar">NameChar</xspecref>
</td>
</tr>
<tr>
<td align="center">\C</td>
<!--		<td>&nbsp;</td>-->
<td align="center">[^\c]</td>
</tr>
<tr>
<td align="center">\d</td>
<!--		<td>digit (includes digits outside of the 0-9)</td>-->
<td align="center">\p{Nd}</td>
</tr>
<tr>
<td align="center">\D</td>
<!--		<td>&nbsp;</td>-->
<td align="center">[^\d]</td>
</tr>
<tr>
<td align="center">\w</td>
<!--		<td>a "word" character</td>-->
<td align="center">
			[#x0000-#x10FFFF]-[\p{P}\p{Z}\p{C}]
			(<emph>all characters except the set of "punctuation",
				"separator" and "other" characters</emph>)
		</td>
</tr>
<tr>
<td align="center">\W</td>
<!--		<td>&nbsp;</td>-->
<td align="center">[^\w]</td>
</tr>
</tbody>
</table>
<note>
<p>
The <termref def="dt-regex"/> language defined here does not
attempt to provide a general solution to "regular expressions" over
UCS character sequences.  In particular, it does not easily provide
for matching sequences of base characters and combining marks.
The language is targeted at support of "Level 1" features as defined in
<bibref ref="unicodeRegEx"/>.  It is hoped that future versions of this
specification will provide support for "Level 2" features.
</p>
</note>
</div3>
</div2>
</div1>
<div1 id="normative-glossary">
<head>Glossary (non-normative)</head>
<p>The listing below is for the benefit of readers of a printed version of this
document:  it collects together all the definitions which appear in the
document above.</p>
<ednote role="glossary">
<edtext>An XSL macro is used to
collect definitions from throughout the spec and gather them here for easy
reference.</edtext>
</ednote>
</div1>
<div1 id="biblio">
<head>References</head>
<!--
   bibls can be in any order and the stylesheet will sort them
   by the value of their key attribute
  -->
<div2 id="normative-biblio">
<head>Normative</head>
<blist>
<bibl id="XBase" key="XML Base" diff="add">
<!-- pvb: bug in xmlspec.xsl...diff marking not implemented for bibl -->
<!-- pvb: this wasn't added when we did the errata, but it should have been -->
World Wide Web Consortium.  XML Base.
Available at: <loc href="http://www.w3.org/TR/2001/REC-xmlbase-20010627/">
http://www.w3.org/TR/2001/REC-xmlbase-20010627/</loc>
</bibl>
<bibl id="ieee754" key="IEEE 754-1985">
IEEE. <emph>IEEE Standard for Binary Floating-Point Arithmetic.</emph>
See <loc href="http://standards.ieee.org/reading/ieee/std_public/description/busarch/754-1985_desc.html">
http://standards.ieee.org/reading/ieee/std_public/description/busarch/754-1985_desc.html</loc>
</bibl>
<bibl id="XLink" key="XML Linking Language">
World Wide Web Consortium.  XML Linking Language (XLink).
Available at: <loc href="&xlink;" diff="add">&xlink;.</loc>
<phrase diff="add">Note: only the URI reference escaping procedure defined in
Section 5.4 is normatively referenced.</phrase>
<loc href="&old-xlink;" diff="del">&old-xlink;</loc>
</bibl>
<bibl id="XML" key="XML 1.0 (Second Edition)">
World Wide Web Consortium. <emph>Extensible Markup Language (XML) 1.0, Second
Edition.</emph>
Available at: <loc href="&xmlspec;">&xmlspec;</loc>
</bibl>
<bibl id="structural-schemas" key="XML Schema Part 1: Structures">
XML Schema Part 1: Structures. Available at: <loc href="&xsdl;">
&xsdl;</loc>
</bibl>
<bibl id="schema-requirements" key="XML Schema Requirements">
World Wide Web Consortium.  XML Schema Requirements.  Available at:
<loc href="http://www.w3.org/TR/1999/NOTE-xml-schema-req-19990215">
http://www.w3.org/TR/1999/NOTE-xml-schema-req-19990215</loc>
</bibl>
<bibl id="XMLNS" key="Namespaces in XML">
World Wide Web Consortium.  <emph>Namespaces in XML</emph>. Available at:
<loc href="&xmlnsspec;">&xmlnsspec;</loc>
</bibl>
<bibl id="RFC2396" key="RFC 2396">
Tim Berners-Lee, et. al. <emph>RFC 2396: Uniform Resource Identifiers (URI):
Generic Syntax.</emph>. 1998.  Available at:
<loc href="http://www.ietf.org/rfc/rfc2396.txt">
http://www.ietf.org/rfc/rfc2396.txt</loc>
</bibl>
<!--
<bibl id="RFC2732" href="http://www.ietf.org/rfc/rfc2732.txt" key="RFC 2732">
-->
<bibl id="RFC2732" key="RFC 2732">
<emph>RFC
2732: Format for Literal IPv6 Addresses in URL's</emph>. 1999.
Available at:
<loc href="http://www.ietf.org/rfc/rfc2732.txt">
http://www.ietf.org/rfc/rfc2732.txt</loc>
</bibl>
<bibl id="RFC2045" key="RFC 2045">
N. Freed and N. Borenstein. <emph>RFC 2045: Multipurpose Internet Mail Extensions
(MIME) Part One: Format of Internet Message Bodies</emph>. 1996.  Available at:
<loc href="http://www.ietf.org/rfc/rfc2045.txt">
http://www.ietf.org/rfc/rfc2045.txt</loc>
</bibl>
<bibl id="RFC1766" key="RFC 1766" diff="del">
H. Alvestrand, ed. <emph>RFC 1766: Tags for the Identification of Languages</emph>
1995. Available at: <loc href="http://www.ietf.org/rfc/rfc1766.txt">
http://www.ietf.org/rfc/rfc1766.txt</loc>
</bibl>
<bibl id="RFC3066" key="RFC 3066" diff="add">
H. Alvestrand, ed. <emph>RFC 3066: Tags for the Identification of Languages</emph>
1995. Available at: <loc href="http://www.ietf.org/rfc/rfc3066.txt">
http://www.ietf.org/rfc/rfc3066.txt</loc>
</bibl>
<bibl id="clinger1990" key="Clinger, WD (1990)">
William D Clinger. <emph>How to Read Floating Point Numbers Accurately.</emph>
In <emph>Proceedings of Conference on Programming Language Design and
Implementation</emph>, pages 92-101.
Available at: <loc href="ftp://ftp.ccs.neu.edu/pub/people/will/howtoread.ps">
ftp://ftp.ccs.neu.edu/pub/people/will/howtoread.ps</loc>
</bibl>
<bibl id="UnicodeDB" key="Unicode Database">
The Unicode Consortium. <emph>The Unicode Character Database</emph>.
Available at: <loc href="http://www.unicode.org/Public/3.1-Update/UnicodeCharacterDatabase-3.1.0.html">
http://www.unicode.org/Public/3.1-Update/UnicodeCharacterDatabase-3.1.0.html</loc>
</bibl>
</blist>
</div2>
<div2 id="non-normative-biblio">
<head>Non-normative</head>
<blist>
<bibl id="draft-masinter-url-i18n-07" key="IETF INTERNET-DRAFT: IRIs">
<phrase diff="add">M. D&#xfc;rst and M. Suignard</phrase>
<phrase diff="del">L. Masinter and M. Durst</phrase>.
<emph>Internationalized Resource Identifiers</emph>
<phrase diff="add">2002</phrase>
<phrase diff="del">2001</phrase>. Available at:
<phrase diff="add">
<loc href="http://www.w3.org/International/iri-edit/draft-duerst-iri-04.txt">
http://www.w3.org/International/iri-edit/draft-duerst-iri-04.txt</loc>
</phrase>
<phrase diff="del">
http://www.ietf.org/internet-drafts/draft-masinter-url-i18n-07.txt</phrase>
</bibl>
<bibl id="ruby" key="Ruby">
World Wide Web Consortium.  Ruby Annotation.  Available at:
<loc href="http://www.w3.org/TR/2001/WD-ruby-20010216/">
http://www.w3.org/TR/2001/WD-ruby-20010216/</loc>
</bibl>
<bibl id="html4" key="HTML 4.01">
World Wide Web Consortium.  Hypertext Markup Language, version 4.01.  Available at:
<loc href="&html4;">
&html4;</loc>
</bibl>
<bibl id="schema-primer" key="XML Schema Language: Part 0 Primer">
World Wide Web Consortium.  XML Schema Language: Part 0 Primer.  Available at:
<loc href="&primer;">
&primer;</loc>
</bibl>
<bibl id="unicodeRegEx" key="Unicode Regular Expression Guidelines">
Mark Davis.  <emph>Unicode Regular Expression Guidelines</emph>, 1988.
Available at: <loc href="http://www.unicode.org/unicode/reports/tr18/">
http://www.unicode.org/unicode/reports/tr18/</loc>
</bibl>
<bibl id="Perl" key="Perl">
The Perl Programming Language.  See <loc href="http://www.perl.com/pub/language/info/software.html">
http://www.perl.com/pub/language/info/software.html</loc>
</bibl>
<bibl id="SQL" key="SQL">
ISO (International Organization for Standardization).  <emph>ISO/IEC
9075-2:1999, Information technology --- Database languages ---
SQL --- Part 2: Foundation (SQL/Foundation)</emph>.
[Geneva]: International Organization for Standardization, 1999.
See <loc href="http://www.iso.ch/cate/d26197.html">
http://www.iso.ch/cate/d26197.html</loc>
</bibl>
<bibl id="IERS" key="International Earth Rotation Service (IERS)">
International  Earth Rotation Service (IERS).
See <loc href="http://maia.usno.navy.mil">http://maia.usno.navy.mil</loc>
</bibl>
<bibl id="ISO8601" key="ISO 8601">
ISO (International Organization for Standardization).
<emph>Representations of dates and times, 1988-06-15.</emph>
<phrase diff="del">Available at:
<!--
<loc href="http://www.iso.ch/markete/8601.pdf">-->
http://www.iso.ch/markete/8601.pdf<!--</loc>-->
</phrase>
</bibl>
<bibl id="ISO8601-1998" key="ISO 8601:1998 Draft Revision" diff="add">
ISO (International Organization for Standardization).
<emph>Representations of dates and times, draft revision, 1998.</emph>
</bibl>
<bibl id="ISO8601-2000" key="ISO 8601:2000 Second Edition">
ISO (International Organization for Standardization).
<emph>Representations of dates and times, <phrase diff="del">draft
revision, 2000</phrase>
<phrase diff="add">second edition, 2000-12-15</phrase>.</emph>
</bibl>
<bibl id="ISO11404" key="ISO 11404">
ISO (International Organization for Standardization).
<emph>Language-independent Datatypes.</emph>  See
<loc href="http://www.iso.ch/cate/d19346.html">
 http://www.iso.ch/cate/d19346.html</loc>
</bibl>
<bibl id="RDFSchema" key="RDF Schema">
World Wide Web Consortium. <emph>RDF Schema Specification.</emph>
Available at:
<loc href="http://www.w3.org/TR/2000/CR-rdf-schema-20000327/">
http://www.w3.org/TR/2000/CR-rdf-schema-20000327/</loc>
</bibl>
<bibl id="USNavy" key="U.S. Naval Observatory Time Service Department">
<emph>Information about Leap Seconds</emph>
Available at:
<loc href="http://tycho.usno.navy.mil/leapsec.990505.html">http://tycho.usno.navy.mil/leapsec.990505.html</loc>
</bibl>
<bibl id="XSL" key="XSL">
World Wide Web Consortium.
<emph>Extensible Stylesheet Language (XSL).</emph>
Available at: <loc href="http://www.w3.org/TR/2000/CR-xsl-20001121/">
http://www.w3.org/TR/2000/CR-xsl-20001121/</loc>
</bibl>
<bibl id="CharMod" key="Character Model">
Martin J. D&#xfc;rst and Fran&#xe7;ois Yergeau, eds.
Character Model for the World Wide Web. World Wide Web Consortium
Working Draft. 2001.
Available at:
<loc href="&charmod;">&charmod;</loc>
</bibl>
<bibl id="gay1990" key="Gay, DM (1990)">
David M. Gay.  <emph>Correctly Rounded Binary-Decimal and
Decimal-Binary Conversions.</emph> AT&amp;T Bell Laboratories Numerical
Analysis Manuscript 90-10, November 1990.
Available at:
<loc href="http://cm.bell-labs.com/cm/cs/doc/90/4-10.ps.gz">
http://cm.bell-labs.com/cm/cs/doc/90/4-10.ps.gz</loc>
</bibl>
</blist>
</div2>
</div1>
<div1 id="acknowledgments">
<head>Acknowledgements (non-normative)</head>
<p>The following have contributed material to <phrase diff="del">this
draft</phrase>
<phrase diff="add">the first edition of this specification</phrase>:</p>
<slist>
<sitem>Asir S. Vedamuthu, webMethods, Inc</sitem>
<sitem>Mark Davis, IBM</sitem>
</slist>
<p>
Co-editor Ashok Malhotra's work on this specification from March 1999 until
February 2001 was supported by IBM.  From February 2001 until May 2004 it
was supported by Microsoft.
</p>
<p>
The editors acknowledge the members of the XML Schema Working Group, the members of other W3C Working Groups, and industry experts in other
forums who have contributed directly or indirectly to the process or content of
creating this document. The Working Group is particularly grateful to Lotus
Development Corp. and IBM for providing teleconferencing facilities.
</p>
<p>
<phrase diff="del">The current</phrase>
<phrase diff="add">At the time the first edition of this
specification was published, the</phrase> members of the XML Schema Working Group 
<phrase diff="del">are</phrase>
<phrase diff="add">were</phrase>:</p>
<orglist>
<member>
<name>Jim Barnette</name>
<affiliation>Defense Information Systems Agency (DISA)</affiliation>
</member>
<member>
<name>Paul V. Biron</name>
<affiliation>Health Level Seven</affiliation>
</member>
<member>
<name>Don Box</name>
<affiliation>DevelopMentor</affiliation>
</member>
<member>
<name>Allen Brown</name>
<affiliation>Microsoft</affiliation>
</member>
<member>
<name>Lee Buck</name>
<affiliation>TIBCO Extensibility</affiliation>
</member>
<member>
<name>Charles E. Campbell</name>
<affiliation>Informix</affiliation>
</member>
<member>
<name>Wayne Carr</name>
<affiliation>Intel</affiliation>
</member>
<member>
<name>Peter Chen</name>
<affiliation>Bootstrap Alliance and LSU</affiliation>
</member>
<member>
<name>David Cleary</name>
<affiliation>Progress Software</affiliation>
</member>
<member>
<name>Dan Connolly</name>
<affiliation>W3C</affiliation>
<role>staff contact</role>
</member>
<member>
<name>Ugo Corda</name>
<affiliation>Xerox</affiliation>
</member>
<member>
<name>Roger L. Costello</name>
<affiliation>MITRE</affiliation>
</member>
<member>
<name>Haavard Danielson</name>
<affiliation>Progress Software</affiliation>
</member>
<member>
<name>Josef Dietl</name>
<affiliation>Mozquito Technologies</affiliation>
</member>
<member>
<name>David Ezell</name>
<affiliation>Hewlett-Packard Company
 </affiliation>
</member>
<member>
<name>Alexander Falk</name>
<affiliation>Altova GmbH</affiliation>
</member>
<member>
<name>David Fallside</name>
<affiliation>IBM</affiliation>
</member>
<member>
<name>Dan Fox</name>
<affiliation>Defense Logistics Information Service (DLIS)</affiliation>
</member>
<member>
<name>Matthew Fuchs</name>
<affiliation>Commerce One</affiliation>
</member>
<member>
<name>Andrew Goodchild</name>
<affiliation>Distributed Systems Technology Centre (DSTC Pty Ltd)</affiliation>
</member>
<member>
<name>Paul Grosso</name>
<affiliation>Arbortext, Inc</affiliation>
</member>
<member>
<name>Martin Gudgin</name>
<affiliation>DevelopMentor</affiliation>
</member>
<member>
<name>Dave Hollander</name>
<affiliation>Contivo, Inc</affiliation>
<role>co-chair</role>
</member>
<member>
<name>Mary Holstege</name>
<affiliation>Invited Expert</affiliation>
</member>
<member>
<name>Jane Hunter</name>
<affiliation>Distributed Systems Technology Centre (DSTC Pty Ltd)</affiliation>
</member>
<member>
<name>Rick Jelliffe</name>
<affiliation>Academia Sinica</affiliation>
</member>
<member>
<name>Simon Johnston</name>
<affiliation>Rational Software</affiliation>
</member>
<member>
<name>Bob Lojek</name>
<affiliation>Mozquito Technologies</affiliation>
</member>
<member>
<name>Ashok Malhotra</name>
<affiliation>Microsoft</affiliation>
</member>
<member>
<name>Lisa Martin</name>
<affiliation>IBM</affiliation>
</member>
<member>
<name>Noah Mendelsohn</name>
<affiliation>Lotus Development Corporation</affiliation>
</member>
<member>
<name>Adrian Michel</name>
<affiliation>Commerce One</affiliation>
</member>
<member>
<name>Alex Milowski</name>
<affiliation>Invited Expert</affiliation>
</member>
<member>
<name>Don Mullen</name>
<affiliation>TIBCO Extensibility</affiliation>
</member>
<member>
<name>Dave Peterson</name>
<affiliation>Graphic Communications Association</affiliation>
</member>
<member>
<name>Jonathan Robie</name>
<affiliation>Software AG</affiliation>
</member>
<member>
<name>Eric Sedlar</name>
<affiliation>Oracle Corp.</affiliation>
</member>
<member>
<name>C. M. Sperberg-McQueen</name>
<affiliation>W3C</affiliation>
<role>co-chair</role>
</member>
<member>
<name>Bob Streich</name>
<affiliation>Calico Commerce</affiliation>
</member>
<member>
<name>William K. Stumbo</name>
<affiliation>Xerox</affiliation>
</member>
<member>
<name>Henry S. Thompson</name>
<affiliation>University of Edinburgh</affiliation>
</member>
<member>
<name>Mark Tucker</name>
<affiliation>Health Level Seven</affiliation>
</member>
<member>
<name>Asir S. Vedamuthu</name>
<affiliation>webMethods, Inc</affiliation>
</member>
<member>
<name>Priscilla Walmsley</name>
<affiliation>XMLSolutions</affiliation>
</member>
<member>
<name>Norm Walsh</name>
<affiliation>Sun Microsystems</affiliation>
</member>
<member>
<name>Aki Yoshida</name>
<affiliation>SAP AG</affiliation>
</member>
<member>
<name>Kongyi Zhou</name>
<affiliation>Oracle Corp.</affiliation>
</member>
</orglist>
<p>The XML Schema Working Group has benefited in its work from the
participation and contributions of a number of people not currently
members of the Working Group, including
in particular those named below.  Affiliations given are those current at
the time of their work with the WG.
</p>
<orglist>
<member>
<name>Paula Angerstein</name>
<affiliation>Vignette Corporation</affiliation>
</member>
<member>
<name>David Beech</name>
<affiliation>Oracle Corp.</affiliation>
</member>
<member>
<name>Gabe Beged-Dov</name>
<affiliation>Rogue Wave Software</affiliation>
</member>
<member>
<name>Greg Bumgardner</name>
<affiliation>Rogue Wave Software</affiliation>
</member>
<member>
<name>Dean Burson</name>
<affiliation>Lotus Development Corporation</affiliation>
</member>
<member>
<name>Mike Cokus</name>
<affiliation>MITRE</affiliation>
</member>
<member>
<name>Andrew Eisenberg</name>
<affiliation>Progress Software</affiliation>
</member>
<member>
<name>Rob Ellman</name>
<affiliation>Calico Commerce</affiliation>
</member>
<member>
<name>George Feinberg</name>
<affiliation>Object Design</affiliation>
</member>
<member>
<name>Charles Frankston</name>
<affiliation>Microsoft</affiliation>
</member>
<member>
<name>Ernesto Guerrieri</name>
<affiliation>Inso</affiliation>
</member>
<member>
<name>Michael Hyman</name>
<affiliation>Microsoft</affiliation>
</member>
<member>
<name>Renato Iannella</name>
<affiliation>Distributed Systems Technology Centre (DSTC Pty Ltd)</affiliation>
</member>
<member>
<name>Dianne Kennedy</name>
<affiliation>Graphic Communications Association</affiliation>
</member>
<member>
<name>Janet Koenig</name>
<affiliation>Sun Microsystems</affiliation>
</member>
<member>
<name>Setrag Khoshafian</name>
<affiliation>Technology Deployment International (TDI)</affiliation>
</member>
<member>
<name>Ara Kullukian</name>
<affiliation>Technology Deployment International (TDI)</affiliation>
</member>
<member>
<name>Andrew Layman</name>
<affiliation>Microsoft</affiliation>
</member>
<member>
<name>Dmitry Lenkov</name>
<affiliation>Hewlett-Packard Company</affiliation>
</member>
<member>
<name>John McCarthy</name>
<affiliation>Lawrence Berkeley National Laboratory</affiliation>
</member>
<member>
<name>Murata Makoto</name>
<affiliation>Xerox</affiliation>
</member>
<member>
<name>Eve Maler</name>
<affiliation>Sun Microsystems</affiliation>
</member>
<member>
<name>Murray Maloney</name>
<affiliation>Muzmo Communication, acting for Commerce One</affiliation>
</member>
<member>
<name>Chris Olds</name>
<affiliation>Wall Data</affiliation>
</member>
<member>
<name>Frank Olken</name>
<affiliation>Lawrence Berkeley National Laboratory</affiliation>
</member>
<member>
<name>Shriram Revankar</name>
<affiliation>Xerox</affiliation>
</member>
<member>
<name>Mark Reinhold</name>
<affiliation>Sun Microsystems</affiliation>
</member>
<member>
<name>John C. Schneider</name>
<affiliation>MITRE</affiliation>
</member>
<member>
<name>Lew Shannon</name>
<affiliation>NCR</affiliation>
</member>
<member>
<name>William Shea</name>
<affiliation>Merrill Lynch</affiliation>
</member>
<member>
<name>Ralph Swick</name>
<affiliation>W3C</affiliation>
</member>
<member>
<name>Tony Stewart</name>
<affiliation>Rivcom</affiliation>
</member>
<member>
<name>Matt Timmermans</name>
<affiliation>Microstar</affiliation>
</member>
<member>
<name>Jim Trezzo</name>
<affiliation>Oracle Corp.</affiliation>
</member>
<member>
<name>Steph Tryphonas</name>
<affiliation>Microstar</affiliation>
</member>
</orglist>
<p diff="add">The lists given above pertain to the first edition.
At the time work on this second edition was completed,
the membership of the Working Group was:</p>
<orglist diff="add">
<member>
<name>Leonid Arbouzov</name>
<affiliation>Sun Microsystems</affiliation>
</member>
<member>
<name>Jim Barnette</name>
<affiliation>Defense Information Systems Agency (DISA)</affiliation>
</member>
<member>
<name>Paul V. Biron</name>
<affiliation>Health Level Seven</affiliation>
</member>
<member>
<name>Allen Brown</name>
<affiliation>Microsoft</affiliation>
</member>
<member>
<name>Charles E. Campbell</name>
<affiliation>Invited expert</affiliation>
</member>
<member>
<name>Peter Chen</name>
<affiliation>Invited expert</affiliation>
</member>
<member>
<name>Tony Cincotta</name>
<affiliation>NIST</affiliation>
</member>
<member>
<name>David Ezell</name>
<affiliation>National Association of Convenience Stores</affiliation>
</member>
<member>
<name>Matthew Fuchs</name>
<affiliation>Invited expert</affiliation>
</member>
<member>
<name>Sandy Gao</name>
<affiliation>IBM</affiliation>
</member>
<member>
<name>Andrew Goodchild</name>
<affiliation>Distributed Systems Technology Centre (DSTC Pty Ltd)</affiliation>
</member>
<member>
<name>Xan Gregg</name>
<affiliation>Invited expert</affiliation>
</member>
<member>
<name>Mary Holstege</name>
<affiliation>Mark Logic</affiliation>
</member>
<member>
<name>Mario Jeckle</name>
<affiliation>DaimlerChrysler</affiliation>
</member>
<member>
<name>Marcel Jemio</name>
<affiliation>Data Interchange Standards Association</affiliation>
</member>
<member>
<name>Kohsuke Kawaguchi</name>
<affiliation>Sun Microsystems</affiliation>
</member>
<member>
<name>Ashok Malhotra</name>
<affiliation>Invited expert</affiliation>
</member>
<member>
<name>Lisa Martin</name>
<affiliation>IBM</affiliation>
</member>
<member>
<name>Jim Melton</name>
<affiliation>Oracle Corp</affiliation>
</member>
<member>
<name>Noah Mendelsohn</name>
<affiliation>IBM</affiliation>
</member>
<member>
<name>Dave Peterson</name>
<affiliation>Invited expert</affiliation>
</member>
<member>
<name>Anli Shundi</name>
<affiliation>TIBCO Extensibility</affiliation>
</member>
<member>
<name>C. M. Sperberg-McQueen</name>
<affiliation>W3C</affiliation>
<role>co-chair</role>
</member>
<member>
<name>Hoylen Sue</name>
<affiliation>Distributed Systems Technology Centre (DSTC Pty Ltd)</affiliation>
</member>
<member>
<name>Henry S. Thompson</name>
<affiliation>University of Edinburgh</affiliation>
</member>
<member>
<name>Asir S. Vedamuthu</name>
<affiliation>webMethods, Inc</affiliation>
</member>
<member>
<name>Priscilla Walmsley</name>
<affiliation>Invited expert</affiliation>
</member>
<member>
<name>Kongyi Zhou</name>
<affiliation>Oracle Corp.</affiliation>
</member>
</orglist>
<p diff="add">
We note with sadness the accidental death of Mario Jeckle
shortly after the completion of work on this document.  
In addition to those named above, several
people served on the Working Group during the development
of this second edition:
<!--* Furthermore, those listed below were members of the working
group at some point during the development of this second edition, but had left
by the time of publication.  In particular we note with sadness the accidental
death of Mario Jeckle shortly before publication. *-->
</p>
<orglist diff="add">
<member>
<name>Oriol Carbo</name>
<affiliation>University of Edinburgh</affiliation>
</member>
<member>
<name>Tyng-Ruey Chuang</name>
<affiliation>Academia Sinica</affiliation>
</member>
<member>
<name>Joey Coyle</name>
<affiliation>Health Level 7</affiliation>
</member>
<member>
<name>Tim Ewald</name>
<affiliation>DevelopMentor</affiliation>
</member>
<!--* 
<member>
 <name>Martin Gudgin</name>
 <affiliation>Invited expert</affiliation>
</member>
<member>
 <name>Dave Hollander</name>
 <affiliation>Contivo, Inc</affiliation>
 <role>co-chair</role>
</member>
*-->
<member>
<name>Nelson Hung</name>
<affiliation>Corel</affiliation>
</member>
<member>
<name>Melanie Kudela</name>
<affiliation>Uniform Code Council</affiliation>
</member>
<member>
<name>Matthew MacKenzie</name>
<affiliation>XML Global</affiliation>
</member>
<member>
<name>Cliff Schmidt</name>
<affiliation>Microsoft</affiliation>
</member>
<member>
<name>John Stanton</name>
<affiliation>Defense Information Systems Agency</affiliation>
</member>
<member>
<name>John Tebbutt</name>
<affiliation>NIST</affiliation>
</member>
<member>
<name>Ross Thompson</name>
<affiliation>Contivo</affiliation>
</member>
<member>
<name>Scott Vorthmann</name>
<affiliation>TIBCO Extensibility</affiliation>
</member>
</orglist>
</div1>
<!--
<div1 id='open-issues'>
<head>Open Issues</head>
<open-issues/>
</div1>
<div1 id="revisions">
<head>Revisions from Previous Draft</head>
<revisions/>
</div1>
-->
</back>
</spec>