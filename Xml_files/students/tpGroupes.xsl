<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="tp-groups">
                    <fo:region-body margin="20mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="tp-groups">
                <fo:flow flow-name="xsl-region-body">

                    <!-- Titre du Document -->
                    <fo:block text-align="center" font-size="18pt" font-weight="bold" color="blue" space-after="10mm">
                        Liste des Groupes de TP
                    </fo:block>

                    <!-- Boucle sur les groupes -->
                    <xsl:for-each select="TPGroups/TPGroup">
                        <fo:block font-size="14pt" font-weight="bold" space-before="10mm" space-after="5mm" color="blue">
                            Groupe TP : <xsl:value-of select="GroupNumber"/>
                        </fo:block>

                        <!-- Tableau des étudiants -->
                        <fo:table width="100%" border="0.5pt solid black" table-layout="fixed">
                            <fo:table-column column-width="15%"/>
                            <fo:table-column column-width="20%"/>
                            <fo:table-column column-width="20%"/>
                            <fo:table-column column-width="30%"/>
                            <fo:table-column column-width="15%"/>

                            <!-- En-tête du tableau -->
                            <fo:table-header>
                                <fo:table-row background-color="#D3D3D3">
                                    <fo:table-cell border="0.5pt solid black">
                                        <fo:block font-weight="bold" text-align="center">CNE</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="0.5pt solid black">
                                        <fo:block font-weight="bold" text-align="center">Nom</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="0.5pt solid black">
                                        <fo:block font-weight="bold" text-align="center">Prénom</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="0.5pt solid black">
                                        <fo:block font-weight="bold" text-align="center">Email</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="0.5pt solid black">
                                        <fo:block font-weight="bold" text-align="center">Téléphone</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>

                            <!-- Corps du tableau avec les étudiants -->
                            <fo:table-body>
                                <xsl:for-each select="Student">
                                    <fo:table-row>
                                        <xsl:attribute name="background-color">
                                            <xsl:choose>
                                                <xsl:when test="position() mod 2 = 0">#F5F5F5</xsl:when>
                                                <xsl:otherwise>white</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <fo:table-cell border="0.5pt solid black">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="@CNE"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="0.5pt solid black">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="LastName"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="0.5pt solid black">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="FirstName"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="0.5pt solid black">
                                            <fo:block text-align="center" font-size="10pt">
                                                <xsl:value-of select="Email"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="0.5pt solid black">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="Phone"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </xsl:for-each>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>
