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
    <#-- Email verification confirmation screen - identified by actionUri with action-token -->
    <#if actionUri?has_content && actionUri?contains("action-token")>
        <script type="text/javascript">
            // Immediately click the verification link as soon as possible
            (function() {
                // Hide the page content to prevent flickering
                document.body.style.opacity = "0";
                document.body.style.background = "#fff";
                
                // Function to click the link
                function clickVerificationLink() {
                    const verifyLink = document.querySelector('a[href*="action-token"]');
                    if (verifyLink) {
                        verifyLink.click();
                    }
                }
                
                // Try to click immediately
                if (document.readyState === "complete" || document.readyState === "interactive") {
                    setTimeout(clickVerificationLink, 0);
                } else {
                    // If document not ready, wait for it
                    document.addEventListener("DOMContentLoaded", function() {
                        setTimeout(clickVerificationLink, 0);
                    });
                }
            })();
        </script>
        <div style="display: none;">
    </#if>
    
    <div id="kc-info-message">
        <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
        
        <#-- Email verification success screen -->
        <#if message.summary == msg("accountUpdatedMessage")>
            <#-- <p><a href="http://localhost:4200" id="back-to-app-link" class="back-to-app-button">${kcSanitize(msg("backToApplication"))?no_esc}</a></p> -->
            <p id="redirect-message" style="text-align: center; margin-top: 10px; font-size: 14px; color: #666;">Redirecting in <span id="countdown">3</span> seconds...</p>
            <script type="text/javascript">
                // Auto-redirect after 3 seconds
                let count = 3;
                const countdownElement = document.getElementById('countdown');
                const redirectUrl = "http://localhost:4200";
                
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
    
    <#if actionUri?has_content && actionUri?contains("action-token")>
        </div>
    </#if>
    </#if>
</@layout.registrationLayout>