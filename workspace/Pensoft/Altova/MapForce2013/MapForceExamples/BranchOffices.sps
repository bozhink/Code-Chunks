<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="sql" uri="urn:schemas-microsoft-com:mapping-schema"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="BranchOffices.xsd"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<script-project>
		<Project version="2" app="AuthenticView">
			<Forms>
				<Form name="JumpTo">
					<Source>//Occurs when the component is double-clicked.
function JumpTo_ListBox_DoubleClick( objSender, e_EventArgs )
{
	lastform.DialogResult = CLR.Static( &apos;System.Windows.Forms.DialogResult&apos; ).OK;
	lastform.Close();
}
</Source>
					<FormData>&lt;Object type=&quot;System.Windows.Forms.Form, System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089&quot; name=&quot;JumpTo&quot; children=&quot;Controls&quot;&gt;&lt;Object type=&quot;System.Windows.Forms.Button, System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089&quot; name=&quot;btnCancel&quot; children=&quot;Controls&quot;&gt;&lt;Property name=&quot;TabIndex&quot;&gt;1&lt;/Property&gt;&lt;Property name=&quot;Name&quot;&gt;btnCancel&lt;/Property&gt;&lt;Property name=&quot;Size&quot;&gt;75, 23&lt;/Property&gt;&lt;Property name=&quot;UseVisualStyleBackColor&quot;&gt;True&lt;/Property&gt;&lt;Property name=&quot;Text&quot;&gt;Cancel&lt;/Property&gt;&lt;Property name=&quot;UseCompatibleTextRendering&quot;&gt;True&lt;/Property&gt;&lt;Property name=&quot;Location&quot;&gt;182, 152&lt;/Property&gt;&lt;Property name=&quot;DataBindings&quot;&gt;&lt;Property name=&quot;DefaultDataSourceUpdateMode&quot;&gt;OnValidation&lt;/Property&gt;&lt;/Property&gt;&lt;Property name=&quot;DialogResult&quot;&gt;Cancel&lt;/Property&gt;&lt;Event name=&quot;Click&quot;&gt;JumpTo_Button1_Click&lt;/Event&gt;&lt;/Object&gt;&lt;Object type=&quot;System.Windows.Forms.Button, System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089&quot; name=&quot;btnOK&quot; children=&quot;Controls&quot;&gt;&lt;Property name=&quot;TabIndex&quot;&gt;1&lt;/Property&gt;&lt;Property name=&quot;Name&quot;&gt;btnOK&lt;/Property&gt;&lt;Property name=&quot;Size&quot;&gt;75, 23&lt;/Property&gt;&lt;Property name=&quot;UseVisualStyleBackColor&quot;&gt;True&lt;/Property&gt;&lt;Property name=&quot;Text&quot;&gt;OK&lt;/Property&gt;&lt;Property name=&quot;UseCompatibleTextRendering&quot;&gt;True&lt;/Property&gt;&lt;Property name=&quot;Location&quot;&gt;89, 152&lt;/Property&gt;&lt;Property name=&quot;DataBindings&quot;&gt;&lt;Property name=&quot;DefaultDataSourceUpdateMode&quot;&gt;OnValidation&lt;/Property&gt;&lt;/Property&gt;&lt;Property name=&quot;DialogResult&quot;&gt;OK&lt;/Property&gt;&lt;Event name=&quot;Click&quot;&gt;JumpTo_Button1_Click&lt;/Event&gt;&lt;/Object&gt;&lt;Object type=&quot;System.Windows.Forms.ListBox, System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089&quot; name=&quot;ListBox&quot; children=&quot;Controls&quot;&gt;&lt;Property name=&quot;FormattingEnabled&quot;&gt;True&lt;/Property&gt;&lt;Property name=&quot;Size&quot;&gt;245, 121&lt;/Property&gt;&lt;Property name=&quot;DataBindings&quot;&gt;&lt;Property name=&quot;DefaultDataSourceUpdateMode&quot;&gt;OnValidation&lt;/Property&gt;&lt;/Property&gt;&lt;Property name=&quot;Name&quot;&gt;ListBox&lt;/Property&gt;&lt;Property name=&quot;Location&quot;&gt;12, 12&lt;/Property&gt;&lt;Property name=&quot;TabIndex&quot;&gt;0&lt;/Property&gt;&lt;Event name=&quot;DoubleClick&quot;&gt;JumpTo_ListBox_DoubleClick&lt;/Event&gt;&lt;/Object&gt;&lt;Property name=&quot;Text&quot;&gt;Jump to...&lt;/Property&gt;&lt;Property name=&quot;Name&quot;&gt;JumpTo&lt;/Property&gt;&lt;Property name=&quot;StartPosition&quot;&gt;CenterParent&lt;/Property&gt;&lt;Property name=&quot;DataBindings&quot;&gt;&lt;Property name=&quot;DefaultDataSourceUpdateMode&quot;&gt;OnValidation&lt;/Property&gt;&lt;/Property&gt;&lt;Property name=&quot;ClientSize&quot;&gt;284, 195&lt;/Property&gt;&lt;Property name=&quot;AcceptButton&quot;&gt;&lt;Reference name=&quot;btnOK&quot; /&gt;&lt;/Property&gt;&lt;/Object&gt;</FormData>
				</Form>
			</Forms>
			<Macros>
				<Macro name="JumpTo">
					<Source>dlgJumpTo = CreateForm( &apos;JumpTo&apos; );
