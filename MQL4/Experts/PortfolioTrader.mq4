//+------------------------------------------------------------------+
//|                                              PortfolioTrader.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property description "Does Magic."
#property strict

#include <EA\PortfolioTrader.mqh>

input string WatchedSymbols="USDJPYpro,GBPUSDpro,USDCADpro,USDCHFpro,USDSEKpro"; // Currency Basket, csv list or blank for current chart.
input ENUM_TIMEFRAMES ExtremeBreakTimeframe=PERIOD_CURRENT;
input int ExtremeBreakPeriod=30;
input int ExtremeBreakShift=1;
input int ExtremeBreakMinimumTpSlDistance=100; // Tp/Sl Min. Points for valid signal.
input int ExtremeBreakParallelSignals=3; // Quantity of parallel signals to use.
input double Lots=0.01;
input double ProfitTarget=25; // Profit target in account currency
input double MaxLoss=25; // Maximum allowed loss in account currency
input int Slippage=10; // Allowed slippage
extern ENUM_DAY_OF_WEEK Start_Day=0;//Start Day
extern ENUM_DAY_OF_WEEK End_Day=6;//End Day
extern string   Start_Time="00:00";//Start Time
extern string   End_Time="24:00";//End Time
input bool ScheduleIsDaily=false;// Use start and stop times daily?
input bool TradeAtBarOpenOnly=false;// Trade only at opening of new bar?

PortfolioTrader *portfolioTrader;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deinit()
  {
   delete portfolioTrader;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void init()
  {
   string symbols = WatchedSymbols;
   ENUM_TIMEFRAMES timeframe=ExtremeBreakTimeframe;
   if(IsTesting())
   {
      symbols=Symbol();
      timeframe=PERIOD_CURRENT;
   }
   portfolioTrader=new PortfolioTrader(
                                       symbols,
                                       ExtremeBreakPeriod,ExtremeBreakShift,
                                       ExtremeBreakMinimumTpSlDistance,timeframe,
                                       ExtremeBreakParallelSignals,
                                       Lots,ProfitTarget,MaxLoss,Slippage,
                                       Start_Day,End_Day,Start_Time,End_Time,ScheduleIsDaily,
                                       TradeAtBarOpenOnly);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   portfolioTrader.Execute();
  }
//+------------------------------------------------------------------+
