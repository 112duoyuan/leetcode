实现一个MyQueue类，该类用两个栈来实现一个队列。


示例：

MyQueue queue = new MyQueue();

queue.push(1);
queue.push(2);
queue.peek();  // 返回 1
queue.pop();   // 返回 1
queue.empty(); // 返回 false



#include <stack>
class MyQueue {
private:
    void in2out(){
        while(!stkIn.empty()){
            int num = stkIn.top();
            stkOut.push(num);
            stkIn.pop();
        }
    }
public:
    /** Initialize your data structure here. */
    MyQueue() {
        
    }
    
    /** Push element x to the back of queue. */
    void push(int x) {
        stkIn.push(x);
    }
    
    /** Removes the element from in front of queue and returns that element. */
    int pop() {
        if(stkOut.empty()){
            in2out();
        }
        int num = stkOut.top();
        stkOut.pop();
        return num;
    }
    
    /** Get the front element. */
    int peek() {
        if(stkOut.empty()){
            in2out();
        }
        return stkOut.top();
    }
    
    /** Returns whether the queue is empty. */
    bool empty() {
        return (stkIn.empty() && stkOut.empty());
    }
    stack<int>stkIn,stkOut;
};
