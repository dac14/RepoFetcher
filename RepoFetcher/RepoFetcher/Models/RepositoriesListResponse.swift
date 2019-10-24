//
//  RepositoriesListResponse.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 23/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Foundation

struct RepositoriesListResponse: Codable {
    
    let incompleteResults: Bool?
    let totalCount: Int?
    let items: [RepositoryItem]?
    
    enum CodingKeys: String, CodingKey {
        case incompleteResults = "incomplete_results"
        case totalCount = "total_count"
        case items
    }
}

struct RepositoryOwner: Codable {
    let organizationsUrl: String?
    let reposUrl: String?
    let htmlUrl: String?
    let siteAdmin: Bool?
    let gravatarId: String?
    let starredUrl: String?
    let avatarUrl: String?
    let type: String?
    let gistsUrl: String?
    let login: String?
    let followersUrl: String?
    let id: Int?
    let subscriptionsUrl: String?
    let followingUrl: String?
    let receivedEventsUrl: String?
    let nodeId: String?
    let url: String?
    let eventsUrl: String?
    
    enum CodingKeys: String, CodingKey {

        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case htmlUrl = "html_url"
        case siteAdmin = "site_admin"
        case gravatarId = "gravatar_id"
        case starredUrl = "starred_url"
        case avatarUrl = "avatar_url"
        case gistsUrl = "gists_url"
        case followersUrl = "followers_url"
        case subscriptionsUrl = "subscriptions_url"
        case followingUrl = "following_url"
        case receivedEventsUrl = "received_events_url"
        case nodeId = "node_id"
        case eventsUrl = "events_url"
        case type
        case login
        case id
        case url
    }
}

struct RepositoryItem: Codable {
    
    let owner: RepositoryOwner?
    let pullsUrl: String?
    let tagsUrl: String?
    let openIssues: Int?
    let hasProjects: Bool?
    let cloneUrl: String?
    let size: Int?
    let gitUrl: String?
    let gitTagsUrl: String?
    let id: Int?
    let defaultBranch: String?
    let issueEventsUrl: String?
    let downloadsUrl: String?
    let commentsUrl: String?
    let homepage: String?
    let teamsUrl: String?
    let url: String?
    let hasPages: Bool?
    let hooksUrl: String?
    let htmlUrl: String?
    let issuesUrl: String?
    let fullName: String?
    let fork: Bool?
    let description: String?
    let notificationsUrl: String?
    let sshUrl: String?
    let stargazersCount: Int?
    let issueCommentUrl: String?
    let compareUrl: String?
    let languagesUrl: String?
    let watchers: Int?
    let milestonesUrl: String?
    let branchesUrl: String?
    let collaboratorsUrl: String?
    let hasIssues: Bool?
    let archiveUrl: String?
    let forks: Int?
    let createdAt: String?
    let assigneesUrl: String?
    let openIssuesCount: Int?
    let labelsUrl: String?
    let forksCount: Int?
    let eventsUrl: String?
    let blobsUrl: String?
    let hasDownloads: Bool?
    let svnUrl: String?
    let forksUrl: String?
    let releasesUrl: String?
    let disabled: Bool?
    let language: String?
    let pushedAt: String?
    let contentsUrl: String?
    let statusesUrl: String?
    let subscribersUrl: String?
    let gitRefsUrl: String?
    let stargazersUrl: String?
    let name: String?
    let contributorsUrl: String?
    let score: Int?
    let subscriptionUrl: String?
    let updatedAt: String?
    let treesUrl: String?
    let keysUrl: String?
    let hasWiki: Bool?
    let gitCommitsUrl: String?
    let commitsUrl: String?
    let watchersCount: Int?
    let deploymentsUrl: String?
    let mergesUrl: String?
    let nodeId: String?
    let archived: Bool?
    
    enum CodingKeys: String, CodingKey {

        case pullsUrl = "pulls_url"
        case openIssues = "open_issues"
        case hasProjects = "has_projects"
        case cloneUrl = "clone_url"
        case gitUrl = "git_url"
        case gitTagsUrl = "git_tags_url"
        case defaultBranch = "default_branch"
        case issueEventsUrl = "issue_events_url"
        case commentsUrl = "comments_url"
        case teamsUrl = "teams_url"
        case hasPages = "has_pages"
        case hooksUrl = "hooks_url"
        case htmlUrl = "html_url"
        case issuesUrl = "issues_url"
        case fullName = "full_name"
        case tagsUrl = "tags_url"
        case notificationsUrl = "notifications_url"
        case sshUrl = "ssh_url"
        case stargazersCount = "stargazers_count"
        case issueCommentUrl = "issue_comment_url"
        case compareUrl = "compare_url"
        case languagesUrl = "languages_url"
        case milestonesUrl = "milestones_url"
        case branchesUrl = "branches_url"
        case collaboratorsUrl = "collaborators_url"
        case hasIssues = "has_issues"
        case archiveUrl = "archive_url"
        case createdAt = "created_at"
        case assigneesUrl = "assignees_url"
        case openIssuesCount = "open_issues_count"
        case labelsUrl = "labels_url"
        case forksCount = "forks_count"
        case eventsUrl = "events_url"
        case blobsUrl = "blobs_url"
        case hasDownloads = "has_downloads"
        case svnUrl = "svn_url"
        case forksUrl = "forks_url"
        case releasesUrl = "releases_url"
        case pushedAt = "pushed_at"
        case contentsUrl = "contents_url"
        case statusesUrl = "statuses_url"
        case subscribersUrl = "subscribers_url"
        case gitRefsUrl = "git_refs_url"
        case stargazersUrl = "stargazers_url"
        case contributorsUrl = "contributors_url"
        case subscriptionUrl = "subscription_url"
        case updatedAt = "updated_at"
        case treesUrl = "trees_url"
        case keysUrl = "keys_url"
        case hasWiki = "has_wiki"
        case gitCommitsUrl = "git_commits_url"
        case commitsUrl = "commits_url"
        case watchersCount = "watchers_count"
        case deploymentsUrl = "deployments_url"
        case mergesUrl = "merges_url"
        case nodeId = "node_id"
        case downloadsUrl = "downloads_url"
        case owner
        case size
        case id
        case archived
        case homepage
        case url
        case fork
        case description
        case watchers
        case forks
        case disabled
        case language
        case name
        case score
    }
}
