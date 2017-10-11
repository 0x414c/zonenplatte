%% Zone plate pattern generator examples
% Both circular and hyperbolical variants are supported

%% Circular zone plate pattern
% Generate circular zone plate pattern
radius = 256; type = 'circular'; func = 'sin';
pattern = zonenplatte(radius, type, func);
figure('Name', 'Circular zone plate pattern'); imshow(pattern)
format = 'png'; filename = sprintf('Patterns/Zonenplatte-r%d-t%s-f%s.%s', radius, type, func, format);
imwrite(pattern, filename);

%% Hyperbolical zone plate pattern
% Generate hyperbolical zone plate pattern
radius = 256; type = 'hyperbolical'; func = 'sin';
pattern = zonenplatte(radius, type, func);
figure('Name', 'Hyperbolical zone plate pattern'); imshow(pattern)
format = 'png'; filename = sprintf('Patterns/Zonenplatte-r%d-t%s-f%s.%s', radius, type, func, format);
imwrite(pattern, filename);

%% Circular square wave zone plate pattern
% Generate circular square wave zone plate pattern
radius = 256; type = 'circular'; func = 'cos'; freq = pi / 2; square = true;
pattern = zonenplatte(radius, type, func, freq, square);
figure('Name', 'Circular square wave zone plate pattern'); imshow(pattern)
format = 'png'; filename = sprintf('Patterns/Zonenplatte-r%d-t%s-f%s-sq.%s', radius, type, func, format);
imwrite(pattern, filename);

%% Hyperbolical square wave zone plate pattern
% Generate hyperbolical square wave zone plate pattern
radius = 256; type = 'hyperbolical'; func = 'cos'; freq = pi / 2; square = true;
pattern = zonenplatte(radius, type, func, freq, square);
figure('Name', 'Hyperbolical square wave zone plate pattern'); imshow(pattern)
format = 'png'; filename = sprintf('Patterns/Zonenplatte-r%d-t%s-f%s-sq.%s', radius, type, func, format);
imwrite(pattern, filename);