dlgJumpTo.ListBox.Items.Add( &apos;Begin&apos; );

elemBranchOffices = AuthenticView.XMLDataRoot.GetChildElement( &apos;BranchOffices&apos;, 0 );
if ( elemBranchOffices != null )
{
	nIndex = 0;
	while ( ( elemOffice = elemBranchOffices.GetChildElement( &apos;Office&apos;, nIndex ) ) != null )
	{
		elemName = elemOffice.GetChildElement( &apos;Name&apos;, 0 );
		if ( elemName != null )
		{
			dlgJumpTo.ListBox.Items.Add( &apos;  &apos; + elemName.GetTextValueXMLDecoded() );
		}
		nIndex++;
	}
}

dlgJumpTo.ListBox.Items.Add( &apos;End&apos; );
dlgJumpTo.ListBox.SetSelected( 0, true );

if ( dlgJumpTo.ShowDialog() == CLR.Static( &apos;System.Windows.Forms.DialogResult&apos; ).OK )
{
	switch( dlgJumpTo.ListBox.Text ) {
	case &apos;Begin&apos; :	AuthenticView.DocumentBegin.Select();	break;
	case &apos;End&apos; :	AuthenticView.DocumentEnd.Select();		break;
	default:
		nIndex = 0;
		while ( ( elemOffice = elemBranchOffices.GetChildElement( &apos;Office&apos;, nIndex ) ) != null )
		{
			elemName = elemOffice.GetChildElement( &apos;Name&apos;, 0 );
			if (
				elemName != null &amp;&amp;
				elemName.GetTextValueXMLDecoded() == dlgJumpTo.ListBox.Text.substr( 2 ) 
			)
			{
				txtName = elemName.GetFirstChild( spyXMLDataText );
				if ( txtName != null )
				{
					newSel = AuthenticView.Selection.Clone();
					newSel.FirstXMLData = txtName;
					newSel.LastXMLData = txtName;
					newSel.Select();
				}
				break;
			}
			nIndex++;
		}
	}
}
</Source>
				</Macro>
				<Macro name="ZoomIn">
					<Source>AuthenticView.EventContext.SetVariableValue(
	&apos;Zoom&apos;,
	parseInt( AuthenticView.EventContext.GetVariableValue( &apos;Zoom&apos; ) ) + 1
);
</Source>
				</Macro>
				<Macro name="ZoomOut">
					<Source>nZoom = parseInt( AuthenticView.EventContext.GetVariableValue( &apos;Zoom&apos; ) );
