<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <title>List of Modules</title>
        <style>
          body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            text-align: center;
          }

          h2 {
            color: #2c3e50;
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: bold;
          }

          table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
          }

          th {
            background-color: #2c3e50;
            color: white;
            text-transform: uppercase;
            font-weight: bold;
            padding: 12px;
          }

          td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
          }

          tr:nth-child(even) {
            background-color: #f2f2f2;
          }

          tr:hover {
            background-color: #dfe6e9;
            transition: 0.3s;
          }

          .elements-list {
            padding-left: 15px;
          }
        </style>
      </head>
      <body>
        <h2>📚 List of Modules 📚</h2>
        <table>
          <tr>
            <th>Code</th>
            <th>Module Name</th>
            <th>Elements</th>
            <th>Department</th>
            <th>Class</th>
            <th>Chef</th> <!-- ✅ Added Chef Column -->
          </tr>
          <xsl:apply-templates select="Modules/Module"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Module">
    <tr>
      <td><xsl:value-of select="@code_module"/></td>
      <td><xsl:value-of select="ModuleName"/></td>
      <td>
        <ul class="elements-list">
          <xsl:apply-templates select="Elements/Element"/>
        </ul>
      </td>
      <td><xsl:value-of select="Dept_Attachement"/></td>
      <td><xsl:value-of select="ClasseName"/></td>
      <td><xsl:value-of select="Chef"/></td> <!-- ✅ Added Chef Field -->
    </tr>
  </xsl:template>

  <xsl:template match="Element">
    <li><xsl:value-of select="."/></li>
  </xsl:template>

</xsl:stylesheet>
