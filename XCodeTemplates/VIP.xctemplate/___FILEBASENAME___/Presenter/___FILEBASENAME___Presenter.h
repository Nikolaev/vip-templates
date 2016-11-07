//
//  {{ prefix }}{{ module_info.name }}Presenter.h
//  {{ module_info.project_name }}
//
//  Created by {{ developer.name }} on {{ date }}.
//  Copyright {{ year }} {{ developer.company }}. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "{{ prefix }}{{ module_info.name }}PresenterInput.h"
#import "{{ prefix }}{{ module_info.name }}PresenterOutput.h"

@interface {{ prefix }}{{ module_info.name }}Presenter : NSObject <{{ prefix }}{{ module_info.name }}PresenterInput>

@property (weak, nonatomic) id<{{ prefix }}{{ module_info.name }}PresenterOutput> output;

@end
