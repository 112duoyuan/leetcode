#define MAXN 500 


class union_find{


//初始化每个元素的父节点是本身
inline void init(int n){
    for(int i = 0;i <= n -1 ;i++){
        fa[i]=i;
    }
}
//查询操作
int find(int x){
    if(fa[x] == x){
        return x;
    }else{
        return find(fa[x]);
    }
}
//合并操作
inline void merge(int i ,int j){
    fa[find(i)] = find(j);
}

int find_short(int x){
    if(x == fa[x]){
        return x;
    }else{
        fa[x] = find_short(fa[x]);
        return fa[x];
    }
}

private:
    int fa[MAXN];//一个数组来存储每个元素的父节点
};