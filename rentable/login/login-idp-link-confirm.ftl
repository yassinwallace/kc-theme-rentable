<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("confirmLinkIdpTitle")}
    <#elseif section = "form">
        <div id="kc-form">
          <div id="kc-form-wrapper">
            <form id="kc-register-form" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <p class="instruction">${msg("confirmLinkIdpTitle")}</p>
                    
                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" 
                               name="submitAction" id="linkAccount" value="linkAccount">${msg("confirmLinkIdpContinue", idpDisplayName)}</button>
                        
                    </div>
                </div>
            </form>
          </div>
        </div>
    </#if>
</@layout.registrationLayout>
