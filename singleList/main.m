//
//  main.m
//  singleList
//
//  Created by chenfenglong on 2017/2/20.
//  Copyright © 2017年 chenfenglong. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>

typedef int ElemType;

//定义结点类型
typedef struct Node
{
    ElemType data;
    struct Node *next;
}Node,*LinkedList;

/*
 * 初始化一个单链表
 */
LinkedList LinkedListInit()
{
    Node *L;
    L = (Node *)malloc(sizeof(Node));
    if (L == NULL) {
        printf("申请内存空间失败");
    }
    L->next = NULL;
    
    return L;
}

/*
 * 初始化一个nodeNum个数的长度的链表
 */
void CreateListNode(Node *pHead,int nodeNum)
{
    Node *originNode = pHead;
    for (int i = 0; i < nodeNum; i++) {
        Node *curNode = (Node *)malloc(sizeof(Node));
        curNode->data = i + 1;
        curNode->next = NULL;
        
        originNode->next = curNode;
        originNode = curNode;
    }
}

/*
 * 显示某一个节点的值
 */
void ShowNodeData(Node *pHead)
{
    while (pHead != nil && pHead->next != NULL) {
        printf("%d\n",pHead->data);
        pHead = pHead->next;
    }
}

/*
 * 查找链表的第m个元素
 */
void findOneElement(Node *pHead,int m)
{
    NSInteger i = 0;
    Node *originNode = pHead;
    while (originNode->next != NULL) {
        if (i == m)
        {
            printf("%d\n",originNode->data);
        }
        else
        {
            originNode = originNode->next;
        }
        i++;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Node *link = LinkedListInit();
        CreateListNode(link, 10);
        ShowNodeData(link);
        findOneElement(link, 2);
    }
    return 0;
}
