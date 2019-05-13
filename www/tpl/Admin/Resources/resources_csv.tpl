"{translate key='Name'}","{translate key='Status'}","{translate key='Schedule'}","{translate key='ResourceType'}","{translate key='SortOrder'}","{translate key='Location'}","{translate key='Contact'}","{translate key='Description'}","{translate key='Notes'}","{translate key='ResourceAdministrator'}","{translate key='ResourceColor'}","{translate key='ResourceMinLengthCsv'}","{translate key='ResourceMaxLengthCsv'}","{translate key='ResourceBufferTimeCsv'}","{translate key='ResourceAllowMultiDay'}","{translate key='Capacity'}","{translate key='ResourceGroups'}","{translate key='ResourceMinNoticeAddCsv'}","{translate key='ResourceMinNoticeUpdateCsv'}","{translate key='ResourceMinNoticeDeleteCsv'}","{translate key='ResourceRequiresApproval'}","{translate key='ResourcePermissionAutoGranted'}","{translate key='RequiresCheckInNotification'}","{translate key='AutoReleaseMinutes'}","{translate key='CreditsOffPeak'}","{translate key='CreditsPeak'}"{foreach from=$AttributeList item=attr name=attributeLabels},"{$attr->Label()|escape:'quotes'}"{/foreach}
{foreach from=$Resources item=resource}
"{$resource->GetName()|escape:'quotes'}","{if $resource->IsAvailable()}{translate key='Available'}{elseif $resource->IsUnavailable()}{translate key='Unavailable'}{else}{translate key='Hidden'}{/if}","{$Schedules[$resource->GetScheduleId()]}","{if $resource->HasResourceType()}{($ResourceTypes[$resource->GetResourceTypeId()]->Name())|escape:'quotes'}{/if}",{$resource->GetSortOrder()|default:"0"},"{$resource->GetLocation()|escape:'quotes'}","{$resource->GetContact()|escape:'quotes'}","{$resource->GetDescription()|escape:'quotes'}","{$resource->GetNotes()|escape:'quotes'}","{($GroupLookup[$resource->GetAdminGroupId()]->Name)|escape:'quotes'}","{$resource->GetColor()}","{$resource->GetMinLength()}","{$resource->GetMaxLength()}","{$resource->GetBufferTime()}","{$resource->GetAllowMultiday()|default:0}","{$resource->GetMaxParticipants()}","{foreach from=$resource->GetResourceGroupIds() item=resourceGroupId name=eachGroup}{($ResourceGroupList[$resourceGroupId]->name)|escape:'quotes'}{if !$smarty.foreach.eachGroup.last},{/if}{/foreach}","{$resource->GetMinNoticeAdd()}","{$resource->GetMinNoticeUpdate()}","{$resource->GetMinNoticeDelete()}","{$resource->GetMaxNotice()}","{$resource->GetRequiresApproval()|default:0}","{$resource->GetAutoAssign()|default:0}","{$resource->IsCheckInEnabled()|default:0}","{$resource->GetAutoReleaseMinutes()}","{$resource->GetCreditsPerSlot()}","{$resource->GetPeakCreditsPerSlot()}",{foreach from=$AttributeList item=attribute name=attributeLoop},"{$resource->GetAttributeValue($attribute->Id())|escape:'quotes'}"{/foreach}
{/foreach}