<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="student-card">
                    <fo:region-body margin="10mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="student-card">
                <fo:flow flow-name="xsl-region-body">

                    <!-- En-tête avec Logos -->
                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="30%"/>
                        <fo:table-column column-width="40%"/>
                        <fo:table-column column-width="30%"/>

                        <fo:table-body>
                            <fo:table-row>
                                <!-- Logo Université -->
                                <fo:table-cell text-align="left">
                                    <fo:block>
                                        <fo:external-graphic src="universite_logo.png" content-width="40mm"/>
                                    </fo:block>
                                </fo:table-cell>

                                <!-- Texte Université -->
                                <fo:table-cell text-align="center">
                                    <fo:block font-size="14pt" font-weight="bold" color="#004080">
                                        Université Abdelmalek Essaâdi
                                    </fo:block>
                                    <fo:block font-size="12pt">
                                        École Nationale des Sciences Appliquées
                                    </fo:block>
                                    <fo:block font-size="12pt">Tanger</fo:block>
                                </fo:table-cell>

                                <!-- Logo ENSA -->
                                <fo:table-cell text-align="right">
                                    <fo:block>
                                        <fo:external-graphic src="ensa_logo.png" content-width="40mm"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>

                    <!-- Séparateur -->
                    <fo:block border-bottom="2pt solid #004080" space-before="5mm"/>

                    <!-- Titre "CARTE D'ÉTUDIANT" -->
                    <fo:block text-align="center" font-size="16pt" font-weight="bold" color="#004080" space-before="5mm">
                        CARTE D'ÉTUDIANT
                    </fo:block>

                    <!-- Contenu de la carte -->
                    <fo:table table-layout="fixed" width="100%" space-before="10mm">
                        <fo:table-column column-width="40%"/>
                        <fo:table-column column-width="60%"/>

                        <fo:table-body>
                            <fo:table-row>
                                <!-- Photo Étudiant -->
                                <fo:table-cell text-align="center">
                                    <fo:block>
                                        <fo:external-graphic src="PhotoPersonnelle.png" content-width="50mm" content-height="50mm"/>
                                    </fo:block>
                                </fo:table-cell>

                                <!-- Infos Étudiant -->
                                <fo:table-cell text-align="left">
                                    <fo:block font-size="14pt" font-weight="bold">
                                        <xsl:value-of select="Student/LastName"/>
                                    </fo:block>
                                    <fo:block font-size="14pt">
                                        <xsl:value-of select="Student/FirstName"/>
                                    </fo:block>
                                    <fo:block font-size="12pt" font-weight="bold" color="#004080">
                                        CNE: <xsl:value-of select="Student/@CNE"/>
                                    </fo:block>
                                    <fo:block font-size="12pt" space-before="5mm">
                                        Classe : <xsl:value-of select="Student/ClasseName"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>

                    <!-- Informations Supplémentaires -->
                    <fo:block font-size="12pt" space-before="10mm" text-align="center">
                        # Date de naissance : <xsl:value-of select="Student/DateOfBirth"/>
                    </fo:block>

                    <fo:block font-size="12pt" text-align="center">
                        # Email : <xsl:value-of select="Student/Email"/>
                    </fo:block>

                    <fo:block font-size="12pt" text-align="center">
                        # Téléphone : <xsl:value-of select="Student/Phone"/>
                    </fo:block>

                    <!-- Note en bas de la carte -->
                    <fo:block text-align="center" font-size="10pt" color="#666666" space-before="10mm">
                        * Cette carte est personnelle et doit être présentée lors des examens *
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>