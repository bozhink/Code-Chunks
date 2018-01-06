<?xml version="1.0" encoding="UTF-8"?>
<structure version="16" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="EmployeesWithDetails.xsd"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<mainparts/>
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
							<newline/>
							<tgrid>
								<properties width="100%"/>
								<styles border="none" border-style="none" font-family="Verdana" font-size="10pt" text-align="right"/>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol/>
											<tgridcol/>
										</children>
									</tgridbody-cols>
									<tgridbody-rows>
										<children>
											<tgridrow>
												<children>
													<tgridcell>
														<styles text-align="left"/>
														<children>
															<text fixtext="Nanonull Inc.">
																<styles font-size="20pt" font-weight="bold"/>
															</text>
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
										</children>
									</tgridbody-rows>
								</children>
							</tgrid>
							<text fixtext=" "/>
							<newline/>
							<tgrid>
								<properties border="1" cellspacing="0"/>
								<styles background-color="#ffffe9" width="100%"/>
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
														<properties valign="middle"/>
														<children>
															<tgrid>
																<properties border="0" cellspacing="4" width="100%"/>
																<styles width="100%"/>
																<children>
																	<tgridbody-cols>
																		<children>
																			<tgridcol/>
																			<tgridcol/>
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
																							<text fixtext="900 Cummings Center"/>
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
																							<text fixtext="Beverly"/>
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
																							<text fixtext="MA 01915"/>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
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
																							<template subtype="uservariable" match="$NanonullPhone">
																								<children>
																									<content subtype="regular"/>
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
																							<text fixtext="+1 (321) 555 5155 - 9"/>
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
																							<link>
																								<children>
																									<text fixtext="office@nanonull.com"/>
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
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																	</tgridbody-rows>
																</children>
															</tgrid>
														</children>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridbody-rows>
								</children>
							</tgrid>
							<template subtype="element" match="Company">
								<children>
									<newline/>
									<template subtype="userdefined" levelflag="1" match=".">
										<children>
											<paragraph paragraphtag="h2">
												<styles border-bottom="2px solid"/>
												<children>
													<text fixtext="Selected Employees"/>
												</children>
											</paragraph>
											<tgrid>
												<properties border="1"/>
												<styles border="1px solid black" border-collapse="collapse" width="100%"/>
												<children>
													<tgridbody-cols>
														<children>
															<tgridcol>
																<styles width="30%"/>
															</tgridcol>
															<tgridcol>
																<styles width="35%"/>
															</tgridcol>
															<tgridcol>
																<styles width="35%"/>
															</tgridcol>
														</children>
													</tgridbody-cols>
													<tgridheader-rows>
														<children>
															<tgridrow>
																<styles background-color="#ffc057"/>
																<children>
																	<tgridcell>
																		<styles border="1px solid black" padding-left="5px" padding-right="5px" text-align="center"/>
																		<children>
																			<text fixtext="Name">
																				<styles text-align="center"/>
																			</text>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles border="1px solid black" padding-left="5px" padding-right="5px" text-align="center"/>
																		<children>
																			<text fixtext="Title"/>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<styles border="1px solid black" text-align="center" width="60px"/>
																		<children>
																			<text fixtext="Extension"/>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
													</tgridheader-rows>
													<tgridbody-rows>
														<children>
															<template subtype="element" match="Employees">
																<children>
																	<template subtype="element" match="Employee">
																		<children>
																			<tgridrow>
																				<properties _xbgcolor="if ( $personnumber mod 2 = 0 ) then &apos;#ffffa0&apos; else &apos;#ffffe9&apos;"/>
																				<children>
																					<tgridcell>
																						<styles border="1px solid black" padding-left="5px" padding-right="5px" text-align="left"/>
																						<children>
																							<template subtype="element" match="FirstName">
																								<children>
																									<content subtype="regular"/>
																								</children>
																								<variables/>
																							</template>
																							<text fixtext=" ">
																								<styles text-align="center"/>
																							</text>
																							<template subtype="element" match="LastName">
																								<children>
																									<content subtype="regular"/>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid black" padding-left="5px" padding-right="5px" text-align="left"/>
																						<children>
																							<template subtype="element" match="Title">
																								<children>
																									<content subtype="regular"/>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																					<tgridcell>
																						<styles border="1px solid black" text-align="center" width="60px"/>
																						<children>
																							<template subtype="element" match="PhoneExt">
																								<children>
																									<content subtype="regular"/>
																								</children>
																								<variables/>
																							</template>
																						</children>
																					</tgridcell>
																				</children>
																			</tgridrow>
																		</children>
																		<variables>
																			<variable name="personnumber" value="position()" valuetype="&lt;auto&gt;"/>
																		</variables>
																	</template>
																</children>
																<variables/>
															</template>
														</children>
													</tgridbody-rows>
												</children>
											</tgrid>
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
						<variables>
							<variable name="NanonullPhone" value="&apos;+1 (321) 555 5155&apos;" valuetype="&lt;auto&gt;"/>
						</variables>
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
