/**
 * Copyright (c) 2000-2014 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

#import "LRServiceFactory.h"

static NSMutableDictionary *_services;

/**
 * @author Bruno Farache
 */
@implementation LRServiceFactory

+ (void)initialize {
	if (!_services) {
		_services = [[NSMutableDictionary alloc] init];
	}
}

+ (LRBaseService *)getService:(Class)clazz session:(LRSession *)session {
	LRBaseService *service = [_services objectForKey:NSStringFromClass(clazz)];

	if (!service) {
		service = [[clazz alloc] init:session];

		[_services setObject:service forKey:NSStringFromClass(clazz)];
	}
	else {
		[service setSession:session];
	}

	return service;
}

@end