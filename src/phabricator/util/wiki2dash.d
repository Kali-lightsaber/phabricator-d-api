/**
 * Copyright 2017
 * MIT License
 * Convert phriction page to dashboard panel
 */
module phabricator.util.wiki2dash;
import phabricator.api;
import phabricator.common;

/**
 * Convert a phid (wiki) to a dashboard widget
 */
public static bool convertToDashboard(Settings settings,
                                      string phid,
                                      string panel)
{
    try
    {
        auto wiki = construct!PhrictionAPI(settings);
        auto pageData = wiki.searchByPHID(phid)[ResultKey][DataKey];
        auto page = pageData[AttachKey][ContentKey][ContentKey]["raw"].str;
        auto dash = construct!DashboardAPI(settings);
        dash.editText(panel, page);
        return true;
    }
    catch (Exception e)
    {
        return false;
    }
}
