//+------------------------------------------------------------------+
//|                                             ValidationResult.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class ValidationResult
  {
public:
   bool              Result;
   string            Messages[];
   void              Reset();
   void              AddMessage(string message);
   bool              DoesMessageExist(string message);
   string            JoinMessages(string separator="\r\n");
                     ValidationResult(){}
                    ~ValidationResult(){}
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ValidationResult::Reset()
  {
   this.Result=false;
   ArrayResize(this.Messages,1,0);
   this.Messages[0]="";
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ValidationResult::DoesMessageExist(string message)
  {
   int sz=ArraySize(this.Messages);
   int i;
   for(i=0;i<sz;i++)
     {
      if(message==this.Messages[i]) return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ValidationResult::AddMessage(string message)
  {
   if(this.DoesMessageExist(message)) return;
   
   int sz=ArraySize(this.Messages);
   ArrayResize(this.Messages,(sz+1),0);
   this.Messages[sz]=message;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ValidationResult::JoinMessages(string separator="\r\n")
  {
   string message="";
   int sz=ArraySize(this.Messages);
   int last=sz-1;
   int ct=0;
   for(ct=0;ct<sz;ct++)
     {
      if(ct==last)
        {
         message+=this.Messages[ct];
        }
      else
        {
         message+=StringConcatenate(this.Messages[ct],separator);
        }
     }
   return message;
  }
//+------------------------------------------------------------------+
