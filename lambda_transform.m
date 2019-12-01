function zero = lambda_transform(x)
load nestent
zero = sum(sum( (1-lambda).^x .*Pdisteroded)) - (1-0.27);

