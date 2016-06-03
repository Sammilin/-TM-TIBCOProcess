<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns1="http://www.trendmicro.com/ESB/schemas/MDM/SFDC/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:ns6="http://www.trendmicro.com/ESB/schemas/MDM/TeO/Customer" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
					<xsl:value-of select="&quot;UpdateTeOCust&quot;"/>
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
				<ns0:TeO>
					<ns0:Customer>
						<ns6:Customer>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:nav_id/@xsi:nil">
									<ns6:NavisionID>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:NavisionID"/>
									</ns6:NavisionID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:NavisionID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:nav_id"/>
									</ns6:NavisionID>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id/@xsi:nil">
									<ns6:MDMID>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:MdmPartnerId"/>
									</ns6:MDMID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:MDMID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:gold_id"/>
									</ns6:MDMID>
								</xsl:otherwise>
							</xsl:choose>
							<ns6:SFID>
								<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:MDM/ns0:SourceIDMapping/ns2:SfId,ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:SfdcPartnerId)"/>
							</ns6:SFID>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:duns/@xsi:nil">
									<ns6:DUNSID>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:DUNS"/>
									</ns6:DUNSID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:DUNSID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:duns"/>
									</ns6:DUNSID>
								</xsl:otherwise>
							</xsl:choose>
							<ns6:IsDisti>
								<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor"/>
							</ns6:IsDisti>
							<ns6:IsReseller>
								<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser"/>
							</ns6:IsReseller>
							<ns6:IsEndUser>
								<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser"/>
							</ns6:IsEndUser>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil">
									<ns6:CountryID>
										<xsl:value-of select="&quot;&quot;"/>
									</ns6:CountryID>
								</xsl:when>
								<xsl:otherwise>
									<ns6:CountryID>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country"/>
									</ns6:CountryID>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name/@xsi:nil">
									<ns6:Name>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:AccountName"/>
									</ns6:Name>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Name>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name"/>
									</ns6:Name>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address/@xsi:nil">
									<ns6:Address>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:BillingStreet"/>
									</ns6:Address>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Address>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address"/>
									</ns6:Address>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address_line2">
								<ns6:Address2>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address_line2"/>
								</ns6:Address2>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city/@xsi:nil">
									<ns6:City>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:BillingCity"/>
									</ns6:City>
								</xsl:when>
								<xsl:otherwise>
									<ns6:City>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city"/>
									</ns6:City>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county">
								<ns6:County>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:county"/>
								</ns6:County>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email/@xsi:nil">
									<ns6:Email>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:EmailDomain"/>
									</ns6:Email>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Email>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email"/>
									</ns6:Email>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no/@xsi:nil">
									<ns6:Fax>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:Fax"/>
									</ns6:Fax>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Fax>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_fax_no"/>
									</ns6:Fax>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no/@xsi:nil">
									<ns6:Phone>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:MainPhoneNumber"/>
									</ns6:Phone>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Phone>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_phone_no"/>
									</ns6:Phone>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website/@xsi:nil">
									<ns6:Website>
										<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:Website"/>
									</ns6:Website>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Website>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_website"/>
									</ns6:Website>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code/@xsi:nil">
									<xsl:if test="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:BillingPostalCode">
										<ns6:Zip>
											<xsl:value-of select="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:BillingPostalCode"/>
										</ns6:Zip>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Zip>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:post_code"/>
									</ns6:Zip>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="not(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:language_code/@xsi:nil)">
								<ns6:LanguageCode>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:language_code"/>
								</ns6:LanguageCode>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="ns0:SMFBody/ns0:SFDC/ns0:Customer[1]/ns1:AccountStatus=&quot;Active&quot;">
									<ns6:Blocked>
										<xsl:value-of select="1"/>
									</ns6:Blocked>
								</xsl:when>
								<xsl:otherwise>
									<ns6:Blocked>
										<xsl:value-of select="0"/>
									</ns6:Blocked>
								</xsl:otherwise>
							</xsl:choose>
							<ns6:Company>
								<xsl:value-of select="&quot;&quot;"/>
							</ns6:Company>
							<xsl:if test="not(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:currency_code/@xsi:nil)">
								<ns6:Currency>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:currency_code"/>
								</ns6:Currency>
							</xsl:if>
							<xsl:if test="not(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier/@xsi:nil)">
								<xsl:if test="not((ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier/@xsi:nil=(&quot;true&quot;)) or (ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier/@xsi:nil=(&quot;1&quot;)))">
									<ns6:Category>
										<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_tier"/>
									</ns6:Category>
								</xsl:if>
							</xsl:if>
						</ns6:Customer>
					</ns0:Customer>
				</ns0:TeO>
			</ns0:SMFBody>
		</ns0:SMF>
	</xsl:template>
</xsl:stylesheet>