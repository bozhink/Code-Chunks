<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="18">
	<component name="defaultmap1" blackbox="0" uid="24" editable="1">
		<properties SelectedLanguage="java" MakePathsAbsoluteOnGeneration="1"/>
		<structure>
			<children>
				<component name="constant" library="core" uid="20" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="7"/>
					</targets>
					<view ltx="203" lty="548" rbx="255" rby="566"/>
					<data>
						<constant value="10" datatype="string"/>
						<wsdl/>
					</data>
				</component>
				<component name="starts-with" library="core" uid="18" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="64"/>
						<datapoint pos="1" key="5"/>
					</sources>
					<targets>
						<datapoint pos="0" key="10"/>
					</targets>
					<view ltx="231" lty="361" rbx="311" rby="417"/>
				</component>
				<component name="constant" library="core" uid="19" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="4"/>
					</targets>
					<view ltx="152" lty="335" rbx="190" rby="353"/>
					<data>
						<constant value="1" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="Rows 1, n=dyn" library="core" uid="11" kind="3">
					<properties/>
					<sources>
						<datapoint pos="0" key="49"/>
						<datapoint pos="1" key="26"/>
					</sources>
					<targets>
						<datapoint pos="0" key="1"/>
						<datapoint/>
					</targets>
					<view ltx="325" lty="88" rbx="428" rby="144"/>
				</component>
				<component name="concat" library="core" uid="13" kind="5" growable="1" growablebasename="value">
					<properties/>
					<sources>
						<datapoint pos="0" key="23"/>
						<datapoint pos="1" key="41"/>
					</sources>
					<targets>
						<datapoint pos="0" key="16"/>
					</targets>
					<view ltx="309" lty="184" rbx="384" rby="242"/>
				</component>
				<component name="constant" library="core" uid="10" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="19"/>
					</targets>
					<view ltx="146" lty="17" rbx="184" rby="35"/>
					<data>
						<constant value="1" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="constant" library="core" uid="14" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="22"/>
					</targets>
					<view ltx="201" lty="243" rbx="253" rby="261"/>
					<data>
						<constant value="10" datatype="string"/>
						<wsdl/>
					</data>
				</component>
				<component name="starts-with" library="core" uid="9" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="43"/>
						<datapoint pos="1" key="20"/>
					</sources>
					<targets>
						<datapoint pos="0" key="25"/>
					</targets>
					<view ltx="228" lty="44" rbx="308" rby="100"/>
				</component>
				<component name="excel" library="xlsx" uid="8" kind="26">
					<properties/>
					<view ltx="5" lty="44" rbx="178" rby="232"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
									<namespace uid="http://www.altova.com/mapforce"/>
								</namespaces>
							</header>
							<entry name="FileInstance" ns="1" expanded="1">
								<entry name="document" ns="1" expanded="1">
									<entry name="Workbook" expanded="1">
										<entry name="Worksheet" expanded="1">
											<ranges>
												<range id="1" start="1"/>
											</ranges>
											<entry name="Row" expanded="1" displayselectionmode="selection">
												<entry name="Cell" datatype="string"/>
											</entry>
											<entry name="Row" outkey="48" expanded="1">
												<condition>
													<expression>
														<function name="is-range-id">
															<expression>
																<constant value="1" datatype="long"/>
															</expression>
														</function>
													</expression>
												</condition>
												<entry name="Cell" expanded="1" displayselectionmode="selection" datatype="string"/>
												<entry name="Cell" outkey="51" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="1" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" outkey="45" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="2" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" outkey="40" datatype="double">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="3" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="n"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="4" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="5" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<wsdl/>
						<excel inputinstance="Altova.xlsx" outputinstance="Altova.xlsx"/>
					</data>
				</component>
				<component name="constant" library="core" uid="1" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="28"/>
					</targets>
					<view ltx="142" lty="649" rbx="180" rby="667"/>
					<data>
						<constant value="4" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="equal" library="core" uid="2" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="29"/>
						<datapoint pos="1" key="69"/>
					</sources>
					<targets>
						<datapoint pos="0" key="31"/>
					</targets>
					<view ltx="213" lty="672" rbx="266" rby="728"/>
				</component>
				<component name="concat" library="core" uid="16" kind="5" growable="1" growablebasename="value">
					<properties/>
					<sources>
						<datapoint pos="0" key="8"/>
						<datapoint pos="1" key="66"/>
					</sources>
					<targets>
						<datapoint pos="0" key="34"/>
					</targets>
					<view ltx="311" lty="502" rbx="386" rby="560"/>
				</component>
				<component name="Rows 1, n=dyn" library="core" uid="17" kind="3">
					<properties/>
					<sources>
						<datapoint pos="0" key="55"/>
						<datapoint pos="1" key="11"/>
					</sources>
					<targets>
						<datapoint pos="0" key="37"/>
						<datapoint/>
					</targets>
					<view ltx="331" lty="391" rbx="434" rby="447"/>
				</component>
				<component name="excel" library="xlsx" uid="22" kind="26">
					<properties/>
					<view ltx="10" lty="362" rbx="177" rby="553"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
									<namespace uid="http://www.altova.com/mapforce"/>
								</namespaces>
							</header>
							<entry name="FileInstance" ns="1" expanded="1">
								<entry name="document" ns="1" expanded="1">
									<entry name="Workbook" expanded="1">
										<entry name="Worksheet" expanded="1" displayselectionmode="selection">
											<ranges/>
											<entry name="Row" expanded="1">
												<entry name="Cell" expanded="1" displayselectionmode="selection" datatype="string"/>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="1" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="2" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" expanded="1" datatype="double">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="3" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="n"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" expanded="1" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="4" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" expanded="1" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="5" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
											</entry>
										</entry>
										<entry name="Worksheet" expanded="1">
											<condition>
												<expression>
													<function name="equal-ignorecase" library="xlsx">
														<expression>
															<attribute name="Name"/>
														</expression>
														<expression>
															<constant value="Admin"/>
														</expression>
													</function>
												</expression>
											</condition>
											<ranges>
												<range id="1" start="1"/>
											</ranges>
											<entry name="Row" expanded="1" displayselectionmode="selection">
												<entry name="Cell" datatype="string"/>
											</entry>
											<entry name="Row" outkey="54" expanded="1">
												<condition>
													<expression>
														<function name="is-range-id">
															<expression>
																<constant value="1" datatype="long"/>
															</expression>
														</function>
													</expression>
												</condition>
												<entry name="Cell" displayselectionmode="selection" datatype="string"/>
												<entry name="Cell" outkey="57" annotation="First" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="1" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" outkey="60" annotation="Last" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="2" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" outkey="63" annotation="Phone" datatype="double">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="3" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="n"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="4" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="5" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
											</entry>
										</entry>
										<entry name="Worksheet" expanded="1">
											<condition>
												<expression>
													<function name="equal-ignorecase" library="xlsx">
														<expression>
															<attribute name="Name"/>
														</expression>
														<expression>
															<constant value="Development"/>
														</expression>
													</function>
												</expression>
											</condition>
											<ranges>
												<range id="2" start="1"/>
											</ranges>
											<entry name="Row" expanded="1" displayselectionmode="selection">
												<entry name="Cell" datatype="string"/>
											</entry>
											<entry name="Row" expanded="1">
												<condition>
													<expression>
														<function name="is-range-id">
															<expression>
																<constant value="2" datatype="long"/>
															</expression>
														</function>
													</expression>
												</condition>
												<entry name="Cell" datatype="string"/>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<wsdl/>
						<excel inputinstance="Altova.xlsx" outputinstance="Altova.xlsx"/>
					</data>
				</component>
				<component name="Person" library="core" uid="4" kind="3">
					<properties/>
					<sources>
						<datapoint pos="0" key="72"/>
						<datapoint pos="1" key="32"/>
					</sources>
					<targets>
						<datapoint pos="0" key="13"/>
						<datapoint/>
					</targets>
					<view ltx="284" lty="715" rbx="387" rby="771"/>
				</component>
				<component name="structure" library="db" uid="6" kind="15">
					<properties JDBCDriver="sun.jdbc.odbc.JdbcOdbcDriver" JDBCDatabaseURL="jdbc:odbc:;DRIVER=Microsoft Access Driver (*.mdb);" DBDataSource="altova.mdb" DBCatalog="altova" OLEDBProvider="Microsoft.Jet.OLEDB.4.0" OLEDBOptions="Persist Security Info=false;"/>
					<view ltx="9" lty="672" rbx="172" rby="890"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces/>
							</header>
							<entry name="document" expanded="1">
								<entry name="Department" type="table" expanded="1">
									<entry name="PrimaryKey" outkey="68"/>
									<entry name="Person|ForeignKey" type="table" outkey="71" expanded="1">
										<entry name="First" outkey="74"/>
										<entry name="Last" outkey="77"/>
									</entry>
								</entry>
							</entry>
						</root>
						<wsdl/>
						<database>
							<database_connection database_kind="MS Access" import_kind="ADO" version="04.00.0000" name="altova" path="altova" use_driver_for_retrieval="Yes" allow_background_retrieval="No">
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
								<LocalViewStorage/>
								<LocalRelationsStorage/>
								<selections>
									<selection>
										<PathElement Name="altova" Kind="DataSource"/>
										<PathElement Name="altova" Kind="Database"/>
										<PathElement Name="Address" Kind="Table"/>
									</selection>
									<selection>
										<PathElement Name="altova" Kind="DataSource"/>
										<PathElement Name="altova" Kind="Database"/>
										<PathElement Name="Altova" Kind="Table"/>
									</selection>
									<selection>
										<PathElement Name="altova" Kind="DataSource"/>
										<PathElement Name="altova" Kind="Database"/>
										<PathElement Name="Department" Kind="Table"/>
									</selection>
									<selection>
										<PathElement Name="altova" Kind="DataSource"/>
										<PathElement Name="altova" Kind="Database"/>
										<PathElement Name="Office" Kind="Table"/>
									</selection>
									<selection>
										<PathElement Name="altova" Kind="DataSource"/>
										<PathElement Name="altova" Kind="Database"/>
										<PathElement Name="Person" Kind="Table"/>
									</selection>
								</selections>
							</database_connection>
							<recordset/>
						</database>
					</data>
				</component>
				<component name="excel" library="xlsx" uid="23" kind="26">
					<properties/>
					<view ltx="421" lty="673" rbx="596" rby="894"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
									<namespace uid="http://www.altova.com/mapforce"/>
								</namespaces>
							</header>
							<entry name="FileInstance" ns="1" expanded="1">
								<entry name="document" ns="1" expanded="1">
									<entry name="Workbook" expanded="1">
										<entry name="Worksheet" expanded="1" displayselectionmode="selection">
											<ranges/>
											<entry name="Row" expanded="1">
												<entry name="Cell" datatype="string"/>
											</entry>
										</entry>
										<entry name="Worksheet" expanded="1">
											<condition>
												<expression>
													<function name="equal-ignorecase" library="xlsx">
														<expression>
															<attribute name="Name"/>
														</expression>
														<expression>
															<constant value="Altova"/>
														</expression>
													</function>
												</expression>
											</condition>
											<ranges>
												<range id="1" start="1"/>
											</ranges>
											<entry name="Row" expanded="1" displayselectionmode="selection">
												<entry name="Cell" datatype="string"/>
											</entry>
											<entry name="Row" inpkey="14" expanded="1">
												<condition>
													<expression>
														<function name="is-range-id">
															<expression>
																<constant value="1" datatype="long"/>
															</expression>
														</function>
													</expression>
												</condition>
												<entry name="Cell" displayselectionmode="selection" datatype="string"/>
												<entry name="Cell" inpkey="75" annotation="Person First" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="1" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" inpkey="78" annotation="Person Last" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="2" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="3" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="4" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
												<entry name="Cell" datatype="string">
													<condition>
														<expression>
															<function name="logical-and" library="core">
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="n"/>
																		</expression>
																		<expression>
																			<constant value="5" datatype="long"/>
																		</expression>
																	</function>
																</expression>
																<expression>
																	<function name="equal" library="core">
																		<expression>
																			<attribute name="t"/>
																		</expression>
																		<expression>
																			<constant value="s"/>
																		</expression>
																	</function>
																</expression>
															</function>
														</expression>
													</condition>
												</entry>
											</entry>
										</entry>
										<entry name="Worksheet" expanded="1">
											<condition>
												<expression>
													<function name="equal-ignorecase" library="xlsx">
														<expression>
															<attribute name="Name"/>
														</expression>
														<expression>
															<constant value="Sheet2"/>
														</expression>
													</function>
												</expression>
											</condition>
											<ranges>
												<range id="2" start="1"/>
											</ranges>
											<entry name="Row" expanded="1" displayselectionmode="selection">
												<entry name="Cell" datatype="string"/>
											</entry>
											<entry name="Row" expanded="1">
												<condition>
													<expression>
														<function name="is-range-id">
															<expression>
																<constant value="2" datatype="long"/>
															</expression>
														</function>
													</expression>
												</condition>
												<entry name="Cell" datatype="string"/>
											</entry>
										</entry>
										<entry name="Worksheet" expanded="1">
											<condition>
												<expression>
													<function name="equal-ignorecase" library="xlsx">
														<expression>
															<attribute name="Name"/>
														</expression>
														<expression>
															<constant value="Sheet3"/>
														</expression>
													</function>
												</expression>
											</condition>
											<ranges>
												<range id="3" start="1"/>
											</ranges>
											<entry name="Row" expanded="1" displayselectionmode="selection">
												<entry name="Cell" datatype="string"/>
											</entry>
											<entry name="Row" expanded="1">
												<condition>
													<expression>
														<function name="is-range-id">
															<expression>
																<constant value="3" datatype="long"/>
															</expression>
														</function>
													</expression>
												</condition>
												<entry name="Cell" datatype="string"/>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<wsdl/>
						<excel/>
					</data>
				</component>
				<component name="document" library="xml" uid="15" kind="14">
					<properties XSLTTargetEncoding="UTF-8" XSLTDefaultOutput="1"/>
					<view ltx="463" lty="27" rbx="628" rby="234"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace uid="http://my-company.com/namespace"/>
									<namespace uid="http://www.altova.com/mapforce"/>
								</namespaces>
							</header>
							<entry name="FileInstance" ns="1" expanded="1">
								<entry name="document" ns="1" expanded="1" casttotargettypemode="cast-in-subtree">
									<entry name="Company" expanded="1">
										<entry name="Person" inpkey="2" expanded="1">
											<entry name="First" inpkey="52"/>
											<entry name="Last" inpkey="46"/>
											<entry name="PhoneExt" inpkey="17"/>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="MFCompany.xsd" outputinstance="MFCompany.xml" instanceroot="{http://my-company.com/namespace}Company" userdefinedschemalocation="C:/DOCUME~1/alp/MYDOCU~1/Altova/MapForce2010/MapForceExamples/Tutorial/MFCompany.xsd"/>
						<wsdl/>
					</data>
				</component>
				<component name="document" library="xml" uid="21" kind="14">
					<properties XSLTTargetEncoding="UTF-8"/>
					<view ltx="461" lty="350" rbx="624" rby="554"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace uid="http://my-company.com/namespace"/>
									<namespace uid="http://www.altova.com/mapforce"/>
								</namespaces>
							</header>
							<entry name="FileInstance" ns="1" expanded="1">
								<entry name="document" ns="1" expanded="1" casttotargettypemode="cast-in-subtree">
									<entry name="Company" expanded="1">
										<entry name="Person" inpkey="38" expanded="1">
											<entry name="First" inpkey="58"/>
											<entry name="Last" inpkey="61"/>
											<entry name="PhoneExt" inpkey="35"/>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="MFCompany.xsd" outputinstance="MFCompany2.xml" instanceroot="{http://my-company.com/namespace}Company" userdefinedschemalocation="C:/DOCUME~1/alp/MYDOCU~1/Altova/MapForce2010/MapForceExamples/Tutorial/MFCompany.xsd"/>
						<wsdl/>
					</data>
				</component>
			</children>
			<graph directed="1">
				<edges/>
				<vertices>
					<vertex vertexkey="1">
						<edges>
							<edge vertexkey="2" edgekey="3"/>
						</edges>
					</vertex>
					<vertex vertexkey="4">
						<edges>
							<edge vertexkey="5" edgekey="6"/>
						</edges>
					</vertex>
					<vertex vertexkey="7">
						<edges>
							<edge vertexkey="8" edgekey="9"/>
						</edges>
					</vertex>
					<vertex vertexkey="10">
						<edges>
							<edge vertexkey="11" edgekey="12"/>
						</edges>
					</vertex>
					<vertex vertexkey="13">
						<edges>
							<edge vertexkey="14" edgekey="15"/>
						</edges>
					</vertex>
					<vertex vertexkey="16">
						<edges>
							<edge vertexkey="17" edgekey="18"/>
						</edges>
					</vertex>
					<vertex vertexkey="19">
						<edges>
							<edge vertexkey="20" edgekey="21"/>
						</edges>
					</vertex>
					<vertex vertexkey="22">
						<edges>
							<edge vertexkey="23" edgekey="24"/>
						</edges>
					</vertex>
					<vertex vertexkey="25">
						<edges>
							<edge vertexkey="26" edgekey="27"/>
						</edges>
					</vertex>
					<vertex vertexkey="28">
						<edges>
							<edge vertexkey="29" edgekey="30"/>
						</edges>
					</vertex>
					<vertex vertexkey="31">
						<edges>
							<edge vertexkey="32" edgekey="33"/>
						</edges>
					</vertex>
					<vertex vertexkey="34">
						<edges>
							<edge vertexkey="35" edgekey="36"/>
						</edges>
					</vertex>
					<vertex vertexkey="37">
						<edges>
							<edge vertexkey="38" edgekey="39"/>
						</edges>
					</vertex>
					<vertex vertexkey="40">
						<edges>
							<edge vertexkey="41" edgekey="42"/>
							<edge vertexkey="43" edgekey="44"/>
						</edges>
					</vertex>
					<vertex vertexkey="45">
						<edges>
							<edge vertexkey="46" edgekey="47"/>
						</edges>
					</vertex>
					<vertex vertexkey="48">
						<edges>
							<edge vertexkey="49" edgekey="50"/>
						</edges>
					</vertex>
					<vertex vertexkey="51">
						<edges>
							<edge vertexkey="52" edgekey="53"/>
						</edges>
					</vertex>
					<vertex vertexkey="54">
						<edges>
							<edge vertexkey="55" edgekey="56"/>
						</edges>
					</vertex>
					<vertex vertexkey="57">
						<edges>
							<edge vertexkey="58" edgekey="59"/>
						</edges>
					</vertex>
					<vertex vertexkey="60">
						<edges>
							<edge vertexkey="61" edgekey="62"/>
						</edges>
					</vertex>
					<vertex vertexkey="63">
						<edges>
							<edge vertexkey="64" edgekey="65"/>
							<edge vertexkey="66" edgekey="67"/>
						</edges>
					</vertex>
					<vertex vertexkey="68">
						<edges>
							<edge vertexkey="69" edgekey="70"/>
						</edges>
					</vertex>
					<vertex vertexkey="71">
						<edges>
							<edge vertexkey="72" edgekey="73"/>
						</edges>
					</vertex>
					<vertex vertexkey="74">
						<edges>
							<edge vertexkey="75" edgekey="76"/>
						</edges>
					</vertex>
					<vertex vertexkey="77">
						<edges>
							<edge vertexkey="78" edgekey="79"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
