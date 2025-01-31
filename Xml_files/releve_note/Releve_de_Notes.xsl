<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/student">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm" margin="1cm">
                    <fo:region-body margin-top="2cm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="1.5cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">

                    <!-- HEADER -->
                    <fo:table table-layout="fixed">
                        <fo:table-column column-width="5cm"/>
                        <fo:table-column column-width="10cm"/>
                        <fo:table-column column-width="5cm"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block text-align="left">
                                        <fo:external-graphic src="url('file:///C:/Application-Gestion-Note/App-Gestion-Notes/logoUae.png')"
                                            width="2.7cm" height="3.0cm"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="center" font-size="16pt" font-weight="bold" color="#003366">
                                        Relevé de Notes de <xsl:value-of select="FirstName"/> <xsl:value-of select="LastName"/>
                                    </fo:block>
                                    <fo:block text-align="center" font-size="12pt" font-weight="bold" color="#666">
                                        CNE: <xsl:value-of select="@CNE"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="right">
                                        <fo:external-graphic src="url('file:///C:/Application-Gestion-Note/App-Gestion-Notes/ensa.png')"
                                            width="4.3cm" height="2.5cm"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>

                    <fo:block space-before="10pt"/>

                    <!-- TABLE -->
                    <fo:table border="0.5pt solid black" table-layout="fixed" width="100%">
                        <fo:table-column column-width="15%"/>
                        <fo:table-column column-width="30%"/>
                        <fo:table-column column-width="10%"/>
                        <fo:table-column column-width="10%"/>
                        <fo:table-column column-width="25%"/>
                        <fo:table-column column-width="10%"/>

                        <!-- Table Header -->
                        <fo:table-header>
                            <fo:table-row background-color="#003366" color="white" font-size="8pt" font-weight="bold">
                                <fo:table-cell padding="3pt"><fo:block>Code Module</fo:block></fo:table-cell>
                                <fo:table-cell padding="3pt"><fo:block>Designation Module</fo:block></fo:table-cell>
                                <fo:table-cell padding="3pt"><fo:block>Note / 20</fo:block></fo:table-cell>
                                <fo:table-cell padding="3pt"><fo:block>Année Universitaire</fo:block></fo:table-cell>
                                <fo:table-cell padding="3pt"><fo:block>Designation Matière</fo:block></fo:table-cell>
                                <fo:table-cell padding="3pt"><fo:block>Note / 20</fo:block></fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>

                        <fo:table-body>
                            <xsl:for-each select="notes/module">
                                <fo:table-row background-color="#f5f5f5" font-size="8pt">
                                    <fo:table-cell padding="3pt" border="0.5pt solid black">
                                        <fo:block font-weight="bold"><xsl:value-of select="@code"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black">
                                        <fo:block font-weight="bold"><xsl:value-of select="@name"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black" text-align="center">
                                        <xsl:value-of select="@note"/>
                                    </fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black" text-align="center">2024/2025</fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black">&#160;</fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black">&#160;</fo:table-cell>
                                </fo:table-row>

                                <!-- Sous-modules -->
                                <xsl:for-each select="sous_module">
                                    <fo:table-row font-size="8pt">
                                        <fo:table-cell padding="3pt" border="0.5pt solid black">&#160;</fo:table-cell>
                                        <fo:table-cell padding="3pt" border="0.5pt solid black">
                                            <fo:block><xsl:value-of select="@name"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="3pt" border="0.5pt solid black" text-align="center">
                                            <xsl:value-of select="@note"/>
                                        </fo:table-cell>
                                        <fo:table-cell padding="3pt" border="0.5pt solid black">&#160;</fo:table-cell>
                                        <fo:table-cell padding="3pt" border="0.5pt solid black">&#160;</fo:table-cell>
                                        <fo:table-cell padding="3pt" border="0.5pt solid black">&#160;</fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <!-- Footer with Average -->
                    <fo:block text-align="right" font-size="10pt" font-weight="bold" space-before="15pt">
                        Moyenne Générale : <xsl:value-of select="moyenne"/>
                    </fo:block>
                    <fo:block text-align="right" font-size="10pt" font-weight="bold">
                        <xsl:choose>
                            <xsl:when test="moyenne &gt;= 12">
                                <fo:inline color="green">ADM</fo:inline>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:inline color="red">NON ADM</fo:inline>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>