if ( nZoom &gt; 1 )
{
	AuthenticView.EventContext.SetVariableValue( &apos;Zoom&apos;, nZoom - 1 );
}
</Source>
				</Macro>
				<Macro name="TypeRoadmap">
					<Source>AuthenticView.EventContext.SetVariableValue( &apos;MapType&apos;, &apos;roadmap&apos; );</Source>
				</Macro>
				<Macro name="TypeSatellite">
					<Source>AuthenticView.EventContext.SetVariableValue( &apos;MapType&apos;, &apos;satellite&apos; );</Source>
				</Macro>
				<Macro name="TypeHybrid">
					<Source>AuthenticView.EventContext.SetVariableValue( &apos;MapType&apos;, &apos;hybrid&apos; );</Source>
				</Macro>
				<Macro name="MapBigger">
					<Source>AuthenticView.EventContext.SetVariableValue(
	&apos;MapWidth&apos;,
	parseInt( AuthenticView.EventContext.GetVariableValue( &apos;MapWidth&apos; ) ) + 100
);
</Source>
				</Macro>
				<Macro name="MapSmaller">
					<Source>nWidth = parseInt( AuthenticView.EventContext.GetVariableValue( &apos;MapWidth&apos; ) );
if ( nWidth &gt; 300 )
{
	AuthenticView.EventContext.SetVariableValue( &apos;MapWidth&apos;, nWidth - 100 );
}
</Source>
				</Macro>
			</Macros>
		</Project>
	</script-project>
	<importedxslt/>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="variable" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="1" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.0in" papermarginheader="0.0in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.5in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="BranchOffices">
								<children>
									<newline/>
									<tgrid>
										<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<properties width="40%"/>
													</tgridcol>
													<tgridcol>
														<properties width="60%"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridbody-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<properties valign="top"/>
																<children>
																	<template subtype="element" match="Name">
																		<children>
																			<content>
																				<styles color="#0588BA" font-family="Arial" font-size="20pt" font-weight="bold"/>
																				<format basic-type="xsd" datatype="string"/>
																			</content>
																		</children>
																		<variables/>
																	</template>
																</children>
															</tgridcell>
															<tgridcell>
																<styles text-align="right"/>
																<children>
																	<image>
																		<target>
																			<fixtext value="nanonull.gif"/>
																		</target>
																	</image>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
													<tgridrow>
														<children>
															<tgridcell>
																<properties valign="bottom"/>
																<children>
																	<newline/>
																	<text fixtext="Quick Finder">
																		<styles font-family="Arial" font-size="14pt" font-weight="bold"/>
																	</text>
																	<newline/>
																</children>
															</tgridcell>
															<tgridcell joinabove="1">
																<styles text-align="right"/>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<toc name="toc">
										<children>
											<reflevel>
												<children>
													<newline/>
													<ref name="toc" createhyperlink="1">
														<children>
															<field type="ref-entrytext">
																<styles font-family="Arial" font-size="12pt" font-weight="bold"/>
															</field>
														</children>
													</ref>
													<newline/>
													<reflevel>
														<children>
															<tgrid>
																<properties cellspacing="0" width="100%"/>
																<styles line-height="12pt"/>
																<children>
																	<tgridbody-cols>
																		<children>
																			<tgridcol>
																				<properties width="50%"/>
																			</tgridcol>
																			<tgridcol>
																				<properties width="50%"/>
																			</tgridcol>
																		</children>
																	</tgridbody-cols>
																	<tgridbody-rows>
																		<children>
																			<tgridrow>
																				<properties _xbgcolor="if ( position() mod 2 ) then &quot;antiquewhite&quot; else &quot;navajowhite&quot;"/>
																				<children>
																					<tgridcell>
																						<properties valign="top"/>
																						<children>
																							<ref name="toc" createhyperlink="1">
																								<children>
																									<num-lvl format="A.1" omitlevels="1">
																										<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																									</num-lvl>
																									<text fixtext=". ">
																										<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																									</text>
																									<field type="ref-entrytext">
																										<styles font-family="Arial" font-size="10pt" font-weight="bold"/>
																									</field>
																								</children>
																							</ref>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<properties valign="top"/>
																						<children>
																							<reflevel>
																								<children>
																									<tgrid>
																										<properties cellpadding="0" cellspacing="0"/>
																										<children>
																											<tgridbody-cols>
																												<children>
																													<tgridcol/>
																												</children>
																											</tgridbody-cols>
																											<tgridbody-rows>
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<properties valign="top"/>
																																<children>
																																	<ref name="toc" createhyperlink="1">
																																		<children>
																																			<num-lvl format="A.1" omitlevels="1">
																																				<styles font-family="Arial" font-size="8pt"/>
																																			</num-lvl>
																																			<text fixtext=" ">
																																				<styles font-family="Arial" font-size="8pt"/>
																																			</text>
																																			<field type="ref-entrytext">
																																				<styles font-family="Arial" font-size="8pt"/>
																																			</field>
																																		</children>
																																	</ref>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																											</tgridbody-rows>
																										</children>
																									</tgrid>
																								</children>
																							</reflevel>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
														</children>
													</reflevel>
												</children>
											</reflevel>
										</children>
									</toc>
									<template subtype="element" levelflag="1" match="Office">
										<editorproperties adding="no"/>
										<children>
											<condition>
												<children>
													<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;">
														<children>
															<newline/>
															<newline/>
															<newline/>
															<paragraph>
																<styles border-top-color="#0588ba" border-top-style="solid" border-top-width="2pt"/>
																<children>
																	<newline/>
																	<marker xpath="." name="toc">
																		<children>
																			<template subtype="element" match="Name">
																				<editorproperties adding="no"/>
																				<children>
																					<content>
																						<styles color="#707070" font-family="Arial" font-size="15pt" font-weight="bold"/>
																						<format basic-type="xsd" datatype="string"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</marker>
																	<newline/>
																	<newline/>
																	<text fixtext="Location: ">
																		<styles color="#808080" font-family="Arial" font-size="small" font-weight="bold"/>
																	</text>
																	<condition>
																		<children>
																			<conditionbranch xpath="not(Address or  Address_EU)"/>
																			<conditionbranch>
																				<children>
																					<template subtype="element" match="Location">
																						<editorproperties autoaddname="1" editable="0" adding="no" markupmode="hide"/>
																						<children>
																							<content>
																								<styles color="#808080" font-weight="bold"/>
																								<format basic-type="xsd" datatype="string"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</paragraph>
														</children>
													</conditionbranch>
													<conditionbranch xpath="$SV_OutputFormat = &apos;HTML&apos;">
														<children>
															<newline/>
															<paragraph>
																<styles border-top-color="#0588ba" border-top-style="solid" border-top-width="2pt"/>
																<children>
																	<newline/>
																	<marker xpath="." name="toc">
																		<children>
																			<template subtype="element" match="Name">
																				<editorproperties adding="no"/>
																				<children>
																					<content>
																						<styles color="#707070" font-family="Arial" font-size="15pt" font-weight="bold"/>
																						<format basic-type="xsd" datatype="string"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</marker>
																	<newline/>
																	<newline/>
																	<text fixtext="Location: ">
																		<styles color="#808080" font-family="Arial" font-size="small" font-weight="bold"/>
																	</text>
																	<condition>
																		<children>
																			<conditionbranch xpath="not(Address or  Address_EU)">
																				<children>
																					<template subtype="element" match="Location">
																						<editorproperties autoaddname="1" editable="1" adding="no" markupmode="hide"/>
																						<children>
																							<combobox>
																								<children>
																									<content>
																										<format basic-type="xsd" datatype="string"/>
																									</content>
																								</children>
																								<selectoption description="US" value="US"/>
																								<selectoption description="EU" value="EU"/>
																							</combobox>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<template subtype="element" match="Location">
																						<editorproperties autoaddname="1" editable="0" adding="no" markupmode="hide"/>
																						<children>
																							<content>
																								<styles color="#808080" font-weight="bold"/>
																								<format basic-type="xsd" datatype="string"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</paragraph>
														</children>
													</conditionbranch>
													<conditionbranch xpath="$SV_OutputFormat = &apos;RTF&apos; or $SV_OutputFormat = &apos;Word2007&apos;">
														<children>
															<newline break="page"/>
															<paragraph>
																<children>
																	<newline/>
																	<marker xpath="." name="toc">
																		<children>
																			<template subtype="element" match="Name">
																				<editorproperties adding="no"/>
																				<children>
																					<content>
																						<styles color="#707070" font-family="Arial" font-size="15pt" font-weight="bold"/>
																						<format basic-type="xsd" datatype="string"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</marker>
																	<newline/>
																	<newline/>
																	<text fixtext="Location: ">
																		<styles color="#808080" font-family="Arial" font-size="small" font-weight="bold"/>
																	</text>
																	<condition>
																		<children>
																			<conditionbranch xpath="not(Address or  Address_EU)">
																				<children>
																					<template subtype="element" match="Location">
																						<editorproperties autoaddname="1" editable="1" adding="no" markupmode="hide"/>
																						<children>
																							<combobox>
																								<children>
																									<content>
																										<format basic-type="xsd" datatype="string"/>
																									</content>
																								</children>
																								<selectoption description="US" value="US"/>
																								<selectoption description="EU" value="EU"/>
																							</combobox>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<template subtype="element" match="Location">
																						<editorproperties autoaddname="1" editable="0" adding="no" markupmode="hide"/>
																						<children>
																							<content>
																								<styles color="#808080" font-weight="bold"/>
																								<format basic-type="xsd" datatype="string"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</paragraph>
														</children>
													</conditionbranch>
													<conditionbranch xpath="$SV_OutputFormat = &apos;PDF&apos;">
														<children>
															<paragraph>
																<children>
																	<newline/>
																	<marker xpath="." name="toc">
																		<children>
																			<template subtype="element" match="Name">
																				<editorproperties adding="no"/>
																				<children>
																					<content>
																						<styles color="#707070" font-family="Arial" font-size="15pt" font-weight="bold"/>
																						<format basic-type="xsd" datatype="string"/>
																					</content>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</marker>
																	<newline/>
																	<newline/>
																	<text fixtext="Location: ">
																		<styles color="#808080" font-family="Arial" font-size="small" font-weight="bold"/>
																	</text>
																	<condition>
																		<children>
																			<conditionbranch xpath="not(Address or  Address_EU)">
																				<children>
																					<template subtype="element" match="Location">
																						<editorproperties autoaddname="1" editable="1" adding="no" markupmode="hide"/>
																						<children>
																							<combobox>
																								<children>
																									<content>
																										<format basic-type="xsd" datatype="string"/>
																									</content>
																								</children>
																								<selectoption description="US" value="US"/>
																								<selectoption description="EU" value="EU"/>
																							</combobox>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<template subtype="element" match="Location">
																						<editorproperties autoaddname="1" editable="0" adding="no" markupmode="hide"/>
																						<children>
																							<content>
																								<styles color="#808080" font-weight="bold"/>
																								<format basic-type="xsd" datatype="string"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</paragraph>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<tgrid>
												<properties border="1" cellspacing="0"/>
												<styles width="100%"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<properties width="300px"/>
																<styles width="35%"/>
															</tgridcol>
															<tgridcol>
																<styles width="65%"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridbody-rows>
														<children>
															<tgridrow>
																<children>
																	<tgridcell>
																		<properties valign="middle"/>
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath="Location =&quot;US&quot;">
																						<children>
																							<template subtype="element" match="Address">
																								<editorproperties adding="no"/>
																								<children>
																									<tgrid>
																										<properties border="0" cellspacing="4px" width="100%"/>
																										<styles width="100%"/>
																										<children>
																											<tgridbody-cols>
																												<children>
																													<tgridcol>
																														<properties width="30%"/>
																													</tgridcol>
																													<tgridcol>
																														<properties width="70%"/>
																													</tgridcol>
																												</children>
																											</tgridbody-cols>
																											<tgridbody-rows>
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<children>
																																	<text fixtext="Street: ">
																																		<styles font-weight="bold"/>
																																	</text>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<children>
																																	<template subtype="element" match="street">
																																		<editorproperties adding="no"/>
																																		<children>
																																			<content>
																																				<format basic-type="xsd" datatype="string"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<children>
																																	<text fixtext="City:">
																																		<styles font-weight="bold"/>
																																	</text>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<children>
																																	<template subtype="element" match="city">
																																		<editorproperties adding="no"/>
																																		<children>
																																			<content>
																																				<format basic-type="xsd" datatype="string"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<children>
																																	<text fixtext="State &amp; Zip:">
																																		<styles font-weight="bold"/>
																																	</text>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<children>
																																	<template subtype="element" match="state">
																																		<editorproperties adding="no"/>
																																		<children>
																																			<combobox enumeration="1">
																																				<children>
																																					<content>
																																						<format basic-type="xsd" datatype="string"/>
																																					</content>
																																				</children>
																																			</combobox>
																																		</children>
																																		<variables/>
																																	</template>
																																	<text fixtext=" "/>
																																	<template subtype="element" match="zip">
																																		<editorproperties adding="no"/>
																																		<children>
																																			<editfield>
																																				<children>
																																					<content>
																																						<format basic-type="xsd" datatype="integer"/>
																																					</content>
																																				</children>
																																			</editfield>
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
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="Location =&quot;EU&quot;">
																						<children>
																							<template subtype="element" match="Address">
																								<children>
																									<tgrid>
																										<properties border="0" cellspacing="4px" width="100%"/>
																										<styles width="100%"/>
																										<children>
																											<tgridbody-cols>
																												<children>
																													<tgridcol>
																														<properties width="30%"/>
																													</tgridcol>
																													<tgridcol>
																														<properties width="70%"/>
																													</tgridcol>
																												</children>
																											</tgridbody-cols>
																											<tgridbody-rows>
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<children>
																																	<text fixtext="Street:">
																																		<styles font-weight="bold"/>
																																	</text>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<children>
																																	<template subtype="element" match="street">
																																		<editorproperties adding="no"/>
																																		<children>
																																			<editfield>
																																				<children>
																																					<content>
																																						<format basic-type="xsd" datatype="string"/>
																																					</content>
																																				</children>
																																			</editfield>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<children>
																																	<text fixtext="City:">
																																		<styles font-weight="bold"/>
																																	</text>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<children>
																																	<template subtype="element" match="city">
																																		<editorproperties adding="no"/>
																																		<children>
																																			<editfield>
																																				<children>
																																					<content>
																																						<format basic-type="xsd" datatype="string"/>
																																					</content>
																																				</children>
																																			</editfield>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<children>
																																	<text fixtext="Post Code:">
																																		<styles font-weight="bold"/>
																																	</text>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<children>
																																	<template subtype="element" match="state">
																																		<children>
																																			<editfield>
																																				<styles width="0.18in"/>
																																				<children>
																																					<content>
																																						<format basic-type="xsd" datatype="integer"/>
																																					</content>
																																				</children>
																																			</editfield>
																																		</children>
																																		<variables/>
																																	</template>
																																	<text fixtext="-"/>
																																	<template subtype="element" match="zip">
																																		<children>
																																			<editfield>
																																				<styles width="0.69in"/>
																																				<children>
																																					<content>
																																						<format basic-type="xsd" datatype="integer"/>
																																					</content>
																																				</children>
																																			</editfield>
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
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<properties valign="top"/>
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath="Location">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos;">
																										<children>
																											<tgrid>
																												<properties border="0" width="100%"/>
																												<styles width="100%"/>
																												<children>
																													<tgridbody-cols>
																														<children>
																															<tgridcol>
																																<properties width="100px"/>
																															</tgridcol>
																															<tgridcol/>
																														</children>
																													</tgridbody-cols>
																													<tgridbody-rows>
																														<children>
																															<tgridrow>
																																<children>
																																	<tgridcell>
																																		<children>
																																			<image>
																																				<properties _xwidth="$MapWidth" height="300"/>
																																				<target>
																																					<xpath value="iri-to-uri(for $full_addr in  if ( Location =&quot;US&quot; )
