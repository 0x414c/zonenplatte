function Result = zonenplatte(Radius, PatternType, Function, MaxFrequency, SquareWave)
  % ZONENPLATTE Generate zone plate pattern
  %
  % Usage:
  %   Result = ZONENPLATTE(Radius, PatternType, Function, MaxFrequency, SquareWave)
  %
  % Examples:
  %   pattern1 = ZONENPLATTE;
  %   pattern2 = ZONENPLATTE(256, 'circular, 'sin', pi, false);
  %
  % Input:
  %   Radius: pattern radius, default 256
  %   PatternType: pattern type: 'circular' or 'hyperbolical', default 'circular'
  %   Function: pattern function: 'sin' or 'cos', default 'sin'
  %   MaxFrequency: max frequency, default pi
  %   SquareWave: use square wave instead of sine, default false
  %
  % Output:
  %   Result: pattern image
  %     type: double
  %     dimensions: (Radius * 2) + 1 rows and columns
  %     values range: [0 1]

  if nargin < 5
    SquareWave = false;
  end

  if nargin < 5
    MaxFrequency = pi;
  end

  if nargin < 3
    Function = 'sin';
  end

  if nargin < 2
    PatternType = 'circular';
  end

  if nargin < 1
    Radius = 256;
  end

  [x, y] = meshgrid(-Radius : Radius);

  maskSmoothstepWidth = 0.2;
  patternRadius = Radius - maskSmoothstepWidth;

  switch PatternType
    case 'circular'
      % To get circular zone plate
      radius = x .^ 2 + y .^ 2;
      distance = (MaxFrequency * radius) / (2 * patternRadius);

      % Use tanh(.) to get smooth mask
      mask = tanh((patternRadius + maskSmoothstepWidth - sqrt(radius)) / maskSmoothstepWidth);
      mask = (mask + 1) / 2;

      % Or use simple boolean expression to get crisp mask
      % mask = sqrt(radiusSquared) <= maskRadius + maskSmoothstepWidth;

    case 'hyperbolical'
      % To get hyperbolical zone plate
      radius = (x .* y);
      distance = (2 * MaxFrequency * radius) / (2 * patternRadius);

      % Use tanh(.) to get smooth mask
      mask = tanh((((patternRadius + maskSmoothstepWidth) ^ 2) / 2 - abs(radius)) / maskSmoothstepWidth);
      mask = (mask + 1) / 2;

      % Or use simple boolean expression to get crisp mask
      % mask = abs(radius) <= ((maskRadius + maskSmoothstepWidth) ^ 2) / 2;

    otherwise
      error('Unsupported argument: PatternType = %s', PatternType)
  end

  switch Function
    case 'sin'
      pattern = sin(distance);

    case 'cos'
      pattern = cos(distance);

    otherwise
      error('Unsupported argument: Function = %s', Function)
  end

  % Use sign(sin(.)) to get Fresnel-Soret (square) wave,
  %   or sin(.) to get Gabor (sine) wave
  if SquareWave
    pattern = sign(pattern);
  end

  Result = pattern .* mask;
  Result = (Result + 1) / 2;
end
