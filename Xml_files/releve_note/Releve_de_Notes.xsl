<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

            <!-- Page Layout -->
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm" margin="1.1cm">
                    <fo:region-body margin-top="1.4cm" margin-bottom="1.2cm"/>
                    <fo:region-before extent="1cm"/>
                    <fo:region-after extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">

                <!-- Static Content (Header) -->
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-size="11pt" font-weight="bold" text-transform="uppercase" letter-spacing="0.7pt" text-align="center" padding="2pt" border-bottom="0.5pt solid black" font-family="Arial">
                        Relevé de note de <xsl:value-of select="student/FirstName"/> <xsl:text> </xsl:text>
                        <xsl:value-of select="student/LastName"/> (CNE: <xsl:value-of select="student/@CNE"/>)
                    </fo:block>
                </fo:static-content>

                <!-- Static Content (Footer) -->
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="11pt" font-weight="bold" text-align="center" font-family="Arial">
                        Moyenne Générale: <xsl:value-of select="student/moyenne"/> -
                        <xsl:choose>
                            <xsl:when test="student/moyenne &gt;= 12">
                                <fo:inline color="green">Admis</fo:inline>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:inline color="red">Non Admis</fo:inline>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block space-before="10pt" space-after="10pt">

                        <!-- Table for Notes -->
                        <fo:table border="0.3pt solid #4A4A4A" width="100%" table-layout="fixed" font-size="9.3pt" font-family="Arial">
                            <fo:table-column column-width="15%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="10%"/>
                            <fo:table-column column-width="15%"/>
                            <fo:table-column column-width="20%"/>
                            <fo:table-column column-width="15%"/>

                            <fo:table-header>
                                <fo:table-row font-weight="bold" background-color="#1B1F3B" color="white">
                                    <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block>Code Module</fo:block></fo:table-cell>
                                    <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block>Désignation Module</fo:block></fo:table-cell>
                                    <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block>Note/20</fo:block></fo:table-cell>
                                    <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block>Année Universitaire</fo:block></fo:table-cell>
                                    <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block>Désignation Matière</fo:block></fo:table-cell>
                                    <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block>Note Matière</fo:block></fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>

                            <fo:table-body>
                                <xsl:for-each select="student/notes/module">
                                    <fo:table-row>
                                        <xsl:attribute name="background-color">
                                            <xsl:choose>
                                                <xsl:when test="position() mod 2 = 1">#ECF2FF</xsl:when>
                                                <xsl:otherwise>#FFE8C6</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block><xsl:value-of select="@code"/></fo:block></fo:table-cell>
                                        <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block><xsl:value-of select="@name"/></fo:block></fo:table-cell>
                                        <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block><xsl:value-of select="@note"/></fo:block></fo:table-cell>
                                        <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block>2024/2025</fo:block></fo:table-cell>
                                        <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block/></fo:table-cell>
                                        <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block/></fo:table-cell>
                                    </fo:table-row>
                                    <xsl:for-each select="sous_module">
                                        <fo:table-row>
                                            <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block/></fo:table-cell>
                                            <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block/></fo:table-cell>
                                            <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block/></fo:table-cell>
                                            <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block/></fo:table-cell>
                                            <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block><xsl:value-of select="@name"/></fo:block></fo:table-cell>
                                            <fo:table-cell border="0.3pt solid #4A4A4A"><fo:block><xsl:value-of select="@note"/></fo:block></fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:flow>

            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