then concat(Address/street, &apos;,&apos;, Address/city, &apos;,&apos; , Address/state, &apos;,&apos;, Address/zip)
else concat(Address/street, &apos;,&apos;, Address/city, &apos;,&apos; , Address/state, &apos;,&apos;, Address/zip)
return
  concat( &apos;http://maps.google.com/maps/api/staticmap?center=&apos;, $full_addr,
  &apos;&amp;zoom=&apos;, $Zoom, &apos;&amp;maptype=&apos;, $MapType,
  &apos;&amp;size=&apos;, $MapWidth, &apos;x300&amp;sensor=false&amp;markers=color:red|&apos;, $full_addr))"/>
																																				</target>
																																			</image>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<properties valign="top"/>
																																		<children>
																																			<button>
																																				<styles width="0.75in"/>
																																				<children>
																																					<text fixtext="Zoom In">
																																						<styles font-size="smaller"/>
																																					</text>
																																				</children>
																																				<action>
																																					<none/>
																																				</action>
																																				<authentic-event-handlers OnClick="ZoomIn"/>
																																			</button>
																																			<newline/>
																																			<button>
																																				<styles width="0.75in"/>
																																				<children>
																																					<text fixtext="Zoom Out">
																																						<styles font-size="smaller"/>
																																					</text>
																																				</children>
																																				<action>
																																					<none/>
																																				</action>
																																				<authentic-event-handlers OnClick="ZoomOut"/>
																																			</button>
																																			<newline/>
																																			<newline/>
																																			<button>
																																				<styles width="0.75in"/>
																																				<children>
																																					<text fixtext="Roadmap">
																																						<styles font-size="smaller"/>
																																					</text>
																																				</children>
																																				<action>
																																					<none/>
																																				</action>
																																				<authentic-event-handlers OnClick="TypeRoadmap"/>
																																			</button>
																																			<newline/>
																																			<button>
																																				<styles width="0.75in"/>
																																				<children>
																																					<text fixtext="Satellite">
																																						<styles font-size="smaller"/>
																																					</text>
																																				</children>
																																				<action>
																																					<none/>
																																				</action>
																																				<authentic-event-handlers OnClick="TypeSatellite"/>
																																			</button>
																																			<newline/>
																																			<button>
																																				<styles width="0.75in"/>
																																				<children>
																																					<text fixtext="Hybrid">
																																						<styles font-size="smaller"/>
																																					</text>
																																				</children>
																																				<action>
																																					<none/>
																																				</action>
																																				<authentic-event-handlers OnClick="TypeHybrid"/>
																																			</button>
																																			<newline/>
																																			<newline/>
																																			<button>
																																				<styles width="0.75in"/>
																																				<children>
																																					<text fixtext="Bigger =&gt;">
																																						<styles font-size="smaller"/>
																																					</text>
																																				</children>
																																				<action>
																																					<none/>
																																				</action>
																																				<authentic-event-handlers OnClick="MapBigger"/>
																																			</button>
																																			<newline/>
																																			<button>
																																				<styles width="0.75in"/>
																																				<children>
																																					<text fixtext="Smaller &lt;=">
																																						<styles font-size="smaller"/>
																																					</text>
																																				</children>
																																				<action>
																																					<none/>
																																				</action>
																																				<authentic-event-handlers OnClick="MapSmaller"/>
																																			</button>
																																			<newline/>
																																		</children>
																																	</tgridcell>
																																</children>
																															</tgridrow>
																														</children>
																													</tgridbody-rows>
																												</children>
																											</tgrid>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<image>
																												<properties _xwidth="if ($SV_OutputFormat eq &apos;RTF&apos; or $SV_OutputFormat eq &apos;Word2007&apos;) then 400 else 300" height="300"/>
																												<target>
																													<xpath value="iri-to-uri(for $full_addr in  if ( Location =&quot;US&quot; )
