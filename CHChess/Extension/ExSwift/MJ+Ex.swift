//
//  MJ+Ex.swift
//  
//
//  Created by EZen on 2021/9/10.
//

import MJRefresh

class RefreshHeader: MJRefreshNormalHeader {
    
    override func prepare() {
        super.prepare()
        
        setTitle("下拉刷新", for: MJRefreshState.idle)
        setTitle("松开获取最新数据", for: MJRefreshState.pulling)
        setTitle("加载中...", for: MJRefreshState.refreshing)
        
        stateLabel?.textColor = UIColor.init(white: 0.625, alpha: 1.0)
        stateLabel?.font = UIFont.SYS_F14
        lastUpdatedTimeLabel?.isHidden = true
        
    }
}

class RefreshAutoBackFooter: MJRefreshBackNormalFooter {
    
    override func prepare() {
        super.prepare()
        
        setTitle("上拉加载更多", for: MJRefreshState.idle)
        setTitle("加载更多...", for: MJRefreshState.pulling)
        setTitle(" ━━━━━ 已经到底了 ━━━━━ ", for: MJRefreshState.noMoreData)
        
        stateLabel?.textColor = UIColor.init(white: 0.625, alpha: 1.0)
        stateLabel?.font = UIFont.SYS_F14
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let contentSizeHeight = self.scrollView?.contentSize.height ?? 0
        let height = self.scrollView?.height ?? 0

        self.y = max(contentSizeHeight, height) + ignoredScrollViewContentInsetBottom
    }

    override func scrollViewContentSizeDidChange(_ change: [AnyHashable : Any]?) {
        super.scrollViewPanStateDidChange(change)

        let contentSizeHeight = self.scrollView?.contentSize.height ?? 0
        let height = self.scrollView?.height ?? 0

        self.y = max(contentSizeHeight, height)
    }
}
