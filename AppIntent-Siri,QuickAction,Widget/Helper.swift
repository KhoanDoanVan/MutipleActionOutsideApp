//
//  Helper.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 11/3/25.
//


import AppIntents
import IntentsUI

func createSiriShortcut(title: String, phrase: String, activityType: String) -> INShortcut {
    let activity = NSUserActivity(activityType: activityType)
    activity.title = title
    activity.suggestedInvocationPhrase = phrase
    return INShortcut(userActivity: activity)
}
