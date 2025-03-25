<#macro emailLayout>
<html>
<head>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            color: #333333;
            line-height: 1.5;
            margin: 0;
            padding: 0;
            text-align: left;
        }
        p {
            font-size: 16px;
            margin: 16px 0;
        }
        a {
            color: #3366ff;
        }
    </style>
</head>
<body style="font-family: Arial, sans-serif; font-size: 16px; color: #333333; line-height: 1.5; margin: 0; padding: 0; text-align: left;">
    <div style="max-width: 100%; margin: 0; padding: 20px; text-align: left;">
        <#nested>
    </div>
</body>
</html>
</#macro>