then concat( Address/street, &apos;,&apos;, Address/city, &apos;,&apos; , Address/state, &apos;,&apos;, Address/zip )
else concat(Address/street, &apos;,&apos;, Address/city, &apos;,&apos; , Address/state, &apos;,&apos;, Address/zip)
return
  concat( &apos;http://maps.google.com/maps/api/staticmap?center=&apos;, $full_addr,
  &apos;&amp;zoom=&apos;, $Zoom, &apos;&amp;maptype=&apos;, $MapType,
  &apos;&amp;size=&apos;, if ($SV_OutputFormat eq &apos;RTF&apos; or $SV_OutputFormat eq &apos;Word2007&apos;) then &apos;400&apos; else &apos;300&apos;, &apos;x300&amp;sensor=false&amp;markers=color:red|&apos;, $full_addr))"/>
																												</target>
																											</image>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
															<tgridrow>
																<children>
																	<tgridcell>
																		<properties valign="middle"/>
																		<children>
																			<tgrid>
																				<properties border="0" cellspacing="4" width="100%"/>
																				<styles width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol>
																								<properties width="30%"/>
																							</tgridcol>
																							<tgridcol>
																								<properties width="70%"/>
																							</tgridcol>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Phone:">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="Phone">
																												<editorproperties adding="no"/>
																												<children>
																													<content>
																														<format basic-type="xsd" datatype="string"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Fax:">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="Fax">
																												<editorproperties autoaddname="1" editable="1" adding="no"/>
																												<children>
																													<content>
																														<editorproperties editable="1"/>
																														<format basic-type="xsd" datatype="string"/>
																													</content>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="E-mail:">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="EMail">
																												<editorproperties adding="no"/>
																												<children>
																													<link>
																														<children>
																															<content>
																																<format basic-type="xsd" datatype="string"/>
																															</content>
																														</children>
																														<action>
																															<none/>
																														</action>
																														<hyperlink>
																															<fixtext value="mailto:"/>
																															<xpath value="."/>
																														</hyperlink>
																													</link>
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
																	</tgridcell>
																	<tgridcell joinabove="1"/>
																</children>
															</tgridrow>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
											<newline/>
											<condition>
												<children>
													<conditionbranch xpath="Location=&quot;US&quot;">
														<children>
															<template subtype="element" match="Address">
																<editorproperties adding="no"/>
																<children>
																	<template subtype="element" match="city">
																		<editorproperties autoaddname="1" editable="0" adding="no" markupmode="hide"/>
																		<children>
																			<content>
																				<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline"/>
																				<format basic-type="xsd" datatype="string"/>
																			</content>
																		</children>
																		<variables/>
																	</template>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
													<conditionbranch xpath="Location=&quot;EU&quot;">
														<children>
															<template subtype="element" match="Address">
																<children>
																	<template subtype="element" match="city">
																		<editorproperties autoaddname="1" editable="0" adding="no" markupmode="hide"/>
																		<children>
																			<content>
																				<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline"/>
																				<format basic-type="xsd" datatype="string"/>
																			</content>
																		</children>
																		<variables/>
																	</template>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<condition>
												<children>
													<conditionbranch xpath="Location">
														<children>
															<text fixtext=" Office Description:">
																<styles color="#004080" font-family="Arial" font-size="10pt" font-weight="bold" text-decoration="underline"/>
															</text>
															<newline/>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<condition>
												<children>
													<conditionbranch xpath="Location =&quot;US&quot;">
														<children>
															<paragraph paragraphtag="p">
																<children>
																	<text fixtext="The company was established "/>
																	<text fixtext="in Beverly in 1995">
																		<styles font-weight="bold"/>
																	</text>
																	<text fixtext=" as a privately held software company. Since 1996, Nanonull has been actively involved in developing nanoelectronic software technologies. It released the first version of its acclaimed "/>
																	<text fixtext="NanoSoft Development Suit">
																		<styles font-style="italic"/>
																	</text>
																	<text fixtext="e in February 1999. Also in 1999, Nanonull increased its capital base with investment from a consortium of private investment firms. The company has been expanding rapidly ever since. "/>
																</children>
															</paragraph>
															<paragraph paragraphtag="p">
																<children>
																	<text fixtext="Due to the fact that nanoelectronic software components are new and that sales are restricted to corporate customers, Nanonull and its product line have not received much media publicity in the company&amp;apos;s early years. This has however changed in recent months as trade journals have realized the importance of this revolutionary technology."/>
																</children>
															</paragraph>
														</children>
													</conditionbranch>
													<conditionbranch xpath="Location =&quot;EU&quot;">
														<children>
															<paragraph paragraphtag="p">
																<children>
																	<text fixtext="In May 2000, Nanonull Europe was set up in Vienna. At the start of the subsidiary&apos;s operations, the team consisted of five research scientists and one administrative staff. By the end of 2000, the number of research scientists had risen to nine. Nanonull Europe will play the central role in all new research and will work closely with the Engineering team in Beverly."/>
																</children>
															</paragraph>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<newline/>
										</children>
										<variables>
											<variable name="Zoom" value="16" valuetype="xs:integer" editable="1"/>
											<variable name="MapType" value="&apos;roadmap&apos;" valuetype="xs:string" editable="1"/>
										</variables>
									</template>
									<newline/>
								</children>
								<variables>
									<variable name="MapWidth" value="300" valuetype="xs:integer" editable="1"/>
								</variables>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons>
		<textstateicon match="bold" iconfile="bold.bmp"/>
		<textstateicon match="italic" iconfile="italic.bmp"/>
		<separator/>
		<scripted-button match="JumpTo" text="Jump To..." tooltip="Quick jump to one of the offices"/>
	</authentic-custom-toolbar-buttons>
</structure>
