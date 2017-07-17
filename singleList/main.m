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
 * 打印单链表
 */
void PrintSingleList(Node *pHead)
{
    if (pHead == NULL) {
        return;
    }
    if (pHead->next) {
        NSLog(@"%ld",(long)pHead->data);
    }
    while (pHead->next) {
        NSLog(@"%ld",(long)pHead->data);
        pHead = pHead->next;
    }
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
 * 打印所有单链表的值
 */
void ShowAllNodeData(Node *pHead)
{
    if (pHead == NULL) {
        return;
    }
    if (pHead->next) {
        NSLog(@"%ld",(long)pHead->data);
    }
    while (pHead->next) {
        NSLog(@"%ld",(long)pHead->data);
        pHead = pHead->next;
    }
}

/*
 * 查找链表的第m个元素
 */
void FindOneElement(Node *pHead,int m)
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

/*
 * 翻转单链表
 */
void ReversalSingleList(Node *pHead)
{
    if (pHead == NULL || pHead->next == NULL) {
        return;
    }
    Node *originHeader = pHead;
    Node *newHeader = NULL;
    while (originHeader->next) {
        Node *nextOriginNode = originHeader->next;
        originHeader->next = newHeader;
        newHeader = originHeader;
        originHeader = nextOriginNode;
    }
    PrintSingleList(newHeader);
}

/*
 * 倒序打印单链表；通过使用递归来倒序打印单链表。
 */
void InvertedSingleList(Node *pHead)
{
    if (pHead == NULL) {
        return;
    }
    if (pHead->next) {
        pHead = pHead->next;
        InvertedSingleList(pHead);
        NSLog(@"%ld",(long)pHead->data);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Node *link = LinkedListInit();
        CreateListNode(link, 10);
        InvertedSingleList(link);
        //        ReversalSingleList(link);
        //        ShowNodeData(link);
        //        FindOneElement(link, 2);
    }
    return 0;
}
