<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="21">
	<resources>
		<datasources>
			<datasource name="altova">
				<properties JDBCDriver="sun.jdbc.odbc.JdbcOdbcDriver" JDBCDatabaseURL="jdbc:odbc:;DRIVER=Microsoft Access Driver (*.mdb);DBQ=altova.mdb;" DBDataSource="altova.mdb" DBCatalog="altova" OLEDBProvider="Microsoft.Jet.OLEDB.4.0"/>
				<database_connection database_kind="MS Access" import_kind="ADO" version="04.00.0000" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=altova.mdb" name="altova" path="altova" use_driver_for_retrieval="Yes" allow_background_retrieval="No">
					<properties>
						<property name="Database Kind" value="MS Access"/>
						<property name="Import Kind" value="ADO"/>
						<property name="Root Object" value="altova"/>
						<property name="Data Source" value="altova.mdb"/>
						<property name="Provider" value="Microsoft.Jet.OLEDB.4.0"/>
						<property name="User ID"/>
						<property name="Password"/>
						<property name="Persist Security Info"/>
						<property name="Jet OLEDB:System Database"/>
						<property name="Jet OLEDB:Sandbox Mode"/>
						<property name="Jet OLEDB:Exclusive Async Delay"/>
						<property name="Jet OLEDB:Flush Transaction Timeout"/>
						<property name="Jet OLEDB:Implicit Commit Sync"/>
						<property name="Jet OLEDB:Lock Delay"/>
						<property name="Jet OLEDB:Lock Retry"/>
						<property name="Jet OLEDB:Max Buffer Size"/>
						<property name="Jet OLEDB:Max Locks Per File"/>
						<property name="Jet OLEDB:Page Locks to Table Lock"/>
						<property name="Jet OLEDB:Page Timeout"/>
						<property name="Jet OLEDB:Recycle Long-Valued Pages"/>
						<property name="Jet OLEDB:Shared Async Delay"/>
						<property name="Jet OLEDB:User Commit Sync"/>
						<property name="Jet OLEDB:Compact Without Replica Repair"/>
						<property name="Jet OLEDB:Create System Database"/>
						<property name="Jet OLEDB:Database Locking Mode"/>
						<property name="Jet OLEDB:Database Password"/>
						<property name="Jet OLEDB:New Database Password"/>
						<property name="Jet OLEDB:Registry Path"/>
					</properties>
					<LocalViewStorage>
						<LocalViewElement SQL="SELECT [First], [Last], [Title], [PhoneExt], [EMail] FROM [Person] WHERE [ForeignKey] = :DepartmentID AND [Title] LIKE :patternForTitle">
							<PathElement Name="altova" Kind="DataSource"/>
							<PathElement Name="altova" Kind="Database"/>
							<PathElement Name="PersonsByDepartmentAndTitle" Kind="Select Statement"/>
							<Parameters>
								<Parameter name="DepartmentID" type="INT" null="Yes">
									<Properties/>
								</Parameter>
								<Parameter name="patternForTitle" type="TEXT" size="255" null="Yes">
									<Properties/>
								</Parameter>
							</Parameters>
						</LocalViewElement>
					</LocalViewStorage>
					<LocalRelationsStorage>
						<LocalRelationElement name="Untitled">
							<SourceTable>
								<PathElement Name="altova" Kind="DataSource"/>
								<PathElement Name="altova" Kind="Database"/>
								<PathElement Name="PersonsByDepartmentAndTitle" Kind="Select Statement"/>
							</SourceTable>
							<SourceColumns>
								<Column name="DepartmentID" kind="Parameter"/>
							</SourceColumns>
							<DestinationTable>
								<PathElement Name="altova" Kind="DataSource"/>
								<PathElement Name="altova" Kind="Database"/>
								<PathElement Name="Department" Kind="Table"/>
							</DestinationTable>
							<DestinationColumns>
								<Column name="PrimaryKey" kind="Column"/>
							</DestinationColumns>
						</LocalRelationElement>
					</LocalRelationsStorage>
					<RecordSetStructureStorage/>
				</database_connection>
			</datasource>
		</datasources>
	</resources>
	<component name="defaultmap2" blackbox="0" uid="67602616" editable="1">
		<properties XSLTTargetEncoding="UTF-8" SelectedLanguage="builtin" MakePathsAbsoluteOnGeneration="1"/>
		<structure>
			<children>
				<component name="constant" library="core" uid="67651956" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="233"/>
					</targets>
					<view ltx="341" lty="111" rbx="392" rby="129"/>
					<data>
						<constant value="@" datatype="string"/>
						<wsdl/>
					</data>
				</component>
				<component name="concat" library="core" uid="67651955" kind="5" growable="1" growablebasename="value">
					<properties/>
					<sources>
						<datapoint pos="0" key="229"/>
						<datapoint pos="1" key="230"/>
						<datapoint pos="2" key="231"/>
					</sources>
					<targets>
						<datapoint pos="0" key="232"/>
					</targets>
					<view ltx="443" lty="53" rbx="528" rby="129"/>
				</component>
				<component name="value-map" library="core" uid="67651953" kind="23">
					<properties/>
					<sources>
						<datapoint pos="0" key="227"/>
					</sources>
					<targets>
						<datapoint pos="0" key="228"/>
					</targets>
					<view ltx="284" lty="53" rbx="361" rby="92"/>
					<data>
						<wsdl/>
						<valuemap>
							<valuemapTable>
								<entry from="1" to="Nanonull, Inc."/>
								<entry from="2" to="Nanonull Partners, Inc."/>
							</valuemapTable>
							<input name="input" type="integer"/>
							<result name="result" type="string"/>
						</valuemap>
					</data>
				</component>
				<component name="pattern" library="core" uid="67651961" kind="6">
					<properties/>
					<sources>
						<datapoint pos="0" key="269"/>
					</sources>
					<targets>
						<datapoint pos="0" key="270"/>
					</targets>
					<view ltx="135" lty="327" rbx="218" rby="366"/>
					<data>
						<input datatype="string"/>
						<wsdl/>
						<parameter usageKind="input" name="pattern" optional="1"/>
					</data>
				</component>
				<component name="constant" library="core" uid="67651958" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="268"/>
					</targets>
					<view ltx="-16" lty="348" rbx="86" rby="366"/>
					<data>
						<constant value="%Engineer%" datatype="string"/>
						<wsdl/>
					</data>
				</component>
				<component name="PersonsByDepartmentAndTitle" library="db" uid="67651957" kind="28">
					<properties/>
					<view ltx="270" lty="172" rbx="575" rby="280"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
								</namespaces>
							</header>
							<entry name="procedure" inpkey="249" expanded="1"/>
							<entry name="PersonsByDepartmentAndTitle" displayselectionmode="selection"/>
							<entry name="PersonsByDepartmentAndTitle" expanded="1">
								<condition>
									<expression>
										<function name="equal" library="core">
											<expression>
												<attribute name="input"/>
											</expression>
											<expression>
												<constant value="true" datatype="boolean"/>
											</expression>
										</function>
									</expression>
								</condition>
								<entry name="patternForTitle" type="attribute" inpkey="250"/>
							</entry>
						</root>
						<root rootindex="1">
							<header>
								<namespaces>
									<namespace/>
								</namespaces>
							</header>
							<entry name="PersonsByDepartmentAndTitle" displayselectionmode="selection"/>
							<entry name="PersonsByDepartmentAndTitle" outkey="251" expanded="1">
								<condition>
									<expression>
										<function name="equal" library="core">
											<expression>
												<attribute name="input"/>
											</expression>
											<expression>
												<constant value="false" datatype="boolean"/>
											</expression>
										</function>
									</expression>
								</condition>
								<entry name="PersonsByDepartmentAndTitle" expanded="1">
									<entry name="First" type="attribute" outkey="252"/>
									<entry name="Last" type="attribute" outkey="253"/>
									<entry name="EMail" type="attribute" outkey="254"/>
									<entry name="PhoneExt" type="attribute" outkey="255"/>
									<entry name="Title" type="attribute" outkey="256"/>
								</entry>
							</entry>
						</root>
						<wsdl/>
					</data>
				</component>
				<component name="structure" library="db" uid="67651946" kind="15">
					<properties/>
					<view ltx="-98" lty="41" rbx="208" rby="259"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces/>
							</header>
							<entry name="document" expanded="1">
								<entry name="Department" type="table" expanded="1">
									<entry name="ForeignKey" outkey="213"/>
									<entry name="Name" outkey="203"/>
									<entry name="PersonsByDepartmentAndTitle|DepartmentID" type="routine" outkey="274"/>
								</entry>
							</entry>
						</root>
						<wsdl/>
						<database ref="altova">
							<data>
								<selections>
									<selection>
										<PathElement Name="altova" Kind="DataSource"/>
										<PathElement Name="altova" Kind="Database"/>
										<PathElement Name="Department" Kind="Table"/>
									</selection>
									<selection>
										<PathElement Name="altova" Kind="DataSource"/>
										<PathElement Name="altova" Kind="Database"/>
										<PathElement Name="PersonsByDepartmentAndTitle" Kind="Select Statement"/>
									</selection>
								</selections>
							</data>
						</database>
					</data>
				</component>
				<component name="EmployeesWithDetails" library="xml" uid="67651952" kind="14">
					<properties XSLTTargetEncoding="UTF-8" XSLTDefaultOutput="1"/>
					<view ltx="674" lty="41" rbx="847" rby="246"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
									<namespace uid="http://www.altova.com/mapforce"/>
								</namespaces>
							</header>
							<entry name="FileInstance" ns="1" expanded="1">
								<entry name="document" ns="1" expanded="1" casttotargettypemode="cast-in-subtree">
									<entry name="Company" expanded="1">
										<entry name="Employees" expanded="1">
											<entry name="Employee" inpkey="276" expanded="1">
												<entry name="Department" type="attribute" inpkey="277"/>
												<entry name="FirstName" inpkey="278"/>
												<entry name="LastName" inpkey="279"/>
												<entry name="Title" inpkey="280"/>
												<entry name="PhoneExt" inpkey="281"/>
												<entry name="Email" inpkey="282"/>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="EmployeesWithDetails.xsd" instanceroot="{}Company" sps="EmployeesWithDetails.sps"/>
						<wsdl/>
					</data>
				</component>
			</children>
			<graph directed="1">
				<edges/>
				<vertices>
					<vertex vertexkey="203">
						<edges>
							<edge vertexkey="229" edgekey="234"/>
						</edges>
					</vertex>
					<vertex vertexkey="213">
						<edges>
							<edge vertexkey="227" edgekey="235"/>
						</edges>
					</vertex>
					<vertex vertexkey="228">
						<edges>
							<edge vertexkey="231" edgekey="242"/>
						</edges>
					</vertex>
					<vertex vertexkey="232">
						<edges>
							<edge vertexkey="277" edgekey="283"/>
						</edges>
					</vertex>
					<vertex vertexkey="233">
						<edges>
							<edge vertexkey="230" edgekey="244"/>
						</edges>
					</vertex>
					<vertex vertexkey="251">
						<edges>
							<edge vertexkey="276" edgekey="284"/>
						</edges>
					</vertex>
					<vertex vertexkey="252">
						<edges>
							<edge vertexkey="278" edgekey="285"/>
						</edges>
					</vertex>
					<vertex vertexkey="253">
						<edges>
							<edge vertexkey="279" edgekey="286"/>
						</edges>
					</vertex>
					<vertex vertexkey="254">
						<edges>
							<edge vertexkey="282" edgekey="287"/>
						</edges>
					</vertex>
					<vertex vertexkey="255">
						<edges>
							<edge vertexkey="281" edgekey="288"/>
						</edges>
					</vertex>
					<vertex vertexkey="256">
						<edges>
							<edge vertexkey="280" edgekey="289"/>
						</edges>
					</vertex>
					<vertex vertexkey="268">
						<edges>
							<edge vertexkey="269" edgekey="271"/>
						</edges>
					</vertex>
					<vertex vertexkey="270">
						<edges>
							<edge vertexkey="250" edgekey="273"/>
						</edges>
					</vertex>
					<vertex vertexkey="274">
						<edges>
							<edge vertexkey="249" edgekey="275"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
