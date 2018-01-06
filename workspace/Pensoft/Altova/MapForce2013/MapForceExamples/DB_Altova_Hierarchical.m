<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="16">
	<component name="defaultmap1" blackbox="0" uid="48863048" editable="1">
		<properties XSLTTargetEncoding="UTF-8" SelectedLanguage="java" MakePathsAbsoluteOnGeneration="1"/>
		<structure>
			<children>
				<component name="document" library="xml" uid="37260672" kind="14">
					<properties XSLTTargetEncoding="UTF-8" XSLTDefaultOutput="1"/>
					<view ltx="421" rbx="612" rby="554"/>
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
									<entry name="Altova" inpkey="26" expanded="1">
										<entry name="PrimaryKey" inpkey="29" expanded="1"/>
										<entry name="Name" inpkey="32" expanded="1"/>
										<entry name="Office" inpkey="35" expanded="1">
											<entry name="PrimaryKey" inpkey="38" expanded="1"/>
											<entry name="ForeignKey" inpkey="41" expanded="1"/>
											<entry name="Desc" inpkey="44" expanded="1"/>
											<entry name="EMail" inpkey="47" expanded="1"/>
											<entry name="Established" inpkey="50" expanded="1"/>
											<entry name="Fax" inpkey="53" expanded="1"/>
											<entry name="Name" inpkey="56" expanded="1"/>
											<entry name="Phone" inpkey="59" expanded="1"/>
											<entry name="Address" inpkey="62" expanded="1">
												<entry name="PrimaryKey" inpkey="65" expanded="1"/>
												<entry name="ForeignKey" inpkey="68" expanded="1"/>
												<entry name="city" inpkey="71" expanded="1"/>
												<entry name="state" inpkey="74" expanded="1"/>
												<entry name="street" inpkey="77" expanded="1"/>
												<entry name="zip" inpkey="80" expanded="1"/>
											</entry>
											<entry name="Department" inpkey="83" expanded="1">
												<entry name="PrimaryKey" inpkey="86" expanded="1"/>
												<entry name="ForeignKey" inpkey="89" expanded="1"/>
												<entry name="Name" inpkey="92" expanded="1"/>
												<entry name="Person" inpkey="2" expanded="1">
													<entry name="PrimaryKey" inpkey="5" expanded="1"/>
													<entry name="ForeignKey" inpkey="8" expanded="1"/>
													<entry name="EMail" inpkey="11" expanded="1"/>
													<entry name="First" inpkey="14" expanded="1"/>
													<entry name="Last" inpkey="17" expanded="1"/>
													<entry name="PhoneExt" inpkey="20" expanded="1"/>
													<entry name="Title" inpkey="23" expanded="1"/>
												</entry>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="Altova_Hierarchical.xsd" instanceroot="{}Altova" sps="Altova_Hierarchical.sps"/>
					</data>
				</component>
				<component name="structure" library="db" uid="38630232" kind="15">
					<properties JDBCDriver="sun.jdbc.odbc.JdbcOdbcDriver" JDBCDatabaseURL="jdbc:odbc:;DRIVER=Microsoft Access Driver (*.mdb);" DBDataSource="altova.mdb" OLEDBProvider="Microsoft.Jet.OLEDB.4.0"/>
					<view rbx="290" rby="553"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces/>
							</header>
							<entry name="document" expanded="1">
								<entry name="Altova" type="table" outkey="25" expanded="1">
									<entry name="PrimaryKey" outkey="28" expanded="1"/>
									<entry name="Name" outkey="31" expanded="1"/>
									<entry name="Office|ForeignKey" type="table" outkey="34" expanded="1">
										<entry name="PrimaryKey" outkey="37" expanded="1"/>
										<entry name="ForeignKey" outkey="40" expanded="1"/>
										<entry name="Desc" outkey="43" expanded="1"/>
										<entry name="EMail" outkey="46" expanded="1"/>
										<entry name="Established" outkey="49" expanded="1"/>
										<entry name="Fax" outkey="52" expanded="1"/>
										<entry name="Name" outkey="55" expanded="1"/>
										<entry name="Phone" outkey="58" expanded="1"/>
										<entry name="Address|ForeignKey" type="table" outkey="61" expanded="1">
											<entry name="PrimaryKey" outkey="64" expanded="1"/>
											<entry name="ForeignKey" outkey="67" expanded="1"/>
											<entry name="city" outkey="70" expanded="1"/>
											<entry name="state" outkey="73" expanded="1"/>
											<entry name="street" outkey="76" expanded="1"/>
											<entry name="zip" outkey="79" expanded="1"/>
										</entry>
										<entry name="Department|ForeignKey" type="table" outkey="82" expanded="1">
											<entry name="PrimaryKey" outkey="85" expanded="1"/>
											<entry name="ForeignKey" outkey="88" expanded="1"/>
											<entry name="Name" outkey="91" expanded="1"/>
											<entry name="Person|ForeignKey" type="table" outkey="1" expanded="1">
												<entry name="PrimaryKey" outkey="4" expanded="1"/>
												<entry name="ForeignKey" outkey="7" expanded="1"/>
												<entry name="EMail" outkey="10" expanded="1"/>
												<entry name="First" outkey="13" expanded="1"/>
												<entry name="Last" outkey="16" expanded="1"/>
												<entry name="PhoneExt" outkey="19" expanded="1"/>
												<entry name="Title" outkey="22" expanded="1"/>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<database>
							<database_connection database_kind="MS Access" import_kind="ADO" version="04.00.0000" name="altova" path="altova">
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
						</edges>
					</vertex>
					<vertex vertexkey="43">
						<edges>
							<edge vertexkey="44" edgekey="45"/>
						</edges>
					</vertex>
					<vertex vertexkey="46">
						<edges>
							<edge vertexkey="47" edgekey="48"/>
						</edges>
					</vertex>
					<vertex vertexkey="49">
						<edges>
							<edge vertexkey="50" edgekey="51"/>
						</edges>
					</vertex>
					<vertex vertexkey="52">
						<edges>
							<edge vertexkey="53" edgekey="54"/>
						</edges>
					</vertex>
					<vertex vertexkey="55">
						<edges>
							<edge vertexkey="56" edgekey="57"/>
						</edges>
					</vertex>
					<vertex vertexkey="58">
						<edges>
							<edge vertexkey="59" edgekey="60"/>
						</edges>
					</vertex>
					<vertex vertexkey="61">
						<edges>
							<edge vertexkey="62" edgekey="63"/>
						</edges>
					</vertex>
					<vertex vertexkey="64">
						<edges>
							<edge vertexkey="65" edgekey="66"/>
						</edges>
					</vertex>
					<vertex vertexkey="67">
						<edges>
							<edge vertexkey="68" edgekey="69"/>
						</edges>
					</vertex>
					<vertex vertexkey="70">
						<edges>
							<edge vertexkey="71" edgekey="72"/>
						</edges>
					</vertex>
					<vertex vertexkey="73">
						<edges>
							<edge vertexkey="74" edgekey="75"/>
						</edges>
					</vertex>
					<vertex vertexkey="76">
						<edges>
							<edge vertexkey="77" edgekey="78"/>
						</edges>
					</vertex>
					<vertex vertexkey="79">
						<edges>
							<edge vertexkey="80" edgekey="81"/>
						</edges>
					</vertex>
					<vertex vertexkey="82">
						<edges>
							<edge vertexkey="83" edgekey="84"/>
						</edges>
					</vertex>
					<vertex vertexkey="85">
						<edges>
							<edge vertexkey="86" edgekey="87"/>
						</edges>
					</vertex>
					<vertex vertexkey="88">
						<edges>
							<edge vertexkey="89" edgekey="90"/>
						</edges>
					</vertex>
					<vertex vertexkey="91">
						<edges>
							<edge vertexkey="92" edgekey="93"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
