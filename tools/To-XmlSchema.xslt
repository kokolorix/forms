<?xml version="1.0" encoding="iso-8859-1"?>
<!--
<?altova_samplexml ..\SINA18.xml?>
<?altova_samplexml ..\MESSPROT18.xml?>
-->
<?altova_samplexml ..\VSE_IA18.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<xsl:output name="xml-def" method="xml" indent="yes"/>
	<!--=======================================================================-->
	<!-- Main-Template -->
	<!--=======================================================================-->
	<xsl:template match="/">
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,'.xsd')"/>
		<xsl:result-document href="{$fn}" format="xml-def">
			<xs:schema>
				<xs:element>
					<xsl:attribute name="name"><xsl:value-of select="Form/@Name"/></xsl:attribute>
					<xsl:attribute name="type">T_<xsl:value-of select="Form/@Name"/></xsl:attribute>
				</xs:element>
				<!--=======================================================================-->
				<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="elm1"/>
				<!--=======================================================================-->
				<xs:complexType>
					<xsl:attribute name="name">T_<xsl:value-of select="Form/@Name"/></xsl:attribute>
					<xs:all>
						<xsl:call-template name="SpecialElements"/>
						<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="elm"/>
						<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="ref"/>
					</xs:all>
				</xs:complexType>
				<!--=======================================================================-->
			</xs:schema>
		</xsl:result-document>
	<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="doc"/>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Feld-Element -->
	<!--=======================================================================-->
	<xsl:template name="SpecialElements">
		<xs:element name="FORM_TYP" type="xs:string"/>
	</xsl:template>
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="elm">
		<xsl:variable name="type">
			<xsl:choose>
				<xsl:when test="@Type='INT'">
					<xsl:text>xs:int</xsl:text>
				</xsl:when>
				<xsl:when test="@Type='BOOL'">
					<xsl:text>xs:boolean</xsl:text>
				</xsl:when>
				<xsl:when test="@Type='DATE'">
					<xsl:text>xs:dateTime</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>xs:string</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"></xsl:value-of>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@Length">
					<xs:simpleType>
						<xs:restriction base="{$type}">
							<xsl:if test="@Length">
								<xsl:element name="xs:minLength">
									<xsl:attribute name="value">0</xsl:attribute>
								</xsl:element>
								<xsl:element name="xs:maxLength">
									<xsl:attribute name="value">
										<xsl:value-of select="@Length"/>
									</xsl:attribute>
								</xsl:element>
							</xsl:if>
						</xs:restriction>
					</xs:simpleType>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="type">
						<xsl:value-of select="$type"></xsl:value-of>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xs:element>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Tab-Template, erstellt Subtabellen-Elemente -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="elm1">
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"/>
				<xsl:text>_DE</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_FR</xsl:text>
			</xsl:attribute>
		<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_IT</xsl:text>
			</xsl:attribute>
		<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
	</xsl:template>
	<xsl:template match="Tab" mode="elm2">
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"/>
				<xsl:text>_DE</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_FR</xsl:text>
			</xsl:attribute>
		<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_IT</xsl:text>
			</xsl:attribute>
		<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
	</xsl:template>	<!--=======================================================================-->
	<!-- Tab-Template, erstellt einen Subtabellen-Typ -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="T">
		<xs:complexType>
			<xsl:attribute name="name">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xs:sequence minOccurs="0" maxOccurs="unbounded">
				<xs:element name="ROW">
					<xs:complexType>
						<xs:all>
							<xsl:apply-templates select="./Fld" mode="elm"/>
						</xs:all>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt eine Feld-Element-Referenz -->
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="ref">
		<xs:element>
			<xsl:attribute name="ref">
				<xsl:value-of select="@Name"></xsl:value-of>
			</xsl:attribute>
		</xs:element>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Tab-Template, erstellt die Subtabellen-Element Referenzen -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="ref">
		<xs:element>
			<xsl:attribute name="ref">
				<xsl:value-of select="@Name"></xsl:value-of>
			</xsl:attribute>
		</xs:element>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Tab-Template, erstellt die Subtabellen-Element Dokumentt -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="doc">
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,concat(@Name,'.xsd'))"/>
		<xsl:result-document href="{$fn}" format="xml-def">
			<xs:schema>
				<xsl:apply-templates select="." mode="elm2"/>
				<xsl:apply-templates select="." mode="T"/>
			</xs:schema>
		</xsl:result-document>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Leer-Template, tut gar nichts -->
	<!--=======================================================================-->
	<xsl:template match="@*|node()"/>
</xsl:stylesheet>
