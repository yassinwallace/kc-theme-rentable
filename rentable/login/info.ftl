<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
    <#--
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
         ${message.summary} 
        </#if>
    -->
    <#elseif section = "form">
    <div id="kc-info-message">
        <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
        <#if message.summary == msg("accountUpdatedMessage")>
            <p><a href="http://localhost:4200/login" id="back-to-app-link" class="back-to-app-button">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <p id="redirect-message" style="text-align: center; margin-top: 10px; font-size: 14px; color: #666;">Redirecting in <span id="countdown">3</span> seconds...</p>
            <script type="text/javascript">
                // Auto-redirect after 3 seconds
                let count = 3;
                const countdownElement = document.getElementById('countdown');
                const redirectUrl = "http://localhost:4200/login";
                
                const countdownInterval = setInterval(function() {
                    count--;
                    countdownElement.textContent = count;
                    
                    if (count <= 0) {
                        clearInterval(countdownInterval);
                        window.location.href = redirectUrl;
                    }
                }, 1000);
            </script>
        </#if>
        <#if skipLink??>
        <#-- If skipLink is present, then the page is an error page that can be skipped -->
        <#else>


            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri?has_content>
                <p><!-- email_verify_link_start --><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a><!-- email_verify_link_end --></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>

        </#if>
    </div>
    </#if>
</@layout.registrationLayout>