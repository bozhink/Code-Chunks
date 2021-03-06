<?xml version="1.0" encoding="UTF-8"?>
<structure version="16" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*XML" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="n1" uri="http://www.altova.com/documentation"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="WSDL20Documentation.xsd" workingxmlfile="SampleData\TimeService20.xml"/>
		</schemasources>
	</schemasources>
	<modules>
		<module spsfile="..\Schema\OverallDocumentation.sps"/>
	</modules>
	<flags>
		<scripts/>
		<mainparts>
			<mainpart match="/" spsfile="..\Schema\OverallDocumentation.sps" isactive="0"/>
		</mainparts>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<script-project>
		<Project version="2" app="AuthenticView"/>
	</script-project>
	<importedxslt/>
	<globalstyles>
		<rules selector=".wsdlSubTitle">
			<media>
				<media value="all"/>
			</media>
			<rule color="black" font-family="Tahoma" font-size="8pt" font-style="italic"/>
		</rules>
		<rules selector=".wsdlName">
			<media>
				<media value="all"/>
			</media>
			<rule color="#000000" font-family="Tahoma" font-size="10pt"/>
		</rules>
		<rules selector=".wsdlSubData">
			<media>
				<media value="all"/>
			</media>
			<rule color="#000000" font-family="Tahoma" font-size="8pt"/>
		</rules>
		<rules selector=".wsdlDocumentation">
			<media>
				<media value="all"/>
			</media>
			<rule color="#000000" font-family="Tahoma" font-size="8pt" font-style="italic"/>
		</rules>
		<rules selector=".td-space">
			<media>
				<media value="all"/>
			</media>
			<rule border-bottom-style="none" border-bottom-width="0px" border-left-style="none" border-left-width="0px" border-right-color="white" border-right-style="solid" border-right-width="2px" border-top-color="white" border-top-style="solid" border-top-width="2px"/>
		</rules>
	</globalstyles>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties _xtitle="$XML/n1:WSDL20Documentation/n1:Document/@title"/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
						<children>
							<globaltemplate subtype="pagelayout" match="footerall">
								<children>
									<calltemplate subtype="named" match="WSDLFooter">
										<parameters/>
									</calltemplate>
								</children>
							</globaltemplate>
							<globaltemplate subtype="pdf-bookmarktree" match="pdf-bookmarktree">
								<children>
									<template subtype="source" match="XML">
										<children>
											<template subtype="element" match="n1:WSDL20Documentation">
												<children>
													<pdf-bookmark>
														<children>
															<link>
																<children>
																	<text fixtext="Services"/>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#"/>
																	<fixtext value="toc"/>
																</hyperlink>
															</link>
															<template subtype="element" filter="@id" match="n1:Service">
																<children>
																	<calltemplate subtype="named" match="WSDLTreeItem">
																		<parameters/>
																	</calltemplate>
																</children>
																<variables/>
															</template>
														</children>
													</pdf-bookmark>
													<pdf-bookmark>
														<children>
															<link>
																<children>
																	<text fixtext="Bindings"/>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#"/>
																	<fixtext value="toc"/>
																</hyperlink>
															</link>
															<template subtype="element" filter="@id" match="n1:Binding">
																<children>
																	<calltemplate subtype="named" match="WSDLTreeItem">
																		<parameters/>
																	</calltemplate>
																</children>
																<variables/>
															</template>
														</children>
													</pdf-bookmark>
													<pdf-bookmark>
														<children>
															<link>
																<children>
																	<text fixtext="Interfaces"/>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#"/>
																	<fixtext value="toc"/>
																</hyperlink>
															</link>
															<template subtype="element" filter="@id" match="n1:Interface">
																<children>
																	<calltemplate subtype="named" match="WSDLTreeItem">
																		<parameters/>
																	</calltemplate>
																</children>
																<variables/>
															</template>
														</children>
													</pdf-bookmark>
													<pdf-bookmark>
														<children>
															<link>
																<children>
																	<text fixtext="Types"/>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="#"/>
																	<fixtext value="toc"/>
																</hyperlink>
															</link>
															<template subtype="userdefined" match="(n1:Element|n1:ComplexType|n1:SimpleType)[@id]">
																<children>
																	<calltemplate subtype="named" match="WSDLTreeItem">
																		<parameters/>
																	</calltemplate>
																</children>
																<variables/>
															</template>
														</children>
													</pdf-bookmark>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</globaltemplate>
						</children>
						<watermark>
							<image transparency="50" fill-page="1" center-if-not-fill="1"/>
							<text transparency="50"/>
						</watermark>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="n1:WSDL20Documentation">
								<children>
									<template subtype="element" match="n1:Document">
										<children>
											<template subtype="attribute" match="title">
												<children>
													<paragraph>
														<children>
															<bookmark>
																<children>
																	<text fixtext="WSDL">
																		<properties class="elementHeader"/>
																	</text>
																	<text fixtext=" "/>
																	<content subtype="regular">
																		<properties class="elementHeader2"/>
																	</content>
																</children>
																<action>
																	<none/>
																</action>
																<bookmark>
																	<fixtext value="toc"/>
																</bookmark>
															</bookmark>
														</children>
													</paragraph>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
									<newline/>
									<template subtype="element" match="n1:WSDLDocument">
										<children>
											<tgrid>
												<properties width="100%"/>
												<styles width="18cm"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<styles width="3cm"/>
															</tgridcol>
															<tgridcol>
																<styles width="15cm"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<tgridrow>
																<children>
																	<tgridcell>
																		<children>
																			<text fixtext="WSDL location:">
																				<properties class="wsdlSubTitle"/>
																			</text>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<link>
																				<properties class="wsdlName"/>
																				<children>
																					<template subtype="attribute" match="wsdlLocation">
																						<children>
																							<content subtype="regular">
																								<properties class="wsdlName"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																				<action>
																					<none/>
																				</action>
																				<hyperlink>
																					<xpath value="@href"/>
																				</hyperlink>
																			</link>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
															<tgridrow>
																<children>
																	<tgridcell>
																		<children>
																			<text fixtext="targetnamespace:">
																				<properties class="wsdlSubTitle"/>
																			</text>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<children>
																			<template subtype="attribute" match="targetNamespace">
																				<children>
																					<content subtype="regular">
																						<properties class="wsdlName"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
										</children>
										<variables/>
									</template>
									<newline/>
									<tgrid hidecols="when-body-empty">
										<properties cellpadding="2" cellspacing="0" class="table-no-border"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties valign="top"/>
														<styles background-color="#E6E8F2"/>
													</tgridcol>
													<tgridcol>
														<properties valign="top"/>
														<styles background-color="#C9CDE0"/>
													</tgridcol>
													<tgridcol>
														<properties valign="top"/>
														<styles background-color="#BAC0E0"/>
													</tgridcol>
													<tgridcol>
														<properties valign="top"/>
														<styles background-color="#F0F0F0"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<children>
																	<text fixtext="services">
																		<properties class="wsdlSubTitle"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="bindings">
																		<properties class="wsdlSubTitle"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="interfaces">
																		<properties class="wsdlSubTitle"/>
																	</text>
																</children>
															</tgridcell>
															<tgridcell>
																<children>
																	<text fixtext="types">
																		<properties class="wsdlSubTitle"/>
																	</text>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
													<tgridrow>
														<children>
															<tgridcell>
																<properties valign="top"/>
																<children>
																	<template subtype="element" match="n1:Service">
																		<children>
																			<calltemplate subtype="named" match="WSDLBookmarkItem">
																				<parameters/>
																			</calltemplate>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
															<tgridcell>
																<properties valign="top"/>
																<children>
																	<template subtype="element" match="n1:Binding">
																		<children>
																			<calltemplate subtype="named" match="WSDLBookmarkItem">
																				<parameters/>
																			</calltemplate>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
															<tgridcell>
																<properties valign="top"/>
																<children>
																	<template subtype="element" match="n1:Interface">
																		<children>
																			<calltemplate subtype="named" match="WSDLBookmarkItem">
																				<parameters/>
																			</calltemplate>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
															<tgridcell>
																<properties valign="top"/>
																<children>
																	<template subtype="element" match="n1:SchemaDocument">
																		<children>
																			<template subtype="userdefined" match="(n1:Element|n1:ComplexType|n1:SimpleType)[@wsdlType=true()]">
																				<children>
																					<calltemplate subtype="named" match="WSDLBookmarkItem">
																						<parameters/>
																					</calltemplate>
																				</children>
																				<variables/>
																			</template>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<newline/>
									<calltemplate subtype="element" match="n1:SchemaDocument"/>
								</children>
								<variables/>
							</template>
							<newline/>
							<template subtype="element" match="n1:WSDL20Documentation">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="n1:SchemaDocument[1]/@newFile">
												<children>
													<template subtype="userdefined" match="(n1:Service|n1:Binding|n1:Interface)[@id]">
														<children>
															<calltemplate subtype="userdefined" match="current()"/>
														</children>
														<variables/>
													</template>
													<resultdocument _xurl="n1:SchemaDocument[1]/@newFile">
														<children>
															<documentsection>
																<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
																<watermark>
																	<image transparency="50" fill-page="1" center-if-not-fill="1"/>
																	<text transparency="50"/>
																</watermark>
															</documentsection>
															<template subtype="element" match="n1:SchemaDocument">
																<children>
																	<template subtype="userdefined" match="element()[@id]">
																		<children>
																			<calltemplate subtype="userdefined" match="current()"/>
																		</children>
																		<variables/>
																	</template>
																</children>
																<variables/>
															</template>
															<paragraph>
																<children>
																	<link>
																		<properties class="schemaName"/>
																		<children>
																			<text fixtext="Back to TOC">
																				<properties class="schemaName"/>
																				<styles font-style="italic"/>
																			</text>
																		</children>
																		<action>
																			<none/>
																		</action>
																		<hyperlink>
																			<fixtext value="#toc"/>
																		</hyperlink>
																	</link>
																</children>
															</paragraph>
															<newline/>
															<condition>
																<children>
																	<conditionbranch xpath="$SV_OutputFormat = &apos;HTML&apos;">
																		<children>
																			<calltemplate subtype="named" match="WSDLFooter">
																				<parameters/>
																			</calltemplate>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<newline/>
														</children>
														<document-properties _xtitle="concat($XML/n1:WSDL20Documentation/n1:Document/@title,&apos; - &apos;,@name)"/>
													</resultdocument>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<template subtype="userdefined" match="(n1:Service|n1:Binding|n1:Interface|n1:SchemaDocument/element())[@id]">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="@newFile">
																		<children>
																			<resultdocument _xurl="@newFile">
																				<children>
																					<documentsection>
																						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
																						<watermark>
																							<image transparency="50" fill-page="1" center-if-not-fill="1"/>
																							<text transparency="50"/>
																						</watermark>
																					</documentsection>
																					<calltemplate subtype="userdefined" match="current()"/>
																					<paragraph>
																						<children>
																							<link>
																								<properties class="schemaName"/>
																								<children>
																									<text fixtext="Back to TOC">
																										<properties class="schemaName"/>
																										<styles font-style="italic"/>
																									</text>
																								</children>
																								<action>
																									<none/>
																								</action>
																								<hyperlink>
																									<fixtext value="#toc"/>
																								</hyperlink>
																							</link>
																						</children>
																					</paragraph>
																					<newline/>
																					<condition>
																						<children>
																							<conditionbranch xpath="$SV_OutputFormat = &apos;HTML&apos;">
																								<children>
																									<calltemplate subtype="named" match="WSDLFooter">
																										<parameters/>
																									</calltemplate>
																								</children>
																							</conditionbranch>
																						</children>
																					</condition>
																					<newline/>
																				</children>
																				<document-properties _xtitle="concat($XML/n1:WSDL20Documentation/n1:Document/@title,&apos; - &apos;,@name)"/>
																			</resultdocument>
																		</children>
																	</conditionbranch>
																	<conditionbranch>
																		<children>
																			<calltemplate subtype="userdefined" match="current()"/>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
								<variables/>
							</template>
							<condition>
								<children>
									<conditionbranch xpath="$SV_OutputFormat = &apos;HTML&apos;">
										<children>
											<calltemplate subtype="named" match="WSDLFooter">
												<parameters/>
											</calltemplate>
										</children>
									</conditionbranch>
								</children>
							</condition>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts>
		<children>
			<globaltemplate subtype="element" match="n1:Service" schema-tree-path="$XML/n1:WSDL20Documentation/n1:Service">
				<children>
					<template subtype="element" match="n1:Service">
						<children>
							<calltemplate subtype="named" match="WSDLItem">
								<parameters>
									<parameter name="type" value="&apos;service&apos;"/>
									<parameter name="backgroundColor" value="&apos;#E6E8F2&apos;"/>
								</parameters>
							</calltemplate>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="n1:Binding" schema-tree-path="$XML/n1:WSDL20Documentation/n1:Binding">
				<children>
					<template subtype="element" match="n1:Binding">
						<children>
							<calltemplate subtype="named" match="WSDLItem">
								<parameters>
									<parameter name="type" value="&apos;binding&apos;"/>
									<parameter name="backgroundColor" value="&apos;#C9CDE0&apos;"/>
								</parameters>
							</calltemplate>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="n1:Interface" schema-tree-path="$XML/n1:WSDL20Documentation/n1:Interface">
				<children>
					<template subtype="element" match="n1:Interface">
						<children>
							<calltemplate subtype="named" match="WSDLItem">
								<parameters>
									<parameter name="type" value="&apos;interface&apos;"/>
									<parameter name="backgroundColor" value="&apos;#BAC0E0&apos;"/>
								</parameters>
							</calltemplate>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</globalparts>
	<designfragments>
		<children>
			<globaltemplate subtype="named" match="WSDLFooter">
				<parameters/>
				<children>
					<paragraph>
						<children>
							<text fixtext="WSDL documentation generated by ">
								<properties class="wsdlSubTitle"/>
							</text>
							<link>
								<properties class="wsdlSubData"/>
								<children>
									<text fixtext="XMLSpy">
										<properties class="wsdlSubData"/>
									</text>
								</children>
								<action>
									<none/>
								</action>
								<hyperlink>
									<fixtext value="http://www.altova.com/xmlspy"/>
								</hyperlink>
							</link>
							<text fixtext=" "/>
							<text fixtext="WSDL Editor ">
								<properties class="wsdlSubTitle"/>
							</text>
							<link>
								<properties class="wsdlSubData"/>
								<children>
									<text fixtext="http://www.altova.com/xmlspy">
										<properties class="wsdlSubData"/>
									</text>
								</children>
								<action>
									<none/>
								</action>
								<hyperlink>
									<fixtext value="http://www.altova.com/xmlspy"/>
								</hyperlink>
							</link>
						</children>
					</paragraph>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="WSDLBookmarkItem">
				<parameters/>
				<children>
					<paragraph>
						<properties class="wsdlName"/>
						<styles margin-bottom="0px"/>
						<children>
							<link conditional-processing="@id">
								<properties class="wsdlName"/>
								<children>
									<template subtype="attribute" match="name">
										<children>
											<autocalc xpath="if ($SV_OutputFormat = &apos;PDF&apos;)
 then replace(., &apos;([A-Z])&apos;, concat(codepoints-to-string(8203), &apos;$1&apos;))
 else .">
												<properties class="wsdlName"/>
											</autocalc>
										</children>
										<variables/>
									</template>
								</children>
								<action>
									<none/>
								</action>
								<hyperlink>
									<fixtext value="#"/>
									<xpath value="@id"/>
								</hyperlink>
							</link>
						</children>
					</paragraph>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="WSDLItem">
				<parameters>
					<parameter name="type" type="xs:string" default-value="&apos;&apos;"/>
					<parameter name="backgroundColor" type="xs:string" default-value="&apos;#F0F0F0&apos;"/>
				</parameters>
				<children>
					<paragraph>
						<styles keep-with-next="always" margin-bottom="0px"/>
						<children>
							<bookmark>
								<children>
									<template subtype="parameter" match="$type">
										<children>
											<content subtype="regular">
												<properties class="elementHeader"/>
											</content>
										</children>
										<variables/>
									</template>
									<text fixtext=" ">
										<properties class="elementHeader"/>
									</text>
									<template subtype="attribute" match="name">
										<children>
											<content subtype="regular">
												<properties class="elementHeader2"/>
											</content>
										</children>
										<variables/>
									</template>
								</children>
								<action>
									<none/>
								</action>
								<bookmark>
									<xpath value="@id"/>
								</bookmark>
							</bookmark>
						</children>
					</paragraph>
					<condition>
						<children>
							<conditionbranch xpath="n1:Documentations">
								<children>
									<calltemplate subtype="named" match="WSDLDocumentation">
										<parameters/>
									</calltemplate>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<calltemplate subtype="named" match="WSDLPropertyTable">
						<parameters>
							<parameter name="backgroundColor" value="$backgroundColor"/>
						</parameters>
					</calltemplate>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="WSDLDocumentation">
				<parameters/>
				<children>
					<template subtype="element" match="n1:Documentations">
						<children>
							<template subtype="element" match="n1:Documentation">
								<children>
									<paragraph>
										<styles keep-with-next="always" margin-bottom="0px"/>
										<children>
											<content subtype="regular">
												<properties class="wsdlDocumentation"/>
											</content>
										</children>
									</paragraph>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="WSDLPropertyTable">
				<parameters>
					<parameter name="backgroundColor" type="xs:string" default-value="&apos;#F0F0F0&apos;"/>
				</parameters>
				<children>
					<tgrid>
						<properties _xbgcolor="$backgroundColor" border="1" cellpadding="5" cellspacing="0" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<properties valign="top"/>
										<styles width="10%"/>
									</tgridcol>
									<tgridcol>
										<properties class="wsdlName"/>
										<styles width="90%"/>
									</tgridcol>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<template subtype="element" match="n1:Diagram">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties align="right" class="wsdlSubTitle" valign="top"/>
														<children>
															<text fixtext="diagram"/>
														</children>
													</tgridcell>
													<tgridcell>
														<properties align="left" valign="top"/>
														<styles background-color="white"/>
														<children>
															<calltemplate subtype="named" match="WSDLDiagram">
																<parameters/>
															</calltemplate>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:ImportedFrom">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties align="right" class="wsdlSubTitle" valign="top"/>
														<children>
															<text fixtext="imported from"/>
														</children>
													</tgridcell>
													<tgridcell>
														<properties align="left" valign="top"/>
														<children>
															<link>
																<properties class="wsdlName"/>
																<children>
																	<content subtype="regular">
																		<properties class="wsdlName"/>
																	</content>
																</children>
																<action>
																	<none/>
																</action>
																<hyperlink>
																	<fixtext value="@href"/>
																</hyperlink>
															</link>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Endpoints">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="endpoints"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles background-color="white"/>
														<children>
															<template subtype="element" match="n1:Endpoint">
																<children>
																	<bookmark>
																		<action>
																			<none/>
																		</action>
																		<bookmark>
																			<xpath value="@id"/>
																		</bookmark>
																	</bookmark>
																	<template subtype="attribute" match="name">
																		<children>
																			<content subtype="regular">
																				<properties class="wsdlName"/>
																			</content>
																		</children>
																		<variables/>
																	</template>
																	<calltemplate subtype="named" match="WSDLDocumentation">
																		<parameters/>
																	</calltemplate>
																	<tgrid hiderows="when-body-empty">
																		<properties cellpadding="2" cellspacing="0"/>
																		<styles width="16cm"/>
																		<children>
																			<tgridbody-cols>
																				<children>
																					<tgridcol>
																						<styles width="4.5cm"/>
																					</tgridcol>
																					<tgridcol>
																						<styles width="11.5cm"/>
																					</tgridcol>
																				</children>
																			</tgridbody-cols>
																			<tgridbody-rows>
																				<children>
																					<template subtype="element" match="n1:Binding">
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties class="td-space"/>
																										<styles _xbackground-color="$backgroundColor" text-align="right"/>
																										<children>
																											<text fixtext="binding">
																												<properties class="wsdlSubTitle"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<properties class="td-space"/>
																										<styles _xbackground-color="$backgroundColor"/>
																										<children>
																											<calltemplate subtype="named" match="WSDLRefContent">
																												<parameters/>
																											</calltemplate>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																						<variables/>
																					</template>
																					<template subtype="element" match="n1:Address">
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties class="td-space"/>
																										<styles _xbackground-color="$backgroundColor" text-align="right"/>
																										<children>
																											<text fixtext="address">
																												<properties class="wsdlSubTitle"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<properties class="td-space"/>
																										<styles _xbackground-color="$backgroundColor"/>
																										<children>
																											<content subtype="regular">
																												<properties class="wsdlSubData"/>
																											</content>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																						<variables/>
																					</template>
																					<template subtype="element" match="n1:Attributes">
																						<children>
																							<template subtype="element" match="n1:Attribute">
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<properties class="td-space"/>
																												<styles _xbackground-color="$backgroundColor" text-align="right"/>
																												<children>
																													<template subtype="attribute" match="name">
																														<children>
																															<content subtype="regular">
																																<properties class="wsdlSubTitle"/>
																															</content>
																														</children>
																														<variables/>
																													</template>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<properties class="td-space"/>
																												<styles _xbackground-color="$backgroundColor"/>
																												<children>
																													<content subtype="regular">
																														<properties class="wsdlSubData"/>
																													</content>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																								<variables/>
																							</template>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridbody-rows>
																		</children>
																	</tgrid>
																	<condition>
																		<children>
																			<conditionbranch xpath="following-sibling::n1:Endpoint">
																				<children>
																					<newline/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Type">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="type"/>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<content subtype="regular">
																<properties class="wsdlSubData"/>
															</content>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Interface">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="interface"/>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<calltemplate subtype="named" match="WSDLRefContent">
																<parameters/>
															</calltemplate>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:StyleDefault">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="styleDefault"/>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<content subtype="regular">
																<properties class="wsdlSubData"/>
															</content>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Extends">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="extends"/>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<template subtype="element" match="n1:Interface">
																<children>
																	<calltemplate subtype="named" match="WSDLRefContent">
																		<parameters/>
																	</calltemplate>
																</children>
																<variables/>
															</template>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Extensibility">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="extensibility"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles background-color="white"/>
														<children>
															<tgrid hiderows="when-body-empty">
																<properties cellpadding="2" cellspacing="0"/>
																<styles width="16cm"/>
																<children>
																	<tgridbody-cols>
																		<children>
																			<tgridcol>
																				<styles width="4.5cm"/>
																			</tgridcol>
																			<tgridcol>
																				<styles width="11.5cm"/>
																			</tgridcol>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<children>
																			<template subtype="element" match="n1:Attributes">
																				<children>
																					<template subtype="element" match="n1:Attribute">
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<properties class="td-space"/>
																										<styles _xbackground-color="$backgroundColor" text-align="right"/>
																										<children>
																											<template subtype="attribute" match="name">
																												<children>
																													<content subtype="regular">
																														<properties class="wsdlSubTitle"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<properties class="td-space"/>
																										<styles _xbackground-color="$backgroundColor"/>
																										<children>
																											<content subtype="regular">
																												<properties class="wsdlSubData"/>
																											</content>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																						<variables/>
																					</template>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Operations">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="operations"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles background-color="white"/>
														<children>
															<template subtype="element" match="n1:Operation">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="parent::n1:Operations/parent::n1:Interface">
																				<children>
																					<bookmark>
																						<action>
																							<none/>
																						</action>
																						<bookmark>
																							<xpath value="@id"/>
																						</bookmark>
																					</bookmark>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<template subtype="attribute" match="name">
																		<children>
																			<calltemplate subtype="named" match="WSDLRefContent">
																				<parameters/>
																			</calltemplate>
																		</children>
																		<variables/>
																	</template>
																	<calltemplate subtype="named" match="WSDLDocumentation">
																		<parameters/>
																	</calltemplate>
																	<condition>
																		<children>
																			<conditionbranch xpath="parent::n1:Operations/parent::n1:Binding">
																				<children>
																					<tgrid hiderows="when-body-empty">
																						<properties cellpadding="2" cellspacing="0"/>
																						<styles width="16cm"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties valign="top"/>
																										<styles width="4.5cm"/>
																									</tgridcol>
																									<tgridcol>
																										<styles width="11.5cm"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<template subtype="element" match="n1:Attributes">
																										<children>
																											<template subtype="element" match="n1:Attribute">
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<properties class="td-space" valign="top"/>
																																<styles _xbackground-color="$backgroundColor" text-align="right"/>
																																<children>
																																	<template subtype="attribute" match="name">
																																		<children>
																																			<content subtype="regular">
																																				<properties class="wsdlSubTitle"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<properties class="td-space"/>
																																<styles _xbackground-color="$backgroundColor"/>
																																<children>
																																	<content subtype="regular">
																																		<properties class="wsdlSubData"/>
																																	</content>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																												<variables/>
																											</template>
																										</children>
																										<variables/>
																									</template>
																									<template subtype="element" match="n1:SoapModules">
																										<children>
																											<template subtype="element" match="n1:SoapModule">
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<properties class="td-space" valign="top"/>
																																<styles _xbackground-color="$backgroundColor" text-align="right"/>
																																<children>
																																	<template subtype="userdefined" match="parent::*">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular">
																																						<properties class="wsdlSubTitle"/>
																																					</content>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<properties class="td-space"/>
																																<styles _xbackground-color="$backgroundColor"/>
																																<children>
																																	<template subtype="userdefined" match="node()">
																																		<children>
																																			<calltemplate subtype="named" match="XMLSource">
																																				<parameters>
																																					<parameter name="InMixed"/>
																																				</parameters>
																																			</calltemplate>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																												<variables/>
																											</template>
																										</children>
																										<variables/>
																									</template>
																									<template subtype="element" match="n1:References">
																										<children>
																											<template subtype="userdefined" match="(n1:Input|n1:Output)">
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<properties class="td-space" valign="top"/>
																																<styles _xbackground-color="$backgroundColor" text-align="right"/>
																																<children>
																																	<autocalc xpath="lower-case(local-name())">
																																		<properties class="wsdlSubTitle"/>
																																	</autocalc>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<properties class="td-space"/>
																																<styles _xbackground-color="$backgroundColor"/>
																																<children>
																																	<template subtype="attribute" match="name">
																																		<children>
																																			<content subtype="regular">
																																				<properties class="wsdlSubData"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																	<calltemplate subtype="named" match="WSDLDocumentation">
																																		<parameters/>
																																	</calltemplate>
																																	<calltemplate subtype="named" match="WSDLExtensions">
																																		<parameters>
																																			<parameter name="backgroundColor" value="$backgroundColor"/>
																																		</parameters>
																																	</calltemplate>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																												<variables/>
																											</template>
																										</children>
																										<variables/>
																									</template>
																									<template subtype="element" match="n1:References">
																										<children>
																											<template subtype="userdefined" match="(n1:Infault|n1:Outfault)">
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<properties class="td-space" valign="top"/>
																																<styles _xbackground-color="$backgroundColor" text-align="right"/>
																																<children>
																																	<autocalc xpath="lower-case(local-name())">
																																		<properties class="wsdlSubTitle"/>
																																	</autocalc>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<properties class="td-space"/>
																																<styles _xbackground-color="$backgroundColor"/>
																																<children>
																																	<template subtype="attribute" match="name">
																																		<children>
																																			<content subtype="regular">
																																				<properties class="wsdlSubData"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																	<calltemplate subtype="named" match="WSDLDocumentation">
																																		<parameters/>
																																	</calltemplate>
																																	<calltemplate subtype="named" match="WSDLExtensions">
																																		<parameters>
																																			<parameter name="backgroundColor" value="$backgroundColor"/>
																																		</parameters>
																																	</calltemplate>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																												<variables/>
																											</template>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<tgrid hiderows="when-body-empty">
																						<properties cellpadding="2" cellspacing="0"/>
																						<styles width="16cm"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<properties valign="top"/>
																										<styles width="4.5cm"/>
																									</tgridcol>
																									<tgridcol>
																										<styles width="11.5cm"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<template subtype="element" match="n1:Pattern">
																										<children>
																											<tgridrow>
																												<children>
																													<tgridcell>
																														<properties class="td-space"/>
																														<styles _xbackground-color="$backgroundColor" text-align="right"/>
																														<children>
																															<text fixtext="pattern">
																																<properties class="wsdlSubTitle"/>
																															</text>
																														</children>
																													</tgridcell>
																													<tgridcell>
																														<properties class="td-space"/>
																														<styles _xbackground-color="$backgroundColor"/>
																														<children>
																															<content subtype="regular">
																																<properties class="wsdlSubData"/>
																															</content>
																														</children>
																													</tgridcell>
																												</children>
																											</tgridrow>
																										</children>
																										<variables/>
																									</template>
																									<template subtype="element" match="n1:Style">
																										<children>
																											<tgridrow>
																												<children>
																													<tgridcell>
																														<properties class="td-space"/>
																														<styles _xbackground-color="$backgroundColor" text-align="right"/>
																														<children>
																															<text fixtext="style">
																																<properties class="wsdlSubTitle"/>
																															</text>
																														</children>
																													</tgridcell>
																													<tgridcell>
																														<properties class="td-space"/>
																														<styles _xbackground-color="$backgroundColor"/>
																														<children>
																															<content subtype="regular">
																																<properties class="wsdlSubData"/>
																															</content>
																														</children>
																													</tgridcell>
																												</children>
																											</tgridrow>
																										</children>
																										<variables/>
																									</template>
																									<template subtype="element" match="n1:References">
																										<children>
																											<template subtype="userdefined" match="element()">
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<properties class="td-space" valign="top"/>
																																<styles _xbackground-color="$backgroundColor" text-align="right"/>
																																<children>
																																	<autocalc xpath="lower-case(local-name())">
																																		<properties class="wsdlSubTitle"/>
																																	</autocalc>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<properties class="td-space"/>
																																<styles _xbackground-color="$backgroundColor"/>
																																<children>
																																	<template subtype="attribute" match="name">
																																		<children>
																																			<content subtype="regular">
																																				<properties class="wsdlName"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																	<template subtype="element" match="n1:Element">
																																		<children>
																																			<paragraph>
																																				<children>
																																					<calltemplate subtype="named" match="WSDLRefContent">
																																						<parameters/>
																																					</calltemplate>
																																				</children>
																																			</paragraph>
																																		</children>
																																		<variables/>
																																	</template>
																																	<calltemplate subtype="named" match="WSDLDocumentation">
																																		<parameters/>
																																	</calltemplate>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																												<variables/>
																											</template>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="following-sibling::n1:Operation">
																				<children>
																					<newline/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Faults">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="faults"/>
														</children>
													</tgridcell>
													<tgridcell>
														<styles background-color="white"/>
														<children>
															<template subtype="element" match="n1:Fault">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="parent::n1:Faults/parent::n1:Binding">
																				<children>
																					<template subtype="attribute" match="name">
																						<children>
																							<calltemplate subtype="named" match="WSDLRefContent">
																								<parameters/>
																							</calltemplate>
																						</children>
																						<variables/>
																					</template>
																					<calltemplate subtype="named" match="WSDLExtensions">
																						<parameters>
																							<parameter name="backgroundColor" value="$backgroundColor"/>
																						</parameters>
																					</calltemplate>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<bookmark>
																						<action>
																							<none/>
																						</action>
																						<bookmark>
																							<xpath value="@id"/>
																						</bookmark>
																					</bookmark>
																					<template subtype="attribute" match="name">
																						<children>
																							<content subtype="regular">
																								<properties class="wsdlName"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																					<calltemplate subtype="named" match="WSDLDocumentation">
																						<parameters/>
																					</calltemplate>
																					<tgrid hiderows="when-body-empty">
																						<properties cellpadding="2" cellspacing="0"/>
																						<styles width="16cm"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol>
																										<styles width="4.5cm"/>
																									</tgridcol>
																									<tgridcol>
																										<styles width="11.5cm"/>
																									</tgridcol>
																								</children>
																							</tgridbody-cols>
																							<tgridbody-rows>
																								<children>
																									<template subtype="element" match="n1:Element">
																										<children>
																											<tgridrow>
																												<children>
																													<tgridcell>
																														<properties class="td-space"/>
																														<styles _xbackground-color="$backgroundColor" text-align="right"/>
																														<children>
																															<text fixtext="element">
																																<properties class="wsdlSubTitle"/>
																															</text>
																														</children>
																													</tgridcell>
																													<tgridcell>
																														<properties class="td-space"/>
																														<styles _xbackground-color="$backgroundColor"/>
																														<children>
																															<calltemplate subtype="named" match="WSDLRefContent">
																																<parameters/>
																															</calltemplate>
																														</children>
																													</tgridcell>
																												</children>
																											</tgridrow>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="following-sibling::n1:Fault">
																				<children>
																					<newline/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:UsedBy">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="used by"/>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="parent::n1:Binding">
																		<children>
																			<template subtype="element" match="n1:By">
																				<children>
																					<paragraph>
																						<properties class="wsdlName"/>
																						<children>
																							<text fixtext="endpoint ">
																								<properties class="wsdlSubTitle"/>
																							</text>
																							<template subtype="element" match="n1:Endpoint">
																								<children>
																									<calltemplate subtype="named" match="WSDLRefContent">
																										<parameters/>
																									</calltemplate>
																								</children>
																								<variables/>
																							</template>
																							<text fixtext=" "/>
																							<text fixtext="in service ">
																								<properties class="wsdlSubTitle"/>
																							</text>
																							<template subtype="element" match="n1:Service">
																								<children>
																									<calltemplate subtype="named" match="WSDLRefContent">
																										<parameters/>
																									</calltemplate>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</paragraph>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</conditionbranch>
																	<conditionbranch>
																		<children>
																			<template subtype="userdefined" match="element()">
																				<children>
																					<paragraph>
																						<properties class="wsdlName"/>
																						<children>
																							<autocalc xpath="lower-case(local-name())">
																								<properties class="wsdlSubTitle"/>
																							</autocalc>
																							<text fixtext=" "/>
																							<calltemplate subtype="named" match="WSDLRefContent">
																								<parameters/>
																							</calltemplate>
																						</children>
																					</paragraph>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:Source">
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<properties class="wsdlSubTitle" valign="top"/>
														<styles text-align="right"/>
														<children>
															<text fixtext="source"/>
														</children>
													</tgridcell>
													<tgridcell>
														<children>
															<template subtype="userdefined" match="node()">
																<children>
																	<calltemplate subtype="named" match="XMLSource">
																		<parameters>
																			<parameter name="InMixed"/>
																		</parameters>
																	</calltemplate>
																</children>
																<variables/>
															</template>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
										<variables/>
									</template>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="WSDLExtensions">
				<parameters>
					<parameter name="backgroundColor" type="xs:string" default-value="&apos;#F0F0F0&apos;"/>
				</parameters>
				<children>
					<tgrid>
						<properties cellpadding="2" cellspacing="0"/>
						<styles width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<properties class="wsdlSubTitle"/>
										<styles width="25%"/>
									</tgridcol>
									<tgridcol>
										<properties class="wsdlSubData"/>
										<styles width="75%"/>
									</tgridcol>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<template subtype="element" match="n1:Attributes">
										<children>
											<template subtype="element" match="n1:Attribute">
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<properties _xbgcolor="$backgroundColor" class="td-space"/>
																<styles text-align="right"/>
																<children>
																	<template subtype="attribute" match="name">
																		<children>
																			<content subtype="regular"/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
															<tgridcell>
																<properties _xbgcolor="$backgroundColor" class="td-space"/>
																<children>
																	<content subtype="regular"/>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
									<template subtype="userdefined" match="(n1:SoapModules|n1:SoapHeaders|n1:HttpHeaders)">
										<children>
											<template subtype="userdefined" match="element()">
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<properties _xbgcolor="$backgroundColor" class="td-space"/>
																<styles text-align="right"/>
																<children>
																	<template subtype="userdefined" match="parent::*">
																		<children>
																			<template subtype="attribute" match="name">
																				<children>
																					<content subtype="regular"/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
															<tgridcell>
																<properties _xbgcolor="$backgroundColor" class="td-space"/>
																<children>
																	<template subtype="userdefined" match="node()">
																		<children>
																			<calltemplate subtype="named" match="XMLSource">
																				<parameters>
																					<parameter name="InMixed"/>
																				</parameters>
																			</calltemplate>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="WSDLRefContent">
				<parameters/>
				<children>
					<link conditional-processing="if (self::attribute()) then ../@ref else @ref">
						<properties class="wsdlName"/>
						<children>
							<content subtype="regular">
								<properties class="wsdlName"/>
							</content>
						</children>
						<action>
							<none/>
						</action>
						<hyperlink>
							<fixtext value="#"/>
							<xpath value="if (self::attribute()) then ../@ref else @ref"/>
						</hyperlink>
					</link>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" additional-mode="pdf-bookmarktree" match="WSDLTreeItem">
				<parameters/>
				<children>
					<pdf-bookmark>
						<children>
							<link>
								<children>
									<template subtype="attribute" match="name">
										<children>
											<content subtype="regular"/>
										</children>
										<variables/>
									</template>
								</children>
								<action>
									<none/>
								</action>
								<hyperlink>
									<fixtext value="#"/>
									<xpath value="@id"/>
								</hyperlink>
							</link>
						</children>
					</pdf-bookmark>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="WSDLDiagram">
				<parameters>
					<parameter name="maxheight" type="xs:integer" default-value="850"/>
					<parameter name="maxwidth" type="xs:integer" default-value="580"/>
				</parameters>
				<children>
					<image>
						<styles _xheight="if ($SV_OutputFormat = &apos;HTML&apos;)
  then concat(@height, &apos;px&apos;)
  else if (@width &gt; $maxwidth or @height &gt; $maxheight)
    then if ($maxwidth * 100 div @width &gt; $maxheight * 100 div @height)
	  then concat($maxheight, &apos;px&apos;)
      else concat(($maxwidth * 100 div @width) * @height div 100, &apos;px&apos;)
    else concat(@height, &apos;px&apos;)" _xwidth="if ($SV_OutputFormat = &apos;HTML&apos;)
  then concat(@width, &apos;px&apos;)
  else if (@width &gt; $maxwidth or @height &gt; $maxheight)
    then if ($maxwidth * 100 div @width &gt; $maxheight * 100 div @height)
      then concat(($maxheight * 100 div @height) * @width div 100, &apos;px&apos;)
	  else concat($maxwidth, &apos;px&apos;)
    else concat(@width, &apos;px&apos;)"/>
						<target>
							<xpath value="@src"/>
						</target>
					</image>
				</children>
			</globaltemplate>
		</children>
	</designfragments>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
