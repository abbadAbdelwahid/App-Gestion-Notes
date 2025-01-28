<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Student List</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
          }

          h2 {
            color: #333;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
          }

          table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
          }

          th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
          }

          th {
            background-color: #2c3e50;
            color: white;
            text-transform: uppercase;
            font-weight: bold;
          }

          tr:nth-child(even) {
            background-color: #f9f9f9;
          }

          tr:hover {
            background-color: #e0e0e0;
            transition: 0.3s;
          }
        </style>
      </head>
      <body>
        <h2>📚 Student List 📚</h2>
        <table>
          <tr>
            <th>CNE</th>
            <th>Date of Birth</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Class Name</th>
            <th>Phone</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates select="Students/Student"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Student">
    <tr>
      <td><xsl:value-of select="@CNE"/></td>
      <td><xsl:value-of select="DateOfBirth"/></td>
      <td><xsl:value-of select="FirstName"/></td>
      <td><xsl:value-of select="LastName"/></td>
      <td><xsl:value-of select="ClasseName"/></td>
      <td><xsl:value-of select="Phone"/></td>
      <td><xsl:value-of select="Email"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
