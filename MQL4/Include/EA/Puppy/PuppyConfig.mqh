//+------------------------------------------------------------------+
//|                                                  PuppyConfig.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <EA\PortfolioManagerBasedBot\BasePortfolioManagerBotConfig.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct PuppyConfig : public BasePortfolioManagerBotConfig
  {
public:
   int               lcfpPeriod;
   ENUM_TIMEFRAMES   lcfpTimeframe;
   double            lcfpMinimumTpSlDistance;
   bool              lcfpInvertedSignal;
   double            lcfpSkew;
  };
//+------------------------------------------------------------------+
