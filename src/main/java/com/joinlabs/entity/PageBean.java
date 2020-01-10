package com.joinlabs.entity;

public class PageBean {
		//当前页
		private int curPage;		
		//总共数量
		private int totalCount;		//当前条件下的总数量
		//总共页
		private int totalPage;		
		//一页数量
		private int pageCount;		
		//查询开始下标
		private int startIndex;		
		//查询结束下标
		private int endIndex;
		
		public PageBean() {
		}
		public PageBean(int curPage, int totalCount, int totalPage, int pageCount) {
			super();
			this.curPage = curPage;
			this.totalCount = totalCount;
			this.totalPage = totalPage;
			this.pageCount = pageCount;
		}
		public int getCurPage() {
			return curPage;
		}
		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getPageCount() {
			return pageCount;
		}
		public void setPageCount(int pageCount) {
			this.pageCount = pageCount;
		}

		public int getStartIndex() {
			return startIndex;
		}
		public void setStartIndex(int startIndex) {
			this.startIndex = startIndex;
		}
		public int getEndIndex() {
			return endIndex;
		}
		public void setEndIndex(int endIndex) {
			this.endIndex = endIndex;
		}
		@Override
		public String toString() {
			return "PageBean [curPage=" + curPage + ", totalCount=" + totalCount
					+ ", totalPage=" + totalPage + ", pageCount=" + pageCount
					+ ", startIndex=" + startIndex + ", endIndex=" + endIndex + "]";
		}
		
		public void initData() {
			
			//计算总页数
			//System.out.println("-----------"+totalCount/pageCount);
			totalPage = totalCount%pageCount==0?totalCount/pageCount:totalCount/pageCount+1;
			
			//计算开始下标
			startIndex=  (curPage-1)*pageCount;		
			//计算结束下标
			if(curPage == totalPage){
				//如果是最后一页
				
				endIndex = totalCount;
			}else{
				//不是最后一页
				endIndex = startIndex + pageCount;		
			}
			
		}
}
