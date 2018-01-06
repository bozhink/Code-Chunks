<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="16">
	<component name="defaultmap1" blackbox="0" editable="1">
		<properties SelectedLanguage="java" MakePathsAbsoluteOnGeneration="1"/>
		<structure>
			<children>
				<component name="equal" library="core" uid="20" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="47"/>
						<datapoint pos="1" key="52"/>
					</sources>
					<targets>
						<datapoint pos="0" key="73"/>
					</targets>
					<view ltx="427" lty="307" rbx="71" rby="-30"/>
				</component>
				<component name="document" library="xml" uid="16" kind="14">
					<properties XSLTTargetEncoding="UTF-8"/>
					<view ltx="34" lty="37" rbx="211" rby="302"/>
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
									<entry name="BranchOffices" outkey="28" expanded="1">
										<entry name="Name" outkey="15"/>
										<entry name="Office" outkey="43" expanded="1">
											<entry name="Name" outkey="25"/>
											<entry name="EMail" outkey="31"/>
											<entry name="Fax" outkey="34"/>
											<entry name="Phone" outkey="37"/>
											<entry name="Address" outkey="40" expanded="1">
												<entry name="line" outkey="18"/>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="BranchOfficesWithAddressLines.xsd" inputinstance="BranchOfficesWithAddressLines.xml" instanceroot="{}BranchOffices"/>
						<wsdl/>
					</data>
				</component>
				<component name="constant" library="core" uid="42" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="76"/>
					</targets>
					<view ltx="373" lty="530" rbx="-116" rby="21"/>
					<data>
						<constant value="," datatype="string"/>
						<wsdl/>
					</data>
				</component>
				<component name="substring-after" library="core" uid="44" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="68"/>
						<datapoint pos="1" key="79"/>
					</sources>
					<targets>
						<datapoint pos="0" key="10"/>
					</targets>
					<view ltx="445" lty="533" rbx="4" rby="17"/>
				</component>
				<component name="constant" library="core" uid="48" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="81"/>
					</targets>
					<view ltx="559" lty="670" rbx="-30" rby="88"/>
					<data>
						<constant value="5" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="equal" library="core" uid="32" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="49"/>
						<datapoint pos="1" key="8"/>
					</sources>
					<targets>
						<datapoint pos="0" key="59"/>
					</targets>
					<view ltx="429" lty="383" rbx="73" rby="46"/>
				</component>
				<component name="constant" library="core" uid="33" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="7"/>
					</targets>
					<view ltx="355" lty="417" rbx="42" rby="126"/>
					<data>
						<constant value="3" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="line" library="core" uid="18" kind="3">
					<properties/>
					<sources>
						<datapoint pos="0" key="19"/>
						<datapoint pos="1" key="74"/>
					</sources>
					<targets>
						<datapoint pos="0" key="1"/>
						<datapoint/>
					</targets>
					<view ltx="511" lty="292" rbx="105" rby="76"/>
				</component>
				<component name="line" library="core" uid="31" kind="3">
					<properties/>
					<sources>
						<datapoint pos="0" key="23"/>
						<datapoint pos="1" key="60"/>
					</sources>
					<targets>
						<datapoint pos="0" key="65"/>
						<datapoint/>
					</targets>
					<view ltx="511" lty="374" rbx="105" rby="158"/>
				</component>
				<component name="substring-before" library="core" uid="41" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="66"/>
						<datapoint pos="1" key="77"/>
					</sources>
					<targets>
						<datapoint pos="0" key="4"/>
					</targets>
					<view ltx="444" lty="461" rbx="-90" rby="37"/>
				</component>
				<component name="substring" library="core" uid="43" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="11"/>
						<datapoint pos="1" key="55"/>
						<datapoint pos="2" key="57"/>
					</sources>
					<targets>
						<datapoint pos="0" key="62"/>
					</targets>
					<view ltx="617" lty="495" rbx="163" rby="-17"/>
				</component>
				<component name="substring" library="core" uid="47" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="13"/>
						<datapoint pos="1" key="82"/>
						<datapoint/>
					</sources>
					<targets>
						<datapoint pos="0" key="70"/>
					</targets>
					<view ltx="622" lty="597" rbx="12" rby="-13"/>
				</component>
				<component name="position" library="core" uid="17" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="21"/>
					</sources>
					<targets>
						<datapoint pos="0" key="46"/>
					</targets>
					<view ltx="285" lty="369" rbx="-79" rby="51"/>
				</component>
				<component name="constant" library="core" uid="19" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="51"/>
					</targets>
					<view ltx="350" lty="339" rbx="37" rby="48"/>
					<data>
						<constant value="2" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="constant" library="core" uid="45" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="54"/>
					</targets>
					<view ltx="552" lty="544" rbx="-37" rby="-38"/>
					<data>
						<constant value="2" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="document" library="xml" uid="5" kind="14">
					<properties XSLTTargetEncoding="UTF-8" XSLTDefaultOutput="1"/>
					<view ltx="730" lty="38" rbx="867" rby="306"/>
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
									<entry name="BranchOffices" inpkey="29" expanded="1">
										<entry name="Name" inpkey="16"/>
										<entry name="Office" inpkey="44" expanded="1">
											<entry name="Name" inpkey="26"/>
											<entry name="EMail" inpkey="32"/>
											<entry name="Fax" inpkey="35"/>
											<entry name="Phone" inpkey="38"/>
											<entry name="Location" inpkey="91"/>
											<entry name="Address" inpkey="41" expanded="1">
												<entry name="city" inpkey="5"/>
												<entry name="state" inpkey="63"/>
												<entry name="street" inpkey="2"/>
												<entry name="zip" inpkey="71"/>
											</entry>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="BranchOffices.xsd" instanceroot="{}BranchOffices" sps="BranchOffices.sps"/>
						<wsdl/>
					</data>
				</component>
				<component name="equal" library="core" uid="49" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="86"/>
						<datapoint pos="1" key="88"/>
					</sources>
					<targets>
						<datapoint pos="0" key="89"/>
					</targets>
					<view ltx="426" lty="221" rbx="70" rby="-116"/>
				</component>
				<component name="constant" library="core" uid="50" kind="2">
					<properties/>
					<targets>
						<datapoint pos="0" key="87"/>
					</targets>
					<view ltx="349" lty="253" rbx="36" rby="-38"/>
					<data>
						<constant value="1" datatype="decimal"/>
						<wsdl/>
					</data>
				</component>
				<component name="line" library="core" uid="51" kind="3">
					<properties/>
					<sources>
						<datapoint pos="0" key="85"/>
						<datapoint pos="1" key="90"/>
					</sources>
					<targets>
						<datapoint pos="0" key="84"/>
						<datapoint/>
					</targets>
					<view ltx="510" lty="206" rbx="104" rby="-10"/>
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
							<edge vertexkey="13" edgekey="14"/>
						</edges>
					</vertex>
					<vertex vertexkey="15">
						<edges>
							<edge vertexkey="16" edgekey="17"/>
						</edges>
					</vertex>
					<vertex vertexkey="18">
						<edges>
							<edge vertexkey="19" edgekey="20"/>
							<edge vertexkey="21" edgekey="22"/>
							<edge vertexkey="23" edgekey="24"/>
							<edge vertexkey="85" edgekey="92"/>
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
							<edge vertexkey="49" edgekey="50"/>
							<edge vertexkey="86" edgekey="93"/>
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
							<edge vertexkey="57" edgekey="58"/>
						</edges>
					</vertex>
					<vertex vertexkey="59">
						<edges>
							<edge vertexkey="60" edgekey="61"/>
						</edges>
					</vertex>
					<vertex vertexkey="62">
						<edges>
							<edge vertexkey="63" edgekey="64"/>
						</edges>
					</vertex>
					<vertex vertexkey="65">
						<edges>
							<edge vertexkey="66" edgekey="67"/>
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
							<edge vertexkey="79" edgekey="80"/>
						</edges>
					</vertex>
					<vertex vertexkey="81">
						<edges>
							<edge vertexkey="82" edgekey="83"/>
						</edges>
					</vertex>
					<vertex vertexkey="84">
						<edges>
							<edge vertexkey="91" edgekey="94"/>
						</edges>
					</vertex>
					<vertex vertexkey="87">
						<edges>
							<edge vertexkey="88" edgekey="95"/>
						</edges>
					</vertex>
					<vertex vertexkey="89">
						<edges>
							<edge vertexkey="90" edgekey="96"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
