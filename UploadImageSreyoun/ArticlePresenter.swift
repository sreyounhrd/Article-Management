//
//  ArticlePresenter.swift
//  UploadImageSreyoun
//
//  Created by SREYOUN on 12/14/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import UIKit
// Presenter
class ArticlePresenter{
    
    var articleService : ArticleService?
    var articleViewDelegate : ArticleViewDelegate?
    
    init(){
        articleService = ArticleService()
        articleService?.callerDelegate = self
    }
    
    func loadAllArticle(){
        articleService?.loadAllArticles()
    }
}

extension ArticlePresenter : ArticlePresenterInterface{
    func responseData(_ data: [Article]) {
        // Response data to view
        articleViewDelegate?.updateViewWithData(data)
    }
}
