<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Affichage du Module (Après Rattrapage)</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
          }
          .header {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            padding: 15px 0;
            margin: 0;
          }
          .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
          }
          table {
            width: 80%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
          }
          th {
            background-color: #27ae60;
            color: white;
            padding: 10px;
            text-align: left;
          }
          td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
          }
          .low-score {
            background-color: red;
            color: white;
            font-weight: bold;
            padding: 5px;
            border-radius: 5px;
          }
          .medium-score {
            background-color: orange;
            color: white;
            font-weight: bold;
            padding: 5px;
            border-radius: 5px;
          }
          .high-score {
            background-color: #a8e6a2;
            font-weight: bold;
            padding: 5px;
            border-radius: 5px;
          }
          .info-box {
            margin-top: 40px;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 70%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
          }
          .info-box h2 {
            font-size: 18px;
          }
          .result-V {
            color: green;
            font-weight: bold;
          }
          .result-NV {
            color: red;
            font-weight: bold;
          }
        </style>
      </head>
      <body>

        <!-- HEADER WITH MODULE CODE -->
        <div class="header">
          <xsl:text>Affichage du Module </xsl:text>
          <xsl:value-of select="/Notes/@module_code"/>
          <xsl:text> (Après Rattrapage)</xsl:text>
        </div>

        <div class="container">
          <!-- TABLE -->
          <table>
            <tr>
              <th>CNE</th>
              <th>Prénom</th>
              <th>Nom</th>
              <th>Note</th>
              <th>Résultat</th>
            </tr>
            <xsl:for-each select="/Notes/Students/Student">
              <tr>
                <td><xsl:value-of select="CNE"/></td>
                <td><xsl:value-of select="FirstName"/></td>
                <td><xsl:value-of select="LastName"/></td>
                <td>
                  <xsl:choose>
                    <xsl:when test="number(ModuleNote) &lt; 10">
                      <span class="low-score"><xsl:value-of select="ModuleNote"/></span>
                    </xsl:when>
                    <xsl:when test="number(ModuleNote) &lt; 12">
                      <span class="medium-score"><xsl:value-of select="ModuleNote"/></span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span class="high-score"><xsl:value-of select="ModuleNote"/></span>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="@Result = 'V'">
                      <span class="result-V"><xsl:value-of select="@Result"/></span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span class="result-NV"><xsl:value-of select="@Result"/></span>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </xsl:for-each>
          </table>

          <!-- INFO BOX WITH MOYENNE -->
          <div class="info-box">
            <h2>Moyenne du Module: <xsl:value-of select="/Notes/Moyenne"/></h2>
          </div>
        </div>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
