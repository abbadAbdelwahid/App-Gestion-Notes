<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="attestation">
                    <fo:region-body margin="20mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="attestation">
                <fo:flow flow-name="xsl-region-body">

                    <!-- Logos Université et ENSA -->
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
                                    <fo:block font-size="14pt" font-weight="bold">UNIVERSITÉ ABDELMALEK ESSAÂDI</fo:block>
                                    <fo:block font-size="12pt">École Nationale des Sciences Appliquées - Tanger</fo:block>
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
                    <fo:block border-bottom="1pt solid black" space-before="5mm"/>

                    <!-- Titre Attestation -->
                    <fo:block text-align="center" font-size="18pt" font-weight="bold" space-before="15mm">
                        ATTESTATION DE SCOLARITÉ
                    </fo:block>

                    <!-- Contenu principal -->
                    <fo:block font-size="12pt" space-before="10mm" text-align="justify">
                        Nous soussigné, Directeur de l'École Nationale des Sciences Appliquées de Tanger,
                        attestons que l'étudiant(e) :
                    </fo:block>

                    <fo:block font-size="14pt" font-weight="bold" space-before="5mm" text-align="center">
                        <xsl:value-of select="Student/LastName"/> <xsl:value-of select="Student/FirstName"/>
                    </fo:block>

                    <fo:block font-size="12pt" text-align="center">
                        Né(e) le <xsl:value-of select="Student/DateOfBirth"/>
                    </fo:block>

                    <fo:block font-size="12pt" text-align="center">
                        Numéro CNE : <xsl:value-of select="Student/@CNE"/>
                    </fo:block>

                    <fo:block font-size="12pt" text-align="center">
                        Est inscrit(e) en <xsl:value-of select="Student/ClasseName"/> pour l'année universitaire 2024-2025.
                    </fo:block>

                    <fo:block font-size="12pt" space-before="10mm" text-align="justify">
                        Cette attestation est délivrée à la demande de l’intéressé(e) pour servir et valoir ce que de droit.
                    </fo:block>

                    <!-- Signature et cachet -->
                    <fo:block text-align="right" space-before="20mm">
                        Fait à Tanger, le <xsl:value-of select="/Student/DateGeneration"/>
                    </fo:block>

                    <fo:block text-align="right" font-size="14pt" font-weight="bold">
                        Le Directeur
                    </fo:block>

                    <fo:block text-align="right" space-before="10mm">
                        <fo:external-graphic src="stamp.png" content-width="40mm"/>
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
