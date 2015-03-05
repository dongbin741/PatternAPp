//
//  Header.h
//  PatternAPp
//
//  Created by china317 on 14-9-11.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#ifndef PatternAPp_Header_h
#define PatternAPp_Header_h

#ifdef DEBUG
#define DEBUG_LOG(fmt, ...) NSLog(fmt, ##__VA_ARGS__)
#else
#define DEBUG_LOG(fmt, ...)
#endif

#endif
