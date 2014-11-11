function FollowLine()
  nxt.InputSetDigi0(3)
  nxt.InputSetDirOutDigi0(3)

  T1 = 600
  T2 = 630
  SpeedSlow = 50
  SpeedFast = 100
  LoopCount = 0

  t=nxt.TimerRead()
  nxt.DisplayScroll()
  nxt.OutputSetMode(1,2)
  nxt.OutputSetMode(2,2)

  while t+10000>nxt.TimerRead() do
    SV = nxt.InputGetRawAd(3)
    if SV < T2 then
      nxt.OutputSetSpeed(1,32,SpeedFast,0)
    else
      nxt.OutputSetSpeed(1,32,SpeedSlow,0)
    end
    if SV > T1 then
      nxt.OutputSetSpeed(2,32,SpeedFast,0)
    else
      nxt.OutputSetSpeed(2,32,SpeedSlow,0)
    end
    nxt.DisplayText(SV)
    LoopCount = LoopCount + 1
  end
  nxt.DisplayScroll()
  nxt.DisplayText(string.format("%i - %i",SV,LoopCount))
  nxt.OutputSetSpeed(1,32,0,0)
  nxt.OutputSetSpeed(2,32,0,0)
end

FollowLine()


