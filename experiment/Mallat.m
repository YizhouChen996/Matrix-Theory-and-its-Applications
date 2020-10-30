function [ x ] = Mallat(y,A,K)
    [M,N] = size(A);%字典矩阵的规模
    x = zeros(N, 1);%需要重构的解向量x
    At = zeros(M, K);%存储每轮迭代时A中被选中的列
    x_pos = zeros(1, K);%存储每轮迭代时A中被选中列的序号
    r = y;%残差向量，初始化为y
    for ii = 1:K%迭代K轮
        product = A'*r;%计算矩阵各列与残差的点积
        [val, pos] = max(abs(product));%找到与残差最相关的列
        At(:,ii) = A(:,pos);%将被选中的列存储到At中
        x_pos(ii) = pos;%记录被选中列的序号
        A(:,pos) = zeros(M,1);
        x_l = (At(:,1:ii)'*At(:,1:ii))^(-1)*At(:,1:ii)'*y;%最小二乘解
        r = y - At(:,1:ii)*x_l;%更新残差
    end
    x(x_pos) = x_l;
end

