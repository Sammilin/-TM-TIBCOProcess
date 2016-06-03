<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns="http://www.trendmicro.com/ESB/schemas/MDM/EMEA_ERP/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns1="http://www.trendmicro.com/ESB/schemas/MDM/SFDC/Customer" xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/ns0:SMF" />
  </xsl:template>
  <xsl:template match="/ns0:SMF">
	<ns0:SMF>
		<ns0:SMFHeader>
			<ns4:MessageKey>
				<xsl:value-of select="ns0:SMFHeader/ns4:MessageKey"/>
			</ns4:MessageKey>
			<ns4:ServiceName>
				<xsl:value-of select="&quot;CreateNavCust&quot;"/>
			</ns4:ServiceName>
			<ns4:ServiceVersion>
				<xsl:value-of select="&quot;V1.0&quot;"/>
			</ns4:ServiceVersion>
			<ns4:SourceID>
				<xsl:value-of select="ns0:SMFHeader/ns4:SourceID"/>
			</ns4:SourceID>
			<xsl:if test="ns0:SMFHeader/ns4:SourceIP">
				<ns4:SourceIP>
					<xsl:value-of select="ns0:SMFHeader/ns4:SourceIP"/>
				</ns4:SourceIP>
			</xsl:if>
			<xsl:if test="ns0:SMFHeader/ns4:RqTimestamp">
				<ns4:RqTimestamp>
					<xsl:value-of select="ns0:SMFHeader/ns4:RqTimestamp"/>
				</ns4:RqTimestamp>
			</xsl:if>
			<xsl:if test="ns0:SMFHeader/ns4:RsTimestamp">
				<ns4:RsTimestamp>
					<xsl:value-of select="ns0:SMFHeader/ns4:RsTimestamp"/>
				</ns4:RsTimestamp>
			</xsl:if>
		</ns0:SMFHeader>
		<ns0:SMFBody>
			<ns0:Navision>
				<ns0:Customer>
					<ns:Customer>
						<xsl:if test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id">
							<ns:MDMCustID>
								<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id"/>
							</ns:MDMCustID>
						</xsl:if>
						<xsl:if test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:duns">
							<ns:DnBNum>
								<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:duns"/>
							</ns:DnBNum>
						</xsl:if>
						<ns:SiebelID>
							<xsl:value-of select="&quot;&quot;"/>
						</ns:SiebelID>
						<xsl:if test="ns0:SMFBody/ns0:SFDC/ns0:Customer/ns1:SfdcPartnerId">
							<ns:SalesForceID>
								<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer/ns1:SfdcPartnerId"/>
							</ns:SalesForceID>
						</xsl:if>
						<ns:NavDistiID>
							<xsl:value-of select="&quot;&quot;"/>
						</ns:NavDistiID>
						<ns:NAVID>
							<xsl:value-of select="&quot;&quot;"/>
						</ns:NAVID>
						<ns:CustomerName>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name"/>
						</ns:CustomerName>
						<ns:CustomerName2>
							<xsl:value-of select="&quot;&quot;"/>
						</ns:CustomerName2>
						<ns:Address>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address"/>
						</ns:Address>
						<ns:Address2>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address_line2"/>
						</ns:Address2>
						<ns:City>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city"/>
						</ns:City>
						<ns:County>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country"/>
						</ns:County>
						<ns:PostCode>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code"/>
						</ns:PostCode>
						<ns:CountryCode>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country"/>
						</ns:CountryCode>
						<ns:Phone>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no"/>
						</ns:Phone>
						<ns:Fax>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no"/>
						</ns:Fax>
						<ns:Email>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email"/>
						</ns:Email>
						<ns:LanguageCode>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:language_code"/>
						</ns:LanguageCode>
						<ns:LegalEntity>
							<xsl:value-of select="&quot;&quot;"/>
						</ns:LegalEntity>
						<ns:EndCustomer>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser"/>
						</ns:EndCustomer>
						<ns:Reseller>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller"/>
						</ns:Reseller>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=&quot;true&quot;">
								<ns:TransactionProfile>
									<xsl:value-of select="&quot;1&quot;"/>
								</ns:TransactionProfile>
							</xsl:when>
							<xsl:otherwise>
								<ns:TransactionProfile>
									<xsl:value-of select="&quot;0&quot;"/>
								</ns:TransactionProfile>
							</xsl:otherwise>
						</xsl:choose>
						<ns:Segment>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:segment"/>
						</ns:Segment>
						<ns:MasterNAVID>
							<xsl:value-of select="&quot;&quot;"/>
						</ns:MasterNAVID>
						<ns:Blocked>
							<xsl:value-of select="0"/>
						</ns:Blocked>
						<ns:PartnerTier>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier"/>
						</ns:PartnerTier>
						<ns:VATRegNo>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:vat_number"/>
						</ns:VATRegNo>
						<ns:DefaultContactID>
							<xsl:value-of select="&quot;&quot;"/>
						</ns:DefaultContactID>
						<ns:SourceSystemID>
							<xsl:value-of select="&quot;SFDC&quot;"/>
						</ns:SourceSystemID>
						<ns:ContractTypeVAD>
							<xsl:value-of select="&quot;0&quot;"/>
						</ns:ContractTypeVAD>
						<ns:ContractTypeBroadline>
							<xsl:value-of select="&quot;0&quot;"/>
						</ns:ContractTypeBroadline>
						<ns:Currency>
							<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:currency_code"/>
						</ns:Currency>
					</ns:Customer>
				</ns0:Customer>
			</ns0:Navision>
		</ns0:SMFBody>
	</ns0:SMF>
  </xsl:template>
</xsl:stylesheet>